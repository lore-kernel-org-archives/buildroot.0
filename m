From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Apr 2008 11:18:55 +0200
Subject: [Buildroot] Failing NFS root mount
In-Reply-To: <06fe01c8a51f$e37d5470$ad289e86@LPSC0173W> (Guillaume Dargaud's
	message of "Wed\, 23 Apr 2008 10\:56\:10 +0200")
References: <067701c8a475$2df6d860$ad289e86@LPSC0173W>
	<20080422140727.GA32518@cloud.net.au>
	<06fe01c8a51f$e37d5470$ad289e86@LPSC0173W>
Message-ID: <87iqy9j5ds.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume Dargaud <dargaud@lpsc.in2p3.fr> writes:

Hi,

 Guillaume> Question: the exported nfs dir, must be "chown -R
 Guillaume> root:root" beforehand, right ? If I don't do so, then I
 Guillaume> can't do much with it, but I didn't see this fact stated
 Guillaume> anywhere.

Well, you'll need to unpack the tarball as root in order to create the
device nodes and get the permissions right on stuff like /etc/passwd -
If you do that, you shouldn't need to do any additional chown.

 >> Does it work with nfs over tcp? E.G. nfsroot=<ip>:<path>,tcp

 Guillaume> Same thing.

Ok.

 >> Does init=/bin/date or init=/bin/sh work?

 Guillaume> Slightly different result:
 Guillaume> [    4.423251] Freeing unused kernel memory: 76k init
 Guillaume> [    4.700870] Kernel panic - not syncing: Attempted to kill init!
 Guillaume> [    4.705622] Rebooting in 180 seconds..

Ahh, so probably date gets to run just fine, but you just don't see
any output.

Do you have a /dev/ttyUL0 device node (c 204 187)? Are you running a
getty on it? (A ttyUL0::respawn:/sbin/getty -L ttyUL0 115200 vt100
line in /etc/inittab)

-- 
Bye, Peter Korsgaard
