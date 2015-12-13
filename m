From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Dec 2015 22:41:23 +0100
Subject: [Buildroot] [PATCH v2] package/libfreeglut: new package
References: <1450024301-24083-1-git-send-email-bernd.kuhls@t-online.de>
 <20151213222402.311e1895@free-electrons.com>
Message-ID: <3951kcx3eu.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 13 Dec 2015 22:24:02 +0100 schrieb Thomas Petazzoni:

> Dear Bernd Kuhls,
> 
> Thanks for the new version.
> 
> On Sun, 13 Dec 2015 17:31:41 +0100, Bernd Kuhls wrote:
> 
>> diff --git a/package/libfreeglut/Config.in
>> b/package/libfreeglut/Config.in new file mode 100644 index
>> 0000000..e09e7ef --- /dev/null +++ b/package/libfreeglut/Config.in @@
>> -0,0 +1,20 @@
>> +config BR2_PACKAGE_LIBFREEGLUT +	bool "libfreeglut"
>> +	select BR2_PACKAGE_LIBGLU +	select BR2_PACKAGE_XLIB_LIBXI
> 
> Where is this libXi dependency coming from? (It was already a question
> from my previous review).

Hi,

and I tried to answer your question this afternoon ;)
http://lists.busybox.net/pipermail/buildroot/2015-December/146911.html

libXi is mentioned in the compile instructions in README.cmake:
http://sourceforge.net/p/freeglut/code/HEAD/tree/tags/FG_3_0_0/
README.cmake#l45

because X11/extensions/XInput.h is used in fg_internal_x11.h:
http://sourceforge.net/p/freeglut/code/HEAD/tree/tags/FG_3_0_0/src/x11/
fg_internal_x11.h#l42

This file, X11/extensions/XInput.h, is part of libXi:
http://cgit.freedesktop.org/xorg/lib/libXi/tree/include/X11/extensions

https://packages.debian.org/search?searchon=contents&keywords=X11%
2Fextensions%2FXInput.h&mode=path&suite=stable&arch=any

Regards, Bernd
