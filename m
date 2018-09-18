From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 18 Sep 2018 15:36:15 +0300
Subject: [Buildroot] [PATCH] s6-linux-utils: fix build with glibc 2.28
Message-ID: <131325e8288cf4027e581c26c978d7ce350ace8b.1537274175.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch that adds needed header for the major/minor macros.

Fixes:
http://autobuild.buildroot.net/results/974/9742dfabd9b244e1381983dd05edd3e65504f0fe/

Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...s-sysmacros.h-because-glibc-is-glibc.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/s6-linux-utils/0001-Include-sys-sysmacros.h-because-glibc-is-glibc.patch

diff --git a/package/s6-linux-utils/0001-Include-sys-sysmacros.h-because-glibc-is-glibc.patch b/package/s6-linux-utils/0001-Include-sys-sysmacros.h-because-glibc-is-glibc.patch
new file mode 100644
index 000000000000..ac31394f2bae
--- /dev/null
+++ b/package/s6-linux-utils/0001-Include-sys-sysmacros.h-because-glibc-is-glibc.patch
@@ -0,0 +1,27 @@
+From bec661b6f037209c67fc7c9f022ee157c342ade6 Mon Sep 17 00:00:00 2001
+From: Laurent Bercot <ska-skaware@skarnet.org>
+Date: Thu, 5 Oct 2017 18:05:00 +0000
+Subject: [PATCH]  Include sys/sysmacros.h because glibc is glibc
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit bec661b6f037
+
+ src/minutils/s6ps_ttycache.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/minutils/s6ps_ttycache.c b/src/minutils/s6ps_ttycache.c
+index 7fa4bc09e624..319356044da9 100644
+--- a/src/minutils/s6ps_ttycache.c
++++ b/src/minutils/s6ps_ttycache.c
+@@ -7,6 +7,7 @@
+ #include <string.h>
+ #include <stdint.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <errno.h>
+ #include <skalibs/types.h>
+ #include <skalibs/allreadwrite.h>
+-- 
+2.18.0
+
-- 
2.18.0
