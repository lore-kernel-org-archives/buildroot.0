From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 20 Mar 2014 23:56:38 +0100
Subject: [Buildroot] ARC/uclibc-f37101d94284c692ee9b23bc72ef38b9473cd316
	compile failure
Message-ID: <trinity-2154b334-ea3f-48a7-ad1d-15cc3890166f-1395356198737@3capp-gmx-bs24>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

with latest buildroot from git I get the following uclib compile failure.

Buildroot defconfig:

BR2_arceb=y

Build log:
...
  CC libc/sysdeps/linux/common/getpgid.os
  CC libc/sysdeps/linux/common/modify_ldt.os
  CC libc/sysdeps/linux/common/posix_fadvise.os
libc/sysdeps/linux/common/posix_fadvise.c:26:29: error: unknown type name 'off64_t'
 int posix_fadvise64(int fd, off64_t offset, off64_t len, int advice);
                             ^
libc/sysdeps/linux/common/posix_fadvise.c:26:45: error: unknown type name 'off64_t'
 int posix_fadvise64(int fd, off64_t offset, off64_t len, int advice);
                                             ^
libc/sysdeps/linux/common/posix_fadvise.c: In function 'posix_fadvise':
libc/sysdeps/linux/common/posix_fadvise.c:32:2: warning: implicit declaration of function 'posix_fadvise64' [-Wimplicit-function-declaration]
  return posix_fadvise64(fd, offset, len, advice);
  ^
make[2]: *** [libc/sysdeps/linux/common/posix_fadvise.os] Error 1
make[1]: *** [/home/seiderer/Work/zeiss/freescale-imx6/build_arc/build/uclibc-f37101d94284c692ee9b23bc72ef38b9473cd316/.stamp_built] Error 2
make: *** [_all] Error 2

Peter
