From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Mar 2013 23:01:32 +0100
Subject: [Buildroot] [git commit] package/e2fsprogs: add host-package
	selection
Message-ID: <20130318221419.9100B9B173@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=59d1fe58fac77ae6d4e574719b48475c8030ed07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the e2fsprogs as a host-package selection in the menuconfig.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in.host           |    1 +
 package/e2fsprogs/Config.in.host |    6 ++++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 79050f2..8813f5b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,6 +1,7 @@
 menu "Host utilities"
 
 source "package/dfu-util/Config.in.host"
+source "package/e2fsprogs/Config.in.host"
 source "package/lpc3250loader/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
diff --git a/package/e2fsprogs/Config.in.host b/package/e2fsprogs/Config.in.host
new file mode 100644
index 0000000..ea6a0bd
--- /dev/null
+++ b/package/e2fsprogs/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_E2FSPROGS
+	bool "host e2fsprogs"
+	help
+	  The EXT2 file system utilities.
+	  
+	  http://e2fsprogs.sf.net
