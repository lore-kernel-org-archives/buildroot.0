From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 17 Mar 2013 14:59:09 +0100
Subject: [Buildroot] [PATCH 1/4] directfb: bumping version to 1.6.3
In-Reply-To: <513C7DF2.9090005@googlemail.com>
References: <1362908858-6340-1-git-send-email-c.schoenert@gmail.com>
 <1362908858-6340-2-git-send-email-c.schoenert@gmail.com>
 <20130310113224.4e3dbb2a@skate> <513C7DF2.9090005@googlemail.com>
Message-ID: <5145CC2D.5020103@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, all,

Am 10.03.2013 13:34, schrieb Carsten Schoenert:
> Hello Thomas,
> 
> Am 10.03.2013 11:32, schrieb Thomas Petazzoni:
>> This looks good. However, we have a number of packages that depend or
>> can use DirectFB: cairo, directfb-examples, libecore, libevas, libgtk2,
>> links, lite, gst-plugins-bad, opencv, qt, sawman, sdl, webkit. Did you
>> test if those still build after this DirectFB bump? I have no idea if
>> the DirectFB bump from 1.4.x to 1.6.x is a major bump (like with API
>> breakage) or a minor bump. Depending on that, some testing of the
>> packages using DirectFB would be needed, or not.
> 
> Ah yes, good point! I'll pick up some of these packages an will do some
> tests.
> But I have to look once again to the config of directfb itself, I think
> there will have changed some configure options between this different
> versions of directfb. This point comes right now in mind.

I have diffed the output from 'configure --help' of the directfb package
from the old version (1.4.17) to the new version (1.6.3).

There are one option removed and a few new are appended.

This option is now not living anymore.
> --enable-sysfs          build with sysfs support [default=auto]

The following options ([auto])are new.
> --enable-sysfs          build with sysfs support [default=auto]
> --enable-mesa           build with Mesa support [default=auto]

And thees options are [default=yes].
> --enable-dynload        enable dynload support [default=yes]                                                           
> --enable-multicore      enable multicore support [default=yes]
> --enable-mng            build MNG image provider [default=yes]
> --enable-imlib2         build Imlib2 image provider [default=yes]
> --enable-pnm            build PNM (PBM/PGM/PPM) image provider [default=yes]
> --enable-svg            build SVG image provider [default=yes]
> --enable-mpeg2          build MPEG2 image provider [default=yes]
> --enable-bmp            build BMP image provider [default=yes]
> --enable-jpeg2000       build JPEG2000 image provider [default=yes]

And at last one option with [default=no].
> --enable-gstreamer      build gstreamer video provider [default=no]

I'm not already getting the logic inside the directfb.mk so how to
handle thees different options in the future? I mean, what's the point
to implement a configure option or not? I know some options are platform
specific and for me it is particularly implemented.

For example, there are configure options for jpeg, gif and png support
but not for freetype (all this configure options are [default=yes]) and
freetype is also explicitly set per default in the DIRECTFB_CONF_OPT
with '--enable-freetype'.

Why are the options for the gfxdrivers and inputlist are not complete
filled in the Config.in and directfb.mk file?
In the directfb.mk file is a check for BR2_PACKAGE_DIRECTFB_CYBER5K but
the Config.in file has no option for this. Forgotten?

I can try to rework this two files, but to save unneeded work any help
is appreciated. Can someone point me to the right direction?

Regards
Carsten
