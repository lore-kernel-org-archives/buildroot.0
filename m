From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Nov 2016 01:28:17 +0100
Subject: [Buildroot] [PATCH 4/5] fs: call the pseudo wrapper
In-Reply-To: <3cb16b41f768b4e7e92ad1a482ab91066e661376.1478643505.git.yann.morin.1998@free.fr>
References: <cover.1478643505.git.yann.morin.1998@free.fr>
 <3cb16b41f768b4e7e92ad1a482ab91066e661376.1478643505.git.yann.morin.1998@free.fr>
Message-ID: <1daefddf-444a-214c-84f6-e8757b2a007c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-11-16 23:18, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
> Cc: Erico Nunes <nunes.erico@gmail.com>
> Cc: Julien BOIBESSOT <julien.boibessot@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  fs/common.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 2dbef4d..22f3de5 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -97,7 +97,7 @@ endif
>  		echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
>  	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
>  	chmod a+x $$(FAKEROOT_SCRIPT)
> -	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/pseudo -- $$(FAKEROOT_SCRIPT)
> +	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/pseudo-wrapper -- $$(FAKEROOT_SCRIPT)
>  	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
>  	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
>  ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
