Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451F3C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:18:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 089DD60E52
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 089DD60E52
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA3084014B;
	Mon, 25 Oct 2021 20:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VQkjnxHgnpVJ; Mon, 25 Oct 2021 20:18:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5947403CB;
	Mon, 25 Oct 2021 20:18:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4885B1BF97C
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3832F608A8
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P0jchQbI-5rv for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:18:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 812056089F
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:18:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D7BAD88984; Mon, 25 Oct 2021 20:15:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 22:17:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43147827a7b759248288fad1d97130c027c23e9a
X-Git-Newrev: f6ffc2b045d3d92deb91a174e1871d69224e37db
X-Patchwork-Hint: ignore
Message-Id: <20211025201508.D7BAD88984@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3-pip: drop package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6ffc2b045d3d92deb91a174e1871d69224e37db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop python3-pip now that python3-cryptography has been removed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pip/python-pip.mk     |  1 -
 package/python3-pip/python3-pip.hash |  1 -
 package/python3-pip/python3-pip.mk   | 19 -------------------
 3 files changed, 21 deletions(-)

diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index ba7134e235..81fc87d5f0 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-pip/python3-pip.mk
 PYTHON_PIP_VERSION = 21.2.4
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
 PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/52/e1/06c018197d8151383f66ebf6979d951995cf495629fc54149491f5d157d0
diff --git a/package/python3-pip/python3-pip.hash b/package/python3-pip/python3-pip.hash
deleted file mode 120000
index d90fb3d005..0000000000
--- a/package/python3-pip/python3-pip.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-pip/python-pip.hash
\ No newline at end of file
diff --git a/package/python3-pip/python3-pip.mk b/package/python3-pip/python3-pip.mk
deleted file mode 100644
index 5e20b06865..0000000000
--- a/package/python3-pip/python3-pip.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# python3-pip
-#
-################################################################################
-
-# Please keep in sync with package/python-pip/python-pip.mk
-PYTHON3_PIP_VERSION = 21.2.4
-PYTHON3_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON3_PIP_SITE = https://files.pythonhosted.org/packages/52/e1/06c018197d8151383f66ebf6979d951995cf495629fc54149491f5d157d0
-PYTHON3_PIP_SETUP_TYPE = setuptools
-PYTHON3_PIP_LICENSE = MIT
-PYTHON3_PIP_LICENSE_FILES = LICENSE.txt
-PYTHON3_PIP_CPE_ID_VENDOR = pypa
-PYTHON3_PIP_CPE_ID_PRODUCT = pip
-HOST_PYTHON3_PIP_DL_SUBDIR = python-pip
-HOST_PYTHON3_PIP_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
