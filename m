From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 18 Nov 2020 18:18:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/kmsxx: fix build with gcc 10
Message-ID: <20201118171827.1009516-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/59f70fb725c2f07e27dc818839e02f2788ee490c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...card.h-to-follow-gcc10-porting-guide.patch | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/kmsxx/0002-added-include-string-to-card.h-to-follow-gcc10-porting-guide.patch

diff --git a/package/kmsxx/0002-added-include-string-to-card.h-to-follow-gcc10-porting-guide.patch b/package/kmsxx/0002-added-include-string-to-card.h-to-follow-gcc10-porting-guide.patch
new file mode 100644
index 0000000000..a326577b04
--- /dev/null
+++ b/package/kmsxx/0002-added-include-string-to-card.h-to-follow-gcc10-porting-guide.patch
@@ -0,0 +1,25 @@
+From b53f9d383c9189a897c44cd88a8fc1b871fdc8a2 Mon Sep 17 00:00:00 2001
+From: Tobias Off <sebastianoff@web.de>
+Date: Thu, 8 Oct 2020 22:37:55 +0200
+Subject: [PATCH] added #include <string> to card.h to follow gcc10 porting
+ guide
+
+[Retrieved (and backported) from:
+https://github.com/tomba/kmsxx/commit/b53f9d383c9189a897c44cd88a8fc1b871fdc8a2]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ kms++/inc/kms++/card.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/kms++/inc/kms++/card.h b/kms++/inc/kms++/card.h
+index 0a7eaaf..f60b184 100644
+--- a/kms++/inc/kms++/card.h
++++ b/kms++/inc/kms++/card.h
+@@ -4,6 +4,7 @@
+ #include <cstdint>
+ #include <vector>
+ #include <map>
++#include <string>
+ 
+ #include "decls.h"
+ #include "pipeline.h"
-- 
2.29.2
