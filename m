From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Feb 2011 11:55:33 +0000 (UTC)
Subject: [Buildroot] [Bug 3325] New: ffmpeg fails to build
Message-ID: <bug-3325-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3325

           Summary: ffmpeg fails to build
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rotwang at crux.org.pl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


/mnt/usb/repos/buildroot/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
-DHAVE_AV_CONFIG_H -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -I.
-I"/mnt/usb/repos/buildroot/output/build/ffmpeg-0.5.3" -pipe -Os  -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/mnt/usb/repos/buildroot/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include
-I/mnt/usb/repos/buildroot/output/host/usr/i586-unknown-linux-uclibc/sysroot/include
-D_ISOC99_SOURCE -D_POSIX_C_SOURCE=200112 -fPIC
--sysroot=/mnt/usb/repos/buildroot/output/host/usr/i586-unknown-linux-uclibc/sysroot
-std=c99 -fomit-frame-pointer -pthread -g -Wdeclaration-after-statement -Wall
-Wno-switch -Wdisabled-optimization -Wpointer-arith -Wredundant-decls
-Wno-pointer-sign -Wcast-qual -Wwrite-strings -Wtype-limits -Wundef -O3
-fno-math-errno -fno-signed-zeros       -c -o libavcodec/x86/dsputil_mmx.o
libavcodec/x86/dsputil_mmx.c
In file included from libavcodec/x86/dsputil_mmx.c:31:0:
libavcodec/x86/mmx.h:24:2: warning: #warning Everything in this header is
deprecated, use plain __asm__()! New code using this header will be rejected.
In file included from libavcodec/x86/dsputil_mmx.c:1772:0:
libavcodec/x86/h264dsp_mmx.c: In function 'put_h264_qpel4_h_lowpass_3dnow':
libavcodec/x86/h264dsp_mmx.c:2058:1: error: can't find a register in class
'GENERAL_REGS' while reloading 'asm'
libavcodec/x86/h264dsp_mmx.c:2058:1: error: 'asm' operand has impossible
constraints
make[1]: *** [libavcodec/x86/dsputil_mmx.o] Error 1
make[1]: Leaving directory `/mnt/usb/repos/buildroot/output/build/ffmpeg-0.5.3'
make: *** [/mnt/usb/repos/buildroot/output/build/ffmpeg-0.5.3/.stamp_built]
Error 2

ffmpeg 0.5.2 also breaks in this place,

host: i686
target: i586
toolchain: buildroot

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
