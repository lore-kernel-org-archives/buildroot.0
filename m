From: Tom <fivemiletom@gmail.com>
Date: Mon, 18 Jun 2007 17:22:12 -0700
Subject: [Buildroot] Arm / buildroot / kernel issue: init crashes?
In-Reply-To: <6311fe0b0706161136q30c4ca11qbd6ac0e50baf66d8@mail.gmail.com>
References: <4672496D.1060904@gmail.com>	<6311fe0b0706161040h626e4d85x227e490373938537@mail.gmail.com>
	<6311fe0b0706161136q30c4ca11qbd6ac0e50baf66d8@mail.gmail.com>
Message-ID: <467721B4.3090906@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rex Ashbaugh wrote:
> Go right to the problem,
> make a text dump of your init program and see what the undefined 
> instruction is (at pc=00008c60).

Good idea: instruction is 0xe12fff38, blx, which my ARM920T ARMv4T does 
not support.
Have tried both "generic_arm" and "ARM920T" as mentioned, but I guess 
will go over all buildroot and nested options again.

Thanks.

> 
> 
> -Rex
> 
> 
> 
> On 6/16/07, * Rex Ashbaugh* <rexonator@gmail.com 
> <mailto:rexonator@gmail.com>> wrote:
> 
>     Go right to the problem,
>     make a text dump of your init program and see what the undefined
>     instruction is (at pc=00008c60).
> 
> 
>     -Rex
> 
> 
> 
> 
>     On 6/15/07, * Tom* <fivemiletom@gmail.com
>     <mailto:fivemiletom@gmail.com>> wrote:
> 
>         Hello,
> 
>         I have built an ARM toolchain via buildroot. I am building my kernel
>         2.6.21.1 <http://2.6.21.1> successfully with this toolchain, it
>         boots up OK.
> 
>         I am compiling a very simple init program (hello world & endless
>         loop)
>         'arm-linux-uclibcgnueabi-gcc -static init.c -o init'. It crashes
>         "init
>         (1): undefined instruction: pc=00008c60"
> 
>         Both buildroot and kernel are using EABI. I presume that the headers
>         2.6.21.1 <http://2.6.21.1> (my kernel) and 2.6.20.4
>         <http://2.6.20.4> (buildroot) are close enough in
>         respect to system calls.
>         I tried toolchain and kernel both with and without SOFT_FLOAT(after
>         reading a thread "Problem with EABI"), but same crash either
>         way. Tried
>         both generic_arm and ARM920T.
> 
>         I suspect my options for buildroot / uclibc, but don't know what
>         exactly
>         to look for, anyone any ideas?
> 
>         Thanks
>         Tom
>         _______________________________________________
>         buildroot mailing list
>         buildroot at uclibc.org <mailto:buildroot@uclibc.org>
>         http://busybox.net/mailman/listinfo/buildroot
> 
> 
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
