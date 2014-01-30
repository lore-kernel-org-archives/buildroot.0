From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 30 Jan 2014 23:15:44 +0100
Subject: [Buildroot] [PATCH 3/3] infozip: add missing optional bzip2
	dependencie
Message-ID: <1391120144-8420-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/infozip/infozip.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
index 8a356cf..8e51224 100644
--- a/package/infozip/infozip.mk
+++ b/package/infozip/infozip.mk
@@ -10,6 +10,10 @@ INFOZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
 INFOZIP_LICENSE = Info-ZIP
 INFOZIP_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+INFOZIP_DEPENDENCIES += bzip2
+endif
+
 define INFOZIP_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		CFLAGS="$(TARGET_CFLAGS) -I. -DUNIX" \
-- 
1.8.5.3
