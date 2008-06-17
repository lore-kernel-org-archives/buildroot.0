From: hartleys <hartleys@visionengravers.com>
Date: Tue, 17 Jun 2008 13:41:02 -0400
Subject: [Buildroot] Problem with buildroot and external toolchain
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909182568@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Sorry if this is sent to the wrong list.

I am trying to use buildroot with an external toolchain. I was able to
get everything setup and the Linux zImage and root filesystem are both
built. But when the kernel boots I get a kernel panic no init found.

I think I worked the problem down to the external toolchain libraries
not getting copied to the root filesystem. The copy_toolchain_lib_root
in ext-tool.mk does locate the libraries to copy but I don't get the
messages about the libraries being copied.

The only thing I can figure is the find in:

	for FILE in `find $${LIB_DIR} -maxdepth 1 -type l -name
"$${LIB}*"`; do { \

Is failing for some reason. Can anyone please offer any help on this?

Thanks,
Hartley
