From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Feb 2018 14:57:48 +0100
Subject: [Buildroot] [git commit] libhttpparser: add host variant
Message-ID: <20180205140233.72D0C865BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31847c297d412f1e97d51d6d1526d2bfab6031ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow build of host variant of libhttpparser.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libhttpparser/libhttpparser.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/libhttpparser/libhttpparser.mk b/package/libhttpparser/libhttpparser.mk
index 8ff0413322..1df26017e7 100644
--- a/package/libhttpparser/libhttpparser.mk
+++ b/package/libhttpparser/libhttpparser.mk
@@ -23,4 +23,13 @@ define LIBHTTPPARSER_INSTALL_TARGET_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) PREFIX=$(TARGET_DIR)/usr install
 endef
 
+define HOST_LIBHTTPPARSER_BUILD_CMDS
+	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) library package
+endef
+
+define HOST_LIBHTTPPARSER_INSTALL_CMDS
+	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) PREFIX=$(HOST_DIR)/usr install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
