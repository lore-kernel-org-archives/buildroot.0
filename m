From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Feb 2013 22:53:49 +0100
Subject: [Buildroot] [git commit] manual: minor fix in patch-policy.txt
Message-ID: <20130217221225.D8B339AB44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58e2e9d8048907acda3fe14d03a6094a3dd05370
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Drop *.patch.<arch> description as noted by Thomas]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/patch-policy.txt |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index 78ac5b6..14c6efc 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -34,7 +34,7 @@ Most patches are provided within Buildroot, in the package
 directory; these typically aim to fix cross-compilation, libc support,
 or other such issues.
 
-These patch files should be named +<packagename>-*.patch+.
+These patch files should be named +<packagename>-<description>.patch+.
 
 A +series+ file, as used by +quilt+, may also be added in the
 package directory. In that case, the +series+ file defines the patch
@@ -56,9 +56,8 @@ How patches are applied
 * If a +series+ file exists in the package directory, then patches are
   applied according to the +series+ file;
 +
-* Otherwise, patch files matching `<packagename>-*.patch` or
-  `<packagename>-*.patch.<arch>` (where +<arch>+ is the architecture
-  name) are applied following the +ls+ command order.
+* Otherwise, patch files matching `<packagename>-*.patch` are applied
+  following the +ls+ command order.
 
 . Run the +<packagename>_POST_PATCH_HOOKS+ commands if defined.
 
