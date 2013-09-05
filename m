From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 05 Sep 2013 10:24:19 +0800
Subject: [Buildroot] [PATCH] uclibc: Add UCLIBC_MMU_CONFIG to
	UCLIBC_SETUP_DOT_CONFIG
Message-ID: <1378347859.1658.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit c798bec25 "uclibc: set MMU usage accordingly" defines UCLIBC_MMU_CONFIG,
but forgot adding it to UCLIBC_SETUP_DOT_CONFIG. Fix it.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/uclibc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 7f72d5e..a25bfee 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -424,6 +424,7 @@ define UCLIBC_SETUP_DOT_CONFIG
 	$(call UCLIBC_OPT_SET,RUNTIME_PREFIX,"/",$(@D))
 	$(call UCLIBC_OPT_SET,DEVEL_PREFIX,"/usr",$(@D))
 	$(call UCLIBC_OPT_SET,SHARED_LIB_LOADER_PREFIX,"/lib",$(@D))
+	$(UCLIBC_MMU_CONFIG)
 	$(UCLIBC_ARM_TYPE_CONFIG)
 	$(UCLIBC_ARM_ABI_CONFIG)
 	$(UCLIBC_ARM_BX_CONFIG)
-- 
1.8.1.2
