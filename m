From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 7 Mar 2007 15:47:29 +0100
Subject: [Buildroot] undefined __aeabi_read_tp
In-Reply-To: <1172178939.22966.16.camel@ndragon.eng.wgate.com>
References: <1172177933.22966.13.camel@ndragon.eng.wgate.com>
	<1172178939.22966.16.camel@ndragon.eng.wgate.com>
Message-ID: <20070307144729.GD16872@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 22, 2007 at 04:15:38PM -0500, James Newell wrote:
>Hmmmm .. I found them defined in glibc2.5:
>$findsym __aeabi_read_tp
>Searching library: ./arm-926ejs-linux-gnueabi/lib/libc_nonshared.a
>  Found object __aeabi_read_tp in    
>library ./arm-926ejs-linux-gnueabi/lib/libc_nonshared.a
>Searching library: ./arm-926ejs-linux-gnueabi/lib/libc.a
>  Found object __aeabi_read_tp in
>library ./arm-926ejs-linux-gnueabi/lib/libc.a
>
>Could my uclibc be mis-configured for threading?

First, you should direct this to the uClibc list, probably.
Second, AFAIK only linuxthreads.old work on arm.

HTH,
>Thanks,
>Jim
>
>On Thu, 2007-02-22 at 15:58 -0500, James Newell wrote:
>> I was building the ubuntu upstart package, and ran into an undefined
>> __aeabi_read_tp call.  
>> 
>> The gcc defines:
>> -mtp=name
>>            Specify the access model for the thread local storage pointer.  The
>>            valid models are soft, which generates calls to "__aeabi_read_tp",
>>            cp15, which fetches the thread pointer from "cp15" directly (sup-
>>            ported in the arm6k architecture), and auto, which uses the best
>>            available method for the selected processor.  The default setting
>>            is auto.
>> 
>> The __aeabi_read_tp is not defined in the uclibc libs:
>> [jnewell at ndragon staging_dir]$ nm $(find . -type f -name "*.a")|grep
>> eabi_read_tp
>>          U __aeabi_read_tp
>>          U __aeabi_read_tp
>>          U __aeabi_read_tp
>>          U __aeabi_read_tp
>>          U __aeabi_read_tp
>>          U __aeabi_read_tp
>>          U __aeabi_read_tp
>>          U __aeabi_read_tp
>>          U __aeabi_read_tp
>>          U __aeabi_read_tp
>>          U __aeabi_read_tp
>>          U __aeabi_read_tp
>> 
>> Does anyone know who should be defining this call? 
>> 
>> Thanks,
>> Jim
>> 
>> Some of my config:
>> [jnewell at ndragon buildroot]$ grep -e ^BR2_GCC -e ABI -e THREAD .config
>> # BR2_ARM_OABI is not set
>> BR2_ARM_EABI=y
>> # BR2_PTHREADS_NONE is not set
>> # BR2_PTHREADS is not set
>> # BR2_PTHREADS_OLD is not set
>> BR2_PTHREADS_NATIVE=y
>> # BR2_PTHREAD_DEBUG is not set
>> BR2_GCC_VERSION_4_2=y
>> BR2_GCC_IS_SNAP=y
>> BR2_GCC_SNAP_DATE="20070214"
>> BR2_GCC_VERSION="4.2"
>> BR2_GCC_SHARED_LIBGCC=y
>> BR2_SOFT_FLOAT=y
>> 
>>  
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>> 
>
>_______________________________________________
>buildroot mailing list
>buildroot at uclibc.org
>http://busybox.net/mailman/listinfo/buildroot
>
