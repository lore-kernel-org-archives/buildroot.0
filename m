From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Apr 2011 23:13:56 +0200
Subject: [Buildroot] Strange behaviour with cramfs
In-Reply-To: <4DA2B71A.3090407@michaelburghart.de> (Michael Burghart's message
	of "Mon, 11 Apr 2011 10:08:58 +0200")
References: <4DA2B71A.3090407@michaelburghart.de>
Message-ID: <87zknbwg6j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Burghart <mb@michaelburghart.de> writes:

 Michael> Hi,

 Michael> as I need to be able to replace the rootfs regularly I decided
 Michael> to build it as a cramfs (if there is a better option, please
 Michael> let me know).

I would strongly suggest you had a look at squashfs instead. It is
conceptually the same as cramfs, but with better compression and without
some of the limitations of cramfs.

It's more than 5 years ago since I last used cramfs, but it should work
as well though.

 Michael> Unfortunately it does not work. The cramfs gets loaded and the kernel
 Michael> tells me:

 Michael> [    2.883952] VFS: Mounted root (cramfs filesystem) readonly on device
 Michael> 1:0.

 Michael> which is ok.
 Michael> But then:

 Michael> can't open /dev/proc: No such file or directory

/dev/proc? that sounds odd.

 Michael> and so on on end.. what did I forget to include?! Anybody experienced
 Michael> this before?

Could you post your buildroot .config (or even better defconfig which
you get by running make savedefconfig). Do you have the possibility for
boot over nfs? If so, you could try the same build (use the tarball
output format) though nfs.

-- 
Bye, Peter Korsgaard
