From: Belisko Marek <marek.belisko@gmail.com>
Date: Wed, 12 Sep 2012 12:00:01 +0200
Subject: [Buildroot] [RFC] Add board support for Raspberry Pi device.
In-Reply-To: <CAHXCMM+v=M_jusWkrwtMsfZSPqz3PqvF0uj1C2o6g_67gFksnA@mail.gmail.com>
References: <1347402977-17837-1-git-send-email-marek.belisko@open-nandra.com>
 <CAHXCMM+v=M_jusWkrwtMsfZSPqz3PqvF0uj1C2o6g_67gFksnA@mail.gmail.com>
Message-ID: <CAAfyv3637FXWDjC=VEO2kzK+CeoU5UXJ_-O8EB=kP8FE6+J74w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Wed, Sep 12, 2012 at 11:50 AM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Marek,
>
> 2012/9/12 Marek Belisko <marek.belisko@open-nandra.com>:
>> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
>>
>> Basic support:
>> - boot binary blobs + VideoCore added in utils package (to avoid fetching 2 times
>>   same repo which is quite big)
>> - added post-build script to adjust password, add config, cmdline files
>> - add actual kernel build 3.2.27 with cutdown config
>> - using external toolchain
>> - some parts was overtaken from commits from: https://github.com/nezticle/RaspberryPi-BuildRoot.git
>>
>> ---
>>  board/raspberrypi/config.txt                   |   41 ++
>>  board/raspberrypi/linux-3.2.27_defconfig       |  546 ++++++++++++++++++++++++
>>  board/raspberrypi/post-build.sh                |   23 +
>>  configs/raspberrypi_defconfig                  |   19 +
>>  package/Config.in                              |    1 +
>>  package/raspberrypi-utils/Config.in            |   21 +
>>  package/raspberrypi-utils/raspberrypi-utils.mk |   41 ++
>>  7 files changed, 692 insertions(+)
>>  create mode 100644 board/raspberrypi/config.txt
>>  create mode 100644 board/raspberrypi/linux-3.2.27_defconfig
>>  create mode 100755 board/raspberrypi/post-build.sh
>>  create mode 100644 configs/raspberrypi_defconfig
>>  create mode 100644 package/raspberrypi-utils/Config.in
>>  create mode 100644 package/raspberrypi-utils/raspberrypi-utils.mk
>>
> [...]
>> diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
>> new file mode 100644
>> index 0000000..e19883d
>> --- /dev/null
>> +++ b/configs/raspberrypi_defconfig
>> @@ -0,0 +1,19 @@
>> +BR2_arm=y
>> +BR2_arm1176jzf_s=y
>> +BR2_TOOLCHAIN_EXTERNAL=y
> Do you use an external toolchain found on the web?
Nope just choose arm1176jzf_s and select external toolchain
which gives me: Sourcery CodeBench ARM 2011.09. to use.
> If yes, IMO, it would be nice to add it as a supported external
> toolchain (see: toolchain/toolchain-external/Config.in and
> toolchain/toolchain-external/ext-tool.mk).
>
>> +BR2_TARGET_GENERIC_HOSTNAME="raspberrypi"
>> +BR2_TARGET_GENERIC_ISSUE="Welcome to RaspberryPi"
>> +BR2_TARGET_GENERIC_GETTY_PORT="tty1"
>> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi/post-build.sh"
>> +BR2_PACKAGE_ZLIB=y
>> +BR2_PACKAGE_RASPBERRYPI_UTILS=y
>> +BR2_PACKAGE_BOOTLOADER=y
>> +BR2_PACKAGE_VIDEOCORE=y
>> +BR2_TARGET_ROOTFS_TAR_GZIP=y
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/raspberrypi/linux.git"
>> +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="rpi-3.2.27"
>> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/raspberrypi/linux-3.2.27_defconfig"
>> +BR2_LINUX_KERNEL_ZIMAGE=y
>
>
>
> Regards,
>
>
> --
> Sam
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

cheers,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
