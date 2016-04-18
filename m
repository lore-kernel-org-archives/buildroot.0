From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 18 Apr 2016 21:57:49 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/opencv: module objdetect
 depends on imgproc
In-Reply-To: <20160418212003.393f594c@free-electrons.com>
References: <1460992275-383-1-git-send-email-bernd.kuhls@t-online.de>
 <1460992275-383-2-git-send-email-bernd.kuhls@t-online.de>
 <20160418212003.393f594c@free-electrons.com>
Message-ID: <CAHXCMM+gkMR16KjCW=-2o0vw_0tXDmB931ZbVk1t=WwEOPj7+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Mon, Apr 18, 2016 at 9:20 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Samuel,
>
> Can you comment on this one? I thought we had no expression of the
> interdependencies between OpenCV modules. Are those interdependencies
> build-time dependencies or run-time dependencies?
In opencv(2) we don't, in opencv3 we do.

I did the work on opencv3 when bumping the package, but did not take
the time to do it on opencv(2) after we reverted it.

These interdependencies are build-time deps., they are already
expressed in the cmake code.
One just needs to extract the info and report it in the Config.in.
I'll check if I can quickly dig up something about this on the
opencv(2) package.

Regards,

>
> Bernd, if this patch is needed, then it should be the first patch in
> the series, not the second one.
>
> Thomas
>
> On Mon, 18 Apr 2016 17:11:15 +0200, Bernd Kuhls wrote:
>> The mod_cv module of Freeswitch depends on the objdetect module from
>> opencv, as noted by Samuel:
>> http://lists.busybox.net/pipermail/buildroot/2016-April/158902.html
>>
>> Checking for opencv support in Freeswitch should only include the
>> direct dependency, objdetect in this case, and not inter-module
>> dependencies.
>> This patch reflects the dependency of objdetect on imgproc.
>>
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>> ---
>> v2: initial release (Samuel)
>>
>>  package/opencv/Config.in | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
>> index 8bc6c34..d87ca00 100644
>> --- a/package/opencv/Config.in
>> +++ b/package/opencv/Config.in
>> @@ -75,6 +75,7 @@ config BR2_PACKAGE_OPENCV_LIB_NONFREE
>>  config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
>>       bool "objdetect"
>>       default y
>> +     select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>>       help
>>         Include opencv_objdetect module into the OpenCV build.
>>
>
>
>
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Samuel
