From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Dec 2015 16:16:58 +0100
Subject: [Buildroot] [PATCH 1/1] nfs-utils: install /etc/nfsmount.conf
In-Reply-To: <1450707537-30154-2-git-send-email-yba@tkos.co.il>
References: <1450707537-30154-1-git-send-email-yba@tkos.co.il>
 <1450707537-30154-2-git-send-email-yba@tkos.co.il>
Message-ID: <20151221161658.0aaf830d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jonathan Ben-Avraham,

On Mon, 21 Dec 2015 16:18:56 +0200, Jonathan Ben-Avraham wrote:

> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index 30f12fd..55b75e2 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -38,6 +38,9 @@ endif
>  define NFS_UTILS_INSTALL_FIXUP
>  	rm -f $(NFS_UTILS_TARGETS_)
>  	touch $(TARGET_DIR)/etc/exports
> +	$(INSTALL) -m 744 \

Why 744 and not 644 ? It doesn't make much sense to have an executable
configuration file.

Also, please use the -D option.

> +		$(BUILD_DIR)/nfs-utils-$(NFS_UTILS_VERSION)/utils/mount/nfsmount.conf \

Please use:

		$(@D)/utils/mount/nfsmount.conf

> +		$(TARGET_DIR)/etc

And a full destination path here:

		$(TARGET_DIR)/etc/nfsmount.conf

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
