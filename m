From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 11:24:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/iucode-tool: bump version to 1.5
Message-ID: <1454149489-1093-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream changed to gitlab.com
Added hash
Upstream tarballs contains a working configure script, therefore remove
autoreconf.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/iucode-tool/Config.in        | 2 +-
 package/iucode-tool/iucode-tool.hash | 2 ++
 package/iucode-tool/iucode-tool.mk   | 6 +++---
 3 files changed, 6 insertions(+), 4 deletions(-)
 create mode 100644 package/iucode-tool/iucode-tool.hash

diff --git a/package/iucode-tool/Config.in b/package/iucode-tool/Config.in
index aeb3b6e..d81dabb 100644
--- a/package/iucode-tool/Config.in
+++ b/package/iucode-tool/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_IUCODE_TOOL
 	help
 	  Intel processor microcode tool
 
-	  https://gitorious.org/iucode-tool
+	  https://gitlab.com/iucode-tool
diff --git a/package/iucode-tool/iucode-tool.hash b/package/iucode-tool/iucode-tool.hash
new file mode 100644
index 0000000..c1f3bef
--- /dev/null
+++ b/package/iucode-tool/iucode-tool.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	33271652032f20f866a212bc98ea01a8db65c4ac839fa820aa23da974fd6ff62	iucode-tool_1.5.tar.xz
diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index 30515f0..cee0572 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-IUCODE_TOOL_VERSION = 1cbd73013cd4c6b2b287f07f6189eef35cb83ca0
-IUCODE_TOOL_SITE = git://gitorious.org/iucode-tool/iucode-tool.git
+IUCODE_TOOL_VERSION = 1.5
+IUCODE_TOOL_SOURCE = iucode-tool_$(IUCODE_TOOL_VERSION).tar.xz
+IUCODE_TOOL_SITE = https://gitlab.com/iucode-tool/releases/raw/latest
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 IUCODE_TOOL_CONF_ENV = LIBS="-largp"
 IUCODE_TOOL_DEPENDENCIES = argp-standalone
 endif
-IUCODE_TOOL_AUTORECONF = YES
 IUCODE_TOOL_LICENSE = GPLv2+
 IUCODE_TOOL_LICENSE_FILES = COPYING
 
-- 
2.7.0.rc3
