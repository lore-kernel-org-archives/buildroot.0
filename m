From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Jan 2013 11:30:02 +0100
Subject: [Buildroot] [RFC] How to handle targets that need more than one
	file system to boot?
In-Reply-To: <201301030940.07495.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 3 Jan 2013 09:40:07 +0100")
References: <201212240100.17473.yann.morin.1998@free.fr>
 <201301030056.01956.yann.morin.1998@free.fr>
 <CAJJ6jxudS63P58imQ6nPn=_AA9JoBMZp3i=Dq2As1c9EiCDZxg@mail.gmail.com>
 <201301030940.07495.yann.morin.1998@free.fr>
Message-ID: <87wqvuo8yd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 Yann> The reason for wanting to include such a feature in Buildroot is to
 Yann> keep Buildroot ximple to use for the *end-user*, not necessarily for
 Yann> the Buildroot developpers. A little bit of complexity in the Buildroot
 Yann> Makefiles and script is OK if it makes for an smoother user experience.

 Yann> And if you have those files in images/ :
 Yann>   - images/boot-vfat.img
 Yann>   - images/root-squahfs.img
 Yann>   - images/home-ext2.img

 Yann> Then it is a matter of running (/dev/sdX is the sd-card):
 Yann>   - dd if=images/boot-vfat.img of=/dev/sdX1
 Yann>   - dd if=images/root-squashfs.img of=/dev/sdX2
 Yann>   - dd if=images/home-ext2.img of=/dev/sdX3

Except this doesn't take care of resizing the filesystems to span the
entire partition.

The linaro people afaik have a linaro-media-create tool to automate
something like this, perhaps we could use it?
-- 
Bye, Peter Korsgaard
