From: Microbit_Ubuntu <microbit@virginbroadband.com.au>
Date: Wed, 02 Jun 2010 04:30:22 +1000
Subject: [Buildroot] Buildroot 2010.05-rc3 released :: 2 build errors -
 lockfile-progs & gdb
In-Reply-To: <87vda5suz0.fsf@macbook.be.48ers.dk>
References: <877hmpv7km.fsf@macbook.be.48ers.dk>
	<1275007047.6387.17.camel@ubuntu> <87vda5suz0.fsf@macbook.be.48ers.dk>
Message-ID: <1275417022.1598.5.camel@ubuntu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sun, 2010-05-30 at 09:35 +0200, Peter Korsgaard wrote:
> >>>>> "Microbit" == Microbit Ubuntu <microbit@virginbroadband.com.au> writes:
> 
>  Microbit> I still come across 2 build errors with rc3 :
> 
>  Microbit> 1. lockfile-progs-0.1.11
>  Microbit> ========================
>  Microbit> The generated Makefile causes a build error in :
>  Microbit> CFLAGS    := -g -Wall -Werror -O2
>  Microbit> I still need to remove the -Werror to resume the build ??
> 
>  Microbit> 2. gdb symlink
>  Microbit> ==============
>  Microbit> ct-ng generates arm-unknown-linux-uclibcgnueabi where I have
>  Microbit> arm-elf-xxx as an alias.
>  Microbit> The build stops when the symlink for gdb fails. I need to manually
>  Microbit> insert a folder 'arm-unknown-linux-uclibcgnueabi' with 'bin' as a
>  Microbit> subfolder under ../output/staging/usr
> 
> Both issues should be fixed in git now.
> 

2010.05 builds 100% fine now, except for the little snag with the gdb
symlink. I'll see if I can figure out what the common denominator is,
but I'm a bit stumped.

I find I still have to manually insert the folder
'arm-unknown-linux-uclibcgnueabi' with 'bin' as a subfolder under
buildroot-2010.05/output/staging/usr

(ext toolchain built with CT-NG 1.6.1, alias used is 'arm-elf-xxx'

Can you advise ?

All the best
Kris
