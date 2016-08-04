From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 3 Aug 2016 22:39:31 -0400
Subject: [Buildroot] Raspberry Pi OpenGL/Qt5 10x slower than Raspbian
Message-ID: <CA+-urNTrCwfx4YYZ0S37wyB9ehquKLqacKaOzL6_7yCkt+Q29g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to debug a 10x slow down with a simple Qt5 app that draws
rectangles and a couple lines of text on the screen. I'm comparing the
performance between a fresh install of Raspbian and the master branch
of Buildroot (but I also saw this with an older BR release). I've
narrowed the performance difference down to the rectangle and text
drawing calls. Nothing else is running. On the Buildroot side, I'm
using the raspberrypi_defconfig with only the following additions and
my test app:

+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
+BR2_PACKAGE_QT5BASE_GUI=y
+BR2_PACKAGE_QT5BASE_WIDGETS=y
+BR2_PACKAGE_QT5BASE_EGLFS=y
+BR2_PACKAGE_RPI_USERLAND=y

I haven't modified any of the config files in the boot partition.
Changing the config.txt to match the Raspbian version didn't affect
performance. I also verified that my test app is using eglfs. The
performance degradation is the same on both a Raspberry Pi Zero and
Model B.

This slowdown seems so big that it feels like I'm forgetting some
important piece of configuration, but I can't figure it out.

Has anyone else run into this or has any ideas on things to try?

Thanks,
Frank
