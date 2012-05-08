From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  8 May 2012 08:51:18 -0300
Subject: [Buildroot] [PATCH] cifs-utils: security bump to version 5.4
Message-ID: <1336477878-19684-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2012-1586.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cifs-utils/cifs-utils.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 52ad5ce..0fdb689 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -1,5 +1,11 @@
-CIFS_UTILS_VERSION = 5.1
+CIFS_UTILS_VERSION = 5.4
 CIFS_UTILS_SOURCE  = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE    = ftp://ftp.samba.org/pub/linux-cifs/cifs-utils/
 
+define CIFS_UTILS_NO_WERROR
+	$(SED) 's/-Werror//' $(@D)/Makefile.in
+endef
+
+CIFS_UTILS_POST_PATCH_HOOKS += CIFS_UTILS_NO_WERROR
+
 $(eval $(call AUTOTARGETS))
-- 
1.7.3.4
