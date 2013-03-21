From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Mar 2013 07:56:05 +0100
Subject: [Buildroot] [PATCH 1/4] directfb: bumping version to 1.6.3
In-Reply-To: <5145CC2D.5020103@googlemail.com>
References: <1362908858-6340-1-git-send-email-c.schoenert@gmail.com>
 <1362908858-6340-2-git-send-email-c.schoenert@gmail.com>
 <20130310113224.4e3dbb2a@skate> <513C7DF2.9090005@googlemail.com>
 <5145CC2D.5020103@googlemail.com>
Message-ID: <514AAF05.80104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/03/13 14:59, Carsten Schoenert wrote:
> Hello Thomas, all,
>
> Am 10.03.2013 13:34, schrieb Carsten Schoenert:
[snip]
> This option is now not living anymore.
>> --enable-sysfs          build with sysfs support [default=auto]
>
> The following options ([auto])are new.
>> --enable-sysfs          build with sysfs support [default=auto]

  Er, I guess you made a mistake here? sysfs support is still an option?

>> --enable-mesa           build with Mesa support [default=auto]
>
> And thees options are [default=yes].
>> --enable-dynload        enable dynload support [default=yes]
>> --enable-multicore      enable multicore support [default=yes]
>> --enable-mng            build MNG image provider [default=yes]
>> --enable-imlib2         build Imlib2 image provider [default=yes]
>> --enable-pnm            build PNM (PBM/PGM/PPM) image provider [default=yes]
>> --enable-svg            build SVG image provider [default=yes]
>> --enable-mpeg2          build MPEG2 image provider [default=yes]
>> --enable-bmp            build BMP image provider [default=yes]
>> --enable-jpeg2000       build JPEG2000 image provider [default=yes]
>
> And at last one option with [default=no].
>> --enable-gstreamer      build gstreamer video provider [default=no]
>
> I'm not already getting the logic inside the directfb.mk so how to
> handle thees different options in the future? I mean, what's the point
> to implement a configure option or not? I know some options are platform
> specific and for me it is particularly implemented.
>
> For example, there are configure options for jpeg, gif and png support
> but not for freetype (all this configure options are [default=yes]) and
> freetype is also explicitly set per default in the DIRECTFB_CONF_OPT
> with '--enable-freetype'.
>
> Why are the options for the gfxdrivers and inputlist are not complete
> filled in the Config.in and directfb.mk file?
> In the directfb.mk file is a check for BR2_PACKAGE_DIRECTFB_CYBER5K but
> the Config.in file has no option for this. Forgotten?
>
> I can try to rework this two files, but to save unneeded work any help
> is appreciated. Can someone point me to the right direction?

  How it _should_ be is that as many configure options as possible are 
specified explicitly in the .mk file. In particular, any configure option 
that is set to the non-default value in the .mk file, should also be set 
explicitly to the default value.

  But of course, a lot of that is not the case now, because the rule is 
not strictly enforced. Anything you fix during the version bump is nice 
to have, but you're not obliged to fix it if you don't know how to (and 
we expect you to have tested the change, so that means trying out a 
number of different configurations...).

  Regarding the cyber5k thing: that's indeed an oversight from when the 
gfxdrivers options were added. Since nobody has complained about it, I 
guess you can just remove the option. Or you can add it to Config.in, 
whatever you like.

  Regards,
  Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
