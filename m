From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 22:10:57 +0200
Subject: [Buildroot] [PATCH v15 0/9] xbmc: Add support for uClibc, OpenGL,
 libva & optional packages
In-Reply-To: <1406090425-5925-1-git-send-email-bernd.kuhls@t-online.de>
References: <1406090425-5925-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140723221057.2f437a0b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 23 Jul 2014 06:40:16 +0200, Bernd Kuhls wrote:

> Bernd Kuhls (9):
>   xbmc: Bump version to 13.2b2

Applied.

>   xbmc: Add missing egl-related cflags

For this one, I'm not sure. Shouldn't XBMC itself be capable of calling
pkg-config on egl to get the appropriate flags? On the other hand, it's
true that xbmc.mk already has specific hacks for the RPi.

>   xbmc: Allow compilation with uClibc

Applied, but with the architecture dependency factorized into a
BR2_PACKAGE_XBMC_ARCH_SUPPORTS.

>   xbmc: Add alsa support

Applied.

>   xbmc: Add lame support

Applied.

>   xbmc: Fix TexturePacker compile

Applied.

>   xbmc: Add X.org/OpenGL support
>   xbmc: Add option for Goom screensaver
>   xbmc: Add VA-API support

I haven't applied those ones yet. The last two depend on the
X.org/OpenGL support, and this patch is a bit larger. I'll try to get
to it a bit later.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
