From: Bernhard Fischer <rep.nop@aon.at>
Date: Tue, 10 Oct 2006 14:19:14 +0200
Subject: [Buildroot] How to Compile Busy Box with Cross Compiler
	(sh4-linx-)
In-Reply-To: <CCEE49B9CE065146BA4FE34B2748A532017BCA1B@CEL-BANGT-M01.celstream-in.com>
References: <20061010094218.GA14366@aon.at>
	<CCEE49B9CE065146BA4FE34B2748A532017BCA1B@CEL-BANGT-M01.celstream-in.com>
Message-ID: <20061010121914.GB14366@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 10, 2006 at 04:06:23PM +0530, Gulab Chandra Yadava wrote:
>
>Hi
>I have attached error reported during compilation as
># make CROSS=sh4-linux-
>
>
>            --  Regards
>            Gulab 
>
>
>-----Original Message-----
>From: Bernhard Fischer [mailto:rep.nop at aon.at]
>Sent: Tuesday, October 10, 2006 3:12 PM
>To: Gulab Chandra Yadava
>Cc: busybox at busybox.net
>Subject: Re: How to Compile Busy Box with Cross Compiler (sh4-linx-)
>
>On Tue, Oct 10, 2006 at 01:25:10PM +0530, Gulab Chandra Yadava wrote:
>>
>>Hi
>>  I have compiled busybox--1.2.1 on PC successfully.
>> For Cross compilation I put the correct path
>>CROSS_COMPILER_PREFIX="/opt/STM/STLinux-2.0/devkit/sh4/bin/sh4-linux-"
>
>first, the thing is nowadays called CROSS=
>
>>And tried to compile it by invoking # make, but it fails with
>>compilation error at last line.
>>Make[1]: *** [/root/Desktop/busybox-1.2.1/networking/udhcp/common.o]
>>Error 1
>>Make: *** [_all] Error 2
>
>A few lines before that pasted line would be of interrest.
>
>HTH,
>>
>>I have not installed uClib.
>>
>>Basically I want to create ramdisk image (initrd.img) for my target
>>system, which uses stlinux-2.6.11_stm20-31.
>>
>>Can u please provide me any pointer.
>>--Regards
>>	Gulab
>
>
>______________________________________________________________
>DISCLAIMER:
>This electronic message, and any attachments to this electronic message are
>intended for the exclusive use of the addressee(s)named herein and may contain
>legally privileged and confidential information. It is the property of Celstream
>Technologies Ltd. If you are not the intended recipient, you are hereby
>strictly notified not to copy, forward, distribute or use this message or any
>attachments thereto. If you have received this message in error, please delete
>it and all copies thereof from your system and notify the sender at Celstream
>Technologies or administrator at celstream.com immediately
>_______________________________________________________________
Content-Description: error.txt
>CC miscutils/bbconfig.o
>  AR cru miscutils/miscutils.a
>  CC networking/udhcp/common.o
>In file included from /root/Desktop/busybox-1.2.1/networking/udhcp/packet.h:4,
>                 from /root/Desktop/busybox-1.2.1/networking/udhcp/libbb_udhcp.h:9,
>                 from /root/Desktop/busybox-1.2.1/networking/udhcp/common.h:12,
>                 from /root/Desktop/busybox-1.2.1/networking/udhcp/common.c:23:
>/opt/STM/STLinux-2.0/devkit/sh4/target/usr/include/netinet/udp.h:68: error: parse error before "uint16_t"

Make sure that the include that provides the types/structs of that line
are included via include/libbb.h

regards,
Bernhard
>/opt/STM/STLinux-2.0/devkit/sh4/target/usr/include/netinet/udp.h:70: error: parse error before "len"
>/opt/STM/STLinux-2.0/devkit/sh4/target/usr/include/netinet/udp.h:71: error: parse error before "check"
>In file included from /root/Desktop/busybox-1.2.1/networking/udhcp/libbb_udhcp.h:9,
>                 from /root/Desktop/busybox-1.2.1/networking/udhcp/common.h:12,
>                 from /root/Desktop/busybox-1.2.1/networking/udhcp/common.c:23:
>/root/Desktop/busybox-1.2.1/networking/udhcp/packet.h:28: error: field `udp' has incomplete type
>In file included from /root/Desktop/busybox-1.2.1/include/busybox.h:12,
>                 from /root/Desktop/busybox-1.2.1/networking/udhcp/libbb_udhcp.h:10,
>                 from /root/Desktop/busybox-1.2.1/networking/udhcp/common.h:12,
>                 from /root/Desktop/busybox-1.2.1/networking/udhcp/common.c:23:
>/root/Desktop/busybox-1.2.1/include/libbb.h:135: warning: declaration of 'dest' shadows a global declaration
>/opt/STM/STLinux-2.0/devkit/sh4/target/usr/include/netinet/udp.h:69: warning: shadowed declaration is here
>/root/Desktop/busybox-1.2.1/include/libbb.h:137: warning: declaration of 'len' shadows a global declaration
>/opt/STM/STLinux-2.0/devkit/sh4/target/usr/include/netinet/udp.h:70: warning: shadowed declaration is here
>/root/Desktop/busybox-1.2.1/include/libbb.h:139: warning: declaration of 'len' shadows a global declaration
>/opt/STM/STLinux-2.0/devkit/sh4/target/usr/include/netinet/udp.h:70: warning: shadowed declaration is here
>/root/Desktop/busybox-1.2.1/include/libbb.h:312: warning: declaration of 'len' shadows a global declaration
>/opt/STM/STLinux-2.0/devkit/sh4/target/usr/include/netinet/udp.h:70: warning: shadowed declaration is here
>make[1]: *** [/root/Desktop/busybox-1.2.1/networking/udhcp/common.o] Error 1
>make: *** [_all] Error 2
>
