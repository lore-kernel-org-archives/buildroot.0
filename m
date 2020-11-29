From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 29 Nov 2020 10:38:23 +0100
Subject: [Buildroot] [PATCH v1] package/kmsxx: fix gcc-10.x compile
Message-ID: <20201129093823.10286-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport upstream commit ([1]) adding missing string include.

Fixes:
  - http://autobuild.buildroot.net/results/53a5f023ae40db18f45ebe7578962914c2d22a44

  In file included from .../build/kmsxx-cb0786049f960f2bd383617151b01318e02e9ff9/kms++/inc/kms++/omap/omapcard.h:3,
                   from .../build/kmsxx-cb0786049f960f2bd383617151b01318e02e9ff9/kms++/src/omap/omapcard.cpp:2:
  .../build/kmsxx-cb0786049f960f2bd383617151b01318e02e9ff9/kms++/inc/kms++/card.h:17:18: error: 'string' in namespace 'std' does not name a type
     17 |  Card(const std::string& device);
        |                  ^~~~~~

[1] https://github.com/tomba/kmsxx/commit/b53f9d383c9189a897c44cd88a8fc1b871fdc8a2.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...ring-to-card.h-to-follow-gcc10-porti.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/kmsxx/0002-added-include-string-to-card.h-to-follow-gcc10-porti.patch

diff --git a/package/kmsxx/0002-added-include-string-to-card.h-to-follow-gcc10-porti.patch b/package/kmsxx/0002-added-include-string-to-card.h-to-follow-gcc10-porti.patch
new file mode 100644
index 0000000000..3febac40e8
--- /dev/null
+++ b/package/kmsxx/0002-added-include-string-to-card.h-to-follow-gcc10-porti.patch
@@ -0,0 +1,27 @@
+From f7ee1e8c96ffbfc645487e483b928d250a7e79ec Mon Sep 17 00:00:00 2001
+From: Tobias Off <sebastianoff@web.de>
+Date: Thu, 8 Oct 2020 22:37:55 +0200
+Subject: [PATCH] added #include <string> to card.h to follow gcc10 porting
+ guide
+
+[Upstream: https://github.com/tomba/kmsxx/commit/b53f9d383c9189a897c44cd88a8fc1b871fdc8a2.patch]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ kms++/inc/kms++/card.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/kms++/inc/kms++/card.h b/kms++/inc/kms++/card.h
+index 90ad1f6..f055e27 100644
+--- a/kms++/inc/kms++/card.h
++++ b/kms++/inc/kms++/card.h
+@@ -3,6 +3,7 @@
+ #include <cstdint>
+ #include <vector>
+ #include <map>
++#include <string>
+ 
+ #include "decls.h"
+ #include "pipeline.h"
+-- 
+2.29.2
+
-- 
2.29.2
