From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jun 2016 16:59:23 +0200
Subject: [Buildroot] [git commit] openssl: disable assembly for ARMv7M
Message-ID: <20160622150205.369C281EB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc89c4c5b0c9540d1935cd6a945b3a0908946db3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It requires interwork and v7M is thumb-only. Fixes:
http://autobuild.buildroot.net/results/55d/55dc9d6826defd2c9048c2991019d4d573d34af4/

[Peter: use R2_ARM_CPU_HAS_ARM for logic]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/openssl.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 2368aa9..e34868e 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -34,7 +34,8 @@ OPENSSL_DEPENDENCIES += ocf-linux
 endif
 
 # Some architectures are optimized in OpenSSL
-ifeq ($(ARCH),arm)
+# Doesn't work for thumb-only (Cortex-M?)
+ifeq ($(BR2_ARM_CPU_HAS_ARM),y)
 OPENSSL_TARGET_ARCH = armv4
 endif
 ifeq ($(ARCH),aarch64)
