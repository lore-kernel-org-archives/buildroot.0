From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 12 May 2016 20:25:04 +0200
Subject: [Buildroot] [PATCH v1] uclibc: enable debug build option
Message-ID: <1463077504-3646-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set uclibc DODEBUG in case BR2_ENABLE_DEBUG is set.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/uclibc/uclibc.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index b8ccee2..d68385d 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -182,6 +182,15 @@ endef
 endif
 
 #
+# Debug
+#
+ifeq ($(BR2_ENABLE_DEBUG),y)
+define UCLIBC_DEBUG_CONFIG
+	$(call KCONFIG_ENABLE_OPT,DODEBUG=y,$(@D)/.config)
+endef
+endif
+
+#
 # Endianness
 #
 
@@ -394,6 +403,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_SPARC_TYPE_CONFIG)
 	$(UCLIBC_POWERPC_TYPE_CONFIG)
 	$(UCLIBC_X86_TYPE_CONFIG)
+	$(UCLIBC_DEBUG_CONFIG)
 	$(UCLIBC_ENDIAN_CONFIG)
 	$(UCLIBC_LARGEFILE_CONFIG)
 	$(UCLIBC_IPV6_CONFIG)
-- 
2.8.1
