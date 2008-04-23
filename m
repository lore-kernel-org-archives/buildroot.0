From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Apr 2008 12:10:12 +0200
Subject: [Buildroot] Failing NFS root mount (SOLVED)
In-Reply-To: <076001c8a527$0105e410$ad289e86@LPSC0173W> (Guillaume Dargaud's
	message of "Wed\, 23 Apr 2008 11\:47\:06 +0200")
References: <067701c8a475$2df6d860$ad289e86@LPSC0173W>
	<20080422140727.GA32518@cloud.net.au>
	<06fe01c8a51f$e37d5470$ad289e86@LPSC0173W>
	<87iqy9j5ds.fsf@macbook.be.48ers.dk>
	<076001c8a527$0105e410$ad289e86@LPSC0173W>
Message-ID: <8763u8khkr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume Dargaud <dargaud@lpsc.in2p3.fr> writes:

 Guillaume> In retrospect that makes a lot of sense... (but then
 Guillaume> again, so do many things in life).

;)

 Guillaume> I was exporting with NFS the
 Guillaume> project_build_powerpc/genepy/root directory to mount as
 Guillaume> root. And that failed.

Ah yes, you are not supposed to do that. Instead enable tarball
creation under target options and untar that file uner your nfsroot
as root to get the proper permissions/devices.

See the 'Improper device nodes' thread on the list for details.

 Guillaume> But then if do:
 Guillaume> mount -o loop binaries/genepy/rootfs.powerpc.ext2 /media/loop/
 Guillaume> And export /media/loop instead, I can boot fine !!!

That's an option as well, but the tarball is handier.

 Guillaume> Doing a diff between the two dirs reveals that for
 Guillaume> instance the devices are normal files in the project
 Guillaume> directory...

Yes. This is handled by fakeroot so you can compile as non-root.

 >> Well, you'll need to unpack the tarball as root in order to create the
 >> device nodes and get the permissions right on stuff like /etc/passwd -
 >> If you do that, you shouldn't need to do any additional chown.

 Guillaume> I saw your reply right after solving it and that confirms it...

 Guillaume> Thanks to all who contributed.

You're welcome.

-- 
Bye, Peter Korsgaard
