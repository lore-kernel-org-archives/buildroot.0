From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Jan 2017 23:30:03 +0100
Subject: [Buildroot] [PATCH] boot-wrapper-aarch64: Allow users to
 specify an initrd/initramfs file.
In-Reply-To: <34543eb7-53cc-957b-31af-88a8319e3208@mentor.com>
References: <1475880304-21773-1-git-send-email-hollis_blanchard@mentor.com>
 <1475880304-21773-2-git-send-email-hollis_blanchard@mentor.com>
 <20161025235728.796804cc@free-electrons.com>
 <34543eb7-53cc-957b-31af-88a8319e3208@mentor.com>
Message-ID: <6451f7b7-abcb-e3ad-eb21-973265a89321@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-01-17 00:55, Hollis Blanchard wrote:
> On 10/25/2016 02:57 PM, Thomas Petazzoni wrote:
>>>   boot/boot-wrapper-aarch64/Config.in               |    8 ++++++++
>>>   boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk |    4 ++++
>>>   2 files changed, 12 insertions(+), 0 deletions(-)
>> [...]
>>
>> It should be something like:
>>
>> ifeq ($(BR2_TARGET_BOOT_WRAPPER_AARCH64_RAMDISK),y)
>> BOOT_WRAPPER_AARCH64_CONF_OPTS += --with-initrd=$(BINARIES_DIR)/rootfs.cpio
>> BOOT_WRAPPER_AARCH64_DEPENDENCIES += rootfs-cpio
>> endif
> I'm preparing a resend on this, but I'm having trouble with the dependency:
> 
> $ rm /scratch1/hblancha/build/buildroot/images/rootfs.cpio
> $ make O=/scratch1/hblancha/build/buildroot boot-wrapper-aarch64-dirclean all
> [...]
> /scratch1/hblancha/build/buildroot/host/usr/bin/aarch64-buildroot-linux-gnu-ld:
> cannot find /scratch1/hblancha/build/buildroot/images/rootfs.cpio
> 
> I can see that rootfs-* is defined and used in fs/, but, well, ... it doesn't
> seem to be working in this boot/ Makefile. Any advice?

 Difficult to say without seeing the patch. Does it work correctly if you call
'make rootfs-cpio boot-wrapper-arch64'?


 Regards,
 Arnout

> 
> Hollis Blanchard <hollis_blanchard@mentor.com>
> Mentor Graphics Emulation Division
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
