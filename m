From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Mar 2015 12:40:19 +0100
Subject: [Buildroot] [PATCH 2/5] libnl: add patch to add Libs.private in
	libnl-3.0.pc
In-Reply-To: <1425728422-14113-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425728422-14113-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1425728422-14113-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Having a properly defined Libs.private field allows to make sure
static linking against libnl-3.0 works fine, at least as long as
pkg-config is used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ibs.private-field-in-libnl-pkg-config-fil.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/libnl/0002-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch

diff --git a/package/libnl/0002-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch b/package/libnl/0002-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch
new file mode 100644
index 0000000..845a593
--- /dev/null
+++ b/package/libnl/0002-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch
@@ -0,0 +1,30 @@
+From db0d59cd06f3ffd350379847c0885e1bfb85af0f Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 7 Mar 2015 11:34:42 +0100
+Subject: [PATCH 2/2] build: add Libs.private field in libnl pkg-config file
+
+In order to support static linking, the libnl pkg-config file should
+indicate in its Libs.private field the libraries that libnl-3.0.a
+requires. The LIBS variable contains the appropriate list of
+libraries: -lm in all cases, and -lpthread when pthread support is
+enabled. This allows to statically link applications against libnl
+properly.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libnl-3.0.pc.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libnl-3.0.pc.in b/libnl-3.0.pc.in
+index b87e3dc..ddbc999 100644
+--- a/libnl-3.0.pc.in
++++ b/libnl-3.0.pc.in
+@@ -7,4 +7,5 @@ Name: libnl
+ Description: Convenience library for netlink sockets
+ Version: @PACKAGE_VERSION@
+ Libs: -L${libdir} -lnl- at MAJ_VERSION@
++Libs.private: @LIBS@
+ Cflags: -I${includedir}/libnl at MAJ_VERSION@
+-- 
+2.1.0
+
-- 
2.1.0
