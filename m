From: Paulo Matos <pmatos@igalia.com>
Date: Tue, 28 May 2019 15:57:53 +0200
Subject: [Buildroot] board/ci20 uboot problems due to fdt headers
Message-ID: <8811f1b8-8019-912c-a54a-331aabcedbd1@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am attempting to build ci20 board on an archlinux host.
I am getting several errors build uboot that look like:


/usr/bin/gcc -O2 -isystem
/home/pmatos/Projects/igalia/buildroot/output/host/include -Wall
-Wstrict-prototypes -O2 -fomit-frame-pointer -include
/home/pmatos/Projects/igalia/buildroot/output/build/uboot-dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa/include/libfdt_env.h
-idirafter
/home/pmatos/Projects/igalia/buildroot/output/build/uboot-dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa/include
-idirafter
/home/pmatos/Projects/igalia/buildroot/output/build/uboot-dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa/include2
-idirafter
/home/pmatos/Projects/igalia/buildroot/output/build/uboot-dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa/include
-I
/home/pmatos/Projects/igalia/buildroot/output/build/uboot-dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa/lib/libfdt
-I
/home/pmatos/Projects/igalia/buildroot/output/build/uboot-dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa/tools
-DCONFIG_SYS_TEXT_BASE=0x80000000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES
-D_GNU_SOURCE   -o fit_image.o fit_image.c -c
In file included from ../include/libfdt.h:54,
                 from fdt_host.h:11,
                 from mkimage.h:22,
                 from aisimage.c:8:
/usr/include/libfdt_env.h:71:30: error: conflicting types for ?fdt64_t?
 typedef uint64_t FDT_BITWISE fdt64_t;
                              ^~~~~~~
In file included from <command-line>:
/home/pmatos/Projects/igalia/buildroot/output/build/uboot-dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa/include/libfdt_env.h:19:16:
note: previous declaration of ?fdt64_t? was here
 typedef __be64 fdt64_t;
                ^~~~~~~


This seems to be related to a previous thread that seemed to end up
saying 'we have fixed that'.

http://lists.busybox.net/pipermail/buildroot/2018-April/217653.html

Does anyone know what the status of this is? As far as I understood the
problem is related to possible include headers installed in the host
clashing with the ones distributed with buildroot.

-- 
Paulo Matos
