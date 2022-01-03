Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82446C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 22:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E978C403FB;
	Mon,  3 Jan 2022 22:50:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 110nthGH_ToK; Mon,  3 Jan 2022 22:50:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB995405F5;
	Mon,  3 Jan 2022 22:50:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 294041BF358
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 22:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1952E4089A
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 22:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id By4cDWrgw7H6 for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 22:50:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FE1D40895
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 22:50:46 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id s1so72461455wra.6
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 14:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RAeG0cKArSYGGATmCSXK348xPmVrUa2qjt8JxHDxwec=;
 b=Tb5nRGImeAld1TUt4/A14W/NcIvGsuQTxAzAolf75lj0hjk+VbQBB6PTOy6MeEixwg
 27ddwMvmGPgi2J+c6PvO8+7A7TG8RmJJbfqaij0L4/zHEkzFpQuVde6lBVPs4VOtc1nF
 v6MKOmIlgSMj3MmYOKT0Cif0uymVyxjS/vsDT2NpGO0mxoeBKQ+r7DkDepEn0mhTYMoe
 j9KFsSBVDny4S4P6RxuxPSUjy4dtXd/oqPcOU5VFvapBPijoA2P1TsjhCl+hS4Mf8WgE
 qw5EEmIFXxzVBs3zxTiP4/OqAI9DRLFKONAGbv0ESnwubRDbBpTGpvAmqBSyfB2IoVFZ
 h8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RAeG0cKArSYGGATmCSXK348xPmVrUa2qjt8JxHDxwec=;
 b=mNOSnjz3JzyRXAyh9IuDzCOVsWh3lT9WqdBo29hQlNl5RKYD/Tc9f/i54tvNKSqkd+
 /+P/76r5O6CUXqQNSEhH2CPipaL2mXKH0O/N9SaGhKivHRuIVQKiar0NCLrJzutBdO4E
 dfjTaNpXvrnT3ixQbk7QtibZPkgZs9NuJ94XVq/6LxkETHeA+Zy2PmIMy/M+OB3Dpi5E
 0VCq5kDcb0w4xOp598VsdyLEV+6m0YEEq4NikHX7qoJMh02kr34UtpLWc+kyNCajL5N7
 SCgeOdfQ+6V0UCCF+2vDUMSYtn9ekb+ti8dgN+97VWQcwkRnkPVe+21tqnbTPV23Lxj/
 gKIg==
X-Gm-Message-State: AOAM5312O/4gnTkuxdic8weK0DlCNUEDDpzzZaTF2Ea4dRj1xFProsOj
 ZWa2QsnQD8pYwUb2u379qfvIi/NYtn4=
X-Google-Smtp-Source: ABdhPJzwFN0ZSmK+X7dNGc0r0L8PO+SJd2n9aGp0gtzzOchmnig6YBqWnv+u8SAi4NlAwmpaoFxuig==
X-Received: by 2002:adf:f48e:: with SMTP id l14mr40574064wro.88.1641250244436; 
 Mon, 03 Jan 2022 14:50:44 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 1sm29458969wrb.13.2022.01.03.14.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 14:50:44 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jan 2022 23:50:41 +0100
Message-Id: <20220103225041.13925-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/zfs: fix python3 version check
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport a patch to fix the python 3 version check that
broke the build since the python 3.10 version bump.

Add host-python-packaging dependency since the backport
add "from packaging import version" while checking the
python version.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1935414730
https://gitlab.com/buildroot.org/buildroot/-/jobs/1935415049

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...law-in-the-Python-3-version-checking.patch | 106 ++++++++++++++++++
 package/zfs/zfs.mk                            |   5 +-
 2 files changed, 109 insertions(+), 2 deletions(-)
 create mode 100644 package/zfs/0001-Correct-a-flaw-in-the-Python-3-version-checking.patch

