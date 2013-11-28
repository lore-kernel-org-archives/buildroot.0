From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Nov 2013 16:02:15 -0300
Subject: [Buildroot] [PATCH] gdb: disable texinfo/documentation
Message-ID: <1385665335-19364-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes bug #6554

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gdb/gdb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 9cf90e3..700cf72 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -57,6 +57,7 @@ HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 endif
 
 GDB_CONF_ENV = \
+	ac_cv_prog_MAKEINFO=missing \
 	ac_cv_type_uintptr_t=yes \
 	gt_cv_func_gettext_libintl=yes \
 	ac_cv_func_dcgettext=yes \
-- 
1.8.3.2
