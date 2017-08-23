From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 23 Aug 2017 16:44:14 -0700
Subject: [Buildroot] [PATCH] package/rpcbind: Do not mark .service and
	.socket files executable
Message-ID: <20170823234414.3326-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not mark .service and .socket files executable, otherwise systemd
will give us a warning about it.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/rpcbind/rpcbind.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index cf2e81dbbf..5c216afc93 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -22,9 +22,9 @@ RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=no
 endif
 
 define RPCBIND_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -m 0755 -D package/rpcbind/rpcbind.service \
+	$(INSTALL) -m 0644 -D package/rpcbind/rpcbind.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/rpcbind.service
-	$(INSTALL) -m 0755 -D package/rpcbind/rpcbind.socket \
+	$(INSTALL) -m 0644 -D package/rpcbind/rpcbind.socket \
 		$(TARGET_DIR)/usr/lib/systemd/system/rpcbind.socket
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/sockets.target.wants
 	ln -fs ../../../../usr/lib/systemd/system/rpcbind.socket \
-- 
2.13.5
