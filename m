From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Dec 2018 10:18:44 +0100
Subject: [Buildroot] [PATCH v4 3/3] fs/common.mk: make sure that static
 devices from packages are created
In-Reply-To: <20181205085311.6603a2b0@windsurf>
References: <20181203210508.27831-1-thomas.petazzoni@bootlin.com>
 <20181203210508.27831-4-thomas.petazzoni@bootlin.com>
 <606d6e8b-873c-2bb1-e3fb-861df79d819c@mind.be>
 <20181205085311.6603a2b0@windsurf>
Message-ID: <4d2c4fa4-6354-3b54-f6a4-2269739288c2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/12/2018 08:53, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 4 Dec 2018 22:05:19 +0100, Arnout Vandecappelle wrote:
> 
>>> diff --git a/fs/common.mk b/fs/common.mk
>>> index 077ce8903e..a560417c6c 100644
>>> --- a/fs/common.mk
>>> +++ b/fs/common.mk
>>> @@ -61,10 +61,10 @@ endif
>>>  	$(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) > $(ROOTFS_FULL_DEVICES_TABLE)
>>>  ifneq ($(ROOTFS_DEVICE_TABLES),)
>>>  	cat $(ROOTFS_DEVICE_TABLES) >> $(ROOTFS_FULL_DEVICES_TABLE)
>>> +endif
>>>  ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
>>>  	$(call PRINTF,$(PACKAGES_DEVICES_TABLE)) >> $(ROOTFS_FULL_DEVICES_TABLE)
>>>  endif  
>>
>>  This is still conflicting with the purpose of patch 2/3: the package device
>> tables are still overriding the user-specified global device table.
> 
> Fair point. Should we do:
> 
> 	$(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) > $(ROOTFS_FULL_DEVICES_TABLE)
> ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
> 	$(call PRINTF,$(PACKAGES_DEVICES_TABLE)) >> $(ROOTFS_FULL_DEVICES_TABLE)
> endif
> ifneq ($(ROOTFS_DEVICE_TABLES),)
> 	cat $(ROOTFS_DEVICE_TABLES) >> $(ROOTFS_FULL_DEVICES_TABLE)
> endif
> 
> instead ?

 Yep, that's what I meant. I guess.

 Regards,
 Arnout
