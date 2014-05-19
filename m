From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 May 2014 00:07:18 +0200
Subject: [Buildroot] [PATCH 1/2] gdb: fix build of host-gdb 7.4
Message-ID: <1400537239-24812-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build of host-gdb 7.4 fails due to some texinfo issue. To avoid
that, use the same trick as is used for the target variant of gdb:
tell gdb that makeinfo is missing.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 678c17c..c3fca40 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -50,6 +50,9 @@ GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 endif
 
+HOST_GDB_CONF_ENV = \
+	ac_cv_prog_MAKEINFO=missing
+
 GDB_CONF_ENV = \
 	ac_cv_prog_MAKEINFO=missing \
 	ac_cv_type_uintptr_t=yes \
-- 
1.9.3
