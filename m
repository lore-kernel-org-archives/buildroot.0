From: Justin Maggard <jmaggard10@gmail.com>
Date: Tue,  6 Aug 2013 15:53:58 -0700
Subject: [Buildroot] [PATCH] Fix ARM uclibc build with !BR2_UCLIBC_ARM_BX.
Message-ID: <1375829638-7603-1-git-send-email-jmaggard10@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_UCLIBC_ARM_BX is not set, UCLIBC_OPT_UNSET gets called with an extra
argument.  Remove it.

Signed-off-by: Justin Maggard <jmaggard10@gmail.com>
---
 package/uclibc/uclibc.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 644c531..36a5001 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -85,7 +85,7 @@ define UCLIBC_ARM_BX_CONFIG
 endef
 else
 define UCLIBC_ARM_BX_CONFIG
-	$(call UCLIBC_OPT_UNSET,USE_BX,y,$(@D))
+	$(call UCLIBC_OPT_UNSET,USE_BX,$(@D))
 endef
 endif
 
-- 
1.7.9.5
