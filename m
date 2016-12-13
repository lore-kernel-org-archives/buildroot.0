From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 12 Dec 2016 22:21:07 -0600
Subject: [Buildroot] [PATCH 1/2] policycoreutils: CPPFLAGS undefine
	_FILE_OFFSET_BITS
Message-ID: <1481602868-46581-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
large file support.

Similar action was taken previously for CFLAGS.

Resolves:
http://autobuild.buildroot.net/results/4cb/4cb70d776bee01f1284e0c0be5b3fb5f1011353a/
http://autobuild.buildroot.net/results/f43/f438149e7d83475d425e1c1f17550f3cf5f69340/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/policycoreutils/policycoreutils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index b43569f..c9f9ebc 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -36,6 +36,7 @@ endif
 POLICYCOREUTILS_MAKE_OPTS += \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
+	CPPFLAGS="$(TARGET_CPPFLAGS) -U_FILE_OFFSET_BITS" \
 	ARCH="$(BR2_ARCH)"
 
 POLICYCOREUTILS_MAKE_DIRS = \
@@ -74,6 +75,7 @@ HOST_POLICYCOREUTILS_DEPENDENCIES = \
 HOST_POLICYCOREUTILS_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	CFLAGS="$(HOST_CFLAGS) -U_FILE_OFFSET_BITS" \
+	CPPFLAGS="$(HOST_CPPFLAGS) -U_FILE_OFFSET_BITS" \
 	PYTHON="$(HOST_DIR)/usr/bin/python" \
 	PYTHON_INSTALL_ARGS="$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)" \
 	ARCH="$(HOSTARCH)"
-- 
1.9.1
