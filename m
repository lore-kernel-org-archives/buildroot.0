From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Jan 2016 22:00:51 +0100
Subject: [Buildroot] [git commit] package/sysdig: reorder select/depends
Message-ID: <20160101210136.AD922827CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ecd0a2b5626410a434cea70db2b0e7d9bea9fe07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From [1]:
"Even though the ordering has absolutely no consequences in Kconfig, it
is not logical (when reading). It is more logical and far easier to
understand when depends come first, followed by the selects."

Also, the Config.in exemple in the manual suggest to use this coding
style [2].

[1] http://lists.busybox.net/pipermail/buildroot/2015-October/142955.html
[2] http://buildroot.uclibc.org/downloads/manual/manual.html#writing-rules-config-in

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysdig/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index dc71d5f..151e75d 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_SYSDIG
 	bool "sysdig"
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_LUAJIT
-	select BR2_PACKAGE_JSONCPP
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_INSTALL_LIBSTDCPP # libjson
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS # luajit
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_JSONCPP
 	help
 	  Sysdig is open source, system-level exploration:
 	  capture system state and activity from a running Linux instance,
