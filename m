From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Jan 2013 10:48:28 +0100
Subject: [Buildroot] [PATCH] mtd: add options to build flash_otp_unlock and
	flash_otp_write
Message-ID: <1357897708-20616-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mtd/Config.in |    6 ++++++
 package/mtd/mtd.mk    |    2 ++
 2 files changed, 8 insertions(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 7330dd5..ddc3737 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -30,6 +30,12 @@ config BR2_PACKAGE_MTD_FLASH_OTP_DUMP
 config BR2_PACKAGE_MTD_FLASH_OTP_INFO
 	bool "flash_otp_info"
 
+config BR2_PACKAGE_MTD_FLASH_OTP_LOCK
+	bool "flash_otp_lock"
+
+config BR2_PACKAGE_MTD_FLASH_OTP_WRITE
+	bool "flash_otp_write"
+
 config BR2_PACKAGE_MTD_FLASH_UNLOCK
 	bool "flash_unlock"
 	default y
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index aef478f..c48b59f 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -38,6 +38,8 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE)	+= flash_erase
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK)	+= flash_lock
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_DUMP)	+= flash_otp_dump
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_INFO)	+= flash_otp_info
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_INFO)	+= flash_otp_lock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_INFO)	+= flash_otp_write
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK)	+= flash_unlock
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK)	+= ftl_check
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT)	+= ftl_format
-- 
1.7.10.4
