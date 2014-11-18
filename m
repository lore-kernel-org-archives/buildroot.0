From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Nov 2014 14:05:17 -0300
Subject: [Buildroot] [PATCH 1/2] sg3_utils: bump to version 1.40
Message-ID: <1416330318-5625-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sg3_utils/sg3_utils.hash |  2 ++
 package/sg3_utils/sg3_utils.mk   | 10 +++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)
 create mode 100644 package/sg3_utils/sg3_utils.hash

diff --git a/package/sg3_utils/sg3_utils.hash b/package/sg3_utils/sg3_utils.hash
new file mode 100644
index 0000000..d3ae1a0
--- /dev/null
+++ b/package/sg3_utils/sg3_utils.hash
@@ -0,0 +1,2 @@
+# Locally calculated from download (no sig, hash)
+sha256	901ece577d797a8a3870881fe765f6eac4bb381b99a1f7311551689e9f17130b	sg3_utils-1.40.tar.xz
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index d59d26c..dca0f6b 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SG3_UTILS_VERSION = 1.39
+SG3_UTILS_VERSION = 1.40
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
 SG3_UTILS_SITE = http://sg.danny.cz/sg/p
 SG3_UTILS_LICENSE = BSD-3c
@@ -27,10 +27,10 @@ define SG3_UTILS_REMOVE_PROGS
 		raw rbuf rdac read readcap read_block_limits \
 		read_buffer read_long reassign referrals \
 		rep_zones requests reset reset_wp rmsn rtpg safte sanitize \
-		sat_identify sat_phy_event sat_set_features scan \
-		senddiag ses start stpg sync test_rwbuf turs \
-		unmap verify vpd write_buffer write_long \
-		write_same wr_mode xcopy; do \
+		sat_identify sat_phy_event sat_read_gplog sat_set_features \
+		scan senddiag ses ses_microcode start stpg sync test_rwbuf \
+		turs unmap verify vpd write_buffer write_long \
+		write_same write_verify wr_mode xcopy; do \
 		$(RM) $(TARGET_DIR)/usr/bin/sg_$${prog} ; \
 	done
 	for prog in \
-- 
2.0.4
