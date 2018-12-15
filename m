From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Dec 2018 09:48:46 +0100
Subject: [Buildroot] [PATCH 1/1] csky_gx6605s_defconfig: bump gcc to
 6.3.0, kernel to 4.9.56
In-Reply-To: <20181211224312.25814-1-juju@cotds.org> (Julien Olivain's message
 of "Tue, 11 Dec 2018 23:43:12 +0100")
References: <20181211224312.25814-1-juju@cotds.org>
Message-ID: <878t0rch01.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Olivain <juju@cotds.org> writes:

 > Signed-off-by: Julien Olivain <juju@cotds.org>
 > ---
 >  ...ine-for-serial-console-and-rootfs-on.patch | 25 +++++++++++++++++++
 >  configs/csky_gx6605s_defconfig                |  7 +++---
 >  2 files changed, 29 insertions(+), 3 deletions(-)
 >  create mode 100644
 > board/csky/gx6605s/patches/linux/0001-csky-update-cmdline-for-serial-console-and-rootfs-on.patch

 > diff --git
 > a/board/csky/gx6605s/patches/linux/0001-csky-update-cmdline-for-serial-console-and-rootfs-on.patch
 > b/board/csky/gx6605s/patches/linux/0001-csky-update-cmdline-for-serial-console-and-rootfs-on.patch
 > new file mode 100644
 > index 0000000000..1da1a75400
 > --- /dev/null
 > +++ b/board/csky/gx6605s/patches/linux/0001-csky-update-cmdline-for-serial-console-and-rootfs-on.patch
 > @@ -0,0 +1,25 @@
 > +From 7e3f2c482bc16537a093e87a27f0d465804a88e4 Mon Sep 17 00:00:00 2001
 > +From: Julien Olivain <juju@cotds.org>
 > +Date: Tue, 11 Dec 2018 23:04:46 +0100
 > +Subject: [PATCH] csky: update cmdline for serial console and rootfs on sda1
 > +
 > +Signed-off-by: Julien Olivain <juju@cotds.org>
 > +---
 > + arch/csky/boot/dts/gx6605s.dts | 2 +-
 > + 1 file changed, 1 insertion(+), 1 deletion(-)
 > +
 > +diff --git a/arch/csky/boot/dts/gx6605s.dts b/arch/csky/boot/dts/gx6605s.dts
 > +index ce56106af967..f5d60b21e6f9 100644
 > +--- a/arch/csky/boot/dts/gx6605s.dts
 > ++++ b/arch/csky/boot/dts/gx6605s.dts
 > +@@ -155,6 +155,6 @@
 > + 	};
 > + 
 > + 	chosen {
 > +-		bootargs = "console=tty0 init=/sbin/init root=/dev/sda2 rw rootwait";
 > ++		bootargs = "console=ttyS0,115200 init=/sbin/init root=/dev/sda1 rw rootwait";

Please add something in the commit message explaining why this is
needed? Is this related to the kernel bump? Are these bootargs not
handled by the bootloader?

-- 
Bye, Peter Korsgaard
