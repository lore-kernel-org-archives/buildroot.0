From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 25 Jun 2010 11:53:28 +0200
Subject: [Buildroot] make linux26-force
In-Reply-To: <0D753D10438DA54287A00B02708426976372DCA426@AUSP01VMBX24.collaborationhost.net>
	(H. Hartley Sweeten's message of "Thu, 24 Jun 2010 10:48:09 -0500")
References: <0D753D10438DA54287A00B027084269763716C534F@AUSP01VMBX24.collaborationhost.net>
	<20100624092307.38486bc6@surf>
	<0D753D10438DA54287A00B02708426976372DCA426@AUSP01VMBX24.collaborationhost.net>
Message-ID: <874ogr4ew7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

Hi,

 H> No.  Manually adding a new patch or making a change to one of the
 H> source files will not cause the kernel to be rebuilt.  And, doing a
 H> linux26-menuconfig also will not cause the rebuild (unless something
 H> is changed).

 H> I'm trying to bring up a new board design so I am always making
 H> changes to my kernel board init file, either to enable a new feature
 H> or test something.

I would personally do that kind of work outside buildroot, and build the
kernel manually.

BR is nice for automating stuff once you have the basic config stable,
but I'm not the best option when you do lowlevel kernel work like board
code / device drivers.

But ok, we can readd that option - But where to stop? Some day someone
will want to hack on something else (u-boot/busybox/uClibc/whatever) and
end up in the same situation.
-- 
Bye, Peter Korsgaard
