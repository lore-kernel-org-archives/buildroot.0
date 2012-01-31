From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 31 Jan 2012 10:21:38 +0100
Subject: [Buildroot] [PATCH v2] New package: libical
Message-ID: <1328001698-11348-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: use $(BR2_SOURCEFORGE_MIRROR) (Arnout Vandecappelle)

 package/Config.in          |    1 +
 package/libical/Config.in  |   11 +++++++++++
 package/libical/libical.mk |   12 ++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/libical/Config.in
 create mode 100644 package/libical/libical.mk

diff --git a/package/Config.in b/package/Config.in
index c74c08b..4ceb7b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -372,6 +372,7 @@ source "package/libevent/Config.in"
 source "package/libev/Config.in"
 source "package/libffi/Config.in"
 source "package/libglib2/Config.in"
+source "package/libical/Config.in"
 source "package/libnspr/Config.in"
 source "package/libsigc/Config.in"
 source "package/orc/Config.in"
diff --git a/package/libical/Config.in b/package/libical/Config.in
new file mode 100644
index 0000000..12abdb2
--- /dev/null
+++ b/package/libical/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBICAL
+	bool "libical"
+	depends on BR2_USE_WCHAR
+	help
+	  libical is an Open Source (MPL/LGPL) implementation of the IETF's 
+	  iCalendar Calendaring and Scheduling protocols.
+
+	  http://www.citadel.org/doku.php/documentation:featured_projects:libical
+
+comment "libical requires a toolchain with WCHAR support"
+	depends on !(BR2_USE_WCHAR)
diff --git a/package/libical/libical.mk b/package/libical/libical.mk
new file mode 100644
index 0000000..ee251eb
--- /dev/null
+++ b/package/libical/libical.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# libical
+#
+#############################################################
+
+LIBICAL_VERSION = 0.48
+LIBICAL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/freeassociation/libical/libical-$(LIBICAL_VERSION)
+LIBICAL_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
+
-- 
1.7.1.1
