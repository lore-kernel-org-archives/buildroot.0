From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Wed, 23 Apr 2008 11:47:06 +0200
Subject: [Buildroot] Failing NFS root mount (SOLVED)
References: <067701c8a475$2df6d860$ad289e86@LPSC0173W><20080422140727.GA32518@cloud.net.au><06fe01c8a51f$e37d5470$ad289e86@LPSC0173W>
	<87iqy9j5ds.fsf@macbook.be.48ers.dk>
Message-ID: <076001c8a527$0105e410$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In retrospect that makes a lot of sense... (but then again, so do many 
things in life).

I was exporting with NFS the project_build_powerpc/genepy/root directory to 
mount as root. And that failed.

But then if do:
mount -o loop binaries/genepy/rootfs.powerpc.ext2 /media/loop/
And export /media/loop instead, I can boot fine !!!

Doing a diff between the two dirs reveals that for instance the devices are 
normal files in the project directory...

> Well, you'll need to unpack the tarball as root in order to create the
> device nodes and get the permissions right on stuff like /etc/passwd -
> If you do that, you shouldn't need to do any additional chown.

I saw your reply right after solving it and that confirms it...

Thanks to all who contributed.
-- 
Guillaume Dargaud
http://www.gdargaud.net/
