From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 29 Jan 2012 16:11:47 +0100
Subject: [Buildroot] [RFC 14/15] foobar: create a fake proprietary package
	(testing only)
In-Reply-To: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1327849908-15588-15-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is only for testing the proprietary package handling, not to be
committed in any serious repository.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/Config.in              |    1 +
 package/foobar/Config.in       |    5 +++++
 package/foobar/foobar.mk       |   13 +++++++++++++
 package/foobar/source/foobar.c |    7 +++++++
 4 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/foobar/Config.in
 create mode 100644 package/foobar/foobar.mk
 create mode 100644 package/foobar/source/foobar.c

diff --git a/package/Config.in b/package/Config.in
index 65c2a98..d310f9d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -409,6 +409,7 @@ endmenu
 
 menu "Miscellaneous"
 source "package/shared-mime-info/Config.in"
+source "package/foobar/Config.in"
 endmenu
 
 menu "Networking applications"
diff --git a/package/foobar/Config.in b/package/foobar/Config.in
new file mode 100644
index 0000000..c88da26
--- /dev/null
+++ b/package/foobar/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_FOOBAR
+	bool "foobar"
+	default y
+	help
+	  Fake propritary package
diff --git a/package/foobar/foobar.mk b/package/foobar/foobar.mk
new file mode 100644
index 0000000..e2394f8
--- /dev/null
+++ b/package/foobar/foobar.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# foobar - just a dummy, fake proprietary package
+#
+#############################################################
+
+FOOBAR_VERSION = 1.2.3.4
+FOOBAR_SOURCE = foobar-$(FOOBAR_VERSION).tar.bz2
+FOOBAR_SITE = package/foobar/source
+FOOBAR_SITE_METHOD = local
+FOOBAR_LICENSE = PROPRIETARY
+
+$(eval $(call GENTARGETS))
diff --git a/package/foobar/source/foobar.c b/package/foobar/source/foobar.c
new file mode 100644
index 0000000..2c375ef
--- /dev/null
+++ b/package/foobar/source/foobar.c
@@ -0,0 +1,7 @@
+#include <stdlib.h>
+
+int main(void)
+{
+  printf("Hello, World!\n");
+  return 0;
+}
-- 
1.7.5.4
