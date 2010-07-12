From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 12 Jul 2010 23:30:52 +0200
Subject: [Buildroot] [PATCH 5/5] FOR TESTING ONLY: Add a GIT-downloaded test
	package
In-Reply-To: <1278970252-23007-1-git-send-email-luca@lucaceresoli.net>
References: <1278970252-23007-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1278970252-23007-6-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/Config.in          |    2 ++
 package/testpkg/Config.in  |    2 ++
 package/testpkg/testpkg.mk |    7 +++++++
 3 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 package/testpkg/Config.in
 create mode 100644 package/testpkg/testpkg.mk

diff --git a/package/Config.in b/package/Config.in
index eba21da..8b7eda2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -486,4 +486,6 @@ source "package/vim/Config.in"
 endif
 endmenu
 
+source "package/testpkg/Config.in"
+
 endmenu
diff --git a/package/testpkg/Config.in b/package/testpkg/Config.in
new file mode 100644
index 0000000..0802012
--- /dev/null
+++ b/package/testpkg/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_TESTPKG
+	bool "testpkg"
diff --git a/package/testpkg/testpkg.mk b/package/testpkg/testpkg.mk
new file mode 100644
index 0000000..cc1e0f3
--- /dev/null
+++ b/package/testpkg/testpkg.mk
@@ -0,0 +1,7 @@
+# This is a fake package: it only downloads sources.
+
+TESTPKG_SITE=git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/tracker.git
+TESTPKG_VERSION=7f220f1ea
+# TESTPKG_VERSION can also be a tag name.
+
+$(eval $(call GENTARGETS,package,testpkg))
-- 
1.7.0.4
