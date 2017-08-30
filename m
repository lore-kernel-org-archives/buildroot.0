From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Aug 2017 21:48:23 +0300
Subject: [Buildroot] Need help with cross-compiler configuration
In-Reply-To: <CANK3ZEf0_A2aexR9mDJK3pi_CZhbBcujAnmsStvoJ6+DRZSVnA@mail.gmail.com>
References: <CANK3ZEf0_A2aexR9mDJK3pi_CZhbBcujAnmsStvoJ6+DRZSVnA@mail.gmail.com>
Message-ID: <20170830184823.i43svfizch3f3m75@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Aseem,

On Wed, Aug 30, 2017 at 08:19:33PM +0530, Aseem Sharma wrote:
> I am naive to buildroot & processor world trying to compile
> "buildroot-2017.02.5" for "Marvell ARM Armada 166E processor (compatible to
> ARMv5TE instruction-set)" based old system.
> 
> I compiled the buildroot (kernel, rootfs & cross-compiler) by setting arm926t
> (little-endian) as target arch/variant as suggested by Arnout/Baruch in
> response to my old query. However, now I am having trouble booting the
> system with the new buildroot created zImage. I do not seem to get any
> output/log on the system screen after flashing this new image onto the
> system.

Which kernel did you use?

> To verify if the buildroot is configured correctly for my system, I tried
> to create a helloWorld program using the buildroot internal cross-compiler
> and then tried to run it on the arm based system (running old 2005
> buildroot release). Following is the exact error message that I observe:
> *hello.c on Host:*
> 
> #include <stdio.h>
> int main()
> {
>    printf("Hello, World!");
>    return 0;
> }
> 
> *Command Line used to Compile on Host:*
> 
> sudo /home/administrator/Downloads/buildroot_2017/buildroot-2017.0
> 2.5/output/host/usr/bin/arm-linux-gcc --sysroot=/home/administrator/
> Downloads/buildroot_2017/buildroot-2017.02.5/output/staging -o test hello.c
> 
> *Screen Output on Target:*
> 
> *# *./test
> *./test: line 1: syntax error: unexpected ")"*
> *#*
> *#* cat ./test | more   *                              ------->  Just to
> prove its not a shell script!*
> bFLTD? ?c0 ?eY??)? ?? ?? ? -?-? ??-?
>                                     ?
>                                      0???R??X at -? ? 0?0`?S?0?S3?/??
>  ?, at -?`?A ?????0?S3?/??  40?@-? ??@ ?R??????0?S?
> ? ?0 ?0???? @-?80?S?
> 
> *Please let me know if I am missing something. *

Did you build your test program statically? If not, which libc variant do you 
use?

Do you use compatible ARM ABI? The so called OABI (for old ABI) has still been 
in use at that time. See https://wiki.debian.org/ArmEabiPort.

Buildroot dropped support for ARM OABI a few years ago.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
