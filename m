From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 15 Jun 2014 15:05:16 +0200
Subject: [Buildroot] [PATCH 1/1] prevent selecting portmap when rpcbind is
	selected.
Message-ID: <1402837516-6202-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

portmap and rpcbind must not be selected at the same time.
Users should use rpcbind in favor of the deprecated portmap. 

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/portmap/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/portmap/Config.in b/package/portmap/Config.in
index fa7eaf1..f17d9aa 100644
--- a/package/portmap/Config.in
+++ b/package/portmap/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PORTMAP
 	bool "portmap"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on !BR2_PACKAGE_RPCBIND
 	help
 	  The standard portmapper for RPC services.
 
-- 
2.0.0
