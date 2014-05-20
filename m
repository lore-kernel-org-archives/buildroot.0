From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Tue, 20 May 2014 22:34:42 +0200
Subject: [Buildroot] [PATCH 1/1] matchbox-keyboard: Fix dependencies
References: <1400601515-29764-1-git-send-email-bernd.kuhls@t-online.de>
 <87sio4gpso.fsf@dell.be.48ers.dk>
Message-ID: <2sqs4bxc14.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <jacmet@uclibc.org> wrote in
news:87sio4gpso.fsf at dell.be.48ers.dk: 

> > -ifeq ($(BR2_PACKAGE_PANGO),y)
> > -  MATCHBOX_PKEYBOARD_CONF_OPT += --enable-pango
> > -else
> > -  MATCHBOX_KEYBOARD_DEPENDENCIES += xlib_libXft
> > -endif
> 
> No?
> 
> ./configure --help|grep cairo
>   --enable-cairo    enable experimental Cairo support default=no

Hi,

I fail to see the connection between pango and cairo regarding the matchbox-
keyboard package.

The defconfig used by autobuilder enables BR2_PACKAGE_PANGO, but the phrase 
"pango" is used nowhere in the matchbox-keyboard-0.1 sourcecode.

Support for cairo is disabled by default in matchbox-keyboard-
0.1/configure.ac, and not present in package/matchbox/* either, so the 
matchbox-keyboard package will always check for xlib_libXft and fail if it?s 
absent. This is fixed by my patch.

Regards, Bernd
