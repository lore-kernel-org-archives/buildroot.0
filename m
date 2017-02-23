From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:52:00 +0100
Subject: [Buildroot] [git commit] package/sslh: fix a patch, drop the other
Message-ID: <20170223215204.C7CAC816A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=911ac036e0e09149e31d5b67a71e4a896e2d8fdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It turned out that the troll character U+c2a0 was added by our own
patch.

So fix it amd drop our second patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ecure-version-while-building-sslh-in-a-larger-git-t.patch |  4 +++-
 package/sslh/0002-replace-U+c2a0.patch                       | 12 ------------
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/package/sslh/0001-secure-version-while-building-sslh-in-a-larger-git-t.patch b/package/sslh/0001-secure-version-while-building-sslh-in-a-larger-git-t.patch
index 5cb8ce2..d23bc9f 100644
--- a/package/sslh/0001-secure-version-while-building-sslh-in-a-larger-git-t.patch
+++ b/package/sslh/0001-secure-version-while-building-sslh-in-a-larger-git-t.patch
@@ -12,6 +12,8 @@ subtree only, this patch adds a check : a .git directory has to exist at
 the root of the project to enable git-extracted version string.
 
 Signed-off-by: David Bachelart <david.bachelart@bbright.com>
+[yann.morin.1998 at free.fr: fix troll character U+c2a0]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
  genver.sh | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -34,7 +36,7 @@ index 79fd0a0..051e57b 100755
  fi
  
 -if head=`git rev-parse --verify HEAD 2>/dev/null`; then
-+if [ -d .git ]??&& head=`git rev-parse --verify HEAD 2>/dev/null`; then
++if [ -d .git ] && head=`git rev-parse --verify HEAD 2>/dev/null`; then
  	# generate the version info based on the tag
  	release=`(git describe --tags || git --describe || git describe --all --long) \
  		2>/dev/null | tr -d '\n'`
diff --git a/package/sslh/0002-replace-U+c2a0.patch b/package/sslh/0002-replace-U+c2a0.patch
deleted file mode 100644
index 38093fa..0000000
--- a/package/sslh/0002-replace-U+c2a0.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -durN sslh-v1.18.orig/genver.sh sslh-v1.18/genver.sh
---- sslh-v1.18.orig/genver.sh	2017-02-21 22:03:40.849161283 +0100
-+++ sslh-v1.18/genver.sh	2017-02-21 22:03:59.173402356 +0100
-@@ -25,7 +25,7 @@
-         fi
- fi
- 
--if [ -d .git ]??&& head=`git rev-parse --verify HEAD 2>/dev/null`; then
-+if [ -d .git ] && head=`git rev-parse --verify HEAD 2>/dev/null`; then
- 	# generate the version info based on the tag
- 	release=`(git describe --tags || git --describe || git describe --all --long) \
- 		2>/dev/null | tr -d '\n'`
