From: Markos Chandras <markos.chandras@imgtec.com>
Date: Wed, 25 Apr 2012 12:45:16 +0100
Subject: [Buildroot] [PATCH] pkg-download.mk: Add missing argument when
	downloading from primary mirror
Message-ID: <1335354316-11618-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/pkg-download.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index ccf819e..b833de9 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -207,7 +207,7 @@ define DOWNLOAD_INNER
 	$(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
 		case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
 			scp) $(call $(DL_MODE)_SCP,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
-			*) $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
+			*) $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
 	if test -n "$(1)" ; then \
-- 
1.7.1
