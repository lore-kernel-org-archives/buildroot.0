From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 23 Jul 2020 22:04:55 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/ima-evm-utils: fix build on musl
Message-ID: <20200723200457.3996-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
                   br-arm-cortex-a9-musl [ 7/44]: FAILED
                br-i386-pentium-mmx-musl [12/44]: FAILED
                          br-x86-64-musl [34/44]: FAILED
                          linaro-aarch64 [36/44]: FAILED

Fix will be released in future release (after 1.3), but was needed since
initial release.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...Fix-missing-u-g-id_t-typedef-on-musl.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/ima-evm-utils/0002-Fix-missing-u-g-id_t-typedef-on-musl.patch

diff --git a/package/ima-evm-utils/0002-Fix-missing-u-g-id_t-typedef-on-musl.patch b/package/ima-evm-utils/0002-Fix-missing-u-g-id_t-typedef-on-musl.patch
new file mode 100644
index 0000000000..0596f68170
--- /dev/null
+++ b/package/ima-evm-utils/0002-Fix-missing-u-g-id_t-typedef-on-musl.patch
@@ -0,0 +1,29 @@
+From e74b1c8620ba81682dc6b62bd2783311b99f5bd0 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Wed, 22 Jul 2020 13:10:20 +0200
+Subject: [PATCH] Fix missing {u,g}id_t typedef on musl
+
+Fixes: 273701a ("evmctl - IMA/EVM control tool")
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ upstream status: 7f9a59c ("Fix missing {u,g}id_t typedef on musl") ]
+---
+ src/imaevm.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/imaevm.h b/src/imaevm.h
+index b881d92..923e2e6 100644
+--- a/src/imaevm.h
++++ b/src/imaevm.h
+@@ -46,7 +46,7 @@
+ #include <syslog.h>
+ #include <stdbool.h>
+ #include <errno.h>
+-
++#include <sys/types.h>
+ #include <openssl/rsa.h>
+ 
+ #ifdef USE_FPRINTF
+-- 
+2.27.0
+
-- 
2.27.0
