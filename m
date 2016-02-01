From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 1 Feb 2016 22:07:35 +0100
Subject: [Buildroot] [PATCH 08/10] libimxvpuapi: add new package
In-Reply-To: <20160201214218.3eb39852@free-electrons.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454154357-31625-9-git-send-email-gary.bisson@boundarydevices.com>
 <20160201214218.3eb39852@free-electrons.com>
Message-ID: <CAAMH-yscefcieOucmeT2ZpuqG44LBYvKha9VV93=wN_KJCBh-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Mon, Feb 1, 2016 at 9:42 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Gary Bisson,
>
> On Sat, 30 Jan 2016 12:45:55 +0100, Gary Bisson wrote:
>
>> diff --git a/package/Config.in b/package/Config.in
>> index 09c2b40..d3e5e30 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -1033,6 +1033,7 @@ menu "Multimedia"
>>       source "package/libfslparser/Config.in"
>>       source "package/libfslvpuwrap/Config.in"
>>       source "package/libhdhomerun/Config.in"
>> +     source "package/libimxvpuapi/Config.in"
>
> Why isn't it part of the package/freescale/ directory ? Because it
> isn't sourced from the same site ?

No actually my thought process was that this package is the equivalent
of libfslvpuwrap which, for some reason, isn't part of the
freescale-imx folder. Not sure why, I'm sure there's an historical
reason behind it.

>>       source "package/libmatroska/Config.in"
>>       source "package/libmms/Config.in"
>>       source "package/libmpeg2/Config.in"
>> diff --git a/package/libimxvpuapi/Config.in b/package/libimxvpuapi/Config.in
>> new file mode 100644
>> index 0000000..222aa76
>> --- /dev/null
>> +++ b/package/libimxvpuapi/Config.in
>> @@ -0,0 +1,10 @@
>> +config BR2_PACKAGE_LIBIMXVPUAPI
>> +     bool "libimxvpuapi"
>> +     depends on BR2_arm # Only relevant for i.MX
>> +     select BR2_PACKAGE_FREESCALE_IMX
>> +     select BR2_PACKAGE_IMX_VPU
>
> I am wondering if the first one shouldn't be a "depends on", but I'm
> not sure. What do other think ?
>
>> +     help
>> +       This library provides an API for using the iMX6 VPU video engine. It
>> +       is an alternative to Freescale's VPU wrapper. Both the wrapper and
>> +       this library are layered on top of imx-vpu, the low-level iMX6 VPU
>> +       interface.
>
> A URL to the upstream web page would be good. A github page is fine as
> a fallback if there's no real upstream web site.

Ok, I will add the Github page then:
https://github.com/Freescale/libimxvpuapi

>> diff --git a/package/libimxvpuapi/libimxvpuapi.mk b/package/libimxvpuapi/libimxvpuapi.mk
>> new file mode 100644
>> index 0000000..ff9282d
>> --- /dev/null
>> +++ b/package/libimxvpuapi/libimxvpuapi.mk
>> @@ -0,0 +1,35 @@
>> +################################################################################
>> +#
>> +# libimxvpuapi
>> +#
>> +################################################################################
>> +
>> +LIBIMXVPUAPI_VERSION = 0.10.1
>> +LIBIMXVPUAPI_SITE = $(call github,Freescale,libimxvpuapi,$(LIBIMXVPUAPI_VERSION))
>> +LIBIMXVPUAPI_LICENSE = LGPLv2.1
>
> License seems to be LGPLv2.1+.

The LICENSE file says LGPLv2.1 but indeed the source code headers
state the LGPLv2.1+. Who wins then?
https://github.com/Freescale/libimxvpuapi/blob/master/imxvpuapi/imxvpuapi_jpeg.c#L7
https://github.com/Freescale/libimxvpuapi/blob/master/LICENSE

> Also, you forgot to include a hash file. Could you fix those issues and
> send an updated version?

I might have missed an update, are we providing hash even for Github
projects now?

Regards,
Gary
