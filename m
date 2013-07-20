From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 20 Jul 2013 09:52:15 -0300
Subject: [Buildroot] [PATCH 9/9] gcc/mudflap: disable for blackfin,
	it doesn't build
In-Reply-To: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
References: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1374324735-2286-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/gcc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index cbeaa6c..cd6efed 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -202,6 +202,11 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 HOST_GCC_COMMON_CONF_OPT += --disable-libmudflap
 endif
 
+# Blackfin doesn't do mudflap
+ifeq ($(BR2_bfin),y)
+HOST_GCC_COMMON_CONF_OPT += --disable-libmudflap
+endif
+
 # Disable mudflap and enable proper double/long double for SPE ABI
 ifeq ($(BR2_powerpc_SPE),y)
 HOST_GCC_COMMON_CONF_OPT += \
-- 
1.8.1.5
