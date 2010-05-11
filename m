From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 May 2010 09:13:14 +0200
Subject: [Buildroot] [git commit master] sed: bump to 4.2.1 to fix build
	failure
Message-ID: <20100511071423.05F6DAA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=844bbbb3fd10906d0c4e15ac57578f13b00fcf32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 4.1.5 fails to build due to the infamous getline() conflict
issue. 4.2.1 doesn't have this problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sed/sed.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 35cedce..e5a5d00 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -3,7 +3,7 @@
 # sed
 #
 #############################################################
-SED_VERSION:=4.1.5
+SED_VERSION:=4.2.1
 SED_SOURCE:=sed-$(SED_VERSION).tar.gz
 SED_SITE:=$(BR2_GNU_MIRROR)/sed
 SED_CAT:=$(ZCAT)
@@ -100,7 +100,7 @@ endif
 #############################################################
 $(SED_DIR2)/.unpacked: $(DL_DIR)/$(SED_SOURCE)
 	$(SED_CAT) $(DL_DIR)/$(SED_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(SED_DIR2)/config
+	$(CONFIG_UPDATE) $(SED_DIR2)/build-aux
 	touch $@
 
 $(SED_DIR2)/.configured: $(SED_DIR2)/.unpacked
-- 
1.6.3.3
