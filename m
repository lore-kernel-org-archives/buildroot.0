From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 26 Feb 2011 22:55:02 +0100
Subject: [Buildroot] dtc (device tree compiler)
In-Reply-To: <AANLkTikXg3URUg5XqPJKey5X-0BsgE2gimAPGzF94oUR@mail.gmail.com>
	(Charles Krinke's message of "Sat, 26 Feb 2011 11:13:27 -0800")
References: <AANLkTikXg3URUg5XqPJKey5X-0BsgE2gimAPGzF94oUR@mail.gmail.com>
Message-ID: <87hbbqpikp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:

 Charles> I have a question about dtc. In the powerpc, a dtc (device
 Charles> tree compiler) is used to compile a .dts file into a .dtb file
 Charles> which is used by the kernel (uImage) to boot.

 Charles> I dont see us compiling the .dts and creating the .dtb in the
 Charles> MPC8323ERDB.

 Charles> Is there a setting I am missing in buildroot? How does the dtc
 Charles> get invoked to compile the .dts into a .dtb to go along with
 Charles> the uImage file?

This is all handled in the kernel (arch/powerpc/boot/Makefile) - And dtc
is included in the kernel sources these days, so buildroot doesn't do
anything special for it.

The .dtb can be handled in a number of ways (embedded in bootloader,
next to bootloader or together with/in uImage). Are you asking for
options to somehow automate some of these choices?

-- 
Bye, Peter Korsgaard
