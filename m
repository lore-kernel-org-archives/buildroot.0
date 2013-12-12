From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 12 Dec 2013 12:26:58 +0000
Subject: [Buildroot] [PATCH v3] knock: Fix build failure due to missing
	README file.
Message-ID: <1386851218-19360-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apply upstream patch: 306a696c0882f28a5cd2e41d392c3a6ed14d45f4

The build process fails because Makefile.am includes README as part of
the documentation files, but actually it doesn't exist:

make[2]: *** No rule to make target `README', needed by `all-am'. Stop.

The right file is README.md, so making that replacement to Makefile.am
fixes the problem.

Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../knock/knock-001-Fix-missing-README-file.patch  |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 package/knock/knock-001-Fix-missing-README-file.patch

diff --git a/package/knock/knock-001-Fix-missing-README-file.patch b/package/knock/knock-001-Fix-missing-README-file.patch
new file mode 100644
index 0000000..8af7405
--- /dev/null
+++ b/package/knock/knock-001-Fix-missing-README-file.patch
@@ -0,0 +1,34 @@
+From 306a696c0882f28a5cd2e41d392c3a6ed14d45f4 Mon Sep 17 00:00:00 2001
+From: vriera <Vincent.Riera@imgtec.com>
+Date: Tue, 10 Dec 2013 12:40:13 +0000
+Subject: [PATCH] Update Makefile.am
+
+Fix build failure due to missing README file.
+
+The build process fails because Makefile.am includes README as part of the documentation files, but actually it doesn't exist:
+
+make[2]: *** No rule to make target `README', needed by `all-am'. Stop.
+
+The right file is README.md, so making that replacement to Makefile.am fixes the problem.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index b46e8c4..1a95e90 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -10,7 +10,7 @@ man_MANS += doc/knockd.1
+ sysconf_DATA = knockd.conf
+ endif
+ 
+-dist_doc_DATA = README TODO ChangeLog COPYING
++dist_doc_DATA = README.md TODO ChangeLog COPYING
+ 
+ knock_SOURCES = src/knock.c
+ knockd_SOURCES = src/knockd.c src/list.c src/list.h
+-- 
+1.8.5.1
+
-- 
1.7.1
