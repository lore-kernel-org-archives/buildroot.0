Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D723FA3727
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61CFF81E0A;
	Fri,  2 Jan 2026 22:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Zrcb6TZdNE6; Fri,  2 Jan 2026 22:43:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7430E81E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767393787;
	bh=TPWmz+Mvtzr3/i/J+3/INB68dUZTMX7WVPgQMBI853E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pYjUeVXC0zw1pBLCb6PwhJKOSQ9P8g6hmzLiWSIF9TsY6PzPymqeTgbyKbxQ/LWRD
	 UYOutaMDFuNojOZsIzyUAnlc5fL/CjSTGek37mt0IX1x0PqIIXYrnfhfMAGlfCvkMi
	 bkv558j7I3E6FABHHwV9oPg/TIeZ41T/H3ESl/J0inH82cJcKacv2cXvn1JMG3+bnJ
	 IwMjkZHEnNOV+bYblZ85iEHfRuZ0mtEYFP6Gwev/WNInMZcuzcKoYhnKOUeCtwfZHD
	 RNnu8D70+7PD9IIT+Nye11udG0b0XrSkDeT3c7n+79pquGyAxtRl5KeD+z6p9Cg8Df
	 CJ4gfEtOVbKCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7430E81E0D;
	Fri,  2 Jan 2026 22:43:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89BCBA21
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FEF0401FF
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8L4YL9qMVEgW for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:43:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84DB540072
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84DB540072
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:43:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73462880A6; Fri,  2 Jan 2026 22:43:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 23:40:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 294783d757745c56227ab49329dde8351f5a3991
X-Git-Newrev: 353012770406783a3ee7cf8d139f463d4f0e17b6
X-Patchwork-Hint: ignore
Message-Id: <20260102224304.73462880A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-kiwisolver: bump to version
 1.4.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=353012770406783a3ee7cf8d139f463d4f0e17b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new host-python-setuptools-scm build dependency.

License hash changed due to year update:
https://github.com/nucleic/kiwi/commit/728f5661fdd021c68dac1b914b3c8610a46b2e7e

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-kiwisolver/python-kiwisolver.hash | 6 +++---
 package/python-kiwisolver/python-kiwisolver.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-kiwisolver/python-kiwisolver.hash b/package/python-kiwisolver/python-kiwisolver.hash
index ded337b823..636d339739 100644
--- a/package/python-kiwisolver/python-kiwisolver.hash
+++ b/package/python-kiwisolver/python-kiwisolver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/kiwisolver/json
-md5  2eb55aab42272292a732411bb6c79dee  kiwisolver-1.4.8.tar.gz
-sha256  23d5f023bdc8c7e54eb65f03ca5d5bb25b601eac4d7f1a042888a1f45237987e  kiwisolver-1.4.8.tar.gz
+md5  63d13da80a2420278c695d5784dc0b78  kiwisolver-1.4.9.tar.gz
+sha256  c3b22c26c6fd6811b0ae8363b95ca8ce4ea3c202d3d0975b2914310ceb1bcc4d  kiwisolver-1.4.9.tar.gz
 # Locally computed sha256 checksums
-sha256  238e69906d7e507a94832b9831131862c4176d58c002b388e2e99db5d83677d2  LICENSE
+sha256  cf20799d32de0eefa2ea904e3ac5122f47aed5d352930751eb61724762c49d90  LICENSE
diff --git a/package/python-kiwisolver/python-kiwisolver.mk b/package/python-kiwisolver/python-kiwisolver.mk
index cbdb5c3aee..2b81c60688 100644
--- a/package/python-kiwisolver/python-kiwisolver.mk
+++ b/package/python-kiwisolver/python-kiwisolver.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_KIWISOLVER_VERSION = 1.4.8
+PYTHON_KIWISOLVER_VERSION = 1.4.9
 PYTHON_KIWISOLVER_SOURCE = kiwisolver-$(PYTHON_KIWISOLVER_VERSION).tar.gz
-PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/82/59/7c91426a8ac292e1cdd53a63b6d9439abd573c875c3f92c146767dd33faf
+PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/5c/3c/85844f1b0feb11ee581ac23fe5fce65cd049a200c1446708cc1b7f922875
 PYTHON_KIWISOLVER_LICENSE = BSD-3-Clause
 PYTHON_KIWISOLVER_LICENSE_FILES = LICENSE
 PYTHON_KIWISOLVER_SETUP_TYPE = setuptools
-PYTHON_KIWISOLVER_DEPENDENCIES = host-python-cppy
+PYTHON_KIWISOLVER_DEPENDENCIES = host-python-cppy host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
