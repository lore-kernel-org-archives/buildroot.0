From: Markos Chandras <markos.chandras@imgtec.com>
Date: Mon, 11 Jun 2012 10:35:19 +0100
Subject: [Buildroot] [PATCH v2] synergy: Remove -Werror from CXXFLAGS
Message-ID: <1339407319-4255-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/synergy/synergy-1.3.1-remove-werror.patch |   16 ++++++++++++++++
 package/synergy/synergy.mk                        |    2 ++
 2 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 package/synergy/synergy-1.3.1-remove-werror.patch

diff --git a/package/synergy/synergy-1.3.1-remove-werror.patch b/package/synergy/synergy-1.3.1-remove-werror.patch
new file mode 100644
index 0000000..31a8c2b
--- /dev/null
+++ b/package/synergy/synergy-1.3.1-remove-werror.patch
@@ -0,0 +1,16 @@
+Remove -Werror from CXXFLAGS
+
+Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+
+Index: synergy-1.3.1/configure.in
+===================================================================
+--- synergy-1.3.1.orig/configure.in
++++ synergy-1.3.1/configure.in
+@@ -239,7 +239,6 @@ dnl checks for system services
+ 
+ dnl enable maximum compiler warnings and warnings are errors.
+ ACX_CXX_WARNINGS
+-ACX_CXX_WARNINGS_ARE_ERRORS
+ 
+ dnl adjust compiler and linker variables
+ CXXFLAGS="$CXXFLAGS $SYNERGY_CXXFLAGS $ARCH_CFLAGS"
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index c86fb8b..890b82a 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -7,6 +7,8 @@
 SYNERGY_VERSION = 1.3.1
 SYNERGY_SOURCE = synergy-$(SYNERGY_VERSION).tar.gz
 SYNERGY_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/synergy2/
+
+SYNERGY_AUTORECONF = YES
 SYNERGY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
                    --x-libraries=$(STAGING_DIR)/usr/lib
 
-- 
1.7.1
