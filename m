From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Jun 2014 13:13:20 +0200
Subject: [Buildroot] [PATCH v12 09/32] xbmc-addon-xvdr: bump to a
 version compatible with XBMC Gotham
In-Reply-To: <1402144292-27837-10-git-send-email-bernd.kuhls@t-online.de>
References: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
 <1402144292-27837-10-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140608111320.GE15981@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-06-07 14:31 +0200, Bernd Kuhls spake thusly:
> Removed patch applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

There's a typo in the comment; when fixed, feel free to add my:
 -- Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  .../xbmc-addon-xvdr-0001-foreign-automake.patch    |   28 --------------------
>  package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk         |    7 ++---
>  2 files changed, 4 insertions(+), 31 deletions(-)
>  delete mode 100644 package/xbmc-addon-xvdr/xbmc-addon-xvdr-0001-foreign-automake.patch
> 
> diff --git a/package/xbmc-addon-xvdr/xbmc-addon-xvdr-0001-foreign-automake.patch b/package/xbmc-addon-xvdr/xbmc-addon-xvdr-0001-foreign-automake.patch
> deleted file mode 100644
> index 0f49dcf..0000000
> --- a/package/xbmc-addon-xvdr/xbmc-addon-xvdr-0001-foreign-automake.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -commit 846b0b5a8b559f94dffadf5b2f95ca845b6ba9f1
> -Author: Yann E. MORIN <yann.morin.1998@free.fr>
> -Date:   Wed Mar 26 07:45:58 2014 +0100
> -
> -    configure: set the foreign flag
> -    
> -    This is required since we do not bundle the necessary files (NEWS,
> -    INSTALL et al.) Setting it in configure.in is needed to be able
> -    to run autoreconf (in lieu of the weird autogen.sh)
> -    
> -    Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -
> -Patch accepted upstream in master:
> -    https://github.com/pipelka/xbmc-addon-xvdr/commit/84e5860f488e67a3a3386c779f9a56adeb3dc220
> -
> -diff --git a/configure.in b/configure.in
> -index 6e692e1..7be0d18 100755
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -12,7 +12,7 @@ AC_CANONICAL_HOST
> - AC_CANONICAL_TARGET
> - 
> - dnl Setup for automake
> --AM_INIT_AUTOMAKE
> -+AM_INIT_AUTOMAKE([foreign])
> - 
> - dnl Check for tools
> - 
> diff --git a/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk b/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
> index 28c90f7..1f452de 100644
> --- a/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
> +++ b/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
> @@ -4,9 +4,10 @@
>  #
>  ################################################################################
>  
> -# This cset is on the branch 'xbmc-frodo'
> -# When XBMC is updated, then this should be updated to the corresponding branch
> -XBMC_ADDON_XVDR_VERSION = acd4e145fc3220cf708aaf40d895904732dce2c7
> +# This cset in on master. When a Gotham branch is made, we should

*is on master

Regards,
Yann E. MORIN.

> +# follow it, as incompatible changes in the plugins API can happen
> +# on the master branch.
> +XBMC_ADDON_XVDR_VERSION = 82b5093ad33847f97a978cb620c9a87d2dbcf7eb
>  XBMC_ADDON_XVDR_SITE = $(call github,pipelka,xbmc-addon-xvdr,$(XBMC_ADDON_XVDR_VERSION))
>  XBMC_ADDON_XVDR_LICENSE = GPLv2+
>  XBMC_ADDON_XVDR_LICENSE_FILES = COPYING
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
