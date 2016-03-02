From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Mar 2016 18:40:01 -0300
Subject: [Buildroot] [PATCH] sg3_utils: bump to version 1.42
Message-ID: <1456954801-11472-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sg3_utils/sg3_utils.hash | 2 +-
 package/sg3_utils/sg3_utils.mk   | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/sg3_utils/sg3_utils.hash b/package/sg3_utils/sg3_utils.hash
index d3ae1a0..a884063 100644
--- a/package/sg3_utils/sg3_utils.hash
+++ b/package/sg3_utils/sg3_utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated from download (no sig, hash)
-sha256	901ece577d797a8a3870881fe765f6eac4bb381b99a1f7311551689e9f17130b	sg3_utils-1.40.tar.xz
+sha256	97aeed65894feb2add896b4adfa4cf343966c8a61c7d206795ed0507640ee7b9	sg3_utils-1.42.tar.xz
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index dca0f6b..36cb32e 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SG3_UTILS_VERSION = 1.40
+SG3_UTILS_VERSION = 1.42
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
 SG3_UTILS_SITE = http://sg.danny.cz/sg/p
 SG3_UTILS_LICENSE = BSD-3c
@@ -25,12 +25,12 @@ define SG3_UTILS_REMOVE_PROGS
 		get_lba_status ident inq logs luns map26 \
 		map sgm_dd modes opcodes sgp_dd persist prevent \
 		raw rbuf rdac read readcap read_block_limits \
-		read_buffer read_long reassign referrals \
+		read_attr read_buffer read_long reassign referrals \
 		rep_zones requests reset reset_wp rmsn rtpg safte sanitize \
 		sat_identify sat_phy_event sat_read_gplog sat_set_features \
 		scan senddiag ses ses_microcode start stpg sync test_rwbuf \
-		turs unmap verify vpd write_buffer write_long \
-		write_same write_verify wr_mode xcopy; do \
+		timestamp turs unmap verify vpd write_buffer write_long \
+		write_same write_verify wr_mode xcopy zone; do \
 		$(RM) $(TARGET_DIR)/usr/bin/sg_$${prog} ; \
 	done
 	for prog in \
-- 
2.4.10
