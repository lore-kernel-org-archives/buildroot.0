From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  3 Feb 2020 21:52:55 +0100
Subject: [Buildroot] [PATCH 1/2] package/haproxy: install only binary
Message-ID: <20200203205256.2508469-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use install-bin instead of install target to avoid installing doc and
man pages

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haproxy/haproxy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 9f6f2818ae..88247d8e63 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -82,7 +82,7 @@ endef
 
 define HAPROXY_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		$(HAPROXY_MAKE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) install
+		$(HAPROXY_MAKE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) install-bin
 endef
 
 $(eval $(generic-package))
-- 
2.24.1
