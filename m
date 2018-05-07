From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 7 May 2018 10:28:38 -0300 (BRT)
Subject: [Buildroot] [PATCH v2 3/4] Makefile: check rootfs overlays with
 BR2_ROOTFS_MERGED_USR enabled
In-Reply-To: <20180507151002.16e5f66d@windsurf>
References: <20180507124640.7759-1-casantos@datacom.ind.br>
 <20180507124640.7759-4-casantos@datacom.ind.br>
 <20180507145443.6515b0a3@windsurf>
 <34105483.57140.1525698346092.JavaMail.zimbra@datacom.com.br>
 <20180507151002.16e5f66d@windsurf>
Message-ID: <823032015.70033.1525699718063.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "buildroot" <buildroot@buildroot.org>, "Yann Morin" <yann.morin.1998@free.fr>, "Thomas De Schampheleire"
> <thomas.de_schampheleire@nokia.com>, "Peter Korsgaard" <peter@korsgaard.com>
> Sent: Monday, May 7, 2018 10:10:02 AM
> Subject: Re: [Buildroot] [PATCH v2 3/4] Makefile: check rootfs overlays with BR2_ROOTFS_MERGED_USR enabled

> Hello,
> 
> On Mon, 7 May 2018 10:05:46 -0300 (BRT), Carlos Santos wrote:
> 
>> >>  	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
>> >>  		$(call MESSAGE,"Copying overlay $(d)"); \
>> >> -		rsync -a --ignore-times --keep-dirlinks $(RSYNC_VCS_EXCLUSIONS) \
>> >> -			--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
>> >> -			$(d)/ $(TARGET_DIR)$(sep))
>> >> +		$(call SYSTEM_RSYNC,$(d),$(TARGET_DIR))$(sep))
>> > 
>> > This specific chunk is not directly related to checking that overlays
>> > comply with the merged /usr rule, so shouldn't this be in a separate
>> > commit ?
>> 
>> It removes ?--keep-dirlinks?, so becomes identical to the SYSTEM_RSYNC
>> logic, as observed by Peter Korsgaard in a previous message.
> 
> Agreed, but I don't see what it has to do with "check rootfs overlays
> with BR2_ROOTFS_MERGED_USR enabled".

Hum, well, agree.

[grumpy mode on]

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
