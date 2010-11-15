From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Nov 2010 19:23:47 +0100
Subject: [Buildroot] making buildroot for arm7tdmi static flat fails
In-Reply-To: <1289739946.19487.28.camel@cecilia.engel.home>
References: <1289712490.19487.13.camel@cecilia.engel.home>
	<1289739946.19487.28.camel@cecilia.engel.home>
Message-ID: <20101115192347.670361f1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dan,

On Sun, 14 Nov 2010 08:05:46 -0500
Dan Engel <dengel@sourceharvest.com> wrote:

> dan at cecilia ~/tmp $ arm-linux-gcc -Wl,-elf2flt hello.c
> /mnt/local/armtc/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.5/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld.real:
> error: no memory region specified for loadable section `.ARM.extab'
> collect2: ld returned 1 exit status dan at cecilia ~/tmp $ 
> 
> Does anyone have any idea what I'm missing?

I don't think that the no-MMU support in Buildroot is widely used,
which explains why it's broken. If you manage to fix things up, we will
be very interested by your patches and test cases, so that we can make
sure not to break things in the future.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
