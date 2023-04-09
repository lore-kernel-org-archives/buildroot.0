Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F43C77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 21:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 474966076C;
	Sun,  9 Apr 2023 21:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 474966076C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfzlOW7MbDoy; Sun,  9 Apr 2023 21:14:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A3D060BF8;
	Sun,  9 Apr 2023 21:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A3D060BF8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 205121BF82D
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06B5B404E9
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06B5B404E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i2tQWNj199Yl for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 21:13:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2627140151
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 21:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2627140151
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FB7B83C10; Sun,  9 Apr 2023 21:13:53 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Apr 2023 23:11:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29a0dd4a3006c06d4b8d82821bd74b8b9f26715a
X-Git-Newrev: 19c4b1b069e08e8195cccfae2d3b558fbc98eaf2
X-Patchwork-Hint: ignore
Message-Id: <20230409211353.0FB7B83C10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pep517: drop package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=19c4b1b069e08e8195cccfae2d3b558fbc98eaf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is no longer used as python-pypa-build now uses
python-pyproject-hooks instead. In fact, pyproject-hooks is simply the
new name of pep517 [1].

[1] https://github.com/pypa/pyproject-hooks/issues/136

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                               |  1 -
 package/python-pep517/python-pep517.hash |  5 -----
 package/python-pep517/python-pep517.mk   | 14 --------------
 3 files changed, 20 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c226259aec..5cd882b579 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1410,7 +1410,6 @@ F:	package/python-multidict/
 F:	package/python-mypy-extensions/
 F:	package/python-outcome/
 F:	package/python-pathspec/
-F:	package/python-pep517/
 F:	package/python-pycares/
 F:	package/python-pydyf/
 F:	package/python-pypa-build/
diff --git a/package/python-pep517/python-pep517.hash b/package/python-pep517/python-pep517.hash
deleted file mode 100644
index 6535e51656..0000000000
--- a/package/python-pep517/python-pep517.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/pep517/json
-md5  7fd08b11215256601a8a4940c1ba3d34  pep517-0.13.0.tar.gz
-sha256  ae69927c5c172be1add9203726d4b84cf3ebad1edcd5f71fcdc746e66e829f59  pep517-0.13.0.tar.gz
-# Locally computed sha256 checksums
-sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
deleted file mode 100644
index c43b09faaa..0000000000
--- a/package/python-pep517/python-pep517.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-pep517
-#
-################################################################################
-
-PYTHON_PEP517_VERSION = 0.13.0
-PYTHON_PEP517_SOURCE = pep517-$(PYTHON_PEP517_VERSION).tar.gz
-PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/4d/19/e11fcc88288f68ae48e3aa9cf5a6fd092a88e629cb723465666c44d487a0
-PYTHON_PEP517_LICENSE = MIT
-PYTHON_PEP517_LICENSE_FILES = LICENSE
-PYTHON_PEP517_SETUP_TYPE = flit-bootstrap
-
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
