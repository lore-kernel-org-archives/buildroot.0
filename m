From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 10 Jun 2018 21:44:48 +0300
Subject: [Buildroot] [PATCH] x265: fix build
Message-ID: <2fc39171f4e4ed1f1efdb0f88a8ff5c446fd44ec.1528656288.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch fixing missing function argument issue.

Fixes:
http://autobuild.buildroot.net/results/caa/caaaa5dc428c12ce7137194589153313911b000f/
http://autobuild.buildroot.net/results/741/741d8bacbe12e2f40047e30f7765039a88d1ce8f/
http://autobuild.buildroot.net/results/2c3/2c3f5b18efe5f42e1ab5269e106b9200690330af/

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0002-fix-build-error-on-ppc64le.patch     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/x265/0002-fix-build-error-on-ppc64le.patch

diff --git a/package/x265/0002-fix-build-error-on-ppc64le.patch b/package/x265/0002-fix-build-error-on-ppc64le.patch
new file mode 100644
index 000000000000..ca034477ebb2
--- /dev/null
+++ b/package/x265/0002-fix-build-error-on-ppc64le.patch
@@ -0,0 +1,23 @@
+# HG changeset patch
+# User Jayashree <jayashree.c@multicorewareinc.com>
+# Date 1527224165 -19800
+# Node ID 4504219210793536d921ee4e0b3058698c630bf4
+# Parent  cc2c5e46f3c87d27e3602af30b06ba6a0fbe2704
+Fix build error on on ppc64le
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+
+Upstream status: commit 450421921
+
+diff --git a/source/common/param.cpp b/source/common/param.cpp
+--- a/source/common/param.cpp
++++ b/source/common/param.cpp
+@@ -633,7 +633,7 @@
+         if (bValueWasNull)
+             p->cpuid = atobool(value);
+         else
+-            p->cpuid = parseCpuName(value, bError);
++            p->cpuid = parseCpuName(value, bError, false);
+ #endif
+     }
+     OPT("fps")
-- 
2.17.1
