From: Christophe Vu-Brugier <cvubrugier@yahoo.fr>
Date: Tue, 17 Dec 2013 11:09:50 +0100
Subject: [Buildroot] [PATCH] mdadm: pass CHECK_RUN_DIR=0 to the Makefile in
	order to fix build failure
Message-ID: <1387274990-6780-1-git-send-email-cvubrugier@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit should fix build failures of mdadm 3.3:

  http://autobuild.buildroot.net/results/b4a/b4abc317d07b073f8be870ff0e7fee8f8c65f2ff/
  http://autobuild.buildroot.net/results/79e/79e6c5081a5197c4f4647db497fbd1e27f29714d/
  http://autobuild.buildroot.net/results/224/2242f8284aa4bdbb0ab959a6a6464f20fa043e2f/

Signed-off-by: Christophe Vu-Brugier <cvubrugier@yahoo.fr>
---
 package/mdadm/mdadm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 4418986..c1491a4 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -11,7 +11,7 @@ MDADM_LICENSE = GPLv2+
 MDADM_LICENSE_FILES = COPYING
 
 MDADM_MAKE_OPT = \
-	CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(MDADM_DIR) mdadm
+	CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" CHECK_RUN_DIR=0 -C $(MDADM_DIR) mdadm
 
 MDADM_INSTALL_TARGET_OPT = \
 	DESTDIR=$(TARGET_DIR)/usr -C $(MDADM_DIR) install-mdadm
-- 
1.8.5.1
