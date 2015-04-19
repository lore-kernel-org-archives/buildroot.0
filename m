From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 19 Apr 2015 12:57:58 -0400
Subject: [Buildroot] [PATCH 1/2] pkg-download: add optional destination
	filename
Message-ID: <1429462679-4769-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds an optional parameter to the DOWNLOAD macro so that it's
possible to specify a destination filename that's different from one
being downloaded.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/pkg-download.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index e274712..1278018 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -244,13 +244,14 @@ endef
 # 3) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
 #
 # Argument 1 is the source location
+# Argument 2 is an optional destination filename
 #
 # E.G. use like this:
 # $(call DOWNLOAD,$(FOO_SITE))
 ################################################################################
 
 define DOWNLOAD
-	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)))
+	$(call DOWNLOAD_INNER,$(1),$(if $(2),$(2),$(notdir $(1))))
 endef
 
 define DOWNLOAD_INNER
-- 
1.9.1
