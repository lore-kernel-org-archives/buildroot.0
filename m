From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 08 May 2017 21:10:57 +0200
Subject: [Buildroot] [PATCH] mpv: fix X11 logic after bump to 0.25.0
In-Reply-To: <1494250371-13487-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 8 May 2017 15:32:51 +0200")
References: <1494250371-13487-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mvannozi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Between 0.24.0 and 0.25.0, mpv has changed its logic around the
 > detection/usage of X11 (in upstream commit
 > https://github.com/mpv-player/mpv/commit/927afa311d4a89b022305508acbf4e7325fe3928). Instead
 > of having fine grained option for x11, xext, xinerama, xscreensaver and
 > xrandr, mpv now requires all five libraries to be available in order to
 > enable X.org support.

 > Therefore, this commit adjusts the mpv packaging so that:

 >  1. All necessary X11 libraries are selected if BR2_PACKAGE_XORG7 is
 >     enabled. It would indeed be too cumbersome for the user to know that
 >     all of x11, xext, xinerama, xscreensaver and xrandr are necessary in
 >     order to have X.org support.

 >  2. mpv.mk is simplified by enabling X.org support when
 >     BR2_PACKAGE_XORG7 is enabled.

 > Fixes:

 > +# Base X11 support. Config.in ensures that if BR2_PACKAGE_XORG7 is
 > +# enabled, xlib_libX11, xlib_libXext, xlib_libXinerama,
 > +# xlib_libXrandr, xlib_libXScrnSaver.

It sounds like something is missing from this sentence. I've changed it
to:

'if BR2_PACKAGE_XORG7 is enabled, so is xlib_libX11, ..'

And committed, thanks.

-- 
Bye, Peter Korsgaard
