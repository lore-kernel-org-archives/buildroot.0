Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95992C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 13:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D1AC416C1;
	Mon,  6 Nov 2023 13:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D1AC416C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jXAerfsOZobB; Mon,  6 Nov 2023 13:21:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4415541A06;
	Mon,  6 Nov 2023 13:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4415541A06
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5ACB91BF2EA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32B3F4012D
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32B3F4012D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tAhm-BouuOQg for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 13:19:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12A954014E
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 13:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12A954014E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 016478690E; Mon,  6 Nov 2023 13:19:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 13:46:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80b8602eebd9fe2590979832b78125ee71af74ad
X-Git-Newrev: 4eb97cc7e6215d88637ef0f99de0c07b3d123d63
X-Patchwork-Hint: ignore
Message-Id: <20231106131914.016478690E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-beautifulsoup4: bump to
 version 4.12.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=4eb97cc7e6215d88637ef0f99de0c07b3d123d63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools to pep517 hatchling build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-beautifulsoup4/python-beautifulsoup4.hash | 4 ++--
 package/python-beautifulsoup4/python-beautifulsoup4.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.hash b/package/python-beautifulsoup4/python-beautifulsoup4.hash
index 1777563190..0387af8a65 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.hash
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/beautifulsoup4/json
-md5  428d2737d94d238b146081c03d3b2b87  beautifulsoup4-4.12.0.tar.gz
-sha256  c5fceeaec29d09c84970e47c65f2f0efe57872f7cff494c9691a26ec0ff13234  beautifulsoup4-4.12.0.tar.gz
+md5  b49a6696a762e946c2be97c36a5adaa8  beautifulsoup4-4.12.2.tar.gz
+sha256  492bbc69dca35d12daac71c4db1bfff0c876c00ef4a2ffacce226d4638eb72da  beautifulsoup4-4.12.2.tar.gz
 # Locally computed sha256 checksums
 sha256  55b4d8d4b1e5bc86d10efac91b74c87bcb77526b0f5b9edaf8b9cd2adc7397b2  LICENSE
diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.mk b/package/python-beautifulsoup4/python-beautifulsoup4.mk
index 7896dd0f39..4c8b996d07 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.mk
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_BEAUTIFULSOUP4_VERSION = 4.12.0
+PYTHON_BEAUTIFULSOUP4_VERSION = 4.12.2
 PYTHON_BEAUTIFULSOUP4_SOURCE = beautifulsoup4-$(PYTHON_BEAUTIFULSOUP4_VERSION).tar.gz
-PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/c5/4c/b5b7d6e1d4406973fb7f4e5df81c6f07890fa82548ac3b945deed1df9d48
-PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = setuptools
+PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/af/0b/44c39cf3b18a9280950ad63a579ce395dda4c32193ee9da7ff0aed547094
+PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = pep517
 PYTHON_BEAUTIFULSOUP4_LICENSE = MIT
 PYTHON_BEAUTIFULSOUP4_LICENSE_FILES = LICENSE
+PYTHON_BEAUTIFULSOUP4_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
