From: =?utf-8?Q?=C3=89meric?= Vigier <emeric.vigier@savoirfairelinux.com>
Date: Mon, 24 Mar 2014 14:43:16 -0400 (EDT)
Subject: [Buildroot] PowerPC: scsi/sg.h missing in glibc-2.18 /
 linux-headers-3.10.20 toolchain
In-Reply-To: <1996794731.250375.1395685034656.JavaMail.root@mail>
Message-ID: <778977534.278661.1395686596735.JavaMail.root@mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi makers,

I struggled to cross-compile (powerpc) strace-4.8 with linux-headers-3.10.20
and glibc-2.18.It does not find <scsi/sg.h> in my toolchain. Indeed there is
none in my sysroot:

$ find output/ -path "*/scsi/sg.h"
output/build/glibc-2.18/sysdeps/unix/sysv/linux/scsi/sg.h
output/build/linux-headers-3.10.20/include/scsi/sg.h

I have a duplicate buildroot with linux-headers-3.2.52 and the same glibc.
It succeeds to compile strace. Indeed headers are present in sysroot:

$ find output/ -path "*/scsi/sg.h"
output/build/linux-headers-3.2.52/include/scsi/sg.h
output/build/glibc-2.18/sysdeps/unix/sysv/linux/scsi/sg.h
output/build/linux-3.2.x/include/scsi/sg.h
output/host/usr/powerpc-buildroot-linux-gnu/sysroot/usr/include/scsi/sg.h

I checked linux API changes but nothing about SCSI:
http://man7.org/tlpi/api_changes/index.html

I worked around this problem with a simple copy:
$ cp output/build/glibc-2.18/sysdeps/unix/sysv/linux/scsi/sg.h \
     output/host/usr/powerpc-buildroot-linux-gnu/sysroot/usr/incl

I'd like to know how to truly fix this issue. Is this a bug in the toolchain 
cross-compilation?

thanks,
Emeric
