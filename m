From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Apr 2016 08:59:32 +0200
Subject: [Buildroot] [git commit] openssl: enable aarch64 optimization
Message-ID: <20160420071124.DB6B980304@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=817d3a02acf65b31e02ba1b026201f72b908c8ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Shyu <matthew.shyu@amlogic.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/openssl.mk | 3 +++
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
