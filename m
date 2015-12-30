From: Mathew Benson <mathew.benson@gmail.com>
Date: Tue, 29 Dec 2015 18:45:09 -0600
Subject: [Buildroot] -m32 cross compile builds with 64 bit kernel
Message-ID: <CA+C+_XQXAkF+GCsOdULRLUZjiyCnN=tmyfDk0VX2kEbt_UBNqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to cross compile 32 bit code with the -m32 switch for a 64 bit
kernel that I created with buildroot.  My steps are:

1.  Built a 32 bit ("output_32") and a 64 bit ("output") kernel and sysroot
2.  Copied "output_32/host/usr/x86_64-buildroot-linux-gnu/sysroot/lib/" to
"output/host/usr/x86_64-buildroot-linux-gnu/sysroot/lib32/"
3.  Copied "output_32/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/"
to "output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib32/"
4.  Set my build tools to "output/host/usr/bin/i686-pc-linux-gnu-"
5.  Added "output/host/usr/x86_64-buildroot-linux-gnu/sysroot/lib32/" and
"output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usrlib32/" to my
library search path.

Everything compiles and most of the libraries are found and linked in, but
why do I get the following error:

/home/orion/i5/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-pc-linux-gnu/4.7.2/../../../../i686-pc-linux-gnu/bin/ld:
skipping incompatible
/home/orion/i5/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/lib/libc.so.6
when searching for /lib/libc.so.6
/home/orion/i5/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-pc-linux-gnu/4.7.2/../../../../i686-pc-linux-gnu/bin/ld:
cannot find /lib/libc.so.6 inside
/home/orion/i5/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot
/home/orion/i5/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-pc-linux-gnu/4.7.2/../../../../i686-pc-linux-gnu/bin/ld:
skipping incompatible
/home/orion/i5/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libc_nonshared.a
when searching for /usr/lib/libc_nonshared.a
/home/orion/i5/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-pc-linux-gnu/4.7.2/../../../../i686-pc-linux-gnu/bin/ld:
cannot find /usr/lib/libc_nonshared.a inside
/home/orion/i5/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot
/home/orion/i5/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-pc-linux-gnu/4.7.2/../../../../i686-pc-linux-gnu/bin/ld:
cannot find /lib/ld-linux.so.2 inside
/home/orion/i5/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot
collect2: error: ld returned 1 exit status
make[2]: *** [cf/apps/core-bin] Error 1
make[1]: *** [cfe/CMakeFiles/core-bin.dir/all] Error 2
make: *** [all] Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151229/a398c4d4/attachment.html>
