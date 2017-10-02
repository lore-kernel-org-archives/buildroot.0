From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  2 Oct 2017 22:52:59 +0200
Subject: [Buildroot] [PATCH] package/netsniff-ng: add missing header
In-Reply-To: <20171002205259.15434-1-romain.naour@gmail.com>
References: <20171002205259.15434-1-romain.naour@gmail.com>
Message-ID: <20171002205259.15434-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like for nfs-utils and strongswan, add stdint.h header for
UINT16_MAX definition

Reported-by: Ross <grunpferd@netscape.net>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...0004-staging-compilation-fix-with-new-gcc.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/netsniff-ng/0004-staging-compilation-fix-with-new-gcc.patch

diff --git a/package/netsniff-ng/0004-staging-compilation-fix-with-new-gcc.patch b/package/netsniff-ng/0004-staging-compilation-fix-with-new-gcc.patch
new file mode 100644
index 0000000..fce604e
--- /dev/null
+++ b/package/netsniff-ng/0004-staging-compilation-fix-with-new-gcc.patch
@@ -0,0 +1,31 @@
+From 551aa0ee996132e443b5d12cbb6f114ac9aabcd3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jaroslav=20=C5=A0karvada?= <jskarvad@redhat.com>
+Date: Mon, 3 Jul 2017 18:24:32 +0200
+Subject: [PATCH] staging: compilation fix with new gcc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Jaroslav ?karvada <jskarvad@redhat.com>
+
+Upstream patch 551aa0ee996132e443b5d12cbb6f114ac9aabcd3
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ staging/mz.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/staging/mz.h b/staging/mz.h
+index 5ed05a7..aa2c36f 100644
+--- a/staging/mz.h
++++ b/staging/mz.h
+@@ -40,6 +40,7 @@
+ #include <netinet/in.h>
+ #include <stdarg.h>
+ #include <math.h>
++#include <stdint.h>
+ 
+ extern int verbose_level;
+ 
+-- 
+2.9.5
+
-- 
2.9.5
