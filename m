From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 23:34:18 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] libnspr: fix nios2 and
 microblaze support patches
Message-ID: <20181125224645.C96AF88517@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59474ec97bedb7da34498a911a59ac78f2260b20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Commit c9e3d5b6c57 (libnspr: bump to version 4.20) did not refresh the
hunks touching the _linux.cfg file. As a result, these hunk were applied
to the wrong (x86 specific) place in that file, rendering them
ineffective. Refresh the patches to fix that.

Fixes:
http://autobuild.buildroot.net/results/2d1/2d1288e98a6459d84c2599c99b5617a2fde81f62/

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 56825a6518e46af5e0845760e20652426d6fe3b2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnspr/0001-nios2.patch      | 6 +++---
 package/libnspr/0002-microblaze.patch | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libnspr/0001-nios2.patch b/package/libnspr/0001-nios2.patch
index c08fbb272b..2a967c4593 100644
--- a/package/libnspr/0001-nios2.patch
+++ b/package/libnspr/0001-nios2.patch
@@ -9,9 +9,9 @@ Index: b/nspr/pr/include/md/_linux.cfg
 ===================================================================
 --- a/nspr/pr/include/md/_linux.cfg
 +++ b/nspr/pr/include/md/_linux.cfg
-@@ -1017,6 +1017,51 @@
- #define PR_BYTES_PER_WORD_LOG2   2
- #define PR_BYTES_PER_DWORD_LOG2  3
+@@ -1112,6 +1112,51 @@
+ #define PR_BYTES_PER_WORD_LOG2  3
+ #define PR_BYTES_PER_DWORD_LOG2 3
  
 +#elif defined(__nios2__)
 +
diff --git a/package/libnspr/0002-microblaze.patch b/package/libnspr/0002-microblaze.patch
index 46a4485277..4c23259d58 100644
--- a/package/libnspr/0002-microblaze.patch
+++ b/package/libnspr/0002-microblaze.patch
@@ -9,7 +9,7 @@ Index: b/nspr/pr/include/md/_linux.cfg
 ===================================================================
 --- a/nspr/pr/include/md/_linux.cfg
 +++ b/nspr/pr/include/md/_linux.cfg
-@@ -1062,6 +1062,56 @@
+@@ -1157,6 +1157,56 @@
  #define PR_BYTES_PER_WORD_LOG2   2
  #define PR_BYTES_PER_DWORD_LOG2  3
  
