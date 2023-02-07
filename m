Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90716C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40D8A4F2AD;
	Tue, 21 Feb 2023 00:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40D8A4F2AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d-4xIW8mTcoW; Tue, 21 Feb 2023 00:23:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 311074F192;
	Tue, 21 Feb 2023 00:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 311074F192
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C5DF1BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81961417D6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81961417D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id myzHUYkGgClS for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B5A3417B5
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B5A3417B5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80D938648F; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 10:50:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4cdd99190e89d538c25a8fc701372775fbde3b97
X-Git-Newrev: 29fd8481e22fd7e8ac00e0bc47614ff06be33706
X-Patchwork-Hint: ignore
Message-Id: <20230220205251.80D938648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-bunch: remove
 package
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
Content-Type: multipart/mixed; boundary="===============4457004808842005662=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4457004808842005662==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=29fd8481e22fd7e8ac00e0bc47614ff06be33706
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since the python3 bump to version 3.11 in commit
738500c296c8b1206f20e94ca3e7c5932a6a0486 python-bunch has failed
to build.

This is due to open() which no longer accepts 'U' (“universal
newline”) in the file mode.

Remove this package as it has not had a release since 2011 and
is unmaintained upstream.

Details:
https://docs.python.org/3.11/whatsnew/3.11.html#porting-to-python-3-11

Fixes:
 - http://autobuild.buildroot.net/results/2ba/2ba72fc9837605a36ea63bbd3e6e181a40cdf360

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                       |  7 +++++++
 DEVELOPERS                             |  1 -
 package/Config.in                      |  1 -
 package/python-bunch/Config.in         |  6 ------
 package/python-bunch/python-bunch.hash |  5 -----
 package/python-bunch/python-bunch.mk   | 14 --------------
 6 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 61686fdd11..ad80522451 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_PYTHON_BUNCH
+	bool "python-bunch removed"
+	select BR2_LEGACY
+	help
+	  The python-bunch package is unmaintained and is replaced
+	  by the python-munch package.
+
 config BR2_TARGET_GUMMIBOOT
 	bool "gummiboot removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index f8acf8776c..cad8d6affa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2040,7 +2040,6 @@ F:	package/policycoreutils/
 F:	package/proftpd/
 F:	package/protobuf-c/
 F:	package/protobuf/
-F:	package/python-bunch/
 F:	package/python-colorama/
 F:	package/python-filelock/
 F:	package/python-flask-cors/
diff --git a/package/Config.in b/package/Config.in
index b6211f1102..8b9570c447 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -985,7 +985,6 @@ menu "External python modules"
 	source "package/python-bottle/Config.in"
 	source "package/python-brotli/Config.in"
 	source "package/python-bsdiff4/Config.in"
-	source "package/python-bunch/Config.in"
 	source "package/python-cached-property/Config.in"
 	source "package/python-can/Config.in"
 	source "package/python-canopen/Config.in"
diff --git a/package/python-bunch/Config.in b/package/python-bunch/Config.in
deleted file mode 100644
index 89eae742b8..0000000000
--- a/package/python-bunch/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_PYTHON_BUNCH
-	bool "python-bunch"
-	help
-	  A dot-accessible dictionary (a la JavaScript objects).
-
-	  http://github.com/dsc/bunch
diff --git a/package/python-bunch/python-bunch.hash b/package/python-bunch/python-bunch.hash
deleted file mode 100644
index cfde2db603..0000000000
--- a/package/python-bunch/python-bunch.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/bunch/json
-md5  0a829d64e95ed96defbcae2bf9061bb0  bunch-1.0.1.tar.gz
-sha256  50c77a0fc0cb372dfe48b5e11937d5f70e743adbf42683f3a6d2857645a76aaa  bunch-1.0.1.tar.gz
-# Locally computed sha256 checksums
-sha256  57ca95c92059c8380625192462979bd32994aae3fcdf902ff6eb1e467eeb0469  LICENSE.txt
diff --git a/package/python-bunch/python-bunch.mk b/package/python-bunch/python-bunch.mk
deleted file mode 100644
index 18fdc223bb..0000000000
--- a/package/python-bunch/python-bunch.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-bunch
-#
-################################################################################
-
-PYTHON_BUNCH_VERSION = 1.0.1
-PYTHON_BUNCH_SOURCE = bunch-$(PYTHON_BUNCH_VERSION).tar.gz
-PYTHON_BUNCH_SITE = https://files.pythonhosted.org/packages/ef/bf/a4cf1779a4ffb4f610903fa08e15d1f4a8a2f4e3353a02afbe097c5bf4a8
-PYTHON_BUNCH_SETUP_TYPE = setuptools
-PYTHON_BUNCH_LICENSE = MIT
-PYTHON_BUNCH_LICENSE_FILES = LICENSE.txt
-
-$(eval $(python-package))

--===============4457004808842005662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4457004808842005662==--
