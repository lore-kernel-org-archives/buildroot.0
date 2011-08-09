From: Pedro Sanchez <psanchez@fosstel.com>
Date: Tue, 09 Aug 2011 14:34:40 -0400
Subject: [Buildroot] linphone package
In-Reply-To: <878vr2k3u8.fsf@macbook.be.48ers.dk>
References: <4E413EB9.6040504@fosstel.com> <878vr2k3u8.fsf@macbook.be.48ers.dk>
Message-ID: <4E417DC0.3060406@fosstel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/09/2011 11:21 AM, Peter Korsgaard wrote:
>>>>>> "Pedro" == Pedro Sanchez<psanchez@fosstel.com>  writes:
>
>   Pedro>  Hello,
>   Pedro>  I'd like to get linphone-nox (console mode) packaged for buildroot. So
>   Pedro>  before I start working on it, is there some previous packaging work
>   Pedro>  that I could refer to? or is someone else already working on it?
>
> Not that I'm aware of.
>

OK thanks.

I have now a working version of the linphone.mk file that seems to work 
well in my initial tests:

#############################################################
#
# linphone
#
#############################################################
LINPHONE_VERSION = 3.4.3
LINPHONE_SOURCE = linphone-$(LINPHONE_VERSION).tar.gz
LINPHONE_SITE = 
http://download-mirror.savannah.gnu.org/releases/linphone/3.4.x/sources
LINPHONE_INSTALL_STAGING = YES
LINPHONE_DEPENDENCIES = alsa-lib speex ncurses readline libeXosip2 libosip2
LINPHONE_CONF_OPT = --enable-gnome_ui=no \
		    --enable-gtk_ui=no \
		    --enable-alsa \
		    --disable-manual \
		    --disable-sdl \
		    --disable-theora \
		    --disable-x11 \
		    --disable-shared \
		    --disable-gsm \
		    --disable-jack \
		    --disable-libv4l \
		    --disable-video

$(eval $(call AUTOTARGETS,package,linphone))


I am cross-compiling linphone for ARM and the final executable created 
by buildroot in my target directory is /usr/bin/arm-linux-linphonec. No 
other binaries in the build have this "arm-linux' prefix. I's like the 
binary to be named /usr/bin/linphonec instead? Any suggestions?

Thanks,

-- 
Pedro
