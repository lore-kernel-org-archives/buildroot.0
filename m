From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 19 Sep 2020 18:33:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/wampcc: fix build with gcc 10
Message-ID: <20200919163307.468763-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/5668ee2a81daba689cc16c520681cfd16a79dbd7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../wampcc/0003-Broken-build-on-Windows.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/wampcc/0003-Broken-build-on-Windows.patch

diff --git a/package/wampcc/0003-Broken-build-on-Windows.patch b/package/wampcc/0003-Broken-build-on-Windows.patch
new file mode 100644
index 0000000000..3c528cd888
--- /dev/null
+++ b/package/wampcc/0003-Broken-build-on-Windows.patch
@@ -0,0 +1,27 @@
+From eaa70a289288db1e8d90a2a9bcde435a8975fe74 Mon Sep 17 00:00:00 2001
+From: Sergey Lukashevich <sergey.lukashevi4@gmail.com>
+Date: Fri, 26 Jul 2019 21:58:34 +0300
+Subject: [PATCH] Broken build on Windows: "http_parser.h(66,18): error C2039: 
+ 'runtime_error': is not a member of 'std'"
+
+Add missing <stdexcept> include.
+
+[Retrieved from:
+https://github.com/darrenjs/wampcc/commit/eaa70a289288db1e8d90a2a9bcde435a8975fe74]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/wampcc/http_parser.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/wampcc/http_parser.h b/include/wampcc/http_parser.h
+index a9405dd..4c20417 100644
+--- a/include/wampcc/http_parser.h
++++ b/include/wampcc/http_parser.h
+@@ -11,6 +11,7 @@
+ #include <map>
+ #include <string>
+ #include <memory>
++#include <stdexcept>
+ 
+ // types brought in from nodejs http-parser project
+ struct http_parser;
-- 
2.28.0
