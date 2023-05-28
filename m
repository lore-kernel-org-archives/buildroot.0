Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75ACC77B7C
	for <buildroot@archiver.kernel.org>; Sun, 28 May 2023 12:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D19741D73;
	Sun, 28 May 2023 12:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D19741D73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5sdk4XsHRrsf; Sun, 28 May 2023 12:42:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8981941903;
	Sun, 28 May 2023 12:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8981941903
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FF701BF350
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 12:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C19C41903
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 12:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C19C41903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPKUqnWxcho4 for <buildroot@lists.busybox.net>;
 Sun, 28 May 2023 12:42:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6565240034
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6565240034
 for <buildroot@buildroot.org>; Sun, 28 May 2023 12:42:14 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f6cbf02747so15442535e9.1
 for <buildroot@buildroot.org>; Sun, 28 May 2023 05:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685277732; x=1687869732;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I2Lq2n6zPlKnpg4mePphoA9PPKX2dRqsnKWIRWSlx/0=;
 b=KBKxqS1EyQEcL2+IKdHsFeHgPygUsCKblnrU2TA4BoCnEEO5WVy135lopVEpnOXjC0
 B5EbnuClVvKrRL1/RwZZ6HBCNqCngiRK+iPxawcwJBxIQAOY20Yv+9KAjR4RLv7wS3Rl
 cVleT0wvl9X+MnTHANaQRVA7ZGsy7cKG+8SHztwSo/TedSsour0uDXBdZz07FXzIWVWO
 bb6kUMYchFmVK6JpOAv/AXF2ewjN2lGivd4HI8A/5HLtQtHsFTzmMi0dQ6FfpihHvF4V
 Yh6Cdu7ANP1t5ON9s8TZkP9Om6QT/jMMbJDGaDByhoG/+MHSqWrdRKeCJoboraOunC1f
 ydoQ==
X-Gm-Message-State: AC+VfDyjebHHkoTOQF+bzsWJ4O5GPAHrdV6o3uvzKyEveCSmI8jcSUe8
 mV4ZWkRO5wHsl3+Jt877lqm71EgXYFA=
X-Google-Smtp-Source: ACHHUZ6qw/ajRaiJO6740GMn3dGsyZ/KimVZJs8U3vSiQOR7F8iv7F0U15l1AZ576t9lSDzsipfsEg==
X-Received: by 2002:a1c:7c19:0:b0:3f6:2391:be99 with SMTP id
 x25-20020a1c7c19000000b003f62391be99mr5847688wmc.35.1685277731883; 
 Sun, 28 May 2023 05:42:11 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 s26-20020a7bc39a000000b003f42328b5d9sm11045958wmj.39.2023.05.28.05.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 May 2023 05:42:11 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 May 2023 14:42:08 +0200
Message-Id: <20230528124208.2415189-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685277732; x=1687869732;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I2Lq2n6zPlKnpg4mePphoA9PPKX2dRqsnKWIRWSlx/0=;
 b=luNrLvRQtwmpfNOKwbOguJPwur2naZrZiY1GdcCon1sMyx5ytu++VP9nyn8NOSJuX6
 HOdVxZd1b7QYxRg9aIjIOG5Z0w4vCw0xwi4LDbZG8FImk92dS14F6ZLxwwdWb2rm8PY4
 sM6ZfcvUsAz2Er+BW7VsE1buqp9jY4dPWyCBebNaWn4ChNJxFdUKcUXviSHYnUY9CJpE
 qR7QegFUTYLMTIMMbt2jE+c69+ykAeJ3Tyb2ZLyiS4uvu2cB8+JeoEiQKBQn9TB5Byhv
 twJiuAzUNVC7XMEIrkrDsUyvgw51vXEQcm7wLX8s13tLZ82wVgmGmHOAriSV/DkFMBNu
 Z6PA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=luNrLvRQ
Subject: [Buildroot] [PATCH] package/zfs: fix python3 support check
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

