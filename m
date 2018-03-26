From: Julia Ding <dingtasiling@gmail.com>
Date: Sun, 25 Mar 2018 20:08:54 -0700 (MST)
Subject: [Buildroot] QT5 camera error: Unknown module(s) in QT:
 multimedia multimediawidgets
In-Reply-To: <20180301101446.5d64784f@windsurf.lan>
References: <1519875639555-0.post@n4.nabble.com>
 <20180301101446.5d64784f@windsurf.lan>
Message-ID: <1522033734697-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas:

Thanks for your answer.
After "make clean all" and "make" again, it show another error 
/usr/include/EGL/egl.h:39:0, 
                 from qsgvideonode_egl.h:48, 
                 from qsgvideonode_egl.cpp:40: 
/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:118:22: 
fatal error: X11/Xlib.h: No such file or directory 
#include <X11/Xlib.h> 
                     ^ 
I find a patch "qt5base: fix build issue with mesa3d w/out xcb" to fix.
?https://patchwork.ozlabs.org/cover/880120/?
The previous error message did not appear. May be something changed before
in menuconfig, I didn't record them.

Julia Ding



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
