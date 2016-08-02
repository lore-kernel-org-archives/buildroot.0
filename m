From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 02 Aug 2016 01:11:18 +0000
Subject: [Buildroot] [Bug 9121] gst1-imx for i.MX6 compile failed,
 cannot find PXP, IPU and other errors
In-Reply-To: <bug-9121-163@https.bugs.busybox.net/>
References: <bug-9121-163@https.bugs.busybox.net/>
Message-ID: <bug-9121-163-LUShLGecsH@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9121

--- Comment #5 from rdghx <rdghx@163.com> ---
include/linux/ipu.h, include/linux/pxp_device.h,
include/uapi/linux/v4l2-controls.h  all in its place.

in the gst1-imx config.log, for the PXP, IPU test, there is no asm/linkage.h
finded. actually the file is in arch/arm/include/asm/linkage.h. if you create a
link : ln -s arch/arm/include/asm  include/.  there will be other errors.


['/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-gcc',
'-Wextra', '-Wall', '-std=gnu99', '-fPIC', '-DPIC', '-O2',
'-D_LARGEFILE_SOURCE', '-D_LARGEFILE64_SOURCE', '-D_FILE_OFFSET_BITS=64',
'-D_LARGEFILE_SOURCE', '-D_LARGEFILE64_SOURCE', '-D_FILE_OFFSET_BITS=64',
'-Os', '-Wno-cpp',
'-I/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/linux-rel_imx_3.14.52_1.1.0_ga/include',
'-DGSTREAMER_VERSION="1.8.2"', '-DHAVE_GSTREAMER=1', '-DHAVE_GSTREAMER_BASE=1',
'-DHAVE_GSTREAMER_AUDIO=1', '-DHAVE_GSTREAMER_VIDEO=1',
'-DGST_PACKAGE_NAME="Unknown package release"', '-DGST_PACKAGE_ORIGIN="Unknown
package origin"', '-DPACKAGE="gstreamer-imx"',
'-DPACKAGE_BUGREPORT="https://github.com/Freescale/gstreamer-imx"',
'-DVERSION="0.12.1"', '-DHAVE_G2D_H=1', '../test.c', '-c', '-o', 'test.c.1.o']
err: In file included from
/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/linux-rel_imx_3.14.52_1.1.0_ga/include/linux/kgdb.h:16:0,
                 from
/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/linux-rel_imx_3.14.52_1.1.0_ga/include/linux/fb.h:4,
                 from ../test.c:3:
/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/linux-rel_imx_3.14.52_1.1.0_ga/include/linux/linkage.h:7:25:
fatal error: asm/linkage.h: No such file or directory
 #include <asm/linkage.h>
                         ^
compilation terminated.


from
/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/gst1-imx-0.12.1/src/ipu:
Test does not build: Traceback (most recent call last):
  File
"/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/gst1-imx-0.12.1/.waf-1.7.11-edc6ccb516c5e3f9b892efc9f53a610f/waflib/Tools/c_config.py",
line 459, in run_c_code
    bld.compile()
  File
"/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/gst1-imx-0.12.1/.waf-1.7.11-edc6ccb516c5e3f9b892efc9f53a610f/waflib/Build.py",
line 188, in compile
    raise Errors.BuildError(self.producer.error)
BuildError: Build failed
 -> task in 'testprog' failed (exit status 1):
        {task 1087632876: c test.c -> test.c.1.o}

-- 
You are receiving this mail because:
You are on the CC list for the bug.
