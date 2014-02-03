From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2014 21:26:31 +0100
Subject: [Buildroot] [V2 2/2] ljlinenoise: new package
In-Reply-To: <1391425657-30915-2-git-send-email-francois.perrad@gadz.org>
References: <1391425657-30915-1-git-send-email-francois.perrad@gadz.org>
 <1391425657-30915-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140203202630.GB3264@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

A few nit-picks below...

On 2014-02-03 12:07 +0100, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[--SNIP--]
> diff --git a/package/ljlinenoise/Config.in b/package/ljlinenoise/Config.in
> new file mode 100644
> index 0000000..3d2af35
> --- /dev/null
> +++ b/package/ljlinenoise/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LJLINENOISE
> +	bool "ljlinenoise"
> +	select BR2_PACKAGE_LJSYSCALL
> +	# ljsyscall is specifically for LuaJIT, not Lua.
> +	depends on BR2_PACKAGE_LUAJIT
> +	# ljsyscall is only available for some target architectures
> +	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb

No need for the comment, it is obvious from the dependency itself that
ljlinenoise only works on these architectures.

However, it's maybe worth a comment in the commit log.

> +	help
> +	  ljlinenoise is a pure LuaJIT port of linenoise,
> +	  a small alternative to readline and libedit.
> +
> +	  http://fperrad.github.io/ljlinenoise/
> +
> +comment "ljlinenoise needs LuaJIT"
> +	depends on !BR2_PACKAGE_LUAJIT && (BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb)
> diff --git a/package/ljlinenoise/ljlinenoise.mk b/package/ljlinenoise/ljlinenoise.mk
> new file mode 100644
> index 0000000..69f6130
> --- /dev/null
> +++ b/package/ljlinenoise/ljlinenoise.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# ljlinenoise
> +#
> +################################################################################
> +
> +LJLINENOISE_VERSION_UPSTREAM = 0.1.1
> +LJLINENOISE_VERSION = $(LJLINENOISE_VERSION_UPSTREAM)-1
> +LJLINENOISE_SUBDIR  = ljlinenoise-$(LJLINENOISE_VERSION_UPSTREAM)
                     ^^
Very small nit-pick: only one space in front of the '=' sing.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
