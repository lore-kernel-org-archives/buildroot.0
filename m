From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Jul 2013 17:27:58 -0300
Subject: [Buildroot] [PATCH] uclibc: fix SPARC build problem
Message-ID: <1372969678-15353-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Another stupid Unicode character instead of D.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/uclibc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 6060efa..0033a8c 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -126,7 +126,7 @@ ifeq ($(UCLIBC_TARGET_ARCH),sparc)
 UCLIBC_SPARC_TYPE = CONFIG_SPARC_$(call qstrip,$(BR2_UCLIBC_SPARC_TYPE))
 define UCLIBC_SPARC_TYPE_CONFIG
 	$(SED) 's/^\(CONFIG_[^_]*[_]*SPARC[^=]*\)=.*/# \1 is not set/g' \
-		 $(@?)/.config
+		 $(@D)/.config
 	$(call UCLIBC_OPT_SET,$(UCLIBC_SPARC_TYPE),y,$(@D))
 endef
 endif # sparc
-- 
1.8.1.5
