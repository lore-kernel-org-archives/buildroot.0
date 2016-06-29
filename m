From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Jun 2016 22:32:52 +0200
Subject: [Buildroot] [PATCH v6 2/6] libsemanage: bump to version 2.5
In-Reply-To: <1466980753-667-3-git-send-email-Aduskett@gmail.com>
References: <1466980753-667-1-git-send-email-Aduskett@gmail.com>
 <1466980753-667-3-git-send-email-Aduskett@gmail.com>
Message-ID: <20160629203252.GE3728@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2016-06-26 18:39 -0400, Adam Duskett spake thusly:
> The 0001-execption-lib-path-fix.patch is also no longer needed, as the
> new version of libsemanage includes the fix provided by the patch.
> As such, the patch was removed, and 0002 was renamed to 0001.
> 
> Audit was added as a dependency as the new version of libsemanage
> will fail to compile searching for audit.h
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/libsemanage/0001-workaround-blackfin-issue.patch b/package/libsemanage/0001-workaround-blackfin-issue.patch
> new file mode 100644
> index 0000000..7ce9606
> --- /dev/null
> +++ b/package/libsemanage/0001-workaround-blackfin-issue.patch
[--SNIP--]
> diff --git a/package/libsemanage/0002-workaround-blackfin-issue.patch b/package/libsemanage/0002-workaround-blackfin-issue.patch
> deleted file mode 100644
> index 5d00c69..0000000
> --- a/package/libsemanage/0002-workaround-blackfin-issue.patch
> +++ /dev/null
[--SNIP--]

So 0002 was renamed to 0001. Next time, please use the -M and -C options
so that git detects renames and copies. This makes it easier to review.

No need to resend just for that.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
> index d4204d1..69f7c8d 100644
> --- a/package/libsemanage/libsemanage.hash
> +++ b/package/libsemanage/libsemanage.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 de2e8077245581e94576276f54e80a53c23c28d6961d2dfbe2f004eaba452e91 libsemanage-2.1.10.tar.gz
> +sha256 46e2f36254369b6e91d1eea0460c262b139361b055a3a67d3ceea2d8ef72e006 libsemanage-2.5.tar.gz
> diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
> index 197c14e..a60d018 100644
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
> +LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux ustr bzip2
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
