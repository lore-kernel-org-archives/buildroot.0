From: Joel Carlson <JoelsonCarl@gmail.com>
Date: Tue, 4 Dec 2018 16:15:46 -0700
Subject: [Buildroot] [bug] SDK with Arm AArch64 2018.08 toolchain can't find
 ld-linux-aarch64.so.1
Message-ID: <CA+1k=2ZwmYVLve3d7SJCXho7Un9aGLzNKNW3ztgyuTpQC92r4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was upgrading from 2018.08.3 to 2018.11.  I did the build with "Arm
AArch64 2018.08" as the toolchain.  I ran make sdk, extracted it, and
ran relocate-sdk.sh.  Then I have a simple C program test.c that is
just main() and returns 0.

When I run:
$ ./tt_compute_sdk/bin/aarch64-linux-gnu-gcc
--sysroot=/home/joelcarlson/work/sdks/tt_compute_sdk/aarch64-buildroot-linux-gnu/sysroot
test.c

I get:
/home/joelcarlson/work/sdks/tt_compute_sdk/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.2.1/../../../../aarch64-linux-gnu/bin/ld:
cannot find /lib/ld-linux-aarch64.so.1 inside
/home/joelcarlson/work/sdks/tt_compute_sdk/aarch64-buildroot-linux-gnu/sysroot
collect2: error: ld returned 1 exit status

But ld-linux-aarch64.so.1 does exist at
/home/joelcarlson/work/sdks/tt_compute_sdk/aarch64-buildroot-linux-gnu/sysroot/lib/ld-linux-aarch64.so.1

I did a clean build with it configured to use the "Linaro AArch64
2018.05" toolchain (which I believe is the same one that I had been
using in 2018.08.3).  I made, extracted, and relocated the sdk, and I
was able to compile test.c without any issue.
