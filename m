From: Ming-Ching Tiew <mingching.tiew@redtone.com>
Date: Thu, 24 Jan 2008 17:30:37 +0800
Subject: [Buildroot] sstrip and segmentation violation ( was: can't develope
	any programs using ssl in the root )
References: <479802C7.9090108@redtone.com><00c401c85e2a$9de7f140$8119fea9@MingChing>
	<20080124082818.GA1078@zelow.no>
Message-ID: <047901c85e6b$c7237340$8119fea9@MingChing>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


From: "Thomas Lundquist" <lists@zelow.no>
> 
> > BTW, the sstrip thingie looks to me also a bug. It happens to not
> > just SSL shared library. The uClibc libraries could also be
> > sstripped. This will be quite disasterous.
> 
> Not unless you want to build within the buildroot. I do sstrip on all
> libraries on the resulting rootfs (floppyfw and others) but you are
> probably right about sstripping when you have
> CONFIG_BR2_PACKAGE_GCC_TARGET set.
> 
> When building the floppyfw devkit I also set CONFIG_BR2_STRIP_none.
> 
> I would consider it a but if any of the packages .mk files 
> does strip anything even when CONFIG_BR2_STRIP_none is set.
> 
> Bbut stripping the libraries when the target is a normal rootfs seems
> correct to me.
> 

Oh I see. This buildroot thingie is rather new to me, so I am gaining
experience on it.

So it not quite a bug then, it is an not-so-obvious feature which
one can tumble on it. :-)

Last but not least, I seem to only get all the wrong things with me now. 
I managed to compile the rootfs.i686.ext2, using a few different 
combinations of gcc ( 3.4.6, 4.1.0, 4.2.0 ), uclibc version ( 0.9.28.3
and 0.9.29 ). But consistantly I get random segmentation violation 
error when I compile stuff inside the rootfs. Looks like stack 
corruption or something. Now perhaps I need to change my host 
OS compiler instead ( I am using 4.1.2 20061028 ). 

Anyone knows if the host compiler version will have an impact 
on the quality of the rootfs ?

Regards.
