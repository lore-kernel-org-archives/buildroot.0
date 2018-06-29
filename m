From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 29 Jun 2018 08:18:58 +0300
Subject: [Buildroot] [PATCH] qpdf: security bump to version 8.1.0
Message-ID: <f3824d1a8cf1971f29912fa0891ba7e597066d2d.1530249538.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2018-9918: mishandle certain "expected dictionary key but
found non-name object" cases, allowing remote attackers to cause a
denial of service (stack exhaustion)

https://github.com/qpdf/qpdf/issues/202

Drop local SHA256 hash since we use upstream provided SHA512.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/qpdf/qpdf.hash | 6 ++----
 package/qpdf/qpdf.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/qpdf/qpdf.hash b/package/qpdf/qpdf.hash
index 1fbef66e6fc7..d27c9834b99e 100644
--- a/package/qpdf/qpdf.hash
+++ b/package/qpdf/qpdf.hash
@@ -1,4 +1,2 @@
-# From https://sourceforge.net/projects/qpdf/files/qpdf/7.0.0/qpdf-7.0.0.sha512/download
-sha512	7b52d67b4d2c428a7b0c1cd03b03a23f05d38d7e3c81041079a137919019ea5158f12bf95fdcfcff6b43ffdefe93a85127ced2a363a6b4b380cbaa02a3840256  qpdf-7.0.0.tar.gz
-# Locally computed
-sha256	fed08de14caad0fe5efd148d9eca886d812588b2cbb35d13e61993ee8eb8c65f  qpdf-7.0.0.tar.gz
+# From https://sourceforge.net/projects/qpdf/files/qpdf/8.1.0/qpdf-8.1.0.sha512/download
+sha512	1831bcaaed87dae268db5d61805d1483ec5c101f6ce594be660664c119597ae67cf011c2b50092964d785a814d5f6c780935127a89401fe37a1026ae4d3af15c  qpdf-8.1.0.tar.gz
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index 27e4d099789c..4776d22b16d6 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QPDF_VERSION = 7.0.0
+QPDF_VERSION = 8.1.0
 QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
 QPDF_LICENSE = Artistic-2.0
-- 
2.18.0
