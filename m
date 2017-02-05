From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 05 Feb 2017 08:59:37 +0100
Subject: [Buildroot] [PATCH v3 01/38] package/libdvdcss: add
	Kodi-specific patches
References: <20170204114451.20935-1-bernd.kuhls@t-online.de>
 <20170204114451.20935-2-bernd.kuhls@t-online.de>
 <20170204230821.GA3805@free.fr>
Message-ID: <XnsA7135B7CF93B2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Hi Yann,

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:20170204230821.GA3805 at free.fr:

> Bernd, All,
> 
> On 2017-02-04 12:44 +0100, Bernd Kuhls spake thusly:
>> The Kodi build system needs .a files to create
>> usr/lib/kodi/system/players/VideoPlayer/libdvdcss-i486-linux.so
> 
> This is really nasty.
> 
> What happens if one does not have the .a library, but just the .so one
> instead? Does the build really fail?

Yes.

> I've had a quick look at cmake/modules/FindLibDvd.cmake and it only
> requires the .a files in the case that it compiles its own version.

Kodi 17 still uses autoconf, support for it will be dropped in Kodi 18.

> So, could you double check if it really does not work with a shared
> version?
> 
> Ditto for libdvdnav and libdvdread.

libdvd* needs .a files:
https://github.com/xbmc/xbmc/blob/Krypton/lib/libdvd/Makefile.in#L7

to build wrapped .so libs based on .o files extracted from .a files:

https://github.com/xbmc/xbmc/blob/Krypton/lib/libdvd/Makefile.in#L75
https://github.com/xbmc/xbmc/blob/Krypton/lib/libdvd/Makefile.in#L84
https://github.com/xbmc/xbmc/blob/Krypton/lib/libdvd/Makefile.in#L85

Regards, Bernd
