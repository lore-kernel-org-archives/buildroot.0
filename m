From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Oct 2015 22:00:32 +0200
Subject: [Buildroot] [git commit] axfs: add new filesystem type
In-Reply-To: <20151014214751.023DE81663@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Wed, 14 Oct 2015 23:47:30 +0200")
References: <20151014214751.023DE81663@busybox.osuosl.org>
Message-ID: <87vba76gwv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: http://git.buildroot.net/buildroot/commit/?id=a6f916430f553efa71dd7092073f5dec32861ba3
 > branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The Advanced XIP File System is a Linux kernel filesystem driver that
 > enables files to be executed directly from flash or ROM memory rather
 > than being copied into RAM. It has the ability to store individual
 > *pages* in a file uncompressed/XIP or compressed/Demand Paged.

 > This commit only adds support for 'XIP all' mode, so all the files that
 > have the execute attribute set will be XIP'ed.

 > At the moment, the FS is not supported in Linux mainline (v4.3-rc5), so
 > the kernel has to be built with the axfs patches to be able to read it.
 > Patches can be found here: https://github.com/jaredeh/axfs

 > [Thomas: rewrap Config.in help text.]

 > Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> +++ b/fs/axfs/Config.in
 > @@ -0,0 +1,17 @@
 > +config BR2_TARGET_ROOTFS_AXFS
 > +	bool "axfs root filesystem"
 > +	help
 > +	  The Advanced XIP File System is a Linux kernel filesystem
 > +	  driver that enables files to be executed directly from flash
 > +	  or ROM memory rather than being copied into RAM. It has the
 > +	  ability to store individual *pages* in a file
 > +	  uncompressed/XIP or compressed/Demand Paged.
 > +
 > +	  So far, the only supported mode is 'XIP all', so all the
 > +	  files that have the execute attribute set will be XIP'ed.
 > +
 > +	  At the moment, the FS is not supported in Linux mainline
 > +	  (v4.3-rc5), so the kernel has to be built with the axfs
 > +	  patches to be able to read it. Patches can be found at:
 > +
 > +	    https://github.com/jaredeh/axfs

The indentation of that URL looks wrong. I'll fix it now.

-- 
Bye, Peter Korsgaard
