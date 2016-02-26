From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Feb 2016 00:48:06 +0100
Subject: [Buildroot] [v3,
 4/4] beaglebone: adds barebox bootloader defconfig
In-Reply-To: <56D0E40E.40800@mind.be>
References: <1453329821-3167-1-git-send-email-pieter@boesman.nl>
 <1453329821-3167-5-git-send-email-pieter@boesman.nl> <56D0E40E.40800@mind.be>
Message-ID: <56D0E436.6020008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/27/16 00:47, Arnout Vandecappelle wrote:
> On 01/20/16 23:43, Pieter Smith wrote:
>> * Builds barebox MLO and the barebox bootloader.
>> * Barebox integrates a perfectly good device-tree for the bbb, so no dtb is
>>   being generated with the kernel.
>>
>> Signed-off-by: Pieter Smith <pieter@boesman.nl>
>> ---
>>  configs/beaglebone_barebox_defconfig | 39 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>  create mode 100644 configs/beaglebone_barebox_defconfig
>>
>> diff --git a/configs/beaglebone_barebox_defconfig b/configs/beaglebone_barebox_defconfig
>> new file mode 100644
>> index 0000000..b4fd67b
>> --- /dev/null
>> +++ b/configs/beaglebone_barebox_defconfig
>> @@ -0,0 +1,39 @@
>> +# architecture
>> +BR2_arm=y
>> +BR2_cortex_a8=y
>> +BR2_ARM_EABIHF=y
>> +
>> +# system
>> +BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
>> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
>> +BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
>> +# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
>> +
>> +# filesystem
>> +BR2_PACKAGE_AM33X_CM3=y
>> +BR2_TARGET_ROOTFS_EXT2=y
>> +# BR2_TARGET_ROOTFS_TAR is not set
>> +
>> +# lock down headers to avoid breaking with new defaults
>> +BR2_KERNEL_HEADERS_VERSION=y
>> +BR2_DEFAULT_KERNEL_VERSION="3.12.10"
>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y

 Oh, and this should be SAME_AS_KERNEL of course.

 Regards,
 Arnout

>> +
>> +# bootloader
>> +BR2_TARGET_BAREBOX_TWO_CONFIGS=y
>> +BR2_TARGET_BAREBOX=y
>> +BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="am335x"
>> +BR2_TARGET_BAREBOX_USE_SPECIFIC_IMAGE=y
>> +BR2_TARGET_BAREBOX_IMAGE_FILE="barebox-am33xx-beaglebone.img"
>> +BR2_TARGET_BAREBOX_2=y
>> +BR2_TARGET_BAREBOX_2_BOARD_DEFCONFIG="am335x_mlo"
>> +BR2_TARGET_BAREBOX_2_USE_SPECIFIC_IMAGE=y
>> +BR2_TARGET_BAREBOX_2_IMAGE_FILE="barebox-am33xx-beaglebone-mlo.img"
>> +
>> +# kernel
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_LATEST_VERSION=y
> 
>  Kernel version should be locked down as well.
> 
>> +BR2_LINUX_KERNEL_USE_DEFCONFIG=y
>> +BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
>> +BR2_LINUX_KERNEL_ZIMAGE=y
> 
>  Perhaps add a comment here that the dtb from barebox will be used.
> 
>  Regards,
>  Arnout
> 
>>
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
