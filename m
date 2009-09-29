From: Andrew Dyer <amdyer@gmail.com>
Date: Tue, 29 Sep 2009 15:40:50 -0500
Subject: [Buildroot] problems building git head
Message-ID: <c166aa9f0909291340j54ae2835o233fad9d89fdf96b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi - I'm attempting to build buildroot on a debian based system and
having problems.  Problem occured both on 2009.08 and on git head.
I configured buildroot for generic ARM, EABI, and ramdisk via 'make
menuconfig' and saved the config file. When I do 'make', I get:

package/multimedia/libvorbis/libvorbis.mk:20: *** missing `endif'.  Stop.

line 20 in libvorbis.mk says:

$(eval $(call AUTOTARGETS,package/multimedia,libvorbis))

and tracing that into Makefile.autotools.in quickly gets me lost.
Make is GNU Make 3.80.

Has anybody seen this or have a fix?
