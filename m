From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 09 Aug 2011 20:39:31 +0200
Subject: [Buildroot] linphone package
In-Reply-To: <4E417DC0.3060406@fosstel.com> (Pedro Sanchez's message of "Tue, 
 09 Aug 2011 14:34:40 -0400")
References: <4E413EB9.6040504@fosstel.com>
 <878vr2k3u8.fsf@macbook.be.48ers.dk> <4E417DC0.3060406@fosstel.com>
Message-ID: <87vcu6ig4c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pedro" == Pedro Sanchez <psanchez@fosstel.com> writes:

Hi,

 Pedro> #############################################################
 Pedro> #
 Pedro> # linphone
 Pedro> #
 Pedro> #############################################################
 Pedro> LINPHONE_VERSION = 3.4.3
 Pedro> LINPHONE_SOURCE = linphone-$(LINPHONE_VERSION).tar.gz
 Pedro> LINPHONE_SITE =
 Pedro> http://download-mirror.savannah.gnu.org/releases/linphone/3.4.x/sources
 Pedro> LINPHONE_INSTALL_STAGING = YES
 Pedro> LINPHONE_DEPENDENCIES = alsa-lib speex ncurses readline libeXosip2 libosip2
 Pedro> LINPHONE_CONF_OPT = --enable-gnome_ui=no \
 Pedro> 		    --enable-gtk_ui=no \
 Pedro> 		    --enable-alsa \
 Pedro> 		    --disable-manual \
 Pedro> 		    --disable-sdl \
 Pedro> 		    --disable-theora \
 Pedro> 		    --disable-x11 \
 Pedro> 		    --disable-shared \
 Pedro> 		    --disable-gsm \
 Pedro> 		    --disable-jack \
 Pedro> 		    --disable-libv4l \
 Pedro> 		    --disable-video

We have most of those in BR, so it would be good to optionally enable
them.

 Pedro> $(eval $(call AUTOTARGETS,package,linphone))


 Pedro> I am cross-compiling linphone for ARM and the final executable
 Pedro> created by buildroot in my target directory is
 Pedro> /usr/bin/arm-linux-linphonec. No other binaries in the build
 Pedro> have this "arm-linux' prefix. I's like the binary to be named
 Pedro> /usr/bin/linphonec instead? Any suggestions?

Typically you can pass --program-prefix="" to configure to disable it.

Care to send a real git patch including Config.in once you have it all
working?

-- 
Bye, Peter Korsgaard
