From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 29 Jun 2007 12:25:56 +0300
Subject: [Buildroot] build fails with current uclibc
In-Reply-To: <001501c7ba26$7f25dd60$6614a8c0@softalap>
References: <20070628212634.51a2fb0d@newbox> <20070628223106.GH4096@aon.at>
	<001501c7ba26$7f25dd60$6614a8c0@softalap>
Message-ID: <20070629122556.5f4c5c3a@newbox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 Jun 2007 11:21:30 +0300
softa at ttechgroup.com wrote:

> >>
> >>BR2_arm=y
> >>BR2_arm920t=y
> >>BR2_ARM_TYPE="ARM920T"
> >>BR2_ARM_OABI=y
> >>BR2_KERNEL_HEADERS_2_6_21=y
> >>BR2_DEFAULT_KERNEL_HEADERS="2.6.21.5"
> >>BR2_UCLIBC_VERSION_SNAPSHOT=y
> >>BR2_USE_UCLIBC_SNAPSHOT="snapshot"
> >>BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
> >>BR2_PTHREADS_OLD=y
> >>BR2_GCC_VERSION="3.4.6"
> >>
> >>make[1]: Entering directory `buildroot/toolchain_build_arm/uClibc'
> >>../libc/misc/wchar/wchar.c:170: error: syntax error before 
> >>"attribute_hidden"
> >>../libc/misc/wchar/wchar.c:170: warning: data definition has no type or 
> >>storage class
> >>../libc/misc/wchar/wchar.c:173: error: syntax error before 
> >>"attribute_hidden"
> >>../libc/misc/wchar/wchar.c:173: warning: data definition has no type or 
> >>storage class
> >>make[2]: *** [../utils/iconv] Error 1
> >>make[1]: *** [utils] ?????? 2
> >

Wchar and locale uCLibc build is correct - i just enabled wchar&locale in uclibc config 
but not in BR2_ENABLE_LOCALE. Sorry for confusion.

BR,
Ivan
