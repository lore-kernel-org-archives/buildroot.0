From: softa at ttechgroup.com <softa@ttechgroup.com>
Date: Fri, 29 Jun 2007 11:21:30 +0300
Subject: [Buildroot] build fails with current uclibc
References: <20070628212634.51a2fb0d@newbox> <20070628223106.GH4096@aon.at>
Message-ID: <001501c7ba26$7f25dd60$6614a8c0@softalap>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The problem is in *iconv* binary for target, wchar support seems to be ok.
For successful compilation, remove iconv from makefile. I spend 1 day 
digging in this problem and finaly decide to disable iconv in the target 
platform.
Attached is patch that must be copied into buildroot/toolchain/uClibc/ dir.

BR,
Assen Stoyanov

----- Original Message ----- 
From: "Bernhard Fischer" <rep.dot.nop@gmail.com>
To: "Ivan Kuten" <ivan.kuten@promwad.com>
Cc: <buildroot@uclibc.org>
Sent: Friday, June 29, 2007 1:31 AM
Subject: Re: [Buildroot] build fails with current uclibc


> On Thu, Jun 28, 2007 at 09:26:34PM +0300, Ivan Kuten wrote:
>>
>>Hello,
>>
>>Current buildroot fails with configuration:
>
> *phew* glad i usually turn off locale as well as wchar support.
> Glad that I have a pending workaround for m4 being b0rked with
> wchar off, fwiw ;)
>>
>>BR2_arm=y
>>BR2_arm920t=y
>>BR2_ARM_TYPE="ARM920T"
>>BR2_ARM_OABI=y
>>BR2_KERNEL_HEADERS_2_6_21=y
>>BR2_DEFAULT_KERNEL_HEADERS="2.6.21.5"
>>BR2_UCLIBC_VERSION_SNAPSHOT=y
>>BR2_USE_UCLIBC_SNAPSHOT="snapshot"
>>BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
>>BR2_PTHREADS_OLD=y
>>BR2_GCC_VERSION="3.4.6"
>>
>>make[1]: Entering directory `buildroot/toolchain_build_arm/uClibc'
>>../libc/misc/wchar/wchar.c:170: error: syntax error before 
>>"attribute_hidden"
>>../libc/misc/wchar/wchar.c:170: warning: data definition has no type or 
>>storage class
>>../libc/misc/wchar/wchar.c:173: error: syntax error before 
>>"attribute_hidden"
>>../libc/misc/wchar/wchar.c:173: warning: data definition has no type or 
>>storage class
>>make[2]: *** [../utils/iconv] Error 1
>>make[1]: *** [utils] ?????? 2
>
> PS: I'll spare to make any mention of wchar support which is
> time-consuming as well as multilib support which falls into the same
> category. IMHO these two are exactly of those kinds where interrested
> parties should get in touch privately unless they want to sink their own
> time and money to provide a satisfactory correct solution, generally..
>
> Put short, ask the uClibc folks about this
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uClibc-0.9.29-disable-broken-iconv-target.patch
Type: application/octet-stream
Size: 791 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070629/d0959978/attachment.obj 
