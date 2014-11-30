From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:18:13 +0100
Subject: [Buildroot] [PATCHv3 25/74] tinyhttpd: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417357142-14307-26-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tinyhttpd/tinyhttpd.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index ec47fd9..0934b71 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -16,9 +16,12 @@ endef
 
 define TINYHTTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/httpd $(TARGET_DIR)/usr/sbin/tinyhttpd
+	mkdir -p $(TARGET_DIR)/var/www
+endef
+
+define TINYHTTPD_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/tinyhttpd/S85tinyhttpd \
 		$(TARGET_DIR)/etc/init.d/S85tinyhttpd
-	mkdir -p $(TARGET_DIR)/var/www
 endef
 
 $(eval $(generic-package))
-- 
2.1.0
