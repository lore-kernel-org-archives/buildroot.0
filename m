From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 22 Sep 2016 16:26:33 +0200
Subject: [Buildroot] [PATCH 2/3] Patches for Arietta G25 board based on
 Buildroot 2016.08
In-Reply-To: <CAJkBjxFfz2HwXUn7-g0wSR9KAPsCEqTLVV7uOOaDm7z8_4nFVQ@mail.gmail.com>
References: <1474537834-6002-1-git-send-email-biagio.hkr@gmail.com>
 <1474537834-6002-2-git-send-email-biagio.hkr@gmail.com>
 <CA+TH9VmuCO_SH7HPprgPeYaC62uVzA9FtcufKCpreX=UUYivNg@mail.gmail.com>
 <CAJkBjxEyMmGj+bfmEh2br4YATZc2DS7wQYpT3KBS6ydcbOsn6A@mail.gmail.com>
 <CA+TH9VkhDO8RweevYVtdqQ7TwxrbjEbV-eKA3B9uCMxPyJc+2w@mail.gmail.com>
 <CAJkBjxFfz2HwXUn7-g0wSR9KAPsCEqTLVV7uOOaDm7z8_4nFVQ@mail.gmail.com>
Message-ID: <CA+TH9VnpEtLETjqo1KX83PUrp4sJ8TcDAWq16EmNB5ytpf+u+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Biagio!

2016-09-22 16:25 GMT+02:00 Biagio Montaruli <biagio.hkr@gmail.com>:

