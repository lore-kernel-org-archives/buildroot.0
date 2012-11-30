From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Nov 2012 16:32:38 -0800
Subject: [Buildroot] [git commit] strace: remove undef-CTL_PROC patch
Message-ID: <20121130070800.8D58E993D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d490bb6c371468d027e228a445c258af4a272ba7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is no longer necessary since strace-v4.5.15 which always
defines CTL_PROC. Specifically strace git commit
35a55785ea8ff44d214af52085e3a5ea624730aa.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/strace/strace-undef-CTL_PROC.patch |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

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
