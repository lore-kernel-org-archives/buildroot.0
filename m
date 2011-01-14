From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jan 2011 18:19:20 +0100
Subject: [Buildroot] ssh-keygen seg fault
In-Reply-To: <AANLkTi=kVHeatBJ1G2wZsX1ww-FOV0qb5Vtf5rxXNneL@mail.gmail.com>
References: <AANLkTi=OafFhejBCDjz-rffd3_gFR99kzxcGP3o+EmEM@mail.gmail.com>
	<20110114090752.5f01ade5@surf>
	<469243A17FE74439A7BBB6F327046F20@beraninstruments.com.local>
	<20110114104016.252e7f90@surf>
	<AANLkTi=kVHeatBJ1G2wZsX1ww-FOV0qb5Vtf5rxXNneL@mail.gmail.com>
Message-ID: <20110114181920.59ba8b8b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kyle,

On Fri, 14 Jan 2011 09:00:16 -0800
Kyle Hayes <kyle@greenmonitor.com> wrote:

> > Ok, good to know. We don't know if Kyle is using dropbear of the
> > full-fledged openssh. That might make a difference.
> 
> Sorry, it is the full OpenSSH version.  I need to use OpenVPN too, so
> I thought I would try to use the same tools I am currently using.

Ok, good idea.

> >> I think it does.
> 
> I am sure of it.  I can run Ubuntu 8.04 on the box with only a custom
> kernel.  Everything else is completely stock from Ubuntu 8.04.  As far
> as I know, Ubuntu is configured (or was) for either a 486 or a Pentium
> when you run it as stock for x86.

Ok.

> > Ok, great.
> 
> See above.  I am not sure what Ubuntu 8.04 assumes, but I'm fairly
> sure it is not using software FPU.

Yes, definitely.

> I am currently using a custom distro based on Ubuntu 8.04 with as many
> packages trimmed as I can easily do.  This still makes the base CF
> card image more than 400MB.  Buildroot is making a base image of about
> 6MB.  I intend to use extlinux' ability to concatenate multiple
> initramfs files to keep our software (which revs fairly often)
> separate from OpenVPN config (which doesn't change too often) separate
> from the core root filesystem.

Sounds good. Didn't know that extlinux was able to do this kind of
things. By the way, do you build extlinux with Buildroot or separatly ?
If built with Buildroot, does it work ? Is there anything we should
improve on that side ?

> I will try dropbear and see if that works any better.  OpenSSH works
> fine out-of-the box for the Ubuntu 8.04 version so I'm suspicious that
> it is something about the way it is built or with the current version
> of OpenSSH.

Yes, it's definitely something wrong in the build process, and it'd be
great to sort it out.

Would you mind running ssh-keygen under gdbserver+cross-gdb as
suggested in my first e-mail ? Or run "ulimit -c unlimited" on your
board, get ssh-keygen to crash, and then transfer the core file to your
development workstation, and get a backstrace with the cross-gdb. That
would immediatly point us to the segfault location, which would really,
really help in understanding what the issue is.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
