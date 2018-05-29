From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 29 May 2018 22:46:41 +0200
Subject: [Buildroot] [PATCH v3 5/5] configs: add Xilinx ZCU106 board
 (ZynqMP SoC)
In-Reply-To: <20180528225519.426a45f9@windsurf.home>
References: <1525364617-23633-1-git-send-email-luca@lucaceresoli.net>
 <1525364617-23633-6-git-send-email-luca@lucaceresoli.net>
 <20180528225519.426a45f9@windsurf.home>
Message-ID: <23e369a7-f12c-b1c9-58bc-728ad2d7d8f3@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 28/05/2018 22:55, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu,  3 May 2018 18:23:37 +0200, Luca Ceresoli wrote:
> 
>> diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
>> new file mode 100644
>> index 000000000000..36643b2f4cdd
>> --- /dev/null
>> +++ b/configs/zynqmp_zcu106_defconfig
>> @@ -0,0 +1,31 @@
>> +BR2_aarch64=y
>> +BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.4"
>> +BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
>> +BR2_TARGET_ROOTFS_EXT2=y
>> +BR2_TARGET_ROOTFS_EXT2_4=y
>> +# BR2_TARGET_ROOTFS_TAR is not set
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
> 
> Shouldn't we specify an explicit version for ATF, just like it's done
> for U-Boot and Linux ?

Absolutely. Will fix that.

Thanks,
-- 
Luca
