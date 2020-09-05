From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Sep 2020 09:35:28 +0200
Subject: [Buildroot] [git commit] package/libnss: install certutil tool on
 target
Message-ID: <20200905072727.7013185DF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d27b5c7b7214608c8f9c54b2723dac4422d41948
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

certutil is a command-line utility for managing keys and certificate in
both NSS databases and other NSS tokens.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnss/libnss.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index f28e16a406..d0b2d51772 100644
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
