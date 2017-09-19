From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 19 Sep 2017 22:06:15 +0200
Subject: [Buildroot] [git commit] package/poppler: bump version to 0.59.0
Message-ID: <20170919195901.BE6E57FB28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2960a94fba09345f9716a77b5d040c2f3e670480
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
https://cgit.freedesktop.org/poppler/poppler/commit/poppler/Form.h?id=a9581e624fa62b3905b790ac10d1349b1f96048a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Bernd Kuhls &lt;<a href="mailto:bernd.kuhls@t-online.de">bernd.kuhls at t-online.de</a>&gt;<br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-Form-add-missing-std-vector-include.patch | 36 ----------------------
 package/poppler/poppler.hash                       |  2 +-
 package/poppler/poppler.mk                         |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/package/poppler/0001-Form-add-missing-std-vector-include.patch b/package/poppler/0001-Form-add-missing-std-vector-include.patch
deleted file mode 100644
index 5bca757..0000000
--- a/package/poppler/0001-Form-add-missing-std-vector-include.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 156507c6e85ad05256ccba06a710d47d34cd8153 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 5 May 2017 22:21:19 +0200
-Subject: [PATCH] Form: add missing std::vector include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-
-  ../../poppler/Form.h:544:14: error: ???vector??? in namespace ???std??? does not name a template type
-     const std::vector<Ref> &getCalculateOrder() const { return calculateOrder; }
-
-  ../../poppler/Form.h:556:8: error: ???vector??? in namespace ???std??? does not name a template type
-     std::vector<Ref> calculateOrder;
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- poppler/Form.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/poppler/Form.h b/poppler/Form.h
-index 8ddb6fe..e0a3a28 100644
---- a/poppler/Form.h
-+++ b/poppler/Form.h
-@@ -27,6 +27,7 @@
- #include "Annot.h"
- 
- #include <set>
-+#include <vector>
- 
- class GooString;
- class Array;
--- 
-2.11.0
-
diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index ffcc71e..7aa14c6 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 0ea37de71b7db78212ebc79df59f99b66409a29c2eac4d882dae9f2397fe44d8  poppler-0.57.0.tar.xz
+sha256 a3d626b24cd14efa9864e12584b22c9c32f51c46417d7c10ca17651f297c9641  poppler-0.59.0.tar.xz
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 1beb75a..5946cbe 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.57.0
+POPPLER_VERSION = 0.59.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
