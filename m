From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Apr 2013 14:29:46 -0300
Subject: [Buildroot] [PATCH 2/4] openssl: adjust ARM optimizations
In-Reply-To: <1365096588-1932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1365096588-1932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1365096588-1932-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We no longer support ARM less than v4 so just kill dead code that we had
for those cases.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 96f817d..7701d51 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -29,14 +29,8 @@ endif
 
 # Some architectures are optimized in OpenSSL
 ifeq ($(ARCH),arm)
-ifneq ($(BR2_generic_arm),y)
-ifneq ($(BR2_arm610),y)
-ifneq ($(BR2_arm710),y)
 	OPENSSL_TARGET_ARCH = armv4
 endif
-endif
-endif
-endif
 ifeq ($(ARCH),powerpc)
 # 4xx cores seem to have trouble with openssl's ASM optimizations
 ifeq ($(BR2_powerpc_401)$(BR2_powerpc_403)$(BR2_powerpc_405)$(BR2_powerpc_405fp)$(BR2_powerpc_440)$(BR2_powerpc_440fp),)
-- 
1.8.1.5
