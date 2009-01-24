From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 24 Jan 2009 09:05:51 +0100
Subject: [Buildroot] Some Questions - root placement, Initramfs,
	dev nodes
In-Reply-To: <ecbbfeda0901231840q30263e2ax3ab8ba4708776c5@mail.gmail.com>
	(Andrew Wiley's message of "Fri\, 23 Jan 2009 20\:40\:43 -0600")
References: <ecbbfeda0901231840q30263e2ax3ab8ba4708776c5@mail.gmail.com>
Message-ID: <878wp1i0ww.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrew" == Andrew Wiley <debio264@gmail.com> writes:

Hi,

 Andrew> What's the normal approach to this? The board I'm working
 Andrew> with is being used for robotics projects by beginner
 Andrew> programmers, so I would like to have as complete a system as
 Andrew> possible to make programming simpler. Ideally, the board
 Andrew> would be it's own development system, with a native compiler
 Andrew> toolchain.  Is this a realistic goal? Have I understood the
 Andrew> initramfs correctly?  How would I set up something like this?

With initramfs you still waste RAM to store your files. The most
common approach is to put a file system in flash - E.G. jffs2 if you
need read/write access, and squashfs for read only (notice you need a
kernel patch for squashfs).

For development it's probably easier to boot over nfs (see the tarball
image option in buildroot).

Getting native compilation running with 16MB is pretty unrealistic though.

 Andrew> Also, my board has two serial ports, ttyAM0 and ttyAM1. I
 Andrew> copied the /dev nodes from the official Cirrus Labs firmware
 Andrew> (I sent another email about this a while back), and while
 Andrew> ttyAM0 works perfectly, ttyAM1 doesn't seem to respond to
 Andrew> anything I do. Programs can open the port, set speeds, and
 Andrew> write to it without errors, but these actions have no
 Andrew> effect. As I said, I've never had to work without uDev, so
 Andrew> how do I find the major and minor information for this serial
 Andrew> port?

Have a look at contents of /sys/class/tty/ttyAMx/dev or check the
kernel driver.

 Andrew> Thanks for any help you can offer, and feel free to tell me I'm a
 Andrew> clueless idiot,

No worries ;)

-- 
Bye, Peter Korsgaard
