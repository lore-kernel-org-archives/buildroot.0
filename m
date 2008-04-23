From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Apr 2008 20:05:20 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <010801c8a560$21c744d0$020514ac@atmel.com> (Ulf Samuelsson's
	message of "Wed\, 23 Apr 2008 18\:09\:48 +0200")
References: <20080423130355.7668C3C747@busybox.net>
	<010801c8a560$21c744d0$020514ac@atmel.com>
Message-ID: <87skxcfnvj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 >> Author: jacmet
 >> Date: 2008-04-23 06:03:53 -0700 (Wed, 23 Apr 2008)
 >> New Revision: 21809
 >> 
 >> Log:
 >> u-boot: tools in target (mkimage, fw_printenv and fw_setenv)
 >> 
 >> 

 Ulf> Why install mkimage in the target???

To create images and more importantly, to see the version info of
images in the flash (mkimage -l).

 Ulf> It is used to create the linux kernel image so that U-Boot can load it.
 Ulf> If you download a new image, I would expect it is already created
 Ulf> using mkimage on the host.

Sure, but uImages are not just for kernels, E.G. the board I'm working
on has firmware for 2 fpgas in seperate uImages. It's handy to be able
to check the version info of the installed images under Linux, similar
to the imls u-boot command.

-- 
Bye, Peter Korsgaard
