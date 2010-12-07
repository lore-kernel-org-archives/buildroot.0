From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Dec 2010 22:56:56 +0100
Subject: [Buildroot] [git commit master 1/1] lsuio: new UIO helper package
Message-ID: <20101207215804.5C1278E11D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=95f17bf78f94a69858ebe9a7a64a5b9cce76eedb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                 |    2 ++
 package/Config.in       |    1 +
 package/lsuio/Config.in |    6 ++++++
 package/lsuio/lsuio.mk  |   11 +++++++++++
 4 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/lsuio/Config.in
 create mode 100644 package/lsuio/lsuio.mk

diff --git a/CHANGES b/CHANGES
index b3cf6ae..9333e3f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,6 +2,8 @@
 
 	Updated/fixed packages: cloop, m4, openssh, xz
 
+	New packages: lsuio
+
 2010.11, Released November 30th, 2010:
 
 	Fixes all over the tree.
diff --git a/package/Config.in b/package/Config.in
index 03e580a..08ffda6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -175,6 +175,7 @@ source "package/input-tools/Config.in"
 source "package/iostat/Config.in"
 source "package/kbd/Config.in"
 source "package/lm-sensors/Config.in"
+source "package/lsuio/Config.in"
 source "package/lvm2/Config.in"
 source "package/makedevs/Config.in"
 source "package/mdadm/Config.in"
diff --git a/package/lsuio/Config.in b/package/lsuio/Config.in
new file mode 100644
index 0000000..675a318
--- /dev/null
+++ b/package/lsuio/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LSUIO
+	bool "lsuio"
+	help
+	  list available userspace I/O (UIO) devices
+
+	  http://www.osadl.org/UIO.uio.0.html
diff --git a/package/lsuio/lsuio.mk b/package/lsuio/lsuio.mk
new file mode 100644
index 0000000..2a867b7
--- /dev/null
+++ b/package/lsuio/lsuio.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# lsuio
+#
+#############################################################
+
+LSUIO_VERSION = 0.2.0
+LSUIO_SOURCE = lsuio-$(LSUIO_VERSION).tar.gz
+LSUIO_SITE = http://www.osadl.org/projects/downloads/UIO/user
+
+$(eval $(call AUTOTARGETS,package,lsuio))
-- 
1.7.2.2
