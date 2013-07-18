From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 18 Jul 2013 13:07:38 -0300
Subject: [Buildroot] [PATCH 2/3] gcc/arm: disable mudflap for thumb(1)
In-Reply-To: <1374163659-22748-1-git-send-email-gustavo@zacarias.com.ar>
References: <1374163659-22748-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1374163659-22748-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libmudflap doesn't build for a thumb(1) toolchain so disable it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/gcc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index ae2a363..505db06 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -194,6 +194,11 @@ ifeq ($(BR2_avr32),y)
 HOST_GCC_COMMON_CONF_OPT += --disable-libmudflap
 endif
 
+# ARM Thumb and mudflap aren't friends
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+HOST_GCC_COMMON_CONF_OPT += --disable-libmudflap
+endif
+
 # Disable mudflap and enable proper double/long double for SPE ABI
 ifeq ($(BR2_powerpc_SPE),y)
 HOST_GCC_COMMON_CONF_OPT += \
-- 
1.8.1.5
