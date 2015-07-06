From: =?windows-1252?Q?Guillaume_GARDET_-_Olis=E9o?= <guillaume.gardet@oliseo.fr>
Date: Mon, 06 Jul 2015 14:17:11 +0200
Subject: [Buildroot] [PATCH V4] sdl2: new package
In-Reply-To: <559975AD.9030004@openwide.fr>
References: <20150629222241.GF3669@free.fr>
 <1435824981-6312-1-git-send-email-guillaume.gardet@oliseo.fr>
 <559975AD.9030004@openwide.fr>
Message-ID: <559A71C7.6080804@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 05/07/2015 20:21, Romain Naour a ?crit :
> Hi Guillaume,
>
> Le 02/07/2015 10:16, Guillaume GARDET a ?crit :
>> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Cc: Romain Naour <romain.naour@openwide.fr>
>> Cc: Yann E. Morin <yann.morin.1998@free.fr>
>>
>> ---
>>
>> Changes in V4:
>> * Fix comments places in Config.in
>>
>> Changes in V3:
>> * Add dependenies comments for DirectFB and X11 options
>> * Fix license filename
>> * Add explicit enable/disable options for libudev
>> * Fix typo: s/succesful/successful/
>> * Add more X11 dependencies: x11-xcursor, x11-xinerama, x11-xinput, x11-scrnsaver
>> * Disbale opengl/opengles video diver explicitly
>> * Use --disable-rpath option option instead of manual fix
>>
>> Changes in V2:
>> * Fix SDL2 case: s/SDL2/sdl2/
>> * Add dependency on toolchain with dynamic library
>> * Remove unneeded 'SDL2' in sub-options names
>> * Remove unneeded space after comma in if statement
>> * Add explicit enable/disable options for tslib and alsa
>> * Remove Mesa3D optional part
>> * Move unconditionnal SDL2_CONF_OPTS upper
>> * Remove host build
>>
>>
>>   package/Config.in      |  1 +
>>   package/sdl2/Config.in | 32 ++++++++++++++++++++++++
>>   package/sdl2/sdl2.mk   | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 101 insertions(+)
>>   create mode 100644 package/sdl2/Config.in
>>   create mode 100644 package/sdl2/sdl2.mk
>>
> [snip]
>
>> +SDL2_DEPENDENCIES += \
>> +	xlib_libX11 xlib_libXext \
>> +	$(if $(BR2_PACKAGE_XLIB_LIBXRENDER),xlib_libXrender) \
>> +	$(if $(BR2_PACKAGE_XLIB_LIBXRANDR),xlib_libXrandr) \
>> +	$(if $(BR2_PACKAGE_XLIB_LIBXCURSOR,xlib_libXcursor) \
>> +	$(if $(BR2_PACKAGE_XLIB_LIBXINERAMA,xlib_libXinerama) \
>> +	$(if $(BR2_PACKAGE_XPROTO_INPUTPROTO,xproto_inputproto) \
>> +	$(if $(BR2_PACKAGE_XPROTO_SCRNSAVERPROTO,xproto_scrnsaverproto)
> There are missing ',' and ')' here.

Ok for ')', it is clearly a typo, but why do you want to add an extra comma? It is not the case for other packages.

>
> This part should look like:
>
> SDL2_DEPENDENCIES += \
> 	xlib_libX11 xlib_libXext \
> 	$(if $(BR2_PACKAGE_XLIB_LIBXRENDER),xlib_libXrender,) \
> 	$(if $(BR2_PACKAGE_XLIB_LIBXRANDR),xlib_libXrandr,) \
> 	$(if $(BR2_PACKAGE_XLIB_LIBXCURSOR),xlib_libXcursor,) \
> 	$(if $(BR2_PACKAGE_XLIB_LIBXINERAMA),xlib_libXinerama,) \
> 	$(if $(BR2_PACKAGE_XPROTO_INPUTPROTO),xproto_inputproto,) \
> 	$(if $(BR2_PACKAGE_XPROTO_SCRNSAVERPROTO),xproto_scrnsaverproto,)
>
> sdl2 is seems complicated package, I think it would be easier to review if you
> add it progressively by using a patch series:
>
> PATCH1: sdl2 new package (all mandatory dependencies enabled)
> PATCH2: sdl2 add X11 support
> PATCH3: sdl2 add directfb support

No, I won't. It is extra work for nothing. I think it is not so complicated to review only 2 files to add a new package. Splitting packages for u-boot or Linux kernel make sense most of the time, but, here, clearly no.
Buildroot maintainers/reviewers should send their comments from the 1st version, not 1 guy comments on V1, someone else on V2 etc., again the first guy for V3 on another part of the patch which was not commented the 1st time.

I contribute to lots of open source / free software and contributing to Buildroot is really painful compared to other projects. So please, all send your comments at the same time.
For SDL2, please send your comments this week, and I will send a V5 next week fixing the remaining bits and if it does not fit to another guy again, I will stop sending patches to Buildroot.
Now, I understand better why some people are maintaining a buildroot fork instead of upstreaming their patches. So, please improve your patch submission/review process.


Guillaume


> ...
>
> I'll review your patch latter new week end.
>
> Best regards,
> Romain
>
>
