From: Taceant Omnes <taceant@gmail.com>
Date: Thu, 23 Feb 2017 14:30:54 +0000
Subject: [Buildroot] Ethernet not working with imx6ulevk
Message-ID: <CAKkGsYK+WPvgH-SQ9L_cbBkjCOOXK9YE4ty6L5wQDhJOmYR==Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Has anybody got Ethernet working with imx6ulevk?

Some context. Ethernet does not work (out of the box) with the imx6ul
evaluation kit.

# does not work
$ uname -a
Linux imx6ulevk 4.1.15-1.1.0+ga4d2a08 #1 SMP PREEMPT Fri Apr 1
06:06:13 CST 2016 armv7l GNU/Linux

I downloaded the most recent card image for this kit from the NXP
website, and with it Ethernet works out of the box.

# works for both Ethernet ports, though both have the same MAC
address, which is odd.
$ uname -a
Linux imx6ulevk 4.1.15-2.0.1+gb63f3f5 #1 SMP PREEMPT Fri Nov 11
03:52:53 CST 2016 armv7l armv7l armv7l GNU/Linux

According to the SRC-4.1.15-2.0.1 file that comes in the NXP
4.1.15-2.0.1 tar file, the kernel and u-boot versions (
4.1.15_2.0.0_ga) are the same as those in the BR defconfig for this
kit. One would expect BR to work.

What I mean by ?Ethernet working? is that the ports state is down and
I cannot make it go up, and DHCP fails.

I looked at the BR 2017.02-rc2 defconfig and there are no changes as
compared to the version I am using (2016.11.2) (except for the
location of post-image.sh).

Any ideas?
