From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jan 2020 11:46:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/autofs: fix fsck program paths
In-Reply-To: <20190819220520.24833-1-fontaine.fabrice@gmail.com>
References: <20190819220520.24833-1-fontaine.fabrice@gmail.com>
Message-ID: <20200101104648.GH3519@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-08-20 00:05 +0200, Fabrice Fontaine spake thusly:
> Following Arnout review of "autofs: fix mount, umount and fsck program
> paths" in https://patchwork.ozlabs.org/patch/1148086, set
> ac_cv_path_E2FSCK to /sbin/fsck and ac_cv_path_E{3,4}FSCK to no so that
> the fsck wrapper will always gets used (if the e3 and e4 versions don't
> exist, the e2 version is used regardless of fs type).
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/autofs/autofs.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
> index 1a5cb3ce8f..14e78a7e88 100644
> --- a/package/autofs/autofs.mk
> +++ b/package/autofs/autofs.mk
> @@ -15,9 +15,9 @@ AUTOFS_DEPENDENCIES = host-flex host-bison host-pkgconf host-nfs-utils
>  # umount and fsck programs so tell it explicitly where they will be
>  # located on the target.
>  AUTOFS_CONF_ENV = \
> -	ac_cv_path_E2FSCK=/usr/sbin/fsck.ext2 \
> -	ac_cv_path_E3FSCK=/usr/sbin/fsck.ext3 \
> -	ac_cv_path_E4FSCK=/usr/sbin/fsck.ext4 \
> +	ac_cv_path_E2FSCK=/sbin/fsck \
> +	ac_cv_path_E3FSCK=no \
> +	ac_cv_path_E4FSCK=no \
>  	ac_cv_path_KRB5_CONFIG=no \
>  	ac_cv_path_MODPROBE=/sbin/modprobe \
>  	ac_cv_path_MOUNT=/bin/mount \
> -- 
> 2.20.1
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
