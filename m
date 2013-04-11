From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 09:25:51 +0200
Subject: [Buildroot] [git commit] openssl: adjust ARM optimizations
Message-ID: <20130411081132.05A8D9B561@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b7f398dbbc5d11e0c795f1644ccbdfbd12491ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We no longer support ARM less than v4 so just kill dead code that we had
for those cases.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssl/openssl.mk |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

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
