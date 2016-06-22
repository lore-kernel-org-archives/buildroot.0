From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Jun 2016 10:47:28 -0300
Subject: [Buildroot] [PATCH] openssl: disable assembly for ARMv7M
Message-ID: <1466603248-29352-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It requires interwork and v7M is thumb-only. Fixes:
http://autobuild.buildroot.net/results/55d/55dc9d6826defd2c9048c2991019d4d573d34af4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 2368aa9..b019785 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -34,7 +34,8 @@ OPENSSL_DEPENDENCIES += ocf-linux
 endif
 
 # Some architectures are optimized in OpenSSL
-ifeq ($(ARCH),arm)
+# Doesn't work for thumb-only (Cortex-M?)
+ifeq ($(ARCH)$(BR2_ARM_CPU_ARMV7M),arm)
 OPENSSL_TARGET_ARCH = armv4
 endif
 ifeq ($(ARCH),aarch64)
-- 
2.7.3
