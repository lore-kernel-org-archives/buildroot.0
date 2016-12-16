From: =?UTF-8?Q?Jesper_B=C3=A6kdahl?= <jbb@gamblify.com>
Date: Fri, 16 Dec 2016 14:59:36 +0100
Subject: [Buildroot] [PATCH 1/1] gst1-vaapi: new package
In-Reply-To: <20161215214757.0eb1f3d8@free-electrons.com>
References: <1481813631-23515-1-git-send-email-jbb@gamblify.com>
 <20161215214757.0eb1f3d8@free-electrons.com>
Message-ID: <CALnvph3Kr5Rtc8W5FD_oJSRm58sU_gmkNGQfy+M11kCz8BG3TA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15 December 2016 at 21:47, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>> --- /dev/null
>> +++ b/package/gstreamer1/gst1-vaapi/Config.in
>> @@ -0,0 +1,11 @@
>> +config BR2_PACKAGE_GST1_VAAPI
>> +     bool "gst1-vaapi"
>> +     select BR2_PACKAGE_GST1_PLUGINS_BASE
>> +     select BR2_PACKAGE_GST1_PLUGINS_BAD
>
> Are you sure you need those set of plugins to be built to build the
> gst1-vaapi plugin? I'm not too familiar with GStreamer, so maybe this
> is correct, but it looks strange.

I added them based on the requirements section found here:
https://github.com/01org/gstreamer-vaapi

>> +     select BR2_PACKAGE_GST1_PLUGINS_LIBVA
>> +     select BR2_PACKAGE_GST1_PLUGINS_LIBDRM
>
> These two lines however are clearly wrong: those symbols don't exist in
> Buildroot. And your .mk file has a dependency on libva and libdrm
> instead. So these should be:
>
>         select BR2_PACKAGE_LIBVA
>         select BR2_PACKAGE_LIBDRM

Will fix this.

> However, you need to inherit the dependencies of those packages:
>
>         depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
>         depends on !BR2_STATIC_LIBS

I will add those as dependencies too.


Best Regards,

Jesper B?kdahl
Hardware/Software Developer
Gamblify
