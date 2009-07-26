From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Jul 2009 00:15:55 +0200
Subject: [Buildroot] [git commit] target/iso9660: fix mkisofs build for !i686
Message-ID: <20090726221821.C21BC76218@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c63d5d24b371fa5b43a079dd129dcd794ead24f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use HOST_ARCH instead of hardcoded i686. The build still could use
some cleanup though.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/iso9660/iso9660.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/target/iso9660/iso9660.mk b/target/iso9660/iso9660.mk
index 151970f..2525286 100644
--- a/target/iso9660/iso9660.mk
+++ b/target/iso9660/iso9660.mk
@@ -7,7 +7,7 @@ MKISOFS_SOURCE:=cdrtools-2.01.tar.bz2
 MKISOFS_CAT:=$(BZCAT)
 MKISOFS_SITE:=ftp://ftp.berlios.de/pub/cdrecord/
 MKISOFS_DIR:=$(BUILD_DIR)/cdrtools-2.01
-MKISOFS_TARGET:=$(MKISOFS_DIR)/mkisofs/OBJ/i686-linux-cc/mkisofs
+MKISOFS_TARGET=$(MKISOFS_DIR)/mkisofs/OBJ/$(HOST_ARCH)-linux-cc/mkisofs
 
 $(DL_DIR)/$(MKISOFS_SOURCE):
 	$(call DOWNLOAD,$(MKISOFS_SITE),$(MKISOFS_SOURCE))
-- 
1.6.3.3
