From: Zolnierczuk, Piotr <pzolnier@indiana.edu>
Date: Wed, 28 Feb 2007 15:41:04 -0500
Subject: [Buildroot] static libgcc_s
In-Reply-To: <mailman.1.1172692802.12481.buildroot@uclibc.org>
References: <mailman.1.1172692802.12481.buildroot@uclibc.org>
Message-ID: <4B278B357EBD634ABB3A5F9D2B63B9C40176A88A@iu-mssg-mbx101.ads.iu.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas: 
Thanks for prompt reply.
1. U-Boot compiles fine (I use NOSOFTFLAG=yes). I would like to compile
AT91bootstrap
(http://www.atmel.com/dyn/resources/prod_documents/AT91Bootstrap1.2.zip)

2. AFAIK divsi3 is integer division not FP. 
When I do 
nm -B $PATH_TO_TOOLCHAIN/lib/libc.a 
I can see undefined references to __divsi3. The functions are defined in
libgcc_s.so, but I need a static one (-Bstatic) ... hence catch 22 :(

BTW: is there a simple way to convert a shared lib into a static one.
Back in the dark days I used to manipulate static libs with ar (e.g. ar
x libmylib.a would produce a set of *.o files). But I do not know how to
"disassemble" a *.so


Piotr
