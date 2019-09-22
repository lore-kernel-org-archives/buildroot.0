From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:20 +0200
Subject: [Buildroot] [PATCH 04/30] package/policycoreutils: drop ARCH
 variable
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ARCH variable is no longer referenced by the policycoreutils build
system since upstream commit 4cc808671a18b5405be5707eefedd78b9c693268
("Move policycoreutils/mcstrans to mcstrans.")

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/policycoreutils/policycoreutils.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index ff606a7d17..9c50b02a9e 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -36,8 +36,7 @@ endif
 POLICYCOREUTILS_MAKE_OPTS += \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
-	CPPFLAGS="$(TARGET_CPPFLAGS) -U_FILE_OFFSET_BITS" \
-	ARCH="$(BR2_ARCH)"
+	CPPFLAGS="$(TARGET_CPPFLAGS) -U_FILE_OFFSET_BITS"
 
 POLICYCOREUTILS_MAKE_DIRS = \
 	load_policy newrole run_init \
@@ -72,7 +71,6 @@ HOST_POLICYCOREUTILS_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	CFLAGS="$(HOST_CFLAGS) -U_FILE_OFFSET_BITS" \
 	CPPFLAGS="$(HOST_CPPFLAGS) -U_FILE_OFFSET_BITS" \
-	ARCH="$(HOSTARCH)" \
 	DESTDIR=$(HOST_DIR) \
 	PREFIX=$(HOST_DIR)
 
-- 
2.21.0
