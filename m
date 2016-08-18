From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 18 Aug 2016 23:54:37 +0530
Subject: [Buildroot] [PATCH 1/2] libconfuse: add optional dependency on
	gettext
Message-ID: <1471544678-12514-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/libconfuse/Config.in     | 1 +
 package/libconfuse/libconfuse.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/libconfuse/Config.in b/package/libconfuse/Config.in
index be18cbb..7dedd83 100644
--- a/package/libconfuse/Config.in
+++ b/package/libconfuse/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBCONFUSE
 	bool "libconfuse"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  LibConfuse is a configuration file parser library written in
 	  C. It supports sections and (lists of) values (strings,
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index fea90f1..e289798 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -14,5 +14,9 @@ HOST_LIBCONFUSE_DEPENDENCIES = host-flex
 LIBCONFUSE_LICENSE = ISC
 LIBCONFUSE_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+LIBCONFUSE_DEPENDENCIES += gettext
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.6.2
