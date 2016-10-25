From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Tue, 25 Oct 2016 15:28:41 -0700
Subject: [Buildroot] [PATCH] boot-wrapper-aarch64: Allow users to
 specify an initrd/initramfs file.
In-Reply-To: <20161025235728.796804cc@free-electrons.com>
References: <1475880304-21773-1-git-send-email-hollis_blanchard@mentor.com>
 <1475880304-21773-2-git-send-email-hollis_blanchard@mentor.com>
 <20161025235728.796804cc@free-electrons.com>
Message-ID: <f7438160-e3c6-251b-66d8-8a1e1f07a6a3@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/25/2016 02:57 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Fri, 7 Oct 2016 15:45:03 -0700, Hollis Blanchard wrote:
>> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
>> ---
>>   boot/boot-wrapper-aarch64/Config.in               |    8 ++++++++
>>   boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk |    4 ++++
>>   2 files changed, 12 insertions(+), 0 deletions(-)
> Thanks for your patch, sorry for the somewhat slow reply.
No problem; thanks for catching it after a busy week of travel.
>> +config BR2_TARGET_BOOT_WRAPPER_AARCH64_RAMDISK
>> +	string "Ramdisk"
>> +	default ""
> I would like this option to include the filesystem produced by
> Buildroot (in cpio format) as the initramfs. So something like:
>
> 	bool "Include ramdisk in image"
> 	depends on BR2_TARGET_ROOTFS_CPIO

I'm actually using it to embed an AOSP ramdisk.img, so I have 
BR2_TARGET_ROOTFS_CPIO=n, but I can see how that would be more generally 
useful. :-) Perhaps options like these?

config STANDARD_RAMDISK
bool "Include standard ramdisk in image"
depends on BR2_TARGET_ROOTFS_CPIO

config EXTERNAL_RAMDISK
bool "Include external ramdisk in image"
depends on !STANDARD_RAMDISK

config EXTERNAL_RAMDISK_PATH
string "External ramdisk path"
depends on EXTERNAL_RAMDISK

-- 
Hollis Blanchard <hollis_blanchard@mentor.com>
Mentor Graphics Emulation Division
