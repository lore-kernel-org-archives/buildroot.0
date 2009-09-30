From: Berns <Berns@BEKA-Elektronik.de>
Date: Wed, 30 Sep 2009 14:23:54 +0200
Subject: [Buildroot] x11vnc
Message-ID: <NDBBKLDECLOIHFJKBINAGEKNEKAA.Berns@BEKA-Elektronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i'am using a custom AT91SAM9263 board with a TFT screen and touch. The
toolchain and the root filesystem is generated with version 2009.8-git. The
main application uses X11 and GTK+ 2.0 and runs.

For remote controll i'am doing some tests with x11vnc and TightVNC at the
moment. Viewing the application my PC works and the buttons get the focus
when i move the mouse in the vnc viewer on my PC.
But clicking on the buttons in the vnc viewer window doesn't cause any
reaction at the GTK application.
The problem seams to be the missing lib libxtst.
http://www.karlrunge.com/x11vnc/faq.html#faq-missing-xtest
(Maybe this lib can be selected automatically when x11vnc is selected ?.)

So I selected the lib, restart the build procedure with make and transfered
the lib and the links, but this doesn't fixes the problem.
After rm -rf *_build* i try to rebuild buildroot but now it fails compiling
fcfreetype.c iconv.h: No such file or directory.

I don't understand why buildroot now fails. Can anyody give me a hint ?

Thanks and regards

Rainer Berns
