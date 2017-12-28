From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 28 Dec 2017 16:51:44 +0100
Subject: [Buildroot] [PATCH v9 6/8] libhttpparser: add host variant
In-Reply-To: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
Message-ID: <20171228155146.18193-7-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow build of host variant of libhttpparser.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
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
-- 
2.14.3
