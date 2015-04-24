From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Apr 2015 20:01:27 +0200
Subject: [Buildroot] [git commit] qpdf: unbreak build on uClibc w/o threads
Message-ID: <20150424180315.B5E7281DE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42cfac07e1e5732fccf676c8b7aeabe53dbd2ff7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/af8/af857caef0c622aa9cfb1859b344880971ff263c/
http://autobuild.buildroot.net/results/10e/10e90c7c93aec92f0e13de50ecc861d56750dc8c/
http://autobuild.buildroot.net/results/69c/69c4522852e0b634723aaacd57f192db7ad6aa58/
http://autobuild.buildroot.net/results/fc4/fc45fd1bd249f58a3d8907bfd410f5dfbb452751/

And many more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-QUtil.hh-time_t-needs-include-time.h.patch |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/qpdf/0001-QUtil.hh-time_t-needs-include-time.h.patch b/package/qpdf/0001-QUtil.hh-time_t-needs-include-time.h.patch
new file mode 100644
index 0000000..742c70c
--- /dev/null
+++ b/package/qpdf/0001-QUtil.hh-time_t-needs-include-time.h.patch
@@ -0,0 +1,29 @@
+From 88ac4baf0a55ef15f298592fa344d8ddae26fa33 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Fri, 24 Apr 2015 19:58:41 +0200
+Subject: [PATCH] QUtil.hh: time_t needs #include <time.h>
+
+Fixes build on uClibc without threads:
+
+http://autobuild.buildroot.net/results/af8/af857caef0c622aa9cfb1859b344880971ff263c/build-end.log
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ include/qpdf/QUtil.hh | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/qpdf/QUtil.hh b/include/qpdf/QUtil.hh
+index 5c2e548..7f912e2 100644
+--- a/include/qpdf/QUtil.hh
++++ b/include/qpdf/QUtil.hh
+@@ -14,6 +14,7 @@
+ #include <list>
+ #include <stdexcept>
+ #include <stdio.h>
++#include <time.h>
+ 
+ class RandomDataProvider;
+ 
+-- 
+2.1.3
+
