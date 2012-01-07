From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 7 Jan 2012 20:42:22 +0100
Subject: [Buildroot] [git commit] xenomai: restrict to the set of supported
	architectures
Message-ID: <20120107201230.6B5BE9000C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d472bb50ce83d02bba28df6557b65efc2e0db48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.ext.in       |    2 ++
 package/xenomai/Config.in |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 8a9f87e..b304efd 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -3,6 +3,8 @@ menu "Linux Kernel Extensions"
 # Xenomai
 config BR2_LINUX_KERNEL_EXT_XENOMAI
 	bool "Adeos/Xenomai Real-time patch"
+	depends on BR2_i386 || BR2_x86_64 || BR2_arm || \
+		   BR2_bfin || BR2_powerpc || BR2_sh4
 	select BR2_PACKAGE_XENOMAI
 	help
 	  Xenomai Kernel part.
diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 98ebf0a..ecab23e 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XENOMAI
 	bool "Xenomai Userspace"
+	depends on BR2_i386 || BR2_x86_64 || BR2_arm || \
+		   BR2_bfin || BR2_powerpc || BR2_sh4
 	help
 	  Real-Time Framework for Linux
 	  http://www.xenomai.org
