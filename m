From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 5 Nov 2012 15:24:46 +0100
Subject: [Buildroot] new perl build issue
In-Reply-To: <20121105075317.75f9f85c@skate>
References: <CABtOAfw6A4jH1h1W1Bbm7kKsmz_hJLymP8JRBo5A6a4o09wS8g@mail.gmail.com>
 <CAB0FRstkx1+Eg0WTv4eVJ+KPFX9RY2C8X4SaL0EDoBK0P642SQ@mail.gmail.com>
 <20121105075317.75f9f85c@skate>
Message-ID: <CAB0FRsu0Lv+Wqa5sPMBNqD1za-6jL+=ZbexQxSPgKsUSN_L-bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/11/5 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
>
> On Sun, 4 Nov 2012 20:41:45 +0100, Fran?ois Perrad wrote:
>
>> this afternoon, Thomas has posted 3 patches for qemu (see
>> http://patchwork.ozlabs.org/patch/197055/).
>> Alexander, try to rebuild host-qemu with them.
>
> Unfortunately, none of those patches have a chance to fix Alexander's
> problem. My patches only fix missing dependencies.
>
> Also, could you have a look at http://autobuild.buildroot.org/ for perl
> build failures? It seems like Qemu doesn't start properly on some
> platforms, for some reason.

on autobuilder, at the first time to run Qemu, there is the same error :

> I've tried to compile and run the following simple program:
>
> #include <stdio.h>
> int main() { printf("Ok\n"); return(0); }
>
> I used the command:
>
>	/home/peko/scratch/host/usr/bin/powerpc-linux-gcc -o try ... try.c ... -lc
>	/home/peko/scratch/build/perl-5.16.1/Cross/run-qemu-ppc ./try
>
> and I got the following output:
>
> Unable to reserve 0xf7000000 bytes of virtual address space for use
> as guest address space (check your virtual memory ulimit setting
> or reserve less using -R option)
> The program compiled OK, but exited with status 1.
> You have a problem.  Shall I abort Configure [y]

Qemu wants ~4GB of RAM for starting, it is really huge.

Fran?ois

>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
