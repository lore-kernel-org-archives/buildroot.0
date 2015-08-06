From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 08:31:25 +0200
Subject: [Buildroot] [git commit] package/mono: fixing multiple definition
	of vasprintf
Message-ID: <20150806063135.6C3E281E72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ed77ba8785cc277411efb3f64f5dd39afbb7d94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes the detection of an available
vasprintf function, this way the internal vasprintf
function is not compiled.

Fixes http://autobuild.buildroot.net/results/3ab2b8667e5657bf07f55dd04dd857167ab4c62a/
      http://autobuild.buildroot.net/results/3ab2b8667e5657bf07f55dd04dd857167ab4c62a/

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...4-fixing-initialization-of-have-vasprintf.patch |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/mono/0004-fixing-initialization-of-have-vasprintf.patch b/package/mono/0004-fixing-initialization-of-have-vasprintf.patch
new file mode 100644
index 0000000..e01a6f0
--- /dev/null
+++ b/package/mono/0004-fixing-initialization-of-have-vasprintf.patch
@@ -0,0 +1,23 @@
+From 1c3d615d93b20d10c2729478d5104977dd9af23f Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Wed, 5 Aug 2015 12:59:45 +0200
+Subject: [PATCH] Fixing initialization of have_vasprintf
+
+This patch initialize properly have_vasprintf in case vasprint function is found.
+Solves multiple definition of `vasprintf' error in case vasprint is not properly detected.
+---
+ eglib/configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/eglib/configure.ac b/eglib/configure.ac
+index 5281419..4bf91e5 100644
+--- a/eglib/configure.ac
++++ b/eglib/configure.ac
+@@ -135,6 +135,7 @@ AC_CHECK_SIZEOF(void *)
+ AC_CHECK_SIZEOF(long)
+ AC_CHECK_SIZEOF(long long)
+ AC_CHECK_FUNCS(strlcpy stpcpy strtok_r rewinddir vasprintf)
++AC_CHECK_FUNC(vasprintf, have_vasprintf=yes)
+ AC_CHECK_FUNCS(getrlimit)
+ 
+ #
