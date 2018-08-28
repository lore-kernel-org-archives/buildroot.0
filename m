From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 28 Aug 2018 15:03:50 +0200
Subject: [Buildroot] [PATCH next] atop: fix minor() major() build failure
In-Reply-To: <87k1oay87h.fsf@tkos.co.il>
References: <20180828123213.6560-1-giulio.benetti@micronovasrl.com>
 <87k1oay87h.fsf@tkos.co.il>
Message-ID: <d645c828-6281-7c83-e871-0ef750aa437e@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Il 28/08/2018 14:41, Baruch Siach ha scritto:
> Hi Giulio,
> 
> Giulio Benetti writes:
>> On arm / cortex-a8 Arch/Subarch sys/types.h doesn't include
>> sys/sysmacros.h which contains minor() and major() macros.
>>
>> Add patch to directly include <sys/sysmacros.h> into photosyst.c where
>> minor() and major() macros are used.
>>
>> Fixes
>> http://autobuild.buildroot.net/results/3fc/3fc0f18ed94697c404e7ff3751781789170c4fe5//
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>>   .../0001-Fix-major-minor-build-failure.patch  | 32 +++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>   create mode 100644 package/atop/0001-Fix-major-minor-build-failure.patch
>>
>> diff --git a/package/atop/0001-Fix-major-minor-build-failure.patch b/package/atop/0001-Fix-major-minor-build-failure.patch
>> new file mode 100644
>> index 0000000000..d46302dedc
>> --- /dev/null
>> +++ b/package/atop/0001-Fix-major-minor-build-failure.patch
>> @@ -0,0 +1,32 @@
>> +From 1f85bae1fa4b4a021adc71517d218000c53d8501 Mon Sep 17 00:00:00 2001
>> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> +Date: Tue, 28 Aug 2018 14:11:25 +0200
>> +Subject: [PATCH] Fix major() minor() build failure.
>> +
>> +In some toolchain sys/types.h file doesn't include sys/sysmacros.h but
>> +minor() and major() macros are contained there. This causes build failure
>> +using such toolchains(i.e. arm-linux-gnueabihf).
>> +
>> +Add #include <sys/sysmacros.h> directly where using major() and minor()
>> +macros.
>> +
>> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> +---
> 
> Please add a reference to the upstream pull request in the patch
> description:
> 
>    https://github.com/Atoptool/atop/pull/35

I've realized too late there was that PR open that already corrected the 
problem, so I've done mine and sent patch.
After I've sent v2 patch with patch taken from upstream atop PR.

Is it ok?

Thanks
Giulio
