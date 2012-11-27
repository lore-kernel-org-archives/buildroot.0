From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 27 Nov 2012 09:30:11 +0100
Subject: [Buildroot] [PATCH for-2012.11 2/4] manual: more warnings to not
	use output/target
In-Reply-To: <1354005013-28626-1-git-send-email-arnout@mind.be>
References: <1354005013-28626-1-git-send-email-arnout@mind.be>
Message-ID: <1354005013-28626-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .topdeps              |    2 +-
 .topmsg               |   16 +---------------
 docs/manual/using.txt |    3 ++-
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/.topdeps b/.topdeps
index 1f7391f..d46ee1c 100644
--- a/.topdeps
+++ b/.topdeps
@@ -1 +1 @@
-master
+t/manual
diff --git a/.topmsg b/.topmsg
index f070122..367c0df 100644
--- a/.topmsg
+++ b/.topmsg
@@ -1,18 +1,4 @@
 From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
-Subject: [PATCH] manual: various fixes
-
-Various minor linguistic fixes and consistency and correctness
-improvements.
-
-Also removing some sentences that are not or no longer relevant.
+Subject: [PATCH] manual: more warnings to not use output/target
 
 Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
-Since you need a lot of context to review documentation, I increased the
-context to 5 lines.
-
-I originally planned to include only trivial fixes, but there turn
-out to be a few more invasive changes. If necessary, I can split the
-patch into trivial and potentially-controversial. I haven't done that
-yet because I wanted to get this patch out ASAP for the 2012.11 release.
-Unless I get some ACKs earlier, I'll split the patch tomorrow.
diff --git a/docs/manual/using.txt b/docs/manual/using.txt
index 6e144d0..857aa33 100644
--- a/docs/manual/using.txt
+++ b/docs/manual/using.txt
@@ -86,7 +86,8 @@ This directory contains several subdirectories:
 * +target/+ which contains 'almost' the complete root filesystem for
   the target: everything needed is present except the device files in
   +/dev/+ (Buildroot can't create them because Buildroot doesn't run
-  as root and doesn't want to run as root). Therefore, this directory
+  as root and doesn't want to run as root). Also, it doesn't have the correct
+  permissions (e.g. setuid for the busybox binary). Therefore, this directory
   *should not be used on your target*.  Instead, you should use one of
   the images built in the +images/+ directory. If you need an
   extracted image of the root filesystem for booting over NFS, then
-- 
1.7.10.4
