From: Clark Rawlins <clark.rawlins@escient.com>
Date: Sat, 09 Jan 2010 13:00:20 -0500
Subject: [Buildroot] [PATCH 1/2] Support for a kernel-modules catagory
Message-ID: <1263060020.18571.8.camel@venture>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for a catagory of packages called
"Extra kernel modules" in menuconfig and a
new subdirectory similar to the "editors"
subdirectory to hold the kernel-modules packages.

Signed-off-by: Clark Rawlins <clark.rawlins@escient.com>
---
 package/Config.in                        |    3 +++
 package/kernel-modules/Config.in         |    3 +++
 package/kernel-modules/kernel-modules.mk |    1 +
 3 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 package/kernel-modules/Config.in
 create mode 100644 package/kernel-modules/kernel-modules.mk

diff --git a/package/Config.in b/package/Config.in
index 57a6a19..77f47db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -421,4 +421,7 @@ source "package/java/Config.in"
 # various games packages
 source "package/games/Config.in"
 
+# Out of tree kernel modules
+source "package/kernel-modules/Config.in"
+
 endmenu
diff --git a/package/kernel-modules/Config.in b/package/kernel-modules/Config.in
new file mode 100644
index 0000000..ddd27c3
--- /dev/null
+++ b/package/kernel-modules/Config.in
@@ -0,0 +1,3 @@
+menu "Extra Kernel Modules"
+source "package/kernel-modules/cdfs/Config.in"
+endmenu
diff --git a/package/kernel-modules/kernel-modules.mk b/package/kernel-modules/kernel-modules.mk
new file mode 100644
index 0000000..031e2f5
--- /dev/null
+++ b/package/kernel-modules/kernel-modules.mk
@@ -0,0 +1 @@
+include package/kernel-modules/*/*.mk
-- 
1.6.3.3
