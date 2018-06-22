From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jun 2018 19:53:41 +0200
Subject: [Buildroot] Run getty on multiple ttys and Box-drawing character
In-Reply-To: <CACq04CEcu6tiE-P7-xJUtHVYz4ouYrhq1Q2awjhg=i9W+THAvA@mail.gmail.com>
 (MOHAMMAD RASIM's message of "Fri, 22 Jun 2018 19:37:59 +0300")
References: <CACq04CEcu6tiE-P7-xJUtHVYz4ouYrhq1Q2awjhg=i9W+THAvA@mail.gmail.com>
Message-ID: <87po0ik8re.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "MOHAMMAD" == MOHAMMAD RASIM <mohammad.rasim96@gmail.com> writes:

 > Hi
 > I'm running buildroot-2018.02.3  on an arm64 board from initrd  and have a
 > couple of questions:

 > 1- How can I set buildroot to run getty on multiple ttys. the standard
 > BR2_TARGET_GENERIC_GETTY doesn't accept multiple ttys to be set, I normally
 > edit output/target/etc/inittab and add the other tty. So is this the
 > standard way of adding a tty or is there some setting I'm missing?

Yes, either that or do the inittab modification in a post-build
script. Have a look at board/raspberrypi/post-build.sh for an example.

These options are really just convenience options to cover the common
use cases, they will not fit for all use cases.

> also, there is an official kernel parameter called console that can be used
 > to set up gettys, so for example, if I run Ubuntu initramfs I can pass the
 > following arguments to the kernel:

 > console=ttyS0,115200n8 console=tty0

 > and so the initramfs run a getty on each tty I passed, so why doesn't
 > buildroot use these values to run gettys?

How would you implement this in the busybox inittab?


 > 2- I'm running a python script that uses curses library to display a box on
 > the framebuffer, the problem is that the box doesn't show with the box
 > drawing characters <https://en.wikipedia.org/wiki/Box-drawing_character>
 > instead the borders are shown as letters. so what do I need to enable?
 > I've already added en_US.UTF-8 to BR2_GENERATE_LOCALE but still I don't get
 > the box characters.

Maybe play with your TERM settings? The default value is vt100, which
may not support the specific box drawing characters.

-- 
Bye, Peter Korsgaard
