From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 03 Aug 2016 00:54:56 +0000
Subject: [Buildroot] [Bug 9121] gst1-imx for i.MX6 compile failed,
 cannot find PXP, IPU and other errors
In-Reply-To: <bug-9121-163@https.bugs.busybox.net/>
References: <bug-9121-163@https.bugs.busybox.net/>
Message-ID: <bug-9121-163-HHiJxRboXP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9121

--- Comment #9 from rdghx <rdghx@163.com> ---
in the gst1_imx config.log, the version.h is not in the dir: include/linux.
and in the include/generated/uapi/linux/version.h 
linux-rel_imx_3.14.52_1.1.0_ga

kernel version test:

----------------------------------------------------------------
checking whether or not the kernel version is greater than 3.5.0
==>

                #include <linux/version.h>
                int main() {
                #if LINUX_VERSION_CODE > KERNEL_VERSION(3, 5, 0)
                        return 0;
                #else
                #error fail
                #endif
                }

<==
[1/2] [32mc: build/.conf_check_ccf59d1e456025ae0397810f052902cf/test.c ->
build/.conf_check_ccf59d1e456025ae0397810f052902cf/testbuild/test.c.1.o
[0m
['/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-gcc',
'-Wextra', '-Wall', '-std=gnu99', '-fPIC', '-DPIC', '-O2',
'-D_LARGEFILE_SOURCE', '-D_LARGEFILE64_SOURCE', '-D_FILE_OFFSET_BITS=64',
'-D_LARGEFILE_SOURCE', '-D_LARGEFILE64_SOURCE', '-D_FILE_OFFSET_BITS=64',
'-Os',
'-I/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/linux-rel_imx_3.14.52_1.1.0_ga/include',
'-I/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/linux-rel_imx_3.14.52_1.1.0_ga/usr/include',
'-DGSTREAMER_VERSION="1.8.2"', '-DHAVE_GSTREAMER=1', '-DHAVE_GSTREAMER_BASE=1',
'-DHAVE_GSTREAMER_AUDIO=1', '-DHAVE_GSTREAMER_VIDEO=1', '../test.c', '-c',
'-o', 'test.c.1.o']
err: ../test.c: In function ?main?:
../test.c:7:4: error: #error fail
   #error fail
    ^

from /home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/gst1-imx-0.12.1:
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

-- 
You are receiving this mail because:
You are on the CC list for the bug.
