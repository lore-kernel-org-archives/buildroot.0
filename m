Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22228C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 14:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4110812F0;
	Sat,  1 Jan 2022 14:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xO3_o84qEono; Sat,  1 Jan 2022 14:57:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F124812ED;
	Sat,  1 Jan 2022 14:57:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 526191BF59D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 14:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E31E60625
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 14:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vmqySOC4Jg9T for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 14:57:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59B09605A6
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 14:57:22 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i22so60865632wrb.13
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 06:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2TMC/R5Hx8QdEQvxBeNeNXVWEZSm2oKB3GfhrIhMyP4=;
 b=h8Nm2YKUdt2a3bBjnDLOur+iorTHZiKI7UmAq5Ee6Ll3yD4dl5OTZP5y+r765j2rXA
 7Nl7iks/ENb5zwXrwePJ6CBhvXGdxFH6KNxkAC+fIMpu2VFNG2qO74cAsOfj0gbZjRWi
 LnKzdbXzXLEDSUIkvJHPSoFffy6g3GVHgSHgDwFRfjnSvbz8fjT3D0QNcGAUKDTGovCN
 a97ZNvTwcTiPXgcNHShwZdOAfQadtYuy7rMdVb1in/2FAFfpUKqZSU3MD5UW7cWWeHu0
 LDKGgOKrSlqFOPZNrVJqzvZJN9dy3LIHIKkH4DdeSVcHxYphF5vhd3OWjq0lR0DBWLQ6
 VL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2TMC/R5Hx8QdEQvxBeNeNXVWEZSm2oKB3GfhrIhMyP4=;
 b=e7SzzjVCrmF0XylpV/lIpSxcfIXWAWPuDAz8BVJZkbKvEg3xgdw+e2Bj8P5l6KqpUY
 pQaJuG3S8V9ewSm7z669Zg7iVgN6JG9jvcs+hdjiON1yZekrRYjG42rTBSTYsDPhezjH
 ojlaPL6o1DRBQ0TwB0StZj8reiuCWTeQY+dP1GeNPzsJR+DkiYv0A9iPFntSnRDU8cE4
 m9zM+C7XU/uq7Bs9K6nXd3g3NdOTIRL6IfVbFhEqTSIrgyLPfLlvvUv2kGAaT5mizi+v
 qiWDJtLceahDTIfVb93uOCJJDyFK0NKdxs/7G1saiAiho8PMB+LIIACMQXXKDCoPgWKL
 ed4Q==
X-Gm-Message-State: AOAM531Th4G3zRQ0UkpDwONnMtD14Dt4pSyUMZBwu/2CzB36sGWi5wxl
 gKQvN3LrdxjLI7tiD2j7d3kZMWw5k8Q=
X-Google-Smtp-Source: ABdhPJz9Ka2oIpbFTgHTXwIFE1oU+P0u7RHc4bFTkGn7pO0JiEYRo94koHQA5Kiude3ssSJs1usBnw==
X-Received: by 2002:adf:fbc1:: with SMTP id d1mr33121089wrs.648.1641049040454; 
 Sat, 01 Jan 2022 06:57:20 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id o14sm28834199wms.4.2022.01.01.06.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 06:57:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 15:56:32 +0100
Message-Id: <20220101145632.1393642-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fail2ban: fix build with python 3.10
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of python3 to version
3.10.1 in commit 25b1fc2898d68ddf2674b14c738045875fc5a2dc:

error in fail2ban setup command: use_2to3 is invalid.

Fixes:
 - http://autobuild.buildroot.org/results/6a5e91f9912f869b2b07b10b576457b432066393

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...with-error-in-fail2ban-setup-command.patch | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 package/fail2ban/0002-fix-gh-3098-build-fails-with-error-in-fail2ban-setup-command.patch

diff --git a/package/fail2ban/0002-fix-gh-3098-build-fails-with-error-in-fail2ban-setup-command.patch b/package/fail2ban/0002-fix-gh-3098-build-fails-with-error-in-fail2ban-setup-command.patch
new file mode 100644
index 0000000000..8cb097dc38
--- /dev/null
+++ b/package/fail2ban/0002-fix-gh-3098-build-fails-with-error-in-fail2ban-setup-command.patch
@@ -0,0 +1,67 @@
+From 5ac303df8a171f748330d4c645ccbf1c2c7f3497 Mon Sep 17 00:00:00 2001
+From: sebres <info@sebres.de>
+Date: Sun, 19 Sep 2021 18:49:18 +0200
+Subject: [PATCH] fix gh-3098: build fails with error in fail2ban setup
+ command: use_2to3 is invalid (setuptools 58+)
+
+[Retrieved from:
+https://github.com/fail2ban/fail2ban/commit/5ac303df8a171f748330d4c645ccbf1c2c7f3497]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ setup.py | 16 +---------------
+ 1 file changed, 1 insertion(+), 15 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index f4c2550f6..98413273c 100755
+--- a/setup.py
++++ b/setup.py
+@@ -48,7 +48,7 @@
+ from glob import glob
+ 
+ from fail2ban.setup import updatePyExec
+-
++from fail2ban.version import version
+ 
+ source_dir = os.path.realpath(os.path.dirname(
+ 	# __file__ seems to be overwritten sometimes on some python versions (e.g. bug of 2.6 by running under cProfile, etc.):
+@@ -112,22 +112,12 @@ def update_scripts(self, dry_run=False):
+ # Wrapper to specify fail2ban own options:
+ class install_command_f2b(install):
+ 	user_options = install.user_options + [
+-		('disable-2to3', None, 'Specify to deactivate 2to3, e.g. if the install runs from fail2ban test-cases.'),
+ 		('without-tests', None, 'without tests files installation'),
+ 	]
+ 	def initialize_options(self):
+-		self.disable_2to3 = None
+ 		self.without_tests = not with_tests
+ 		install.initialize_options(self)
+ 	def finalize_options(self):
+-		global _2to3
+-		## in the test cases 2to3 should be already done (fail2ban-2to3):
+-		if self.disable_2to3:
+-			_2to3 = False
+-		if _2to3:
+-			cmdclass = self.distribution.cmdclass
+-			cmdclass['build_py'] = build_py_2to3
+-			cmdclass['build_scripts'] = build_scripts_2to3
+ 		if self.without_tests:
+ 			self.distribution.scripts.remove('bin/fail2ban-testcases')
+ 
+@@ -178,7 +168,6 @@ def run(self):
+ if setuptools:
+ 	setup_extra = {
+ 		'test_suite': "fail2ban.tests.utils.gatherTests",
+-		'use_2to3': True,
+ 	}
+ else:
+ 	setup_extra = {}
+@@ -202,9 +191,6 @@ def run(self):
+ 		('/usr/share/doc/fail2ban', doc_files)
+ 	)
+ 
+-# Get version number, avoiding importing fail2ban.
+-# This is due to tests not functioning for python3 as 2to3 takes place later
+-exec(open(join("fail2ban", "version.py")).read())
+ 
+ setup(
+ 	name = "fail2ban",
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
