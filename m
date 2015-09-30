From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Wed, 30 Sep 2015 11:36:55 +0100
Subject: [Buildroot] board: add support for Synopsys VDK Software
 Development Platform
In-Reply-To: <20150930123426.5eb66486@free-electrons.com>
References: <3d88a36124c3fa652b6a54e3a2d0ac1e2c165375.1443605861.git.jpinto@synopsys.com>
 <20150930123426.5eb66486@free-electrons.com>
Message-ID: <560BBB47.1040005@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On 9/30/2015 11:34 AM, Thomas Petazzoni wrote:
> Dear Joao Pinto,
> 
> On Wed, 30 Sep 2015 10:44:29 +0100, Joao Pinto wrote:
>> The Virtualizer Development Kit (VDK) Family for ARM Cortex Products consists of a set of virtual
>> prototypes that provide a virtualizer for the ARM core variants. The VDK is a standalone package that runs
>> on an host computer.
> 
> You already sent the same patch yesterday. What are the changes in this
> new version? New versions of patches should have a different version
> number, and carry a changelog (see the Buildroot manual for details).

It is the same patch. I changed the title (in order to match the std procedure
and added extra content to explain what is the VDK platform).

I'll check your comments and produce a 2nd version of this patch.

Thanks,
-Joao

> 
> Also, your commit log message should be wrapped to ~72 characters.
> 
>>  board/synopsys/vdk/fs-overlay/etc/inittab |   28 +
> 
> You could add a paragraph in your commit log that explains why a custom
> inittab is used.
> 
>>  board/synopsys/vdk/linux-vdk-defconfig    | 2914 +++++++++++++++++++++++++++++
> 
> Please use a defconfig, which you can generate with "make
> linux-update-defconfig". It will make the file much much smaller.
> 
> 
>> diff --git a/configs/snps_vdk_defconfig b/configs/snps_vdk_defconfig
>> new file mode 100644
>> index 0000000..c1b1b8a
>> --- /dev/null
>> +++ b/configs/snps_vdk_defconfig
>> @@ -0,0 +1,17 @@
>> +BR2_aarch64=y
>> +BR2_KERNEL_HEADERS_3_18=y
>> +BR2_TARGET_GENERIC_HOSTNAME="vdk-buildroot"
>> +BR2_TARGET_GENERIC_ISSUE="Welcome to SNPS VDK by Buildroot"
>> +BR2_INIT_SYSV=y
> 
> No, please use the default init system (i.e Busybox).
> 
>> +BR2_SYSTEM_BIN_SH_BASH=y
> 
> Ditto, use the default value.
> 
>> +BR2_ROOTFS_OVERLAY="board/synopsys/vdk/fs-overlay"
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.linaro.org/kernel/linux-linaro-tracking.git"
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-linaro-3.18-2014.12"
>> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/synopsys/vdk/linux-vdk-defconfig"
>> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
>> +BR2_PACKAGE_PCIUTILS=y
> 
> No special packages in defconfigs.
> 
>> +BR2_TARGET_ROOTFS_EXT2=y
> 
> Any reason to generate an ext2 filesystem here? Is it used for the
> emulator/simulator?
> 
> Thanks!
> 
> Thomas
> 
