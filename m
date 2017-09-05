From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 6 Sep 2017 00:44:05 +0530
Subject: [Buildroot]  rk3288: Qt5 with Mali test failed
Message-ID: <CAMty3ZAHzbwNR98FMu-ynKfnu4xwVGUe8hny7rRBz=B4uQVxnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to use MALI_T76X with QT5 packages with reference to
firefly-rk3288 able to detect HDMI and observed below Error log

I'm sure that all Mali libraries are in rootfs and the only difference
is I'm using Mainline Kernel.
# find -iname libEGL.so
./usr/lib/libEGL.so
# find -iname libmali.so
./usr/lib/libmali.so
# find -iname libGLESv1_CM.so
./usr/lib/libGLESv1_CM.so
# find -iname libGLESv2.so
./usr/lib/libGLESv2.so
# find -iname libOpenCL.so
./usr/lib/libOpenCL.so

Error log:
-----------
# export
export PWD='/usr/lib/qt/examples/opengl'
export QT_QPA_EGLFS_FB='/dev/fb0'
export QT_QPA_EGLFS_INTEGRATION='none'
export QT_QPA_PLATFORM='eglfs'
# ./hellowindow/hellowindow
Could not initialize egl display
Aborted

Does mainline still not support Mali setup here or did I miss
anything, request for help

thanks!
-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
