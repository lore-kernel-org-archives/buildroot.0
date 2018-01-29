From: Laurent Charpentier <laurent_pubs@yahoo.com>
Date: Mon, 29 Jan 2018 10:39:46 +0000 (UTC)
Subject: [Buildroot] missing dlfcn.h
References: <1543869406.2474659.1517222386735.ref@mail.yahoo.com>
Message-ID: <1543869406.2474659.1517222386735@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

The non-regression builds show the following error for the "open-lldp" package for 2 toolchains (br-arm-full-static, br-m68k-5208-full):

weak_readline.c:30:19: fatal error: dlfcn.h: No such file or directory
 #include <dlfcn.h>
                   ^
compilation terminated.

The "dlfcn.h" file is located under <toolchain>/sysroot/usr/include/dlfcn.h for all toolchains except for the br-arm-full-static and br-m68k-5208-full toolchains where the file does not exist.


Other projects includes this file ("iproute2" in file iplink.c for example) and do not report the problem.

Question: how to fix this error? is it a toolchain issue?

Thank you.
Best Regards,

Laurent
