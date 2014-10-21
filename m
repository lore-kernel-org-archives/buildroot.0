From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 22:27:05 +0200
Subject: [Buildroot] [PATCH v2 18/30] libnspr: use the BR2_ARM_CPU_ARMV7A
	option
In-Reply-To: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413923237-2861-19-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libnspr --enable-thumb2 option was only enabled on Cortex-A8 and
Cortex-A9. This commit switches ot using BR2_ARM_CPU_ARMV7A instead,
which will allow using Thumb2 for this package even with the other
Cortex-A cores.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnspr/libnspr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index eaa6eb7..537caa6 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -22,7 +22,7 @@ LIBNSPR_CONF_OPTS += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
 LIBNSPR_CONF_OPTS += --$(if $(BR2_INET_IPV6),en,dis)able-ipv6
 
 ifeq ($(BR2_arm),y)
-ifeq ($(BR2_cortex_a8)$(BR2_cortex_a9),y)
+ifeq ($(BR2_ARM_CPU_ARMV7A),y)
 LIBNSPR_CONF_OPTS += --enable-thumb2
 else
 LIBNSPR_CONF_OPTS += --disable-thumb2
-- 
2.0.0
