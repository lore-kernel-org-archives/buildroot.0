From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 May 2012 10:01:35 +0200
Subject: [Buildroot] [git commit] Added the empty package
Message-ID: <20120506080204.715C996A3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4ee7179e692bdded8b98c54dd484b17098c695d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/empty/Config.in |    6 ++++++
 package/empty/empty.mk  |   18 ++++++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 94d0fb4..90b8e19 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -468,6 +468,7 @@ endmenu
 endmenu
 
 menu "Miscellaneous"
+source "package/empty/Config.in"
 source "package/shared-mime-info/Config.in"
 endmenu
 
diff --git a/package/empty/Config.in b/package/empty/Config.in
new file mode 100644
index 0000000..67b09fc
--- /dev/null
+++ b/package/empty/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_EMPTY
+	bool "empty"
+	help
+	  Run processes and applications under pseudo-terminal (PTY) sessions.
+
+	  http://empty.sourceforge.net/
diff --git a/package/empty/empty.mk b/package/empty/empty.mk
new file mode 100644
index 0000000..137e196
--- /dev/null
+++ b/package/empty/empty.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# empty
+#
+#############################################################
+EMPTY_VERSION = 0.6.18b
+EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
+EMPTY_SITE = http://downloads.sourceforge.net/project/empty/empty/empty-$(EMPTY_VERSION)
+
+define EMPTY_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+endef
+
+define EMPTY_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/empty $(TARGET_DIR)/usr/bin/empty
+endef
+
+$(eval $(call GENTARGETS))
