From: John Stile <john@stilen.com>
Date: Thu, 17 Jan 2013 14:09:33 -0800
Subject: [Buildroot] designing a firmware update mechanism
Message-ID: <1358460573.32266.63.camel@genx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I use buildroot for an embedded project, which has an atmel arm
processor, at91BootStrap on NOR to call uboot (and the reset of the
system) on NAND.

I am trying to devise a brick-safe strategy to update the systems once
created, but I'm making this up as I go for a lack of better ideas.

So far I am trying to split NAND in redundant halves (each with a copy
of uboot + uboot-env + kernel + roofs), and modify at91bootstrap to
choose which uboot to load, based on something inside the uboot-env
areas.

Will I need to compile 2 versions of uboot, differing only in where to
look for the uboot-env, or is there another way?  If so, is there a way
to do this within buildroot, or does uboot need to become an external
project from my buildroot setup?

Could anyone share a firmware update strategy for a project that uses
buildroot, at91bootstrap, and uboot, or is that outside the scope of
this list?

I have not found any built-in mechanisms to handle updates.
