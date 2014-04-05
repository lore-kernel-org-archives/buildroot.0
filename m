From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 19:21:14 +0200
Subject: [Buildroot] [git commit] package/udev: convert to the
	virtual-package infrastructure
Message-ID: <20140405172339.4C7B69C5BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7397f45782abd3249bbb7786076c4ee58b29e9b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Mike Zick <minimod@morethan.org>
[eric.le.bihan.dev at free.fr: tested with both systemd and eudev, on QEMU x86]
Tested-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/udev/udev.mk |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index f5eeeb4..cc4a6e3 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -4,13 +4,4 @@
 #
 ################################################################################
 
-UDEV_SOURCE =
-UDEV_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_UDEV))
-
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-ifeq ($(UDEV_DEPENDENCIES),)
-$(error No Udev implementation selected. Configuration error)
-endif
-endif
-
-$(eval $(generic-package))
+$(eval $(virtual-package))
