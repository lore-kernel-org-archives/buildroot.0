From: Matthew Shyu <matthew.shyu.amlogic@gmail.com>
Date: Tue, 19 Apr 2016 18:26:46 +0800
Subject: [Buildroot] [PATCH 1/1] openssl: enable aarch64 optimization
Message-ID: <1461061606-3323-1-git-send-email-matthew.shyu.amlogic@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matthew Shyu <matthew.shyu@amlogic.com>


Signed-off-by: Matthew Shyu <matthew.shyu@amlogic.com>
---
 package/openssl/openssl.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 3b8e525..2f50dfb 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -37,6 +37,9 @@ endif
 ifeq ($(ARCH),arm)
 OPENSSL_TARGET_ARCH = armv4
 endif
+ifeq ($(ARCH),aarch64)
+OPENSSL_TARGET_ARCH = aarch64
+endif
 ifeq ($(ARCH),powerpc)
 # 4xx cores seem to have trouble with openssl's ASM optimizations
 ifeq ($(BR2_powerpc_401)$(BR2_powerpc_403)$(BR2_powerpc_405)$(BR2_powerpc_405fp)$(BR2_powerpc_440)$(BR2_powerpc_440fp),)
-- 
1.7.9.5
