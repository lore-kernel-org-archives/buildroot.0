From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 20 Oct 2014 21:52:37 +0200
Subject: [Buildroot] [PATCH] util-linux: do not disable non existing
	directories
Message-ID: <1413834757-7996-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Legacy disabled sub directories mount-deprecated and fdisks do not
longer exist in util-linux-2.25.1 source package.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/util-linux/util-linux.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index ebbab61..7586ab3 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -102,9 +102,8 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES),)
 define UTIL_LINUX_DISABLE_TOOLS
 	$(SED) '/schedutils/d' -e '/text-utils/d' -e '/term-utils/d' \
-		-e '/login-utils/d' -e '/mount-deprecated/d' \
-		-e '/sys-utils/d' -e '/misc-utils/d' -e '/disk-utils/d' \
-		-e '/fdisks/d' $(@D)/Makefile.am
+		-e '/login-utils/d' -e '/sys-utils/d' -e '/misc-utils/d' \
+		-e '/disk-utils/d' $(@D)/Makefile.am
 endef
 UTIL_LINUX_PRE_PATCH_HOOKS += UTIL_LINUX_DISABLE_TOOLS
 endif
-- 
1.8.1.4