diff --git a/package/zfs/0001-Correct-a-flaw-in-the-Python-3-version-checking.patch b/package/zfs/0001-Correct-a-flaw-in-the-Python-3-version-checking.patch
new file mode 100644
index 0000000000..70978f9f4d
--- /dev/null
+++ b/package/zfs/0001-Correct-a-flaw-in-the-Python-3-version-checking.patch
@@ -0,0 +1,106 @@
+From 4dc82e9d503518a00e54972be7c0cb5f342f985e Mon Sep 17 00:00:00 2001
+From: Rich Ercolani <214141+rincebrain@users.noreply.github.com>
+Date: Tue, 8 Jun 2021 20:20:16 -0400
+Subject: [PATCH] Correct a flaw in the Python 3 version checking
+
+It turns out the ax_python_devel.m4 version check assumes that
+("3.X+1.0" >= "3.X.0") is True in Python, which is not when X+1
+is 10 or above and X is not. (Also presumably X+1=100 and ...)
+
+So let's remake the check to behave consistently, using the
+"packaging" or (if absent) the "distlib" modules.
+
+(Also, update the Github workflows to use the new packages.)
+
+Reviewed-by: Brian Behlendorf <behlendorf1@llnl.gov>
+Reviewed-by: John Kennedy <john.kennedy@delphix.com>
+Signed-off-by: Rich Ercolani <rincebrain@gmail.com>
+Closes: #12073
+(cherry picked from commit 08cd0717359b1a18693e3c8e6d6e5a2819b35a48)
+[Romain: drop rpm spec and github workflows changes]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ config/always-pyzfs.m4    | 15 +++++++++++++++
+ config/ax_python_devel.m4 | 33 +++++++++++++++++++++++++++------
+ 2 files changed, 42 insertions(+), 6 deletions(-)
+
+diff --git a/config/always-pyzfs.m4 b/config/always-pyzfs.m4
+index 76e07b593..fa39fd885 100644
+--- a/config/always-pyzfs.m4
++++ b/config/always-pyzfs.m4
+@@ -46,6 +46,21 @@ AC_DEFUN([ZFS_AC_CONFIG_ALWAYS_PYZFS], [
+ 	])
+ 	AC_SUBST(DEFINE_PYZFS)
+ 
++	dnl #
++	dnl # Python "packaging" (or, failing that, "distlib") module is required to build and install pyzfs
++	dnl #
++	AS_IF([test "x$enable_pyzfs" = xcheck -o "x$enable_pyzfs" = xyes], [
++		ZFS_AC_PYTHON_MODULE([packaging], [], [
++			ZFS_AC_PYTHON_MODULE([distlib], [], [
++				AS_IF([test "x$enable_pyzfs" = xyes], [
++					AC_MSG_ERROR("Python $PYTHON_VERSION packaging and distlib modules are not installed")
++				], [test "x$enable_pyzfs" != xno], [
++					enable_pyzfs=no
++				])
++			])
++		])
++	])
++
+ 	dnl #
+ 	dnl # Require python-devel libraries
+ 	dnl #
+diff --git a/config/ax_python_devel.m4 b/config/ax_python_devel.m4
+index c51b45b7d..cdfbbf81f 100644
+--- a/config/ax_python_devel.m4
++++ b/config/ax_python_devel.m4
+@@ -97,9 +97,18 @@ AC_DEFUN([AX_PYTHON_DEVEL],[
+ 	# Check for a version of Python >= 2.1.0
+ 	#
+ 	AC_MSG_CHECKING([for a version of Python >= '2.1.0'])
+-	ac_supports_python_ver=`$PYTHON -c "import sys; \
+-		ver = sys.version.split ()[[0]]; \
+-		print (ver >= '2.1.0')"`
++	ac_supports_python_ver=`cat<<EOD | $PYTHON -
++from __future__ import print_function;
++import sys;
++try:
++	from packaging import version;
++except ImportError:
++	from distlib import version;
++ver = sys.version.split ()[[0]];
++(tst_cmp, tst_ver) = ">= '2.1.0'".split ();
++tst_ver = tst_ver.strip ("'");
++eval ("print (version.LegacyVersion (ver)"+ tst_cmp +"version.LegacyVersion (tst_ver))")
++EOD`
+ 	if test "$ac_supports_python_ver" != "True"; then
+ 		if test -z "$PYTHON_NOVERSIONCHECK"; then
+ 			AC_MSG_RESULT([no])
+@@ -126,9 +135,21 @@ to something else than an empty string.
+ 	#
+ 	if test -n "$1"; then
+ 		AC_MSG_CHECKING([for a version of Python $1])
+-		ac_supports_python_ver=`$PYTHON -c "import sys; \
+-			ver = sys.version.split ()[[0]]; \
+-			print (ver $1)"`
++		# Why the strip ()?  Because if we don't, version.parse
++		# will, for example, report 3.10.0 >= '3.11.0'
++		ac_supports_python_ver=`cat<<EOD | $PYTHON -
++
++from __future__ import print_function;
++import sys;
++try:
++	from packaging import version;
++except ImportError:
++	from distlib import version;
++ver = sys.version.split ()[[0]];
++(tst_cmp, tst_ver) = "$1".split ();
++tst_ver = tst_ver.strip ("'");
++eval ("print (version.LegacyVersion (ver)"+ tst_cmp +"version.LegacyVersion (tst_ver))")
++EOD`
+ 		if test "$ac_supports_python_ver" = "True"; then
+ 		   AC_MSG_RESULT([yes])
+ 		else
+-- 
+2.31.1
+
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 3b1afb419a..0e7e3e4e74 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -11,6 +11,7 @@ ZFS_LICENSE_FILES = LICENSE COPYRIGHT
 ZFS_CPE_ID_VENDOR = openzfs
 ZFS_CPE_ID_PRODUCT = openzfs
 
+# 0001-Correct-a-flaw-in-the-Python-3-version-checking.patch
 ZFS_AUTORECONF = YES
 
 ZFS_DEPENDENCIES = libaio openssl udev util-linux zlib
@@ -39,7 +40,7 @@ endif
 # The optional PyZFS uses different scripts depending on the python
 # version (ex: arc_summary2 or arc_summary3).
 ifeq ($(BR2_PACKAGE_PYTHON),y)
-ZFS_DEPENDENCIES += python python-setuptools host-python-cffi
+ZFS_DEPENDENCIES += python python-setuptools host-python-cffi host-python-packaging
 ZFS_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/usr/bin/python2 \
 	PYTHON_CPPFLAGS="`$(STAGING_DIR)/usr/bin/python2-config --includes`" \
@@ -47,7 +48,7 @@ ZFS_CONF_ENV += \
 	PYTHON_SITE_PKG="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
 ZFS_CONF_OPTS += --enable-pyzfs
 else ifeq ($(BR2_PACKAGE_PYTHON3),y)
-ZFS_DEPENDENCIES += python3 python-setuptools host-python-cffi
+ZFS_DEPENDENCIES += python3 python-setuptools host-python-cffi host-python-packaging
 ZFS_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/usr/bin/python3 \
 	PYTHON_CPPFLAGS="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
