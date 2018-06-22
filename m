From: MOHAMMAD RASIM <mohammad.rasim96@gmail.com>
Date: Fri, 22 Jun 2018 19:37:59 +0300
Subject: [Buildroot] Run getty on multiple ttys and Box-drawing character
Message-ID: <CACq04CEcu6tiE-P7-xJUtHVYz4ouYrhq1Q2awjhg=i9W+THAvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
I'm running buildroot-2018.02.3  on an arm64 board from initrd  and have a
couple of questions:

1- How can I set buildroot to run getty on multiple ttys. the standard
BR2_TARGET_GENERIC_GETTY doesn't accept multiple ttys to be set, I normally
edit output/target/etc/inittab and add the other tty. So is this the
standard way of adding a tty or is there some setting I'm missing?
also, there is an official kernel parameter called console that can be used
to set up gettys, so for example, if I run Ubuntu initramfs I can pass the
following arguments to the kernel:

console=ttyS0,115200n8 console=tty0

and so the initramfs run a getty on each tty I passed, so why doesn't
buildroot use these values to run gettys?

2- I'm running a python script that uses curses library to display a box on
the framebuffer, the problem is that the box doesn't show with the box
drawing characters <https://en.wikipedia.org/wiki/Box-drawing_character>
instead the borders are shown as letters. so what do I need to enable?
I've already added en_US.UTF-8 to BR2_GENERATE_LOCALE but still I don't get
the box characters.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180622/2f8e3c1f/attachment.html>
