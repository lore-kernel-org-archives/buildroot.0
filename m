From: =?utf-8?q?Ra=C3=BAl_S=C3=A1nchez_Siles?= <rasasi78@gmail.com>
Date: Thu, 6 Sep 2012 18:11:07 +0200
Subject: [Buildroot] [PATCH] uclibc: depend on gcc_intermediate rather than
	$(gcc_intermediate)
Message-ID: <201209061811.07607.rasasi78@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc_intermediate correctly manages GCC_HOST_PREREQ, unlike $(gcc_intermediate)
which fails due to unsatisfied dependencies.

Signed-off-by: Ra?l S?nchez Siles <rasasi78@gmail.com>
---
 toolchain/uClibc/uclibc.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 534550a..3113f2f 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -496,7 +496,7 @@ UCLIBC_TARGETS+=uclibc-test
 endif
 endif
 
-uclibc: $(gcc_intermediate) $(STAGING_DIR)/usr/lib/libc.a $(UCLIBC_TARGETS)
+uclibc: gcc_intermediate $(STAGING_DIR)/usr/lib/libc.a $(UCLIBC_TARGETS)
 
 uclibc-source: $(DL_DIR)/$(UCLIBC_SOURCE)
 
-- 
1.7.10.4
