From: Julien Floret <julien.floret@6wind.com>
Date: Fri,  4 Sep 2020 13:35:01 +0200
Subject: [Buildroot] [PATCH] package/libnss: install certutil tool on target
Message-ID: <20200904113501.22230-1-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

certutil is a command-line utility for managing keys and certificate in
both NSS databases and other NSS tokens.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/libnss/libnss.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index f28e16a40670..d0b2d51772bd 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -105,6 +105,8 @@ define LIBNSS_INSTALL_TARGET_CMDS
 		$(@D)/$(LIBNSS_DISTDIR)/lib/*.a
 	$(INSTALL) -D -m 0644 $(TOPDIR)/package/libnss/nss.pc.in \
 		$(TARGET_DIR)/usr/lib/pkgconfig/nss.pc
+	$(INSTALL) -D -m 755 $(@D)/$(LIBNSS_DISTDIR)/bin/certutil \
+		$(TARGET_DIR)/usr/bin/certutil
 	$(SED) 's/@VERSION@/$(LIBNSS_VERSION)/g;' \
 		$(TARGET_DIR)/usr/lib/pkgconfig/nss.pc
 endef
-- 
2.25.1
