From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:36:21 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] libselinux: use correct
 name and content for patch 0004
Message-ID: <20180824082840.3C9428E5C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=722dd2db431dd3632c1f84e4d522d7b422998d95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Commit 6288409642d8368104f916bd264d2cb042942dfa ("libselinux: add
patch to fix build with gcc < 4.7") introduced a patch, but its file
name was incorrect, so it was never applied. In addition, the patch
was generated against the Git repository of SELinux, which includes
all projects, and therefore it doesn't apply to the libselinux source
code extracted from the tarball: the "libselinux/" component path
needs to be removed from the patch.

This commit fixes both problems, which should finally and really fix:

  http://autobuild.buildroot.net/results/c3272566bb808e43bb77ec59cfe596f7e0fe9a64/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cb8d1743cab1449b91afbabe38c64cbb85bef6ba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...t => 0004-Fix-build-break-around-__atomic_-with-GCC-4.7.patch} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libselinux/0004-Fix-build-break-around-__atomic_-with-GCC-4.7.patch.txt b/package/libselinux/0004-Fix-build-break-around-__atomic_-with-GCC-4.7.patch
similarity index 91%
rename from package/libselinux/0004-Fix-build-break-around-__atomic_-with-GCC-4.7.patch.txt
rename to package/libselinux/0004-Fix-build-break-around-__atomic_-with-GCC-4.7.patch
index 85bd064066..88e3a79332 100644
--- a/package/libselinux/0004-Fix-build-break-around-__atomic_-with-GCC-4.7.patch.txt
+++ b/package/libselinux/0004-Fix-build-break-around-__atomic_-with-GCC-4.7.patch
@@ -14,13 +14,13 @@ pthread_mutex_unlock() "synchronize memory with respect to other threads"...)
 
 Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
 ---
- libselinux/src/label_file.h | 18 ++++++++++++++++++
+ src/label_file.h | 18 ++++++++++++++++++
  1 file changed, 18 insertions(+)
 
-diff --git a/libselinux/src/label_file.h b/libselinux/src/label_file.h
+diff --git a/src/label_file.h b/src/label_file.h
 index 2fa85474..47859baf 100644
---- a/libselinux/src/label_file.h
-+++ b/libselinux/src/label_file.h
+--- a/src/label_file.h
++++ b/src/label_file.h
 @@ -351,8 +351,14 @@ static inline int compile_regex(struct saved_data *data, struct spec *spec,
  	 * init_routine does not take a parameter, it's not possible
  	 * to use, so we generate the same effect with atomics and a
