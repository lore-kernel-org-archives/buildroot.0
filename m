From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Oct 2020 21:23:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/elfutils: needs host-pkgconf
In-Reply-To: <20201001171153.528731-1-fontaine.fabrice@gmail.com>
References: <20201001171153.528731-1-fontaine.fabrice@gmail.com>
Message-ID: <20201001192337.GA11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-10-01 19:11 +0200, Fabrice Fontaine spake thusly:
> host-pkgconf is a mandatory dependency since version 0.180 and
> https://sourceware.org/git/?p=elfutils.git;a=commit;h=f7f0cdc59a13780938ae3f578955737a75e60ea9
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/123bdb3e7244800e1717f968c1d371e51f7fff2b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/elfutils/elfutils.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
> index 28f86c2fab..3d37c4634b 100644
> --- a/package/elfutils/elfutils.mk
> +++ b/package/elfutils/elfutils.mk
> @@ -10,8 +10,8 @@ ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
>  ELFUTILS_INSTALL_STAGING = YES
>  ELFUTILS_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
>  ELFUTILS_LICENSE_FILES = COPYING COPYING-GPLV2 COPYING-LGPLV3
> -ELFUTILS_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
> -HOST_ELFUTILS_DEPENDENCIES = host-zlib host-bzip2 host-xz
> +ELFUTILS_DEPENDENCIES = host-pkgconf zlib $(TARGET_NLS_DEPENDENCIES)
> +HOST_ELFUTILS_DEPENDENCIES = host-pkgconf host-zlib host-bzip2 host-xz
>  
>  # We patch configure.ac
>  ELFUTILS_AUTORECONF = YES
> -- 
> 2.28.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
