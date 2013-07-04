From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Jul 2013 12:09:34 +0200
Subject: [Buildroot] [PATCH] uclibc: fix PowerPC build problem
Message-ID: <1372932574-8439-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A stupid Unicode character was inserted instead of 'D'.

Fixes:
http://autobuild.buildroot.org/results/7a4/7a45fb1379307a788047ec859a4ce2c42d6eb077/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 1c5340c..f8495ba 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -140,7 +140,7 @@ UCLIBC_POWERPC_TYPE = CONFIG_$(call qstrip,$(BR2_UCLIBC_POWERPC_TYPE))
 define UCLIBC_POWERPC_TYPE_CONFIG
 	$(call UCLIBC_OPT_UNSET,CONFIG_GENERIC,$(@D))
 	$(call UCLIBC_OPT_UNSET,CONFIG_E500,$(@D))
-	$(call UCLIBC_OPT_SET,$(UCLIBC_POWERPC_TYPE),y,$(@?))
+	$(call UCLIBC_OPT_SET,$(UCLIBC_POWERPC_TYPE),y,$(@D))
 endef
 endif # powerpc
 
-- 
1.8.1.2
