From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 29 Jun 2007 00:31:06 +0200
Subject: [Buildroot] build fails with current uclibc
In-Reply-To: <20070628212634.51a2fb0d@newbox>
References: <20070628212634.51a2fb0d@newbox>
Message-ID: <20070628223106.GH4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 28, 2007 at 09:26:34PM +0300, Ivan Kuten wrote:
>
>Hello, 
>
>Current buildroot fails with configuration:

*phew* glad i usually turn off locale as well as wchar support.
Glad that I have a pending workaround for m4 being b0rked with
wchar off, fwiw ;)
>
>BR2_arm=y
>BR2_arm920t=y
>BR2_ARM_TYPE="ARM920T"
>BR2_ARM_OABI=y
>BR2_KERNEL_HEADERS_2_6_21=y
>BR2_DEFAULT_KERNEL_HEADERS="2.6.21.5"
>BR2_UCLIBC_VERSION_SNAPSHOT=y
>BR2_USE_UCLIBC_SNAPSHOT="snapshot"
>BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
>BR2_PTHREADS_OLD=y
>BR2_GCC_VERSION="3.4.6"
>
>make[1]: Entering directory `buildroot/toolchain_build_arm/uClibc'
>../libc/misc/wchar/wchar.c:170: error: syntax error before "attribute_hidden"
>../libc/misc/wchar/wchar.c:170: warning: data definition has no type or storage class
>../libc/misc/wchar/wchar.c:173: error: syntax error before "attribute_hidden"
>../libc/misc/wchar/wchar.c:173: warning: data definition has no type or storage class
>make[2]: *** [../utils/iconv] Error 1
>make[1]: *** [utils] ?????? 2

PS: I'll spare to make any mention of wchar support which is
time-consuming as well as multilib support which falls into the same
category. IMHO these two are exactly of those kinds where interrested
parties should get in touch privately unless they want to sink their own
time and money to provide a satisfactory correct solution, generally..

Put short, ask the uClibc folks about this
