From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Aug 2017 23:12:40 +0200
Subject: [Buildroot] [git commit] package/rpcbind: Do not mark .service and
	.socket files executable
Message-ID: <20170824210539.C637481D38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a41c96a25a267db77455a668dd4c673a2a6fc39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not mark .service and .socket files executable, otherwise systemd
will give us a warning about it.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpcbind/rpcbind.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index cf2e81d..5c216af 100644
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
