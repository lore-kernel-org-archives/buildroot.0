From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed,  8 Jul 2015 11:54:16 +0200
Subject: [Buildroot] [PATCH 03/11] ejabberd: fix package version
In-Reply-To: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
References: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1436349264-11797-4-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure tries to guess the version from the last git tag, which
is incorrect here as we are not inside ejabberd git repository.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/ejabberd/0010-fix-package-version.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/ejabberd/0010-fix-package-version.patch

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
-- 
2.1.4
