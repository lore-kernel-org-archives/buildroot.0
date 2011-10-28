From: Bruno Niklaus <niklaus.bruno@gmail.com>
Date: Fri, 28 Oct 2011 12:08:31 +0200
Subject: [Buildroot] fix for mplayer with armv7 / neon
Message-ID: <CANVadiHajYSQyOY9VAVX9mL=ZW+3vgsra5SW76LjKZtPJneNcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi @all

sorry i don't know how to make a patch file or how to send it / git it or
how ever to
the buildroot source :)

i tried to build mplayer for a omap4430 / pandaboard, it always failed with
error:

*arm/mpegvideo_arm.c:33: error: size of array 'x_H263_AIC' is negative*

after a bit of google search i found this email
http://comments.gmane.org/gmane.comp.video.mplayer.user/64844
and edited the file

*libavcodec/arm/asm-offsets.h*

like this
Line 38:
--  #define H263_AIC  0x2670
++ #define H263_AIC 0x2678.

after that i built without erros!

can you make a patch for this?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111028/22d6ff1b/attachment.html>
