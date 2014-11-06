From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Nov 2014 23:58:36 +0100
Subject: [Buildroot] [git commit] libnspr: use the BR2_ARM_CPU_ARMV7A option
Message-ID: <20141106233446.C82ACA3309@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6a865bd52f021f8fe56794edd3c685aa8d277bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libnspr --enable-thumb2 option was only enabled on Cortex-A8 and
Cortex-A9. This commit switches to using BR2_ARM_CPU_ARMV7A instead,
which will allow using Thumb2 for this package even with the other
Cortex-A cores.

[Peter: use BR2_ARM_CPU_HAS_THUMB2 instead]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnspr/libnspr.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index eaa6eb7..c071d85 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -22,7 +22,7 @@ LIBNSPR_CONF_OPTS += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
 LIBNSPR_CONF_OPTS += --$(if $(BR2_INET_IPV6),en,dis)able-ipv6
 
 ifeq ($(BR2_arm),y)
-ifeq ($(BR2_cortex_a8)$(BR2_cortex_a9),y)
+ifeq ($(BR2_ARM_CPU_HAS_THUMB2),y)
 LIBNSPR_CONF_OPTS += --enable-thumb2
 else
 LIBNSPR_CONF_OPTS += --disable-thumb2
