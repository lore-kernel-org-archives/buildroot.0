From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 14 Oct 2019 19:20:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/policycoreutils: fix build with NLS
Message-ID: <20191014172029.21109-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/43b5580fa9f26eac71afa9f3cca413f2791c054d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/policycoreutils/policycoreutils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 9114b152eb..6cd5a019c5 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -9,7 +9,8 @@ POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/downlo
 POLICYCOREUTILS_LICENSE = GPL-2.0
 POLICYCOREUTILS_LICENSE_FILES = COPYING
 
-POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng
+POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(TARGET_NLS_DEPENDENCIES)
+POLICYCOREUTILS_MAKE_OPTS = LDLIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 POLICYCOREUTILS_DEPENDENCIES += linux-pam
-- 
2.23.0
