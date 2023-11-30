Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6855AC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2314C6F4B5;
	Thu, 30 Nov 2023 08:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2314C6F4B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9SBjgXVoOoEg; Thu, 30 Nov 2023 08:32:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F6B26F4B1;
	Thu, 30 Nov 2023 08:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F6B26F4B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 042C61BF23B
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CB3B8444C
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CB3B8444C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZfB1kdHgssj for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:31:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E055184491
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E055184491
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C68B387602; Thu, 30 Nov 2023 08:31:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 09:12:15 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: b8e0734ebf3ecf870333af3709903c369b29304c
X-Git-Newrev: 5e8804218d3c0c8c0bc957f6ec87fce80b8a576a
X-Patchwork-Hint: ignore
Message-Id: <20231130083133.C68B387602@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/zfs: bump version
 to 2.1.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4498540125153495835=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4498540125153495835==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5e8804218d3c0c8c0bc957f6ec87fce80b8a576a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Removed backported patch:
- 0001-removal-of-LegacyVersion-broke-ax_python_dev.m4.patch

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cfff4e120f18322df676160caa9a0162644d3f9a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...l-of-LegacyVersion-broke-ax_python_dev.m4.patch | 134 ---------------------
 package/zfs/zfs.hash                               |   4 +-
 package/zfs/zfs.mk                                 |   2 +-
 3 files changed, 3 insertions(+), 137 deletions(-)

