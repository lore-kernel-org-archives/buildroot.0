From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 22 May 2011 12:26:30 +0200
Subject: [Buildroot] [PATCH 3/3] toolchain/crosstool-NG: fix up ct-ng
	config file to saner defaults
In-Reply-To: <87d3jb407t.fsf@macbook.be.48ers.dk>
References: <1306015542-5208-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	<1306015542-5208-4-git-send-email-yann.morin.1998@anciens.enib.fr>
	<87d3jb407t.fsf@macbook.be.48ers.dk>
Message-ID: <201105221226.30903.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Sunday 22 May 2011 10:18:46 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:
[--SNIP--]
>  Yann>  #--------------
>  Yann> +# glibc/eglibc specific options
>  Yann> +ifeq ($(BR2_TOOLCHAIN_CTNG_glibc)$(BR2_TOOLCHAIN_CTNG_eglibc),y)
>  Yann> +
>  Yann> +# Force unwind support
>  Yann> +CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_LIBC_GLIBC_FORCE_UNWIND) is not set:\1=y:;
>  Yann> +
>  Yann> +# Force non-fortified build
>  Yann> +CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_ENABLE_FORTIFIED_BUILD)=y:# \1 is not set:;
> 
> Does that build for you? For me it fails with:
[--SNIP--]
> sed: -e expression #1, char 892: unterminated `s' command
> 
> E.G. the replace part of the 'Force non-fortified build' line gets
> removed as # is the comment character in makefiles. The fix is simply to
> use \#.

Arg... I did yet forgot to refresh the patch yet again. Some combo of
stgit and send-email issues due to PEBKAC... :-]

> I'll fix that up when I commit.

Thank you.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
