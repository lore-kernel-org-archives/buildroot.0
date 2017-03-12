From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Mar 2017 10:58:17 +0100
Subject: [Buildroot] [PATCH 3/4] package/nbd: add option for the trdump
	utility
In-Reply-To: <cover.1489312674.git.yann.morin.1998@free.fr>
References: <cover.1489312674.git.yann.morin.1998@free.fr>
Message-ID: <8587b0bad840de82be0fb95a983ae17c17d9b97f.1489312674.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/nbd/Config.in | 9 +++++++--
 package/nbd/nbd.mk    | 3 +++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/nbd/Config.in b/package/nbd/Config.in
index b00bc40..afe8ad4 100644
--- a/package/nbd/Config.in
+++ b/package/nbd/Config.in
@@ -16,12 +16,17 @@ config BR2_PACKAGE_NBD_CLIENT
 	bool "nbd client"
 	default y
 	help
-	  the client part of NBD.
+	  The client part of NBD.
 
 config BR2_PACKAGE_NBD_SERVER
 	bool "nbd server"
 	help
-	  the server part of NBD.
+	  The server part of NBD.
+
+config BR2_PACKAGE_NBD_TRDUMP
+	bool "nbd trdump"
+	help
+	  Utility to dump server logs in human-readable form.
 
 endif
 
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 92660c2..42200ee 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -24,6 +24,9 @@ endif
 ifneq ($(BR2_PACKAGE_NBD_SERVER),y)
 NBD_TOREMOVE += /usr/bin/nbd-server
 endif
+ifneq ($(BR2_PACKAGE_NBD_TRDUMP),y)
+NBD_TOREMOVE += /usr/bin/nbd-trdump
+endif
 
 define NBD_CLEANUP_AFTER_INSTALL
 	rm -f $(addprefix $(TARGET_DIR), $(NBD_TOREMOVE))
-- 
2.7.4
