From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 22:26:57 +0200
Subject: [Buildroot] [PATCH v2 10/30] nettle: use the BR2_ARM_CPU_ARM*
	options
In-Reply-To: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413923237-2861-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adjust the nettle package to use the BR2_ARM_CPU_ARM* option to
disable the usage of assembly code on ARMv4 and ARMv5.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nettle/nettle.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index e73a718..a25bb24 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -15,7 +15,7 @@ NETTLE_LICENSE_FILES = COPYING.LIB
 NETTLE_CONF_OPTS = --disable-openssl
 
 # ARM assembly requires v6+ ISA
-ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_arm926t)$(BR2_fa526)$(BR2_strongarm)$(BR2_xscale)$(BR2_iwmmxt),y)
+ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5),y)
 NETTLE_CONF_OPTS += --disable-assembler
 endif
 
-- 
2.0.0