Backport an upstream commit fixing the python3 support check

"The 22.0 release of the python `packaging` package removed the
 `LegacyVersion` trait, causing ZFS to no longer compile.

 This commit replaces the sections of `ax_python_dev.m4` that rely on
 `LegacyVersion` with updated implementations from the upstream
 `autoconf-archive`."

Add a comment above ZFS_AUTORECONF.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819411
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819410
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819409

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...LegacyVersion-broke-ax_python_dev.m4.patch | 134 ++++++++++++++++++
 package/zfs/zfs.mk                            |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 package/zfs/0001-removal-of-LegacyVersion-broke-ax_python_dev.m4.patch

diff --git a/package/zfs/0001-removal-of-LegacyVersion-broke-ax_python_dev.m4.patch b/package/zfs/0001-removal-of-LegacyVersion-broke-ax_python_dev.m4.patch
new file mode 100644
index 0000000000..c7c4dc7d10
--- /dev/null
+++ b/package/zfs/0001-removal-of-LegacyVersion-broke-ax_python_dev.m4.patch
@@ -0,0 +1,134 @@
+From ad2c8e13e42bc2f396cce117d17a227dadedd476 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Thu, 5 Jan 2023 11:04:24 -0800
+Subject: [PATCH] removal of LegacyVersion broke ax_python_dev.m4
+
+The 22.0 release of the python `packaging` package removed the
+`LegacyVersion` trait, causing ZFS to no longer compile.
+
+This commit replaces the sections of `ax_python_dev.m4` that rely on
+`LegacyVersion` with updated implementations from the upstream
+`autoconf-archive`.
+
+Reviewed-by: Brian Behlendorf <behlendorf1@llnl.gov>
+Signed-off-by: Matthew Ahrens <mahrens@delphix.com>
+Closes #14297
+Upstream: https://github.com/openzfs/zfs/commit/b72efb751147ab57afd1588a15910f547cb22600
+[Romain: backport to 2.1.7]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ config/ax_python_devel.m4 | 71 +++++++++++++++++++--------------------
+ 1 file changed, 35 insertions(+), 36 deletions(-)
+
+diff --git a/config/ax_python_devel.m4 b/config/ax_python_devel.m4
+index 7adcf01a0..9eef45065 100644
+--- a/config/ax_python_devel.m4
++++ b/config/ax_python_devel.m4
+@@ -97,23 +97,13 @@ AC_DEFUN([AX_PYTHON_DEVEL],[
+ 	# Check for a version of Python >= 2.1.0
+ 	#
+ 	AC_MSG_CHECKING([for a version of Python >= '2.1.0'])
+-	ac_supports_python_ver=`cat<<EOD | $PYTHON -
+-from __future__ import print_function;
+-import sys;
+-try:
+-	from packaging import version;
+-except ImportError:
+-	from distlib import version;
+-ver = sys.version.split ()[[0]];
+-(tst_cmp, tst_ver) = ">= '2.1.0'".split ();
+-tst_ver = tst_ver.strip ("'");
+-eval ("print (version.LegacyVersion (ver)"+ tst_cmp +"version.LegacyVersion (tst_ver))")
+-EOD`
++	ac_supports_python_ver=`$PYTHON -c "import sys; \
++		ver = sys.version.split ()[[0]]; \
++		print (ver >= '2.1.0')"`
+ 	if test "$ac_supports_python_ver" != "True"; then
+ 		if test -z "$PYTHON_NOVERSIONCHECK"; then
+ 			AC_MSG_RESULT([no])
+-			m4_ifvaln([$2],[$2],[
+-				AC_MSG_FAILURE([
++			AC_MSG_FAILURE([
+ This version of the AC@&t@_PYTHON_DEVEL macro
+ doesn't work properly with versions of Python before
+ 2.1.0. You may need to re-run configure, setting the
+@@ -122,7 +112,6 @@ PYTHON_EXTRA_LIBS and PYTHON_EXTRA_LDFLAGS by hand.
+ Moreover, to disable this check, set PYTHON_NOVERSIONCHECK
+ to something else than an empty string.
+ ])
+-			])
+ 		else
+ 			AC_MSG_RESULT([skip at user request])
+ 		fi
+@@ -131,37 +120,47 @@ to something else than an empty string.
+ 	fi
+ 
+ 	#
+-	# if the macro parameter ``version'' is set, honour it
++	# If the macro parameter ``version'' is set, honour it.
++	# A Python shim class, VPy, is used to implement correct version comparisons via
++	# string expressions, since e.g. a naive textual ">= 2.7.3" won't work for
++	# Python 2.7.10 (the ".1" being evaluated as less than ".3").
+ 	#
+ 	if test -n "$1"; then
+ 		AC_MSG_CHECKING([for a version of Python $1])
+-		# Why the strip ()?  Because if we don't, version.parse
+-		# will, for example, report 3.10.0 >= '3.11.0'
+-		ac_supports_python_ver=`cat<<EOD | $PYTHON -
+-
+-from __future__ import print_function;
+-import sys;
+-try:
+-	from packaging import version;
+-except ImportError:
+-	from distlib import version;
+-ver = sys.version.split ()[[0]];
+-(tst_cmp, tst_ver) = "$1".split ();
+-tst_ver = tst_ver.strip ("'");
+-eval ("print (version.LegacyVersion (ver)"+ tst_cmp +"version.LegacyVersion (tst_ver))")
+-EOD`
++                cat << EOF > ax_python_devel_vpy.py
++class VPy:
++    def vtup(self, s):
++        return tuple(map(int, s.strip().replace("rc", ".").split(".")))
++    def __init__(self):
++        import sys
++        self.vpy = tuple(sys.version_info)
++    def __eq__(self, s):
++        return self.vpy == self.vtup(s)
++    def __ne__(self, s):
++        return self.vpy != self.vtup(s)
++    def __lt__(self, s):
++        return self.vpy < self.vtup(s)
++    def __gt__(self, s):
++        return self.vpy > self.vtup(s)
++    def __le__(self, s):
++        return self.vpy <= self.vtup(s)
++    def __ge__(self, s):
++        return self.vpy >= self.vtup(s)
++EOF
++		ac_supports_python_ver=`$PYTHON -c "import ax_python_devel_vpy; \
++                        ver = ax_python_devel_vpy.VPy(); \
++			print (ver $1)"`
++                rm -rf ax_python_devel_vpy*.py* __pycache__/ax_python_devel_vpy*.py*
+ 		if test "$ac_supports_python_ver" = "True"; then
+-		   AC_MSG_RESULT([yes])
++			AC_MSG_RESULT([yes])
+ 		else
+ 			AC_MSG_RESULT([no])
+-			m4_ifvaln([$2],[$2],[
+-				AC_MSG_ERROR([this package requires Python $1.
++			AC_MSG_ERROR([this package requires Python $1.
+ If you have it installed, but it isn't the default Python
+ interpreter in your system path, please pass the PYTHON_VERSION
+ variable to configure. See ``configure --help'' for reference.
+ ])
+-				PYTHON_VERSION=""
+-			])
++			PYTHON_VERSION=""
+ 		fi
+ 	fi
+ 
+-- 
+2.34.3
+
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 84e9099ba9..97e9442cf8 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -12,6 +12,7 @@ ZFS_LICENSE_FILES = LICENSE COPYRIGHT
 ZFS_CPE_ID_VENDOR = openzfs
 ZFS_CPE_ID_PRODUCT = openzfs
 
+# 0001-removal-of-LegacyVersion-broke-ax_python_dev.m4.patch
 ZFS_AUTORECONF = YES
 
 ZFS_DEPENDENCIES = libaio openssl udev util-linux zlib libcurl
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
