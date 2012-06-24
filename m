From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Jun 2012 10:59:37 +0200
Subject: [Buildroot] [git commit] ltrace: unbreak build on uClibc after
	REAL_GNU_TARGET_NAME removal
Message-ID: <20120624090100.575828A2E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3cd8183f875a56ccffd0adf951ae6caed4b8b0a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/b7456bb91a89f866f91e8c21a8ed5de98f25e6be

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ltrace/ltrace-0.6.0-uclibc.patch |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/ltrace/ltrace-0.6.0-uclibc.patch b/package/ltrace/ltrace-0.6.0-uclibc.patch
new file mode 100644
index 0000000..8bec2ae
--- /dev/null
+++ b/package/ltrace/ltrace-0.6.0-uclibc.patch
@@ -0,0 +1,22 @@
+[PATCH] configure.ac: Recognize linux-uclibc as well
+
+Ltrace works on uClibc as well as on glibc, so accept it.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ configure.ac |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: ltrace-0.6.0/configure.ac
+===================================================================
+--- ltrace-0.6.0.orig/configure.ac
++++ ltrace-0.6.0/configure.ac
+@@ -11,7 +11,7 @@
+ AC_CANONICAL_HOST
+ 
+ case "${host_os}" in
+-    linux-gnu*)	HOST_OS="linux-gnu" ;;
++    linux-gnu* | linux-uclibc*)	HOST_OS="linux-gnu" ;;
+     *)		AC_MSG_ERROR([unkown host-os ${host_osx}]) ;;
+ esac
+ AC_SUBST(HOST_OS)
