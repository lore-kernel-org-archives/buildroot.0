From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 23:45:09 +0100
Subject: [Buildroot] [git commit] package/qpdf: bump version to 6.0.0
Message-ID: <20160201224659.9A1E37FAE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d4cf8f83d2926c5969fdb34aceaa020f71e2a5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
https://github.com/qpdf/qpdf/commit/857bb208d338e117f2a864407e34de76da360d8a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0001-QUtil.hh-time_t-needs-include-time.h.patch | 29 ----------------------
 package/qpdf/qpdf.hash                             |  6 +++--
 package/qpdf/qpdf.mk                               |  2 +-
 3 files changed, 5 insertions(+), 32 deletions(-)

diff --git a/package/qpdf/0001-QUtil.hh-time_t-needs-include-time.h.patch b/package/qpdf/0001-QUtil.hh-time_t-needs-include-time.h.patch
deleted file mode 100644
index 742c70c..0000000
--- a/package/qpdf/0001-QUtil.hh-time_t-needs-include-time.h.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 88ac4baf0a55ef15f298592fa344d8ddae26fa33 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Fri, 24 Apr 2015 19:58:41 +0200
-Subject: [PATCH] QUtil.hh: time_t needs #include <time.h>
-
-Fixes build on uClibc without threads:
-
-http://autobuild.buildroot.net/results/af8/af857caef0c622aa9cfb1859b344880971ff263c/build-end.log
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- include/qpdf/QUtil.hh | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/qpdf/QUtil.hh b/include/qpdf/QUtil.hh
-index 5c2e548..7f912e2 100644
---- a/include/qpdf/QUtil.hh
-+++ b/include/qpdf/QUtil.hh
-@@ -14,6 +14,7 @@
- #include <list>
- #include <stdexcept>
- #include <stdio.h>
-+#include <time.h>
- 
- class RandomDataProvider;
- 
--- 
-2.1.3
-
diff --git a/package/qpdf/qpdf.hash b/package/qpdf/qpdf.hash
index c6c6ebe..c882708 100644
--- a/package/qpdf/qpdf.hash
+++ b/package/qpdf/qpdf.hash
@@ -1,2 +1,4 @@
-# Downloaded from http://sourceforge.net/projects/qpdf/files/qpdf/5.1.2/
-md5	0bd15ef5eea5f628951ab456c84e78ec  qpdf-5.1.2.tar.gz
+# From http://sourceforge.net/projects/qpdf/files/qpdf/6.0.0/qpdf-6.0.0.sha1/download
+sha1	15ebe09d9b9ddd2309a67e4295693fcf82494e33	qpdf-6.0.0.tar.gz
+# Locally computed
+sha256	a9fdc7e94d38fcd3831f37b6e0fe36492bf79aa6d54f8f66062cf7f9c4155233	qpdf-6.0.0.tar.gz
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index bfd533c..9601f98 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QPDF_VERSION = 5.1.2
+QPDF_VERSION = 6.0.0
 QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
 QPDF_LICENSE = Artistic-2.0
