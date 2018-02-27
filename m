From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Feb 2018 22:22:14 +0100
Subject: [Buildroot] [git commit] bind: use BIND_PKGDIR vairable
Message-ID: <20180305200718.DE77281199@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=716cfa6744b542a25a969088c73ad66dffbf6fcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the BIND_PKGDIR variable instead of package/bind.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bind/bind.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index bec902079c..392ef321c2 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -93,11 +93,11 @@ endef
 
 ifeq ($(BR2_PACKAGE_BIND_SERVER),y)
 define BIND_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/bind/S81named \
+	$(INSTALL) -m 0755 -D $(BIND_PKGDIR)/S81named \
 		$(TARGET_DIR)/etc/init.d/S81named
 endef
 define BIND_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/bind/named.service \
+	$(INSTALL) -D -m 644 $(BIND_PKGDIR)/named.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/named.service
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
