From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jun 2010 11:11:26 +0200
Subject: [Buildroot] [PATCH 07/46] u-boot: remove option to
 configuredownload site
In-Reply-To: <000001cb054a$04f5af80$0ee10e80$@pauljones.id.au>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<fd8347fd9ea408c4150f9358521a5dfceca92bc4.1275343447.git.thomas.petazzoni@free-electrons.com>
	<002101cb0223$38af8910$aa0e9b30$@pauljones.id.au>
	<20100604103232.3f415c39@surf> <20100605154934.6ebd9068@surf>
	<000001cb054a$04f5af80$0ee10e80$@pauljones.id.au>
Message-ID: <20100607111126.62495aac@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 6 Jun 2010 17:29:35 +1000
"Paul Jones" <paul@pauljones.id.au> wrote:

> > http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=bootloaders-
> > cleanup&id=13ef908685caecd17ba67953fd1fee8a559231a2
> 
> That is perfect! Thanks. Tested and working.

Great! Nice to see that developers are testing these new features :-)

> There seems to be a bug in your bootloaders-cleanup branch somewhere.
> If I do a make distclean and then configure the kernel to be built into a
> uImage I get the following error:
> (have attached .config)

Yeah, got it. Will fix it later today.

The thing is that on top of my bootloaders-cleanup branch, I've written
a linux-cleanup branch
(http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=linux-cleanup)
which cleanups/simplifies the code to compile the Linux kernel. And in
this branch, the dependency of uImage on mkimage is handled properly
(because I tested the kernel build with linux-cleanup over
bootloaders-cleanup).

However, I forgot to test the kernel build with just
bootloaders-cleanup, and therefore forgot to fix the mkimage
dependency. I'll do this so that the bootloaders-cleanup branch can be
merged alone, without linux-cleanup and without breaking uImage builds.

Thanks again a lot for your tests,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
