From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 18:43:47 +0200
Subject: [Buildroot] [git commit] audit: remove autoreconf
Message-ID: <20160916164404.189A382270@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2deb74c17e1bf7ef02bc23df637f74f7898bca6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit upstream 51925b7dd6d0("package/audit: Bump to version 2.6.5")
removed patch 0002 as part of version bump. But forgot to disable
autoreconf.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
