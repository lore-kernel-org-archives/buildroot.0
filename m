From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 12:18:29 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/rpcbind: Do not
	mark .service and .socket files executable
Message-ID: <20170906112607.30B6C819CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3df894d83cc1f1822a320f1676a879e8814d3964
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Do not mark .service and .socket files executable, otherwise systemd
will give us a warning about it.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 3a41c96a25a267db77455a668dd4c673a2a6fc39)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpcbind/rpcbind.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 4360d1f..f8f8c41 100644
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
