From: Steve Kenton <skenton@ou.edu>
Date: Mon, 02 Feb 2015 16:04:59 -0600
Subject: [Buildroot] [PATCH  V2] mjpegtools: new package
In-Reply-To: <20150202205339.GA4270@free.fr>
References: <54BBE13C.7000600@ou.edu> <20150202205339.GA4270@free.fr>
Message-ID: <54CFF48B.1070506@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2/2/2015 2:53 PM, Yann E. MORIN wrote:
> Steve, All,
>
> On 2015-01-18 10:37 -0600, Steve Kenton spake thusly:
>> The mjpegtools programs are a set of tools
>> that can do recording of videos and playback,
>> simple cut-and-paste editing and the MPEG
>> compression of audio and video under Linux.
>>
>> http://mjpeg.sourceforge.net
>>
>> Signed-off-by Stephen M. Kenton<skenton@ou.edu>
> [--SNIP--]
>> diff -pruN buildroot.ori/package/mjpegtools/Config.in buildroot/package/mjpegtools/Config.in
>> --- buildroot.ori/package/mjpegtools/Config.in	1969-12-31 18:00:00.000000000 -0600
>> +++ buildroot/package/mjpegtools/Config.in	2015-01-16 11:05:54.949872151 -0600
>> @@ -0,0 +1,14 @@
>> +config BR2_PACKAGE_MJPEGTOOLS
>> +	bool "mjpegtools"
>> +	select BR2_PACKAGE_JPEG
>> +	depends on BR2_INSTALL_LIBSTDCPP
> I tried with this defconfig:
>      http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config
>
> and just enabled mjpegtools above that, and it failed with:
>
>      In file included from picture.hh:27:0,
>                       from motionest.cc:61:
>      synchrolib.h:32:21: fatal error: pthread.h: No such file or directory
>       #include<pthread.h>
>                           ^
>      compilation terminated.
>
> So, it needs thread support.
>
OK, I'll look into it

Steve
