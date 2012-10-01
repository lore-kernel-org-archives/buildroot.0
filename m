From: Zvi Vered <veredz72@gmail.com>
Date: Tue, 2 Oct 2012 01:25:11 +0200
Subject: [Buildroot] buildroot-2012.08: Error when selecting crosstool-ng
Message-ID: <CABRndgy4WMyjqrod4L_N89VRbVD_jKDYpThAMfwNqhdySNrFZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm using buildroot-2012.08 to create toolchain + file system for an x86 target.

When I set toolchain to: buildroot, the build was OK.

Then I changed to: crosstool-ng and got the following error:

--------------------------------------------------------------------------------------------------
[INFO ]  Performing some trivial sanity checks
[INFO ]  Build started 20121002.012043
[INFO ]  Building environment variables
[EXTRA]  Preparing working directories
[EXTRA]  Installing user-supplied crosstool-NG configuration
[EXTRA]  =================================================================
[EXTRA]  Dumping internal crosstool-NG configuration
[EXTRA]    Building a toolchain for:
[EXTRA]      build  = i686-pc-linux-gnu
[EXTRA]      host   = i686-pc-linux-gnu
[EXTRA]      target = i686-unknown-linux-uclibc
[EXTRA]  Dumping internal crosstool-NG configuration: done in 0.08s (at 00:01)
[INFO ]  =================================================================
[INFO ]  Retrieving needed toolchain components' tarballs
[EXTRA]    Retrieving 'linux-3.5'
[ALL  ]    --01:20:44--
http://ftp.kernel.org/pub/linux/kernel/v3.x/linux-3.5.tar.xz
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 200 OK
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tar.xz.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22323 Aborted                 "${@}" 2>&1
     22324 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:45--
http://ftp.kernel.org/pub/linux/kernel/v3.x/longterm/v3.5/linux-3.5.tar.xz
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 404 Not Found
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tar.xz.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22335 Aborted                 "${@}" 2>&1
     22336 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:47--
http://ftp.kernel.org/pub/linux/kernel/v3.x/longterm/linux-3.5.tar.xz
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 404 Not Found
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tar.xz.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22347 Aborted                 "${@}" 2>&1
     22348 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:47--
http://ftp.kernel.org/pub/linux/kernel/v3.x/linux-3.5.tar.lzma
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 404 Not Found
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tar.lzma.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22359 Aborted                 "${@}" 2>&1
     22360 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:48--
http://ftp.kernel.org/pub/linux/kernel/v3.x/longterm/v3.5/linux-3.5.tar.lzma
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 404 Not Found
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tar.lzma.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22371 Aborted                 "${@}" 2>&1
     22372 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:49--
http://ftp.kernel.org/pub/linux/kernel/v3.x/longterm/linux-3.5.tar.lzma
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 404 Not Found
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tar.lzma.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22383 Aborted                 "${@}" 2>&1
     22384 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:50--
http://ftp.kernel.org/pub/linux/kernel/v3.x/linux-3.5.tar.bz2
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 200 OK
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tar.bz2.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22395 Aborted                 "${@}" 2>&1
     22396 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:50--
http://ftp.kernel.org/pub/linux/kernel/v3.x/longterm/v3.5/linux-3.5.tar.bz2
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 404 Not Found
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tar.bz2.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22407 Aborted                 "${@}" 2>&1
     22408 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:51--
http://ftp.kernel.org/pub/linux/kernel/v3.x/longterm/linux-3.5.tar.bz2
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 404 Not Found
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tar.bz2.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22419 Aborted                 "${@}" 2>&1
     22420 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:51--
http://ftp.kernel.org/pub/linux/kernel/v3.x/linux-3.5.tar.gz
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 200 OK
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tar.gz.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22431 Aborted                 "${@}" 2>&1
     22432 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:52--
http://ftp.kernel.org/pub/linux/kernel/v3.x/longterm/v3.5/linux-3.5.tar.gz
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 404 Not Found
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tar.gz.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22443 Aborted                 "${@}" 2>&1
     22444 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:52--
