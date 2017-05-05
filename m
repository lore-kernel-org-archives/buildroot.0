From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  5 May 2017 23:17:59 +0200
Subject: [Buildroot] [PATCH v1] poppler: add missing std::vector include for
	Qt code
Message-ID: <20170505211759.1389-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1], [2]:

  ../../poppler/Form.h:544:14: error: ?vector? in namespace ?std? does not name a template type
     const std::vector<Ref> &getCalculateOrder() const { return calculateOrder; }

  ../../poppler/Form.h:556:8: error: ?vector? in namespace ?std? does not name a template type
     std::vector<Ref> calculateOrder;

[1] http://autobuild.buildroot.net/results/b749b252f63945f278358dcd76b6e9c55214ccd8
[2] http://autobuild.buildroot.net/results/92e68defe746eb4852b3a45bb27af2282d3f4c7e

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../0001-Form-add-missing-std-vector-include.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/poppler/0001-Form-add-missing-std-vector-include.patch

diff --git a/package/poppler/0001-Form-add-missing-std-vector-include.patch b/package/poppler/0001-Form-add-missing-std-vector-include.patch
new file mode 100644
index 000000000..5bca75723
--- /dev/null
+++ b/package/poppler/0001-Form-add-missing-std-vector-include.patch
@@ -0,0 +1,36 @@
+From 156507c6e85ad05256ccba06a710d47d34cd8153 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 5 May 2017 22:21:19 +0200
+Subject: [PATCH] Form: add missing std::vector include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  ../../poppler/Form.h:544:14: error: ?vector? in namespace ?std? does not name a template type
+     const std::vector<Ref> &getCalculateOrder() const { return calculateOrder; }
+
+  ../../poppler/Form.h:556:8: error: ?vector? in namespace ?std? does not name a template type
+     std::vector<Ref> calculateOrder;
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ poppler/Form.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/poppler/Form.h b/poppler/Form.h
+index 8ddb6fe..e0a3a28 100644
+--- a/poppler/Form.h
++++ b/poppler/Form.h
+@@ -27,6 +27,7 @@
+ #include "Annot.h"
+ 
+ #include <set>
++#include <vector>
+ 
+ class GooString;
+ class Array;
+-- 
+2.11.0
+
-- 
2.11.0
