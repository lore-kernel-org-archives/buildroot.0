From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 00:11:34 +0100
Subject: [Buildroot] [PATCH 6/6] fs: call pseudo as instructed by the
 pseudo package
In-Reply-To: <f7a170d2df33fe2825b401df89702f02e053c81f.1478553802.git.yann.morin.1998@free.fr>
References: <cover.1478553802.git.yann.morin.1998@free.fr>
 <f7a170d2df33fe2825b401df89702f02e053c81f.1478553802.git.yann.morin.1998@free.fr>
Message-ID: <442f1e0d-f6cd-f7ce-8394-e63283c33446@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-11-16 22:23, Yann E. MORIN wrote:
> Use the newly introduced HOST_PSEUDO variable to call pseudo, ensuring
> the proper environment variables are set.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
> Cc: Erico Nunes <nunes.erico@gmail.com>
> Cc: Julien BOIBESSOT <julien.boibessot@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  fs/common.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 2dbef4d..452b0cc 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -97,7 +97,7 @@ endif
>  		echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
>  	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
>  	chmod a+x $$(FAKEROOT_SCRIPT)
> -	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/pseudo -- $$(FAKEROOT_SCRIPT)
> +	PATH=$$(BR_PATH) $$(HOST_PSEUDO) -- $$(FAKEROOT_SCRIPT)
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