http://ftp.kernel.org/pub/linux/kernel/v3.x/longterm/linux-3.5.tar.gz
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 404 Not Found
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tar.gz.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22455 Aborted                 "${@}" 2>&1
     22456 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:53--
http://ftp.kernel.org/pub/linux/kernel/v3.x/linux-3.5.tgz
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 404 Not Found
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tgz.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22467 Aborted                 "${@}" 2>&1
     22468 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:53--
http://ftp.kernel.org/pub/linux/kernel/v3.x/longterm/v3.5/linux-3.5.tgz
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 404 Not Found
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tgz.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22479 Aborted                 "${@}" 2>&1
     22480 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:54--
http://ftp.kernel.org/pub/linux/kernel/v3.x/longterm/linux-3.5.tgz
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 404 Not Found
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tgz.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22491 Aborted                 "${@}" 2>&1
     22492 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:54--
http://ftp.kernel.org/pub/linux/kernel/v3.x/linux-3.5.tar
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 404 Not Found
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tar.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22503 Aborted                 "${@}" 2>&1
     22504 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:54--
http://ftp.kernel.org/pub/linux/kernel/v3.x/longterm/v3.5/linux-3.5.tar
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 404 Not Found
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tar.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22515 Aborted                 "${@}" 2>&1
     22516 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:55--
http://ftp.kernel.org/pub/linux/kernel/v3.x/longterm/linux-3.5.tar
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 404 Not Found
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tar.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22527 Aborted                 "${@}" 2>&1
     22528 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:55--  http://ftp.kernel.org/pub/linux/kernel/v3.x/linux-3.5
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 404 Not Found
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22539 Aborted                 "${@}" 2>&1
     22540 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:56--
http://ftp.kernel.org/pub/linux/kernel/v3.x/longterm/v3.5/linux-3.5
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 404 Not Found
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22551 Aborted                 "${@}" 2>&1
     22552 Done                    | CT_DoLog "${level}"
[ALL  ]    --01:20:56--
http://ftp.kernel.org/pub/linux/kernel/v3.x/longterm/linux-3.5
[ALL  ]    Resolving ftp.kernel.org... 149.20.4.69
[ALL  ]    Connecting to ftp.kernel.org|149.20.4.69|:80... connected.
[ALL  ]    HTTP request sent, awaiting response... 404 Not Found
[ALL  ]    File
`/home/zvivered/GNU/buildroot-2012.08/output/build/build-toolchain/.build/tarballs/linux-3.5.tmp-dl'
already there; not retrieving.
[ALL  ]
/home/zvivered/GNU/buildroot-2012.08/output/host/usr/lib/ct-ng.1.16.0/scripts/functions:
line 158: 22563 Aborted                 "${@}" 2>&1
     22564 Done                    | CT_DoLog "${level}"
[ERROR]
[ERROR]  >>
[ERROR]  >>  Build failed in step 'Retrieving needed toolchain
components' tarballs'
[ERROR]  >>        called in step '(top-level)'
[ERROR]  >>
[ERROR]  >>  Error happened in: do_kernel_get[scripts/build/kernel/linux.sh at 19]
[ERROR]  >>        called from: main[scripts/crosstool-NG.sh at 528]
[ERROR]  >>
[ERROR]  >>  For more info on this error, look at the file: 'build.log'
[ERROR]  >>  There is a list of known issues, some with workarounds, in:
[ERROR]  >>
'/home/zvivered/GNU/buildroot-2012.08/output/host/usr/share/doc/crosstool-ng/ct-ng.1.16.0/B
- Known issues.txt'
[ERROR]
[ERROR]  (elapsed: 0:13.95)
make[2]: *** [build] Error 1
make[1]: *** [build.4] Error 2
make: *** [/home/zvivered/GNU/buildroot-2012.08/output/stamps/ct-ng-toolchain-built]
Error 2

-----------------------------------------------------------------------------------------------------

The reason I changed to crosstool-ng is  that I want to use glibc and not ulibc.

Attached the .config I'm using.

Can you help ?

Thanks,
Zvika.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 24443 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121002/c6f1f9ba/attachment-0001.obj>
