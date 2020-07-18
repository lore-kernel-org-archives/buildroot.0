From: guillaume.bressaix at gmail.com <guillaume.bressaix@gmail.com>
Date: Sat, 18 Jul 2020 10:11:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnids: ignore CVE-2010-0751
Message-ID: <20200718081154.15819-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

This CVE is falsely reported because it was fixed
in package version 1.24 (which we are using).
Ignore this CVE until the database is updated.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/libnids/libnids.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
index 4a67215242..a7e8f5514a 100644
--- a/package/libnids/libnids.mk
+++ b/package/libnids/libnids.mk
@@ -39,4 +39,9 @@ endif
 LIBNIDS_INSTALL_STAGING_OPTS = install_prefix=$(STAGING_DIR) install
 LIBNIDS_INSTALL_TARGET_OPTS = install_prefix=$(TARGET_DIR) install
 
+# CVE-2010-0751 was fixed in libnids v1.24
+# but the NVD database is not aware of the fix,
+# ignore it until this is updated
+LIBNIDS_IGNORE_CVES += CVE-2010-0751
+
 $(eval $(autotools-package))
-- 
2.20.1
