From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  1 Jan 2015 12:16:43 +0200
Subject: [Buildroot] [PATCH] glibc: add debug symbols when BR2_ENABLE_DEBUG
Message-ID: <5517167ba77f268eeeaa8c5763078aeeb53741c6.1420107403.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/glibc/glibc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 65f4ed3b0d97..0a37bb361a07 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -47,6 +47,10 @@ else ifeq ($(BR2_MIPS_OABI32),y)
 GLIBC_EXTRA_CFLAGS += -mabi=32
 endif
 
+ifeq ($(BR2_ENABLE_DEBUG),y)
+GLIBC_EXTRA_CFLAGS += -g
+endif
+
 # The stubs.h header is not installed by install-headers, but is
 # needed for the gcc build. An empty stubs.h will work, as explained
 # in http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html. The same trick
-- 
2.1.4
