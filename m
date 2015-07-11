From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 12:26:42 +0200
Subject: [Buildroot] [git commit] ejabberd: fix package version
Message-ID: <20150711103326.14131803E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2eaf98df383aa6bb305f8907d1427dafd5f4d9be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure tries to guess the version from the last git tag, which
is incorrect here as we are not inside ejabberd git repository.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ejabberd/0010-fix-package-version.patch |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/ejabberd/0010-fix-package-version.patch b/package/ejabberd/0010-fix-package-version.patch
new file mode 100644
index 0000000..c8b3c10
--- /dev/null
+++ b/package/ejabberd/0010-fix-package-version.patch
@@ -0,0 +1,19 @@
+Description: fix package version
+ Without this patch, the configure tries to guess the version from the
+ last git tag, which is incorrect here as we are not inside ejabberd
+ git repository.
+Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
+
+diff --git a/configure.ac b/configure.ac
+index e7bb43b..e7faac4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2,7 +2,7 @@
+ # Process this file with autoconf to produce a configure script.
+ 
+ AC_PREREQ(2.53)
+-AC_INIT(ejabberd, m4_esyscmd([echo `git describe --tags 2>/dev/null || echo 0.0` | sed 's/-g.*//;s/-/./' | tr -d '\012']), [ejabberd at process-one.net], [ejabberd])
++AC_INIT(ejabberd, [15.06], [ejabberd at process-one.net], [ejabberd])
+ REQUIRE_ERLANG_MIN="5.9.1 (Erlang/OTP R15B01)"
+ REQUIRE_ERLANG_MAX="9.0.0 (No Max)"
+ 
