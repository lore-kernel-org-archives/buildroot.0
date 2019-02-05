From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Feb 2019 17:14:01 +0100
Subject: [Buildroot] [git commit] package/ibrdtnd: include cstring
Message-ID: <20190205162518.6A87E812E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=734135cacc52caf8933f64c050fcdd03cd8ff410
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Failure output
 SecurityCertificateManager.lo
 SecurityCertificateManager.cpp: In static member function 'static void dtn::security::SecurityCertificateManager::validateSubject(X509*, const string&)':
 SecurityCertificateManager.cpp:208:53: error: 'memcmp' was not declared in this scope
        if(memcmp(utf8_eid, utf8_cert_name, utf8_eid_len) == 0){

Upstream
https://github.com/ibrdtn/ibrdtn/commit/122fa8ed49f896abf6a389505f3d0b66d49d1e77

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ertificateManager.cpp-include-cstring-267.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/ibrdtnd/0002-SecurityCertificateManager.cpp-include-cstring-267.patch b/package/ibrdtnd/0002-SecurityCertificateManager.cpp-include-cstring-267.patch
new file mode 100644
index 0000000000..e681936e99
--- /dev/null
+++ b/package/ibrdtnd/0002-SecurityCertificateManager.cpp-include-cstring-267.patch
@@ -0,0 +1,29 @@
+From 9458a8627ed73600488a6d8a0ce2ce1d123da583 Mon Sep 17 00:00:00 2001
+From: bkuhls <bkuhls@users.noreply.github.com>
+Date: Sun, 19 Aug 2018 11:23:48 +0200
+Subject: [PATCH] SecurityCertificateManager.cpp: include cstring (#267)
+
+Fixes build with gcc-8.2.0.
+
+Upstream: https://github.com/ibrdtn/ibrdtn/commit/122fa8ed49f896abf6a389505f3d0b66d49d1e77
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ src/security/SecurityCertificateManager.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/security/SecurityCertificateManager.cpp b/src/security/SecurityCertificateManager.cpp
+index 5fba703..f2bbb01 100644
+--- a/src/security/SecurityCertificateManager.cpp
++++ b/src/security/SecurityCertificateManager.cpp
+@@ -22,6 +22,7 @@
+ #include "security/SecurityCertificateManager.h"
+ #include "Configuration.h"
+ 
++#include <cstring>
+ #include <cstdlib>
+ 
+ #include <ibrcommon/Logger.h>
+-- 
+1.9.1
+
