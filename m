From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Jan 2013 21:14:14 +0100
Subject: [Buildroot] [git commit] mtd: add options to build flash_otp_unlock
	and flash_otp_write
Message-ID: <20130113201423.9EA4A999A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97a3493c51f4163957adef686addcde749f98aa8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/Config.in |    6 ++++++
 package/mtd/mtd.mk    |    2 ++
 2 files changed, 8 insertions(+), 0 deletions(-)

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
index aef478f..eafce45 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -38,6 +38,8 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE)	+= flash_erase
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK)	+= flash_lock
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_DUMP)	+= flash_otp_dump
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_INFO)	+= flash_otp_info
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_LOCK)	+= flash_otp_lock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_WRITE)	+= flash_otp_write
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK)	+= flash_unlock
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK)	+= ftl_check
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT)	+= ftl_format
