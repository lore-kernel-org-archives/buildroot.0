From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 17 Feb 2017 14:55:32 +0100
Subject: [Buildroot] [PATCH 1/1] alljoyn: fix build on or1k
Message-ID: <1487339732-29587-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes missing stdio.h include in ConfigServiceSample

Fixes:
 - http://autobuild.buildroot.net/results/c48/c486397a6a99f6b377cfc0d971b716fe5d69f662

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 ...ng-stdio.h-include-in-ConfigServiceSample.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/alljoyn/0002-Fix-missing-stdio.h-include-in-ConfigServiceSample.patch

diff --git a/package/alljoyn/0002-Fix-missing-stdio.h-include-in-ConfigServiceSample.patch b/package/alljoyn/0002-Fix-missing-stdio.h-include-in-ConfigServiceSample.patch
new file mode 100644
index 0000000..db596e2
--- /dev/null
+++ b/package/alljoyn/0002-Fix-missing-stdio.h-include-in-ConfigServiceSample.patch
@@ -0,0 +1,28 @@
+From a25dfe775819a1efb65a2ec518a292d30a99cc59 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Fri, 17 Feb 2017 11:23:23 +0100
+Subject: [PATCH] Fix missing stdio.h include in ConfigServiceSample
+
+Add stdio.h include as printf is used in ConfigServiceSample/CommonSampleUtil.cc
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ services/config/cpp/samples/ConfigServiceSample/CommonSampleUtil.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/services/config/cpp/samples/ConfigServiceSample/CommonSampleUtil.cc b/services/config/cpp/samples/ConfigServiceSample/CommonSampleUtil.cc
+index d4c9839..fb2a991 100644
+--- a/services/config/cpp/samples/ConfigServiceSample/CommonSampleUtil.cc
++++ b/services/config/cpp/samples/ConfigServiceSample/CommonSampleUtil.cc
+@@ -18,6 +18,8 @@
+ #include "CommonSampleUtil.h"
+ #include <qcc/StringUtil.h>
+ 
++#include <stdio.h>
++
+ using namespace ajn;
+ using namespace services;
+ 
+-- 
+2.7.4
+
-- 
2.7.4
