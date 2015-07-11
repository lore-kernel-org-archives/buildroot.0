From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Jul 2015 15:07:54 +0200
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add support for i.MX28 NAND
 format
In-Reply-To: <20150711141137.23d3de04@free-electrons.com>
References: <1427645447-2419-1-git-send-email-joerg.krause@embedded.rocks>
 <20150711141137.23d3de04@free-electrons.com>
Message-ID: <55A1152A.6080702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/15 14:11, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Sun, 29 Mar 2015 18:10:46 +0200, J?rg Krause wrote:
>> Allow to generate 'u-boot.nand', Freescale i.MX28 BootStream format (.sb)
>> with a header for booting from NAND flash.
>>
>> There are two possibilities when preparing an image writable to NAND flash:
>> 1) The NAND was not written at all yet or the BCB (Boot Control Blocks) is
>>    broken. In this case, the NAND image 'u-boot.nand' needs to written.
>> 2) The NAND flash was already written with a good BCB. This applies after
>>    'u-boot.nand' was correctly written. There is no need to write the BCB
>>    again. In this case, the bootloader can be upgraded by writing 'u-boot.sb'.
>>
>> To satisfy both cases 'u-boot.nand' as well as the make target 'u-boot.sb' are
>> copied to the binaries directory.
>>
>> mxsboot for NAND images needs all three parameters typed in as integer values
>> (hex values do not work). The default values choosen are typical sizes for a
>> NAND flash.
>>
>> For more information see:
>> http://www.denx-cs.de/doku/?q=m28evkrunuboot
>>
>> Commit Note: This patch is based on top of
>> "[PATCH v2 1/2] boot/uboot: add support for i.MX28 SD format"
>> http://patchwork.ozlabs.org/patch/453116/
>>
>> ---
>> Changes v1 -> v2 (all suggested by Arnout Vandecappelle):
>>   - Rebase on top of boot/uboot: add support for i.MX28 SD format
>>     http://patchwork.ozlabs.org/patch/453116/
>>   - Remove trailing whitespace
>>   - Fix typo and wrapping
>>   - Add an explanation like in the commit log to the help text, so the user
>>     knows why he gets two images (u-boot.nand and u-boot.sb) in the binaries
>>     directory
>>   - Explicitly mention in mxsboots options help text that the value has to
>>     be "a decimal integer value"
>>   - erase -> eraseblock in BR2_TARGET_UBOOT_FORMAT_NAND_ERASE_SIZE
>>   - Add dependency on host-elftosb
> 
> Applied, thanks.
> 
> Thomas
> 

 Unfortunately, the Sob dropped off because it was below the --- line.

 Joerg, please pay attention in the future that the Sob (and CC and Reviewed
tags etc) is above the --- line.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
