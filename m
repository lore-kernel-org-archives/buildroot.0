From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 13 Jan 2018 13:22:14 +0100
Subject: [Buildroot] [PATCH 1/2] sunxi-mali-driver-mainline: new package
In-Reply-To: <07b0553f-4358-8e9b-ae74-974018e5df56@micronovasrl.com>
References: <1511648569-18855-1-git-send-email-giulio.benetti@micronovasrl.com>
 <20171127142850.brtfcvts6syjukdb@flea.home>
 <3741cc81-7597-ef36-8e8e-d2254bf68519@micronovasrl.com>
 <07b0553f-4358-8e9b-ae74-974018e5df56@micronovasrl.com>
Message-ID: <bf59fc04-f2d8-07dd-140b-04d23166046f@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

when could it be ok to update git commit SHA1 to the latest
and integrate parallel build and last Help description?

Regards

-- 
Giulio Benetti
R&D Manager &
Advanced Research

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

Il 28/11/2017 00:34, Giulio Benetti ha scritto:
> Hello everybody,
> 
> Il 27/11/2017 16:23, Giulio Benetti ha scritto:
>> Hi Maxime,
>>
>> Il 27/11/2017 15:28, Maxime Ripard ha scritto:
>>> Hi,
>>>
>>> On Sat, Nov 25, 2017 at 11:22:48PM +0100, Giulio Benetti wrote:
>>>> Added kernel allwinner mali driver package.
>>>> Used combined with userspace Allwinner openGL libraries,
>>>> it gives possibility to use 3D openGL SoC acceleration.
>>>>
>>>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>>>> ---
>>>> ? DEVELOPERS???????????????????????????????????????? |? 3 ++
>>>> ? package/Config.in????????????????????????????????? |? 1 +
>>>> ? package/sunxi-mali-driver-mainline/Config.in?????? | 38 
>>>> ++++++++++++++++++++++
>>>> ? .../sunxi-mali-driver-mainline.mk????????????????? | 30 
>>>> +++++++++++++++++
>>>> ? 4 files changed, 72 insertions(+)
>>>> ? create mode 100644 package/sunxi-mali-driver-mainline/Config.in
>>>> ? create mode 100644 
>>>> package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
>>>>
>>>> diff --git a/DEVELOPERS b/DEVELOPERS
>>>> index 7621f96..60a934e 100644
>>>> --- a/DEVELOPERS
>>>> +++ b/DEVELOPERS
>>>> @@ -698,6 +698,9 @@ F:??? package/ocrad/
>>>> ? F:??? package/tesseract-ocr/
>>>> ? F:??? package/webp/
>>>> +N:??? Giulio Benetti <giulio.benetti@micronovasrl.com>
>>>> +F:??? package/sunxi-mali-driver-mainline/
>>>> +
>>>> ? N:??? Gregory Dymarek <gregd72002@gmail.com>
>>>> ? F:??? package/ding-libs/
>>>> ? F:??? package/gengetopt/
>>>> diff --git a/package/Config.in b/package/Config.in
>>>> index fe5ccc4..e619992 100644
>>>> --- a/package/Config.in
>>>> +++ b/package/Config.in
>>>> @@ -497,6 +497,7 @@ endmenu
>>>> ????? source "package/stm32flash/Config.in"
>>>> ????? source "package/sunxi-cedarx/Config.in"
>>>> ????? source "package/sunxi-mali/Config.in"
>>>> +??? source "package/sunxi-mali-driver-mainline/Config.in"
>>>> ????? source "package/sysstat/Config.in"
>>>> ????? source "package/targetcli-fb/Config.in"
>>>> ????? source "package/ti-gfx/Config.in"
>>>> diff --git a/package/sunxi-mali-driver-mainline/Config.in 
>>>> b/package/sunxi-mali-driver-mainline/Config.in
>>>> new file mode 100644
>>>> index 0000000..1f9ef59
>>>> --- /dev/null
>>>> +++ b/package/sunxi-mali-driver-mainline/Config.in
>>>> @@ -0,0 +1,38 @@
>>>> +comment "sunxi-mali-driver-mainline needs a Linux kernel to be built"
>>>> +??? depends on !BR2_LINUX_KERNEL
>>>> +
>>>> +config BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE
>>>> +??? bool "sunxi-mali-driver-mainline"
>>>> +??? depends on BR2_LINUX_KERNEL
>>>> +??? select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
>>>> +??? help
>>>> +????? This package builds and installs the Linux kernel driver for
>>>> +????? the Mali GPU on Allwinner platforms, compatible with recent
>>>> +????? Linux kernels (>= 4.4). Note that it should be installed
>>>> +????? together with the corresponding userspace OpenGL libraries,
>>>> +????? which are provided as binaries only at:
>>>> +????? https://github.com/free-electrons/mali-blobs
>>>> +
>>>> +????? sunxi-mali-driver-mainline requires a Linux kernel >= 4.4 
>>>> with the
>>>> +????? following options enabled:
>>>> +
>>>> +????? - CONFIG_CMA
>>>> +????? - CONFIG_DMA_CMA
>>>> +????? - CONFIG_DRM_FBDEV_OVERALLOC >= 200 for double buffer or more
>>>
>>> Sorry for missing that out earlier, but that one is not true. You can
>>> achieve the same result using the drm_fbdev_overalloc kernel paremeter.
>>
>> Ok, I add it on Help.
> 
> y_morin on #buildroot irc told me that maybe this missing Help phrase 
> can be added by the one who will commit the patch.
> Is it ok, or do I have to submit a new patch?
> 
> Kind regards
> 
>>
>> Thanks
>>
>>>
>>> The rest looks good.
>>>
>>> Maxime
>>>
>>
>>
> 
> 
