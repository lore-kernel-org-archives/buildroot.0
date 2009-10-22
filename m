From: Hugues Hiegel <hugues@hiegel.fr>
Date: Thu, 22 Oct 2009 22:38:02 +0200
Subject: [Buildroot] [PATCH] package: netkitftp updates
Message-ID: <1256243882-10748-1-git-send-email-hugues@hiegel.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Hugues Hiegel <hugues.hiegel@openwide.fr>

---
 package/netkitftp/netkitftp.mk |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/netkitftp/netkitftp.mk b/package/netkitftp/netkitftp.mk
index 3cfdf21..3d9a078 100644
--- a/package/netkitftp/netkitftp.mk
+++ b/package/netkitftp/netkitftp.mk
@@ -5,7 +5,7 @@
 #############################################################
 NETKITFTP_SOURCE:=netkit-ftp_0.17.orig.tar.gz
 NETKITFTP_DIFF:=netkit-ftp_0.17-16.diff.gz
-NETKITFTP_SITE:=ftp://ftp.debian.org/debian/main/pool/netkit/
+NETKITFTP_SITE:=ftp://ftp.debian.org/debian/pool/main/n/netkit-ftp/
 NETKITFTP_DIR:=$(BUILD_DIR)/netkit-ftp-0.17
 NETKITFTP_CAT:=$(ZCAT)
 NETKITFTP_BINARY:=ftp/ftp
@@ -28,6 +28,9 @@ $(NETKITFTP_DIR)/.unpacked: $(DL_DIR)/$(NETKITFTP_SOURCE)
 
 $(NETKITFTP_DIR)/.configured: $(NETKITFTP_DIR)/.unpacked
 	(cd $(NETKITFTP_DIR); PATH=$(TARGET_PATH) CC=$(TARGET_CC) \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ENV) \
+		$(TARGET_CONFIGURE_ARGS) \
 		./configure --installroot=$(TARGET_DIR) --with-c-compiler=$(TARGET_CC) \
 		--without-readline \
 	)
@@ -35,7 +38,7 @@ $(NETKITFTP_DIR)/.configured: $(NETKITFTP_DIR)/.unpacked
 
 $(NETKITFTP_DIR)/$(NETKITFTP_BINARY): $(NETKITFTP_DIR)/.configured
 	$(MAKE) SUB=ftp CC=$(TARGET_CC) -C $(NETKITFTP_DIR)
-	$(STRIP) $(NETKITFTP_DIR)/$(NETKITFTP_BINARY)
+	$(STRIPCMD) $(NETKITFTP_DIR)/$(NETKITFTP_BINARY)
 
 $(TARGET_DIR)/$(NETKITFTP_TARGET_BINARY): $(NETKITFTP_DIR)/$(NETKITFTP_BINARY)
 	# Only install a few selected items...
-- 
1.6.2.BigFiles
