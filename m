From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Thu, 07 Feb 2013 10:53:10 +0100
Subject: [Buildroot] [PATCH] Add Gnublin board support
In-Reply-To: <5112BDFC.5020002@mind.be>
References: <1360174408-18232-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <5112BDFC.5020002@mind.be>
Message-ID: <51137986.3060400@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/06/2013 09:33 PM, Arnout Vandecappelle wrote:
> On 06/02/13 19:13, Zoltan Gyarmati wrote:
>> diff --git a/configs/gnublin_defconfig b/configs/gnublin_defconfig
>> new file mode 100644
>> index 0000000..3664b96
>> --- /dev/null
>> +++ b/configs/gnublin_defconfig
>> @@ -0,0 +1,25 @@
>> +BR2_arm=y
>> +BR2_arm926t=y
>> +BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
>> +BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
>> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
>
>  Why are these selected?
>
>> +BR2_TARGET_GENERIC_ISSUE="Welcome to Gnublin"
>> +BR2_TARGET_GENERIC_PASSWD_SHA256=y
>> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y
>
>  Why is this one selected?
>
>> +BR2_PACKAGE_LIBFFI=y
>> +BR2_PACKAGE_NCURSES=y
>> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>
>  Why do you need these packages?
>
>> +BR2_TARGET_ROOTFS_EXT2=y
>> +BR2_TARGET_ROOTFS_EXT2_BLOCKS=512000
>
>  You should mention in the README that the SD card size should be at 
> least 514MB (strange number by the way - wouldn't it make more sense 
> to set the size at 475000 so it may actually fit on a 500MB SD card?)
>
>
>  Regards,
>  Arnout
>
>> +BR2_TARGET_UBOOT=y
>> +BR2_TARGET_UBOOT_BOARDNAME="GNUBLIN"
>> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
>> +BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://gitorious.org/u-boot-gnublin-support/u-boot-gnublin-support.git" 
>>
>> +BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="2009.11_gnublin_support_v2"
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://gitorious.org/linux-3-7-gnublin/linux-3-7-gnublin.git" 
>>
>> +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="gnublin_support_v1"
>> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/gnublin/gnublin_kernel_config" 
>>
>> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>
>

Hi,

hm, ok, i'll clean up more carefully(it seems the configs are still 
representing my setup...), thx for your time and feedback.

-- 
br,
Zoltan Gyarmati
mail: mr.zoltan.gyarmati at gmail.com
freenode nick: zgyarmati
