From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 2 May 2013 00:04:41 +0200
Subject: [Buildroot] [PATCH v2 3/3] configs: add defconfig for Atmel
 AT91SAM9260-EK Nand Flash Boot
In-Reply-To: <20130501231452.2151618f@skate>
References: <1366184503-16875-1-git-send-email-fabio.porcedda@gmail.com>
 <1366184503-16875-4-git-send-email-fabio.porcedda@gmail.com>
 <20130501231452.2151618f@skate>
Message-ID: <CAHkwnC9rJ+hnqeb+NGGKB-zbzybFtU6_QHHf0Pxp50qAJv1azA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 1, 2013 at 11:14 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,

Hi Thomas,
thanks for reviewing.

> On Wed, 17 Apr 2013 09:41:43 +0200, Fabio Porcedda wrote:
>> This is a configuration that provides a basic setup for generating
>> bootable nandflash images:
>> - at91bootstrap
>> - barebox
>> - kernel
>> - rootfs
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> ---
>>  .../linux-ARM-at91-enable-nand-ubifs-boot.patch    | 44 ++++++++++++++++++++++
>
> I think we generally prefer to store a kernel defconfig, rather than a
> patch against one of the intree kernel defconfigs.

I prefer to modify the defconfig intree kernel to be able to use newer
versions of
the kernel smoothly with little effort if not any effort.

IMHO if i store a custom defconfig i need to change it more often
(maybe for every new kernel version),
instead patching the intree kernel defconfig is less work for me and
for the buildroot maintainers.

IMHO storing a kernel defconfig is better when someone want to use a
specific kernel version
and not the latest upstream version with little modifications.

>
>> diff --git a/configs/at91sam9260eknf_defconfig b/configs/at91sam9260eknf_defconfig
>> new file mode 100644
>> index 0000000..5d26798
>> --- /dev/null
>> +++ b/configs/at91sam9260eknf_defconfig
>> @@ -0,0 +1,15 @@
>> +BR2_arm=y
>> +BR2_PREFER_STATIC_LIB=y
>
> This shouldn't be in a defconfig.

Ok i will send a corrected version without it.

>
>> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
>> +BR2_PACKAGE_HOST_SAM_BA=y
>> +BR2_TARGET_ROOTFS_UBIFS=y
>> +BR2_TARGET_ROOTFS_UBI=y
>> +BR2_TARGET_AT91BOOTSTRAP=y
>> +BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9260ek"
>> +BR2_TARGET_AT91BOOTSTRAP_NANDFLASH=y
>> +BR2_TARGET_BAREBOX=y
>> +BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="at91sam9260ek"
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_PATCH="board/atmel/at91sam9260ek"
>> +BR2_LINUX_KERNEL_DEFCONFIG="at91sam9260"
>> +BR2_LINUX_KERNEL_ZIMAGE=y
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com


Best regards
--
Fabio Porcedda
