From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:57:15 +0100
Subject: [Buildroot] [PATCHv2 57/74] rpcbind: install init script
	unconditionally
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-58-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpcbind/rpcbind.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index b7c2261..55de3fc 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -17,9 +17,8 @@ RPCBIND_DEPENDENCIES += libtirpc
 RPCBIND_CONF_OPTS += --with-rpcuser=root
 
 define RPCBIND_INSTALL_INIT_SYSV
-	[ -f $(TARGET_DIR)/etc/init.d/S30rpcbind ] || \
-		$(INSTALL) -m 0755 -D package/rpcbind/S30rpcbind \
-			$(TARGET_DIR)/etc/init.d/S30rpcbind
+	$(INSTALL) -m 0755 -D package/rpcbind/S30rpcbind \
+		$(TARGET_DIR)/etc/init.d/S30rpcbind
 endef
 
 $(eval $(autotools-package))
-- 
2.1.0
