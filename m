From: Julien Floret <julien.floret@6wind.com>
Date: Sat,  2 Jul 2016 20:48:33 +0200
Subject: [Buildroot] [RFC 1/3] zip: add explicit dependencies for host
	variant
In-Reply-To: <1467485315-28264-1-git-send-email-julien.floret@6wind.com>
References: <1467485315-28264-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467485315-28264-2-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/zip/zip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zip/zip.mk b/package/zip/zip.mk
index 5338f881663d..f56ac5a4804d 100644
--- a/package/zip/zip.mk
+++ b/package/zip/zip.mk
@@ -12,6 +12,7 @@ ZIP_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 ZIP_DEPENDENCIES += bzip2
+HOST_ZIP_DEPENDENCIES += host-bzip2
 endif
 
 # Infozip's default CFLAGS.
-- 
2.1.0
