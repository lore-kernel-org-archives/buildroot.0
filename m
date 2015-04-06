From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 23:27:45 +0200
Subject: [Buildroot] [git commit] package/thrift: fix libtool warning
Message-ID: <20150406212804.1E6C6819BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f9f75af2a28dc54d1c8fa96744e8a98c06a44d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport an upstream patch.

[Thomas: slightly fix the patch according to Arnout comments.]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-check-minimum-required-version-of-automa.patch |   47 ++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/package/thrift/0004-THRIFT-3071-check-minimum-required-version-of-automa.patch b/package/thrift/0004-THRIFT-3071-check-minimum-required-version-of-automa.patch
new file mode 100644
index 0000000..ec2e225
--- /dev/null
+++ b/package/thrift/0004-THRIFT-3071-check-minimum-required-version-of-automa.patch
@@ -0,0 +1,47 @@
+From 9b03d2b02d32302008d2bd0218b31b9a0ca5a748 Mon Sep 17 00:00:00 2001
+From: Jens Geyer <jensg@apache.org>
+Date: Fri, 3 Apr 2015 12:37:03 +0200
+Subject: [PATCH] THRIFT-3071 check minimum required version of automake in bootstrap.sh
+Client: Build process
+Patch: James E. King, III <jim.king@simplivity.com>
+
+This closes #421
+
+- remove a warning when using libtool
+
+"libtoolize: Consider adding 'AC_CONFIG_MACRO_DIRS([./aclocal])' to configure.ac,"
+
+[Romain:
+  - This is upstream commit 4aa95df383bfa13c46a4dc0b41672ec29d476300
+  - remove the part for bootstrap.sh which is not
+    bundled in thrift archive.
+  - fix the commit log accordingly]
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 5fa611e..8daeb03 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -18,6 +18,7 @@
+ #
+ 
+ AC_PREREQ(2.65)
++AC_CONFIG_MACRO_DIR([./aclocal])
+ 
+ AC_INIT([thrift], [0.9.2])
+ 
+@@ -540,6 +541,7 @@ AC_CHECK_FUNCS([memset])
+ AC_CHECK_FUNCS([mkdir])
+ AC_CHECK_FUNCS([realpath])
+ AC_CHECK_FUNCS([select])
++AC_CHECK_FUNCS([setlocale])
+ AC_CHECK_FUNCS([socket])
+ AC_CHECK_FUNCS([strchr])
+ AC_CHECK_FUNCS([strdup])
+-- 
+1.9.3
+
