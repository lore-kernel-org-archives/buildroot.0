From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 15 Sep 2016 15:57:04 +0530
Subject: [Buildroot] [PATCH 3/7] audit: disable autoreconf
In-Reply-To: <1473935228-14014-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1473935228-14014-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1473935228-14014-3-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit upstream 51925b7dd6d0("package/audit: Bump to version 2.6.5")
removed patch 0002 as part of version bump. But forgot to disable
autoreconf.

Fixes: 51925b7dd6d0("package/audit: Bump to version 2.6.5")
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/audit/audit.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 06ec959..11ee8df 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -8,8 +8,6 @@ AUDIT_VERSION = 2.6.5
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPLv2
 AUDIT_LICENSE_FILES = COPYING
-# 0002-Fix-usage-of-audit_status.feature_bitmap.patch
-AUDIT_AUTORECONF = YES
 
 AUDIT_INSTALL_STAGING = YES
 
-- 
2.6.2
