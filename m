From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 1 Feb 2016 21:56:25 +0100
Subject: [Buildroot] [PATCH 01/10] firmware-imx: bump to version 5.2
In-Reply-To: <20160201213903.04cdc5be@free-electrons.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454154357-31625-2-git-send-email-gary.bisson@boundarydevices.com>
 <20160201213903.04cdc5be@free-electrons.com>
Message-ID: <CAAMH-yvoH3CgZ7B=EGuP-juf9XLHvYC-4goUE+6moZCDUbbPUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Mon, Feb 1, 2016 at 9:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Gary Bisson,
>
> On Sat, 30 Jan 2016 12:45:48 +0100, Gary Bisson wrote:
>
>> The package adds the EPDC waveforms and the needed changes to properly
>> install those were done in the firmware-imx.inc file.
>
> I guess you wanted to say firmware-imx.mk. Maybe you've done too much
> Yocto :-)

Haha, no trust me I try not to. It's just a bad copy/paste from the
Yocto commit log.

>>  define FIRMWARE_IMX_INSTALL_TARGET_CMDS
>> -     mkdir -p $(TARGET_DIR)/lib/firmware
>> +     mkdir -p $(TARGET_DIR)/lib/firmware/imx
>>       for blobdir in $(FIRMWARE_IMX_BLOBS); do \
>>               cp -r $(@D)/firmware/$${blobdir} $(TARGET_DIR)/lib/firmware; \
>>       done
>> +     cp -r $(@D)/firmware/epdc $(TARGET_DIR)/lib/firmware/imx; \
>
> The ; \ is not needed.
>
>> +     mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
>> +        $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw;
>
> The final is not needed.
>
> Also, this rename is a bit weird, maybe a comment would have been good.

I agree, my guess is that the driver is looking for the .fw file but
the package includes this strange .nonrestricted extension. So I just
copied what was done in the Yocto package.

Regards,
Gary
