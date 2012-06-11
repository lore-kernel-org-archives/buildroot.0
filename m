From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 11 Jun 2012 11:53:08 +0200
Subject: [Buildroot] [git commit] synergy: Remove -Werror from CXXFLAGS
Message-ID: <20120611095337.647BF96ECD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a65b7d93662c9c801af777528561e488389d592
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/synergy/synergy-1.3.1-remove-werror.patch |   16 ++++++++++++++++
 package/synergy/synergy.mk                        |    2 ++
 2 files changed, 18 insertions(+), 0 deletions(-)

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
 
