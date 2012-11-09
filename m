From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Nov 2012 10:34:46 +0100
Subject: [Buildroot] [PATCH 1/2 v2] xtensa: add support for the Xtensa
 architecture
In-Reply-To: <20121109101959.70d640d5@skate>
References: <509ca3b9.e9c5440a.24b8.24a1@mx.google.com>
 <20121109101959.70d640d5@skate>
Message-ID: <20121109103446.67ef56d8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 9 Nov 2012 10:19:59 +0100, Thomas Petazzoni wrote:

> Is it that the pthread support for Xtensa is not available in uClibc?

And if I disable threads support, it fails later during the uClibc
build:

  CC libc/misc/dirent/alphasort.os
  CC libc/misc/dirent/closedir.os
libc/misc/dirent/closedir.c: In function 'closedir':
libc/misc/dirent/closedir.c:35:2: warning: implicit declaration of function 'INLINE_SYSCALL' [-Wimplicit-function-declaration]
  CC libc/misc/dirent/dirfd.os
  CC libc/misc/dirent/opendir.os
libc/misc/dirent/opendir.c: In function 'opendir':
libc/misc/dirent/opendir.c:85:2: warning: implicit declaration of function 'INLINE_SYSCALL' [-Wimplicit-function-declaration]
libc/misc/dirent/opendir.c:97:3: warning: implicit declaration of function 'INTERNAL_SYSCALL_DECL' [-Wimplicit-function-declaration]
libc/misc/dirent/opendir.c:97:3: error: 'err' undeclared (first use in this function)
libc/misc/dirent/opendir.c:97:3: note: each undeclared identifier is reported only once for each function it appears in
libc/misc/dirent/opendir.c:97:3: warning: implicit declaration of function 'INTERNAL_SYSCALL' [-Wimplicit-function-declaration]
make[2]: *** [libc/misc/dirent/opendir.os] Error 1
make[1]: *** [/home/test/outputs/xtensa/toolchain/uClibc-0.9.33.2/lib/libc.a] Error 2
make: *** [all] Error 2

My defconfig is:

BR2_xtensa=y
BR2_PTHREADS_NONE=y
BR2_PACKAGE_LUA=y
BR2_PACKAGE_LUA_INTERPRETER=y
BR2_PACKAGE_AVAHI=y

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
