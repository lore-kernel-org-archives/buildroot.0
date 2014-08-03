From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 03 Aug 2014 14:40:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Bump to version 2.3.1
References: <1407017477-8540-1-git-send-email-bernd.kuhls@t-online.de>
 <20140803102404.7d7fa4b6@free-electrons.com>
 <XnsA37E88A2EAAF0berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20140803143250.362afa9e@free-electrons.com>
Message-ID: <XnsA37E953C3F7DEberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20140803143250.362afa9e at free-electrons.com:

> Dear Bernd Kuhls,
> 
> On Sun, 03 Aug 2014 13:25:55 +0200, Bernd Kuhls wrote:
> 
>> output/build/ffmpeg-2.3.1/config.log contains
>> ffconf.Vyn5TU6p.c:(.text+0x1f): undefined reference to `fminf'
>> 
>> which leads to 
>> 
>> #define HAVE_FMINF 0
>> 
>> in output/build/ffmpeg-2.3.1/config.h which seems true when looking at
>> http://git.uclibc.org/uClibc/tree/libm/float_wrappers.c#n48
> 
> So, this should work without the need for your patch, right?

Hi,

I do not know why the code is broken, but without my patch ffmpeg did not 
compile. Because uClibc does not provide fminf ffmpeg?s own implementation of 
fminf in libavutil/libm.h is compiled, but this breaks.

Removing the whole fminf function works because fminf is used nowhere in 
ffmpeg.

Having a look at
http://git.videolan.org/?p=ffmpeg.git;a=history;f=libavutil/libm.h;h=
28d5df871b39a1a8f99bc9540d7f9a8ccd840d59;hb=HEAD

we can see that there were already five commits to implement fminf.
I will open a bug report.

Regards, Bernd