> Hi Angelo,
> what do you think about this version of "readme.txt" file for Arietta ? Is
> it good ?
>
> Acme Systems Arietta G25
>>
>> Intro
>> ===
>>
>> This default configuration will allow you to start experimenting with the
>> buildroot environment for the Arietta G25. With the current configuration
>> it will bring-up the board, and allow access through the serial console.
>>
>> You can find additional informations, tutorials and a very comprehensive
>> documentation on http://www.acmesystems.it/arietta.
>>
>> Build instructions
>> =============
>>
>> To build an image for the Arietta G25 choose the configuration
>> corresponding to the Arietta variant.
>>
>> For 128MB RAM variant type:
>>
>> $ make acmesystems_arietta_g25_128mb_defconfig
>>
>> else for 256MB RAM variant type:
>>
>> $ make acmesystems_arietta_g25_256mb_defconfig
>>
>> To customize the configuration chosen type:
>>
>> $ make menuconfig
>>
>> When you are ready to start building Buildroot type:
>>
>> $ make
>>
>> How to write the microSD card
>> ======================
>>
>> Once the build process is finished you will have an image called
>> "sdcard.img"
>> in the output/images/ directory.
>>
>> Copy the bootable "sdcard.img" onto an SD card with "dd":
>>
>>   $ sudo dd if=output/images/sdcard.img of=/dev/sdX
>>
>> Insert the microSD card into the Arietta slot and power it.
>>
>> The image just built is fairly basic and the only output
>> you will get is on serial console, please consider to use a DPI
>> cable (http://www.acmesystems.it/DPI)
>>
>
> If for you it's OK, I will include it in the patch for Arietta.
>

For me it's ok!

Sincerely, Angelo


>
> Best regards,
> Biagio.
>
> 2016-09-22 16:18 GMT+02:00 Angelo Compagnucci <
> angelo.compagnucci at gmail.com>:
>
>> Hi Biagio,
>>
>> 2016-09-22 16:06 GMT+02:00 Biagio Montaruli <biagio.hkr@gmail.com>:
>>
>>> Hi Angelo,
>>> for that patch I have used "Patches for Arietta G25 board based on
>>> Buildroot 2016.08" as title because it adds changes to different files and
>>> not only to the default configuration files of Arietta. Notice that I have
>>> listed the files modified and a summary of changes made to the relative
>>> files including the configuration files for Arietta; anyway I will send a
>>> new patch for Arietta with the title suggested by you
>>> (configs/acmesystems_arietta_g25: updated kernel and at91bootstrap3)
>>>
>>
>> The general rule is to be atomic in patch subject and content, in your
>> case is more than normal that upgrading a configuration involves touching
>> also board files.
>>
>>
>>> I will also include your suggestions for the readme.txt file in the new
>>> patch. Can I use the name "Arietta" instead of "arietta" in the readme.txt
>>> file ?
>>>
>>
>> Yes, sure!
>>
>> Sincerely, Angelo
>>
>>
>>>
>>> Best regards.
>>> Biagio
>>>
>>> 2016-09-22 12:14 GMT+02:00 Angelo Compagnucci <
>>> angelo.compagnucci at gmail.com>:
>>>
>>>> Hi Biagio,
>>>>
>>>> 2016-09-22 11:50 GMT+02:00 Biagio Montaruli <biagio.hkr@gmail.com>:
>>>>
>>>>> - configs/acmesystems_arietta_g25_128mb_defconfig,
>>>>>   configs/acmesystems_arietta_g25_256mb_defconfig :
>>>>>   update default configuration files for both 128MB and 256MB version
>>>>>
>>>>> - board/acmesystems/arietta-g25/genimage.cfg
>>>>>   board/acmesystems/arietta-g25/post-image.sh :
>>>>>   add support for genimage in order to build sdcard.img
>>>>>
>>>>> - board/acmesystems/arietta-g25/readme.txt : update documentation
>>>>>   for Arietta G25 and add notes about how to build sdcard.img
>>>>>
>>>>
>>>> As stated by Thomas in a previous review this patch should have a
>>>> subject like:
>>>>
>>>> configs/acmesystems_arietta_g25: updated kernel ad at91bootstrap
>>>>
>>>> You should do the same for the Aria patch.
>>>>
>>>>
>>>>>
>>>>> Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
>>>>> ---
>>>>>  board/acmesystems/arietta-g25/genimage.cfg      | 12 ++++-----
>>>>>  board/acmesystems/arietta-g25/post-image.sh     |  4 +--
>>>>>  board/acmesystems/arietta-g25/readme.txt        | 33
>>>>> ++++++++++-------------
>>>>>  configs/acmesystems_arietta_g25_128mb_defconfig | 36
>>>>> ++++++++++++++-----------
>>>>>  configs/acmesystems_arietta_g25_256mb_defconfig | 36
>>>>> ++++++++++++++-----------
>>>>>  5 files changed, 63 insertions(+), 58 deletions(-)
>>>>>
>>>>> diff --git a/board/acmesystems/arietta-g25/genimage.cfg
>>>>> b/board/acmesystems/arietta-g25/genimage.cfg
>>>>> index 1080b0e..420f1b6 100644
>>>>> --- a/board/acmesystems/arietta-g25/genimage.cfg
>>>>> +++ b/board/acmesystems/arietta-g25/genimage.cfg
>>>>> @@ -1,18 +1,18 @@
>>>>>  # Minimal SD card image for the Acmesystems Arietta G25
>>>>> -#
>>>>> +
>>>>>  image boot.vfat {
>>>>>         vfat {
>>>>>                 file zImage {
>>>>>                         image = "zImage"
>>>>>                 }
>>>>> -
>>>>> +
>>>>>                 file acme-arietta.dtb {
>>>>> -                       image = "at91-ariag25.dtb"
>>>>> +                       image = "at91-ariettag25.dtb"
>>>>>                 }
>>>>> -
>>>>> +
>>>>>                 file boot.bin {
>>>>> -                       image = "at91sam9x5_arietta-sdcardboot
>>>>> -linux-zimage-dt-3.7.bin"
>>>>> -               }
>>>>> +                       image = "at91sam9x5_arietta-sdcardboot
>>>>> -linux-zimage-dt-3.8.6.bin"
>>>>> +               }
>>>>>         }
>>>>>         size = 16M
>>>>>  }
>>>>> diff --git a/board/acmesystems/arietta-g25/post-image.sh
>>>>> b/board/acmesystems/arietta-g25/post-image.sh
>>>>> index c82b189..2846f56 100755
>>>>> --- a/board/acmesystems/arietta-g25/post-image.sh
>>>>> +++ b/board/acmesystems/arietta-g25/post-image.sh
>>>>> @@ -6,11 +6,9 @@ GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
>>>>>
>>>>>  rm -rf "${GENIMAGE_TMP}"
>>>>>
>>>>> -genimage                               \
>>>>> +genimage  \
>>>>>         --rootpath "${TARGET_DIR}"     \
>>>>>         --tmppath "${GENIMAGE_TMP}"    \
>>>>>         --inputpath "${BINARIES_DIR}"  \
>>>>>         --outputpath "${BINARIES_DIR}" \
>>>>>         --config "${GENIMAGE_CFG}"
>>>>> -
>>>>> -exit $?
>>>>> diff --git a/board/acmesystems/arietta-g25/readme.txt
>>>>> b/board/acmesystems/arietta-g25/readme.txt
>>>>> index 485e275..1899ca2 100644
>>>>> --- a/board/acmesystems/arietta-g25/readme.txt
>>>>> +++ b/board/acmesystems/arietta-g25/readme.txt
>>>>> @@ -1,20 +1,10 @@
>>>>> -Acmesystems Arietta G25
>>>>> -
>>>>> -Intro
>>>>> -=====
>>>>> -
>>>>> -This default configuration will allow you to start experimenting with
>>>>> the
>>>>> -buildroot environment for the Arietta G25. With the current
>>>>> configuration
>>>>> -it will bring-up the board, and allow access through the serial
>>>>> console.
>>>>> -
>>>>> -You can find additional informations, tutorials and a very
>>>>> comprehensive
>>>>> -documentation on http://www.acmesystems.it/arietta.
>>>>>
>>>>
>>>> Why remove this paragraph?
>>>>
>>>>
>>>>> +Acme Systems Arietta G25
>>>>>
>>>>>  Build instructions
>>>>>  ==================
>>>>>
>>>>> -To build an image for the arietta g25 choose the configuration
>>>>> -corresponding to the arietta variant.
>>>>> +To build an image for the Arietta G25 choose the configuration
>>>>> +corresponding to the Arietta variant.
>>>>>
>>>>>  For 128MB RAM variant type:
>>>>>
>>>>> @@ -24,7 +14,11 @@ else for 256MB RAM variant type:
>>>>>
>>>>>  $ make acmesystems_arietta_g25_256mb_defconfig
>>>>>
>>>>> -then:
>>>>> +To customize the configuration chosen type:
>>>>>
>>>>
>>>> Typo: chosen not choosed
>>>>
>>>>
>>>>> +
>>>>> +$ make menuconfig
>>>>> +
>>>>> +When you are ready to start building Buildroot type:
>>>>>
>>>>>  $ make
>>>>>
>>>>> @@ -34,12 +28,13 @@ How to write the microSD card
>>>>>  Once the build process is finished you will have an image called
>>>>> "sdcard.img"
>>>>>  in the output/images/ directory.
>>>>>
>>>>> -Copy the bootable "sdcard.img" onto an SD card with "dd":
>>>>> +Write the bootable SD card image "sdcard.img" onto an SD card with
>>>>> "dd" command:
>>>>>
>>>>>    $ sudo dd if=output/images/sdcard.img of=/dev/sdX
>>>>>
>>>>> -Insert the microSD card into the arietta slot and power it.
>>>>> +Insert the microSD card into the Arietta slot and power it.
>>>>> +
>>>>> +To get the kernel log messages you can use a DPI cable (
>>>>> http://www.acmesystems.it/DPI)
>>>>>
>>>>> -The image just built is fairly basic and the only output
>>>>> -you will get is on serial console, please consider to use a DPI
>>>>> -cable (http://www.acmesystems.it/DPI)
>>>>>
>>>>
>>>> I prefer this paragraph to the one you proposed ;)
>>>>
>>>>
>>>>> +You can find additional informations, tutorials and a very
>>>>> comprehensive
>>>>> +documentation on http://www.acmesystems.it/arietta.
>>>>> diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig
>>>>> b/configs/acmesystems_arietta_g25_128mb_defconfig
>>>>> index e5ddf13..a68ac57 100644
>>>>> --- a/configs/acmesystems_arietta_g25_128mb_defconfig
>>>>> +++ b/configs/acmesystems_arietta_g25_128mb_defconfig
>>>>> @@ -1,30 +1,36 @@
>>>>>  # Architecture
>>>>>  BR2_arm=y
>>>>>
>>>>> -# Toolchain
>>>>> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
>>>>> +# Kernel headers
>>>>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
>>>>>
>>>>> -# Kernel
>>>>> +# System configuration
>>>>> +BR2_TARGET_GENERIC_ISSUE="Welcome to Arietta-G25 Buildroot"
>>>>> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>>>>> +BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
>>>>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25
>>>>> /post-image.sh"
>>>>> +
>>>>> +# Kernel configuration
>>>>>  BR2_LINUX_KERNEL=y
>>>>>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>>>>> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
>>>>> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7.4"
>>>>>  BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
>>>>>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>>>> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
>>>>> -BR2_LINUX_KERNEL_XZ=y
>>>>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariettag25"
>>>>> +
>>>>> +# Root filesystem
>>>>> +BR2_TARGET_ROOTFS_EXT2=y
>>>>> +BR2_TARGET_ROOTFS_EXT2_4=y
>>>>> +BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
>>>>>
>>>>> -# Bootloader
>>>>> +# AT91bootstrap bootloader
>>>>>  BR2_TARGET_AT91BOOTSTRAP3=y
>>>>>  BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>>>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.c
>>>>> om/tanzilli/at91bootstrap.git"
>>>>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="cedbde4b3669
>>>>> 5b715f469f4872f47e5cc8115000"
>>>>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.c
>>>>> om/linux4sam/at91bootstrap.git"
>>>>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.6"
>>>>>  BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-128m"
>>>>>
>>>>> -# Image
>>>>> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25
>>>>> /post-image.sh"
>>>>> -BR2_TARGET_ROOTFS_EXT2=y
>>>>> -BR2_TARGET_ROOTFS_EXT2_4=y
>>>>> -# BR2_TARGET_ROOTFS_TAR is not set
>>>>> -BR2_PACKAGE_HOST_GENIMAGE=y
>>>>> +# Tools to build sdcard.img
>>>>>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>>>>> +BR2_PACKAGE_HOST_GENIMAGE=y
>>>>>  BR2_PACKAGE_HOST_MTOOLS=y
>>>>> diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig
>>>>> b/configs/acmesystems_arietta_g25_256mb_defconfig
>>>>> index cf6f67b..ce9ebac 100644
>>>>> --- a/configs/acmesystems_arietta_g25_256mb_defconfig
>>>>> +++ b/configs/acmesystems_arietta_g25_256mb_defconfig
>>>>> @@ -1,30 +1,36 @@
>>>>>  # Architecture
>>>>>  BR2_arm=y
>>>>>
>>>>> -# Toolchain
>>>>> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
>>>>> +# Kernel headers
>>>>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
>>>>>
>>>>> -# Kernel
>>>>> +# System configuration
>>>>> +BR2_TARGET_GENERIC_ISSUE="Welcome to Arietta-G25 Buildroot"
>>>>> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>>>>> +BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
>>>>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25
>>>>> /post-image.sh"
>>>>> +
>>>>> +# Kernel configuration
>>>>>  BR2_LINUX_KERNEL=y
>>>>>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>>>>> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
>>>>> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7.4"
>>>>>  BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
>>>>>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>>>> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
>>>>> -BR2_LINUX_KERNEL_XZ=y
>>>>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariettag25"
>>>>> +
>>>>> +# Root filesystem
>>>>> +BR2_TARGET_ROOTFS_EXT2=y
>>>>> +BR2_TARGET_ROOTFS_EXT2_4=y
>>>>> +BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
>>>>>
>>>>> -# Bootloader
>>>>> +# AT91bootstrap bootloader
>>>>>  BR2_TARGET_AT91BOOTSTRAP3=y
>>>>>  BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>>>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.c
>>>>> om/tanzilli/at91bootstrap.git"
>>>>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="cedbde4b3669
>>>>> 5b715f469f4872f47e5cc8115000"
>>>>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.c
>>>>> om/linux4sam/at91bootstrap.git"
>>>>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.6"
>>>>>  BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-256m"
>>>>>
>>>>> -# Image
>>>>> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25
>>>>> /post-image.sh"
>>>>> -BR2_TARGET_ROOTFS_EXT2=y
>>>>> -BR2_TARGET_ROOTFS_EXT2_4=y
>>>>> -# BR2_TARGET_ROOTFS_TAR is not set
>>>>> -BR2_PACKAGE_HOST_GENIMAGE=y
>>>>> +# Tools to build sdcard.img
>>>>>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>>>>> +BR2_PACKAGE_HOST_GENIMAGE=y
>>>>>  BR2_PACKAGE_HOST_MTOOLS=y
>>>>> --
>>>>> 2.7.4
>>>>>
>>>>> _______________________________________________
>>>>> buildroot mailing list
>>>>> buildroot at busybox.net
>>>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>>>
>>>>
>>>>
>>>>
>>>> --
>>>> Profile: http://it.linkedin.com/in/compagnucciangelo
>>>>
>>>
>>>
>>
>>
>> --
>> Profile: http://it.linkedin.com/in/compagnucciangelo
>>
>
>


-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160922/77a6b9b1/attachment.html>
