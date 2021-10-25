Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39774C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:18:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 029FB60E74
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 029FB60E74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB01940130;
	Mon, 25 Oct 2021 20:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hjLWbb8qR1hU; Mon, 25 Oct 2021 20:18:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3874A4019B;
	Mon, 25 Oct 2021 20:18:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24ADE1BF870
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 210B980D58
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3g0pT3zgojvJ for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:18:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6973280D37
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:18:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BFC6388984; Mon, 25 Oct 2021 20:15:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 22:17:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95a63a34ac9204c4fe069154783bd97ed48c3ae2
X-Git-Newrev: 43147827a7b759248288fad1d97130c027c23e9a
X-Patchwork-Hint: ignore
Message-Id: <20211025201508.BFC6388984@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3-cryptography: drop package
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

commit: https://git.buildroot.net/buildroot/commit/?id=43147827a7b759248288fad1d97130c027c23e9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python3-cryptography is not needed anymore now that python-cryptography
has a host variant

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-cryptography/python-cryptography.mk |  1 -
 .../python3-cryptography/python3-cryptography.hash |  1 -
 .../python3-cryptography/python3-cryptography.mk   | 24 ----------------------
 3 files changed, 26 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 1d903b03e9..e21b9db042 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-cryptography/python3-cryptography.mk
 PYTHON_CRYPTOGRAPHY_VERSION = 3.3.2
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
 PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/d4/85/38715448253404186029c575d559879912eb8a1c5d16ad9f25d35f7c4f4c
diff --git a/package/python3-cryptography/python3-cryptography.hash b/package/python3-cryptography/python3-cryptography.hash
deleted file mode 120000
index 73fa25f572..0000000000
--- a/package/python3-cryptography/python3-cryptography.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-cryptography/python-cryptography.hash
\ No newline at end of file
diff --git a/package/python3-cryptography/python3-cryptography.mk b/package/python3-cryptography/python3-cryptography.mk
deleted file mode 100644
index 516864f315..0000000000
--- a/package/python3-cryptography/python3-cryptography.mk
+++ /dev/null
@@ -1,24 +0,0 @@
-################################################################################
-#
-# python3-cryptography
-#
-################################################################################
-
-# Please keep in sync with package/python-cryptography/python-cryptography.mk
-PYTHON3_CRYPTOGRAPHY_VERSION = 3.3.2
-PYTHON3_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON3_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON3_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/d4/85/38715448253404186029c575d559879912eb8a1c5d16ad9f25d35f7c4f4c
-PYTHON3_CRYPTOGRAPHY_SETUP_TYPE = setuptools
-PYTHON3_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
-PYTHON3_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-PYTHON3_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
-PYTHON3_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
-HOST_PYTHON3_CRYPTOGRAPHY_DL_SUBDIR = python-cryptography
-HOST_PYTHON3_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
-HOST_PYTHON3_CRYPTOGRAPHY_DEPENDENCIES = \
-	host-openssl \
-	host-python3-cffi \
-	host-python3-pip \
-	host-python3-six
-
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
