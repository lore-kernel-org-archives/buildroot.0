From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 10 May 2016 20:01:32 +0200
Subject: [Buildroot] uClibc shared library issue
In-Reply-To: <CABWt4es8h5Ei2CAivrMaT4PG33W7TPGZSC_9t_FvMDKv6--i1Q@mail.gmail.com>
References: <CABWt4es8h5Ei2CAivrMaT4PG33W7TPGZSC_9t_FvMDKv6--i1Q@mail.gmail.com>
Message-ID: <20160510180132.GP26720@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Robert,
Robert Smigielski wrote,

> Hi everyone
> 
> I have been using buildroot 2015.11. and 2010.11 to try to get an old ARM
> 926EJ-S custom processor (Digi NS-921X) to boot and give me a shell interface
> at the one and only serial port console. My issue is that while I believe the
> board has booted up on either buildroot version, the behavior at the serial
> console is that I can type characters and see them displayed, the Linux kernel
> is not responding to the characters. There is no "buildroot login:" or similar
> displayed. The serial console simply echos back the characters I type.?
> 
> The painful part is this board has only 2 I/O interfaces brought out: a serial
> console and a WiFi interface. Thus my only debug and communication interface is
> the serial console, and I cannot get it to operate properly.
> 
> I have been using the kernel boot args "rdinit=/myinit init=/myinit" to run my
> custom init program. I also experimented by using "rdinit=/junk init=/junk" to
> verify that loading a non existent program results in the expected failure to
> find the file and a kernel panic. That proves that I do have control of the
> init program.
> 
> I tried experiments such as creating a program myinit.c to simply display
> "Hello world" and then sleep.?
> When I compile the myinit.c into a static executable, I receive the printk
> Hello world.?
> When I compile myinit.c as a shared executable I do not receive the printk
> Hello world. I presume that means there is some issue with the uClibc/glibc
> shared object loader or shared library.
> Now I admit I have no detailed experience with building/testing/debugging libc
> issues, shared library loaders, and shared libc. I have much experience
> building kernels, uboot, packages, etc for embedded boards.
> 
> I need advice and suggestions on what to do next to get myinit.c to run when
> compiled against a shared libc. Thanks everyone.

For more help, I think we need some more details.
Can you share your br2 .config from 2015.11 release?
Can you show dmesg of the machine via serial output until your hello
world starts? How do you flash or bootup the embedded device?
Did you check with readelf -e myinit what shared library loader is
used? (interpreter entry in the output)
Is the file available on your target?

But why you think enabling shared library support will fix your
serial line issues? What serial line speed the device supports and
what kernel device name is used? (check dmesg again)

best regards
 Waldemar
