From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 15:10:02 +0200
Subject: [Buildroot] [PATCH v2 3/4] Makefile: check rootfs overlays with
 BR2_ROOTFS_MERGED_USR enabled
In-Reply-To: <34105483.57140.1525698346092.JavaMail.zimbra@datacom.com.br>
References: <20180507124640.7759-1-casantos@datacom.ind.br>
 <20180507124640.7759-4-casantos@datacom.ind.br>
 <20180507145443.6515b0a3@windsurf>
 <34105483.57140.1525698346092.JavaMail.zimbra@datacom.com.br>
Message-ID: <20180507151002.16e5f66d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 7 May 2018 10:05:46 -0300 (BRT), Carlos Santos wrote:

> >>  	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
> >>  		$(call MESSAGE,"Copying overlay $(d)"); \
> >> -		rsync -a --ignore-times --keep-dirlinks $(RSYNC_VCS_EXCLUSIONS) \
> >> -			--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
> >> -			$(d)/ $(TARGET_DIR)$(sep))
> >> +		$(call SYSTEM_RSYNC,$(d),$(TARGET_DIR))$(sep))  
> > 
> > This specific chunk is not directly related to checking that overlays
> > comply with the merged /usr rule, so shouldn't this be in a separate
> > commit ?  
> 
> It removes ?--keep-dirlinks?, so becomes identical to the SYSTEM_RSYNC
> logic, as observed by Peter Korsgaard in a previous message.

Agreed, but I don't see what it has to do with "check rootfs overlays
with BR2_ROOTFS_MERGED_USR enabled".

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
