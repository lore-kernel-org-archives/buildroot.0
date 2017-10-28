From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Oct 2017 12:06:00 +0200
Subject: [Buildroot] [PATCH v2] package/glibc: switch to using the
	maintenance branch
In-Reply-To: <20171024143033.15102-1-romain.naour@gmail.com>
References: <20171024143033.15102-1-romain.naour@gmail.com>
Message-ID: <20171028100600.GB3280@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2017-10-24 16:30 +0200, Romain Naour spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> glibc upstream has sued against doing regular point-releases, but they
> do have a lot of interesting and important fixes for regressions and
> security.
[--SNIP--]
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 0b8b440..d82eb07 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -9,9 +9,14 @@ GLIBC_VERSION =  arc-2017.09-eng010
>  GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
>  GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.gz
>  else
> -GLIBC_VERSION = 2.26
> -GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
> -GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
> +# Generate version string using:
> +#   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
> +GLIBC_VERSION = glibc-2.26-72-g77eea8950ce5495ff033bca3465ccfd2db072ae6

And now we are up to glibc-2.26-73-g4b692dffb95ac4812b161eb6a16113d7e824982e

Yes, that's now 73 patches on top of the latest release, and there won't
ever be a dot-release. :-(

Regards,
Yann E. MORIN.

> +# Upstream doesn't officially provide an https download link.
> +# There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
> +# sometimes the connection time out. So use a git mirror using https.
> +GLIBC_SITE = https://github.com/bminor/glibc.git
> +GLIBC_SITE_METHOD = git
>  endif
>  
>  GLIBC_SRC_SUBDIR = .
> -- 
> 2.9.5
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
