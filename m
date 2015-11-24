From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Nov 2015 10:32:27 -0300
Subject: [Buildroot] [PATCH] gmp: disable assembly for MIPS r6 ISA
Message-ID: <1448371947-30575-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's still not supported/implemented, fixes:
http://autobuild.buildroot.net/results/d06/d0686b3e7b8884f93034d4ea4b79fa8590ffa221/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gmp/gmp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index f71a210..96dd6ed 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -12,5 +12,10 @@ GMP_LICENSE = LGPLv3+
 GMP_LICENSE_FILES = COPYING.LESSERv3
 GMP_DEPENDENCIES = host-m4
 
+# GMP doesn't support assembly for r6 ISA yet
+ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
+GMP_CONF_OPTS += --disable-assembly
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.4.10
