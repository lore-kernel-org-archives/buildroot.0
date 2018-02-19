From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Feb 2018 22:46:28 +0100
Subject: [Buildroot] Read only rootfs with writable (aufs) overlay
In-Reply-To: <5a8b2633.54afdf0a.cb7dd.554c@mx.google.com> (Alex Hildebrand's
 message of "Mon, 19 Feb 2018 20:32:02 +0100")
References: <5a8b2633.54afdf0a.cb7dd.554c@mx.google.com>
Message-ID: <87zi44hcuj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alex" == Alex Hildebrand <alexander.hildebrand@googlemail.com> writes:

 > Hi there,
 > Does anyone of you have experience with a rootfs with a writable (aufs) overlay?
 > I managed to compile aufs and mount a folder combining the read only
 > rootfs with a read write data overlay. How to switch the rootfs to
 > this mount point? Tried to move the mount point to this folder in the
 > inittab, but this fails with "Too many levels of symbolic links"

I don't have any specific experience with aufs (any specific reasons to
not use the in-kernel overlayfs instead), but you would normally need to
setup the overlay in an initramfs and then switch_root to it before
executing init.

-- 
Bye, Peter Korsgaard
