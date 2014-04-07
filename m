From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Apr 2014 22:33:39 +0200
Subject: [Buildroot] [PATCH 2/2] package/zile: add Zile is Lossy Emacs
 editor
In-Reply-To: <1396868422-5757-3-git-send-email-alex.bennee@linaro.org>
References: <1396868422-5757-1-git-send-email-alex.bennee@linaro.org>
 <1396868422-5757-3-git-send-email-alex.bennee@linaro.org>
Message-ID: <20140407203338.GC3215@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alex, All,

On 2014-04-07 12:00 +0100, Alex Benn?e spake thusly:
> This is a lightweight Emacs clone useful for embedded systems. I nabbed
> the help2man disable patch from OpenEmbedded.
[--SNIP--]
> diff --git a/package/zile/Config.in b/package/zile/Config.in
> new file mode 100644
> index 0000000..29fb0fc
> --- /dev/null
> +++ b/package/zile/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_ZILE
> +	bool "zile"
> +        select BR2_PACKAGE_LIBGC
> +	depends on BR2_USE_MMU # fork()
> +	help
> +	  Zile is Lossy Emacs
> +
> +          GNU Zile (Zile Is Lossy Emacs) is a lightweight Emacs clone. Every
> +          Emacs user should feel at home with Zile. Zile is aimed at small
> +          footprint systems (a typical binary is about 100Kb) and quick editing
> +          sessions (it starts up and shuts down instantly).
> +
> +	  http://www.gnu.org/software/zile/

There is space damage above:
  - use one tab in front of options parameters (type, select, depends...)
  - use one tab and two spaces in front of the help text

The above mixes spaces and tabs.

> diff --git a/package/zile/remove-help2man.patch b/package/zile/remove-help2man.patch
> new file mode 100644
> index 0000000..c1a63f4
> --- /dev/null
> +++ b/package/zile/remove-help2man.patch
> @@ -0,0 +1,28 @@
> +Upstream-Status: Inappropriate [configuration]

Please add a complete commit log, and your SoB lines too, in this patch.

Could you also add a pointer to the upstream refusal (bug -tracker or ML
archive), please?

> diff --git a/package/zile/zile.mk b/package/zile/zile.mk
> new file mode 100644
> index 0000000..024595c
> --- /dev/null
> +++ b/package/zile/zile.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# Zile
> +#
> +################################################################################
> +
> +ZILE_VERSION = 2.4.11
> +ZILE_SITE = http://ftp.gnu.org/gnu/zile/
> +ZILE_LICENSE = GPLv1+
> +ZILE_LICENSE_FILES = COPYING
> +ZILE_CONF_OPT += --without-help2man

In the previous patch, you added libgc, stating that it was a dependency
of Zile, but you forgot to add it here.

Probably it is working for you since libgz sorts alphabetically before
zile, but that's not guaranteed with parallel builds.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
