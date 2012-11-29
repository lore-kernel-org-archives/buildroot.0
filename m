From: James Hogan <james.hogan@imgtec.com>
Date: Thu, 29 Nov 2012 17:11:58 +0000
Subject: [Buildroot] [PATCH 1/1] strace: remove undef-CTL_PROC patch
Message-ID: <1354209118-12653-1-git-send-email-james.hogan@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is no longer necessary since strace-v4.5.15 which always
defines CTL_PROC. Specifically strace git commit
35a55785ea8ff44d214af52085e3a5ea624730aa.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
---
 package/strace/strace-undef-CTL_PROC.patch |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)
 delete mode 100644 package/strace/strace-undef-CTL_PROC.patch

diff --git a/package/strace/strace-undef-CTL_PROC.patch b/package/strace/strace-undef-CTL_PROC.patch
deleted file mode 100644
index d841999..0000000
--- a/package/strace/strace-undef-CTL_PROC.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- a/system.c
-+++ b/system.c
-@@ -1614,7 +1614,9 @@ static const struct xlat sysctl_root[] =
- 	{ CTL_KERN, "CTL_KERN" },
- 	{ CTL_VM, "CTL_VM" },
- 	{ CTL_NET, "CTL_NET" },
-+#ifdef CTL_PROC
- 	{ CTL_PROC, "CTL_PROC" },
-+#endif
- 	{ CTL_FS, "CTL_FS" },
- 	{ CTL_DEBUG, "CTL_DEBUG" },
- 	{ CTL_DEV, "CTL_DEV" },
-- 
1.7.7.6
