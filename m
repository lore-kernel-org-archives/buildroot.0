From: Patryk Benderz <Patryk.Benderz@esp.pl>
Date: Tue, 29 Mar 2011 20:14:34 +0200
Subject: [Buildroot] [xdriver_xf86-video-openchrome-0.2.904] via_video.c:
 error: 'struct _Pixmap' has no member named 'screen_x'
Message-ID: <1301422474.6206.37.camel@esp-patben-lin.espdx1.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Devs,
I have searched biuldroot's mail archive but failed to find any solution
to this. I am using buildroot-2011.02.tar.gz
During compilation of openchrome, it complains about missing sarea.h and
dri.h which I have workaround by:
cd /home/patben/Dev/buildroot/output/build/xdriver_xf86-video-openchrome-0.2.904/src
ln -s ../../xserver_xorg-server-1.7.5/hw/xfree86/dri/sarea.h sarea.h
ln -s ../../xserver_xorg-server-1.7.5/hw/xfree86/dri/dri.h dri.h

Now make complains about:
via_video.c: In function 'viaPaintColorkey':
via_video.c:738:44: error: 'struct _Pixmap' has no member named 'screen_x'
via_video.c:738:62: error: 'struct _Pixmap' has no member named 'screen_y'
make[4]: *** [via_video.lo] Error 1

As a side note I can tell, AFAIR it may have working fine with one of
the following versions:
	buildroot-2010.11.tar.gz
	buildroot-2011.02-rc2.tar.gz

Any hints how to make openchrome to compile again?

-- 
Patryk "LeadMan" Benderz
Linux Registered User #377521
()  ascii ribbon campaign - against html e-mail 
/\  www.asciiribbon.org   - against proprietary attachments
