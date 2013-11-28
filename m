From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2013 22:23:32 +0100
Subject: [Buildroot] [git commit] gdb: disable texinfo/documentation
Message-ID: <20131128213428.78C339B304@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df8d0b90eb78fcafe2f30ffd8483309a5a38c0be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes bug #6554

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/gdb.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
