From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jun 2016 00:24:39 +0200
Subject: [Buildroot] [PATCH 5/7] libsemanage: bump to version 2.5
In-Reply-To: <1466803929-5513-5-git-send-email-Aduskett@gmail.com>
References: <1466803929-5513-1-git-send-email-Aduskett@gmail.com>
 <1466803929-5513-5-git-send-email-Aduskett@gmail.com>
Message-ID: <20160624222439.GG4157@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2016-06-24 17:32 -0400, Adam Duskett spake thusly:
> In addition to bumping the version to 2.5, the new version requires audit (as far as I can tell, it fails compilation without it while compilaining it can't find audit.h)
> Also the new version of libsemanage already has the fix provided by 0001-execption-lib-path-fix.patch and therefor I removed it.
> Because of the removal of that patch, I renamed 0002-workaround-blackfin-issue.patch to 0001-workaround-blackfin-issue.patch

Long lines... ;-)

> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
> index 197c14e..fead50d 100644
> --- a/package/libsemanage/libsemanage.mk
> +++ b/package/libsemanage/libsemanage.mk
> @@ -4,11 +4,11 @@
>  #
>  ################################################################################
>  
> -LIBSEMANAGE_VERSION = 2.1.10
> -LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
> +LIBSEMANAGE_VERSION = 2.5
> +LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
>  LIBSEMANAGE_LICENSE = LGPLv2.1+
>  LIBSEMANAGE_LICENSE_FILES = COPYING
> -LIBSEMANAGE_DEPENDENCIES = host-bison host-flex libselinux ustr bzip2
> +LIBSEMANAGE_DEPENDENCIES = host-bison host-flex host-audit libselinux ustr bzip2

So, it only needs audit as a host tool during the build? That's weird,
as, as you report, it complains about a missing audit.h, which seems to
imply it wants to include it, so needs the target variant.

So, probably you meant to add just 'audit', not 'host-audit'. Right?

Regards,
Yann E. MORIN.

>  LIBSEMANAGE_INSTALL_STAGING = YES
>  
>  LIBSEMANAGE_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
> -- 
> 2.7.4
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