diff --git a/package/zfs/0001-removal-of-LegacyVersion-broke-ax_python_dev.m4.patch b/package/zfs/0001-removal-of-LegacyVersion-broke-ax_python_dev.m4.patch
deleted file mode 100644
index c7c4dc7d10..0000000000
--- a/package/zfs/0001-removal-of-LegacyVersion-broke-ax_python_dev.m4.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From ad2c8e13e42bc2f396cce117d17a227dadedd476 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Thu, 5 Jan 2023 11:04:24 -0800
-Subject: [PATCH] removal of LegacyVersion broke ax_python_dev.m4
-
-The 22.0 release of the python `packaging` package removed the
-`LegacyVersion` trait, causing ZFS to no longer compile.
-
-This commit replaces the sections of `ax_python_dev.m4` that rely on
-`LegacyVersion` with updated implementations from the upstream
-`autoconf-archive`.
-
-Reviewed-by: Brian Behlendorf <behlendorf1@llnl.gov>
-Signed-off-by: Matthew Ahrens <mahrens@delphix.com>
-Closes #14297
-Upstream: https://github.com/openzfs/zfs/commit/b72efb751147ab57afd1588a15910f547cb22600
-[Romain: backport to 2.1.7]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- config/ax_python_devel.m4 | 71 +++++++++++++++++++--------------------
- 1 file changed, 35 insertions(+), 36 deletions(-)
-
-diff --git a/config/ax_python_devel.m4 b/config/ax_python_devel.m4
-index 7adcf01a0..9eef45065 100644
---- a/config/ax_python_devel.m4
-+++ b/config/ax_python_devel.m4
-@@ -97,23 +97,13 @@ AC_DEFUN([AX_PYTHON_DEVEL],[
- 	# Check for a version of Python >= 2.1.0
- 	#
- 	AC_MSG_CHECKING([for a version of Python >= '2.1.0'])
--	ac_supports_python_ver=`cat<<EOD | $PYTHON -
--from __future__ import print_function;
--import sys;
--try:
--	from packaging import version;
--except ImportError:
--	from distlib import version;
--ver = sys.version.split ()[[0]];
--(tst_cmp, tst_ver) = ">= '2.1.0'".split ();
--tst_ver = tst_ver.strip ("'");
--eval ("print (version.LegacyVersion (ver)"+ tst_cmp +"version.LegacyVersion (tst_ver))")
--EOD`
-+	ac_supports_python_ver=`$PYTHON -c "import sys; \
-+		ver = sys.version.split ()[[0]]; \
-+		print (ver >= '2.1.0')"`
- 	if test "$ac_supports_python_ver" != "True"; then
- 		if test -z "$PYTHON_NOVERSIONCHECK"; then
- 			AC_MSG_RESULT([no])
--			m4_ifvaln([$2],[$2],[
--				AC_MSG_FAILURE([
-+			AC_MSG_FAILURE([
- This version of the AC@&t@_PYTHON_DEVEL macro
- doesn't work properly with versions of Python before
- 2.1.0. You may need to re-run configure, setting the
-@@ -122,7 +112,6 @@ PYTHON_EXTRA_LIBS and PYTHON_EXTRA_LDFLAGS by hand.
- Moreover, to disable this check, set PYTHON_NOVERSIONCHECK
- to something else than an empty string.
- ])
--			])
- 		else
- 			AC_MSG_RESULT([skip at user request])
- 		fi
-@@ -131,37 +120,47 @@ to something else than an empty string.
- 	fi
- 
- 	#
--	# if the macro parameter ``version'' is set, honour it
-+	# If the macro parameter ``version'' is set, honour it.
-+	# A Python shim class, VPy, is used to implement correct version comparisons via
-+	# string expressions, since e.g. a naive textual ">= 2.7.3" won't work for
-+	# Python 2.7.10 (the ".1" being evaluated as less than ".3").
- 	#
- 	if test -n "$1"; then
- 		AC_MSG_CHECKING([for a version of Python $1])
--		# Why the strip ()?  Because if we don't, version.parse
--		# will, for example, report 3.10.0 >= '3.11.0'
--		ac_supports_python_ver=`cat<<EOD | $PYTHON -
--
--from __future__ import print_function;
--import sys;
--try:
--	from packaging import version;
--except ImportError:
--	from distlib import version;
--ver = sys.version.split ()[[0]];
--(tst_cmp, tst_ver) = "$1".split ();
--tst_ver = tst_ver.strip ("'");
--eval ("print (version.LegacyVersion (ver)"+ tst_cmp +"version.LegacyVersion (tst_ver))")
--EOD`
-+                cat << EOF > ax_python_devel_vpy.py
-+class VPy:
-+    def vtup(self, s):
-+        return tuple(map(int, s.strip().replace("rc", ".").split(".")))
-+    def __init__(self):
-+        import sys
-+        self.vpy = tuple(sys.version_info)
-+    def __eq__(self, s):
-+        return self.vpy == self.vtup(s)
-+    def __ne__(self, s):
-+        return self.vpy != self.vtup(s)
-+    def __lt__(self, s):
-+        return self.vpy < self.vtup(s)
-+    def __gt__(self, s):
-+        return self.vpy > self.vtup(s)
-+    def __le__(self, s):
-+        return self.vpy <= self.vtup(s)
-+    def __ge__(self, s):
-+        return self.vpy >= self.vtup(s)
-+EOF
-+		ac_supports_python_ver=`$PYTHON -c "import ax_python_devel_vpy; \
-+                        ver = ax_python_devel_vpy.VPy(); \
-+			print (ver $1)"`
-+                rm -rf ax_python_devel_vpy*.py* __pycache__/ax_python_devel_vpy*.py*
- 		if test "$ac_supports_python_ver" = "True"; then
--		   AC_MSG_RESULT([yes])
-+			AC_MSG_RESULT([yes])
- 		else
- 			AC_MSG_RESULT([no])
--			m4_ifvaln([$2],[$2],[
--				AC_MSG_ERROR([this package requires Python $1.
-+			AC_MSG_ERROR([this package requires Python $1.
- If you have it installed, but it isn't the default Python
- interpreter in your system path, please pass the PYTHON_VERSION
- variable to configure. See ``configure --help'' for reference.
- ])
--				PYTHON_VERSION=""
--			])
-+			PYTHON_VERSION=""
- 		fi
- 	fi
- 
--- 
-2.34.3
-
diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 0bce3817fe..3a73e5e94f 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.1.7/zfs-2.1.7.sha256.asc
-sha256  6462e63e185de6ff10c64ffa6ed773201a082f9dd13e603d7e8136fcb4aca71b  zfs-2.1.7.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.1.12/zfs-2.1.12.sha256.asc
+sha256  64daa26aed3e12c931f6f4413d7527c4ebdb8da35416b356152b5f9fdd4c6e6d  zfs-2.1.12.tar.gz
 sha256  96a27353fe717ff2c8b95deb8b009c4eb750303c6400e2d8a2582ab1ec12b25a  bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch
 
 # Hash for license files:
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 97e9442cf8..6d5d46a305 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.1.7
+ZFS_VERSION = 2.1.12
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_PATCH = https://github.com/openzfs/zfs/commit/bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch
 ZFS_LICENSE = CDDL

--===============4498540125153495835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4498540125153495835==--
