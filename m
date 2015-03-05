From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 5 Mar 2015 14:44:38 +0100
Subject: [Buildroot] mjpgstreamer build error with ccache and J=0
Message-ID: <10AA8E3F675B42669EDF6C02D65AAE63@JohanW7>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

 
Hi

mjpgstreamer seems to fail bilding when I have ccache on and number of jobs=0

I cleaned the ccache before building.

This is the output of make V=1


[7m>>> mjpg-streamer 730b5bcdc378b6a201131c6c2620eedbe0f6eb30 Installing to target[27m
PATH="/home/buildroot12git2/output/host/bin:/home/buildroot12git2/output/host/sbin:/home/buildroot12git2/output/host/usr/bin:/home/b
uildroot12git2/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/build/h
ost-cmake-3.0.2/bin" /usr/bin/make -j5 -C /home/buildroot12git2/output/build/mjpg-streamer-730b5bcdc378b6a201131c6c2620eedbe0f6eb30
DESTDIR=/home/buildroot12git2/output/target/usr install
make[1]: Entering directory `/home/buildroot12git2/output/build/mjpg-streamer-730b5bcdc378b6a201131c6c2620eedbe0f6eb30'
gcc -D'GIT_REV="2015.02-rc3-957-g7ff46a9-dirty"' -DLINUX -D_GNU_SOURCE -Wall  -g -Wuninitialized mjpg_streamer.o utils.o -lpthread
-ldl -o mjpg_streamer
make -C plugins/input_uvc all
make[2]: Entering directory
`/home/buildroot12git2/output/build/mjpg-streamer-730b5bcdc378b6a201131c6c2620eedbe0f6eb30/plugins/input_uvc'
make[2]: warning: jobserver unavailable: using -j1.  Add `+' to parent make rule.
gcc -c -O1  -DLINUX -D_GNU_SOURCE -Wall -shared -fPIC -g -DDEBUG -o v4l2uvc.lo v4l2uvc.c
chmod 755 mjpg_streamer
In file included from v4l2uvc.c:30:0:
dynctrl.h:24:28: fatal error: linux/uvcvideo.h: No such file or directory
compilation terminated.
make[2]: *** [v4l2uvc.lo] Error 1
make[2]: Leaving directory
`/home/buildroot12git2/output/build/mjpg-streamer-730b5bcdc378b6a201131c6c2620eedbe0f6eb30/plugins/input_uvc'
make[1]: *** [input_uvc.so] Error 2
make[1]: Leaving directory `/home/buildroot12git2/output/build/mjpg-streamer-730b5bcdc378b6a201131c6c2620eedbe0f6eb30'
make: *** [/home/buildroot12git2/output/build/mjpg-streamer-730b5bcdc378b6a201131c6c2620eedbe0f6eb30/.stamp_target_installed] Error
2


No build errors with ccache off and J=0

I had build problems before using the ccache but removing the ccache 
before running make did not seem to work this time.

Is it possible to disable the usage of the ccache for certain packages, or what is the cause for this?

Best Regards 
Sagaert Johan


-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: config.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150305/5012ef4b/attachment.txt>
