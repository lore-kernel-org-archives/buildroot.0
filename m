Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847CFC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3263A40ADD;
	Mon,  5 Feb 2024 11:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3263A40ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZlCaRNMzRaSF; Mon,  5 Feb 2024 11:08:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A5B7414FE;
	Mon,  5 Feb 2024 11:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A5B7414FE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACB381BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 702884189D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 702884189D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UrfKKLe-h1Ew for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 559A74175A
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 559A74175A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42D0C86B6D; Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:05:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 101f5f276cfc74c906a2a66181b5b0f3ab29e3d7
X-Git-Newrev: fff23fd15d6b22e5099304b7e914ee2f81c930f8
X-Patchwork-Hint: ignore
Message-Id: <20240205110640.42D0C86B6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pypng: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fff23fd15d6b22e5099304b7e914ee2f81c930f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/Config.in                      |  1 +
 package/python-pypng/Config.in         |  6 ++++++
 package/python-pypng/python-pypng.hash |  5 +++++
 package/python-pypng/python-pypng.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 75a94177eb..ca1368124f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1275,6 +1275,7 @@ menu "External python modules"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pyparted/Config.in"
 	source "package/python-pyphen/Config.in"
+	source "package/python-pypng/Config.in"
 	source "package/python-pyqrcode/Config.in"
 	source "package/python-pyqt5/Config.in"
 	source "package/python-pyratemp/Config.in"
diff --git a/package/python-pypng/Config.in b/package/python-pypng/Config.in
new file mode 100644
index 0000000000..c1ed405615
--- /dev/null
+++ b/package/python-pypng/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYPNG
+	bool "python-pypng"
+	help
+	  Pure Python library for saving and loading PNG images.
+
+	  https://gitlab.com/drj11/pypng
diff --git a/package/python-pypng/python-pypng.hash b/package/python-pypng/python-pypng.hash
new file mode 100644
index 0000000000..0f55eef702
--- /dev/null
+++ b/package/python-pypng/python-pypng.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pypng/json
+md5  7d9cce86ceb19524784ade86fb13a063  pypng-0.20220715.0.tar.gz
+sha256  739c433ba96f078315de54c0db975aee537cbc3e1d0ae4ed9aab0ca1e427e2c1  pypng-0.20220715.0.tar.gz
+# Locally computed sha256 checksums
+sha256  8dd127d87bb901ab9c8f584e98b7c7aa8539db27fe62ff01b1ee4be93b6a513a  LICENCE
diff --git a/package/python-pypng/python-pypng.mk b/package/python-pypng/python-pypng.mk
new file mode 100644
index 0000000000..07ad16b67b
--- /dev/null
+++ b/package/python-pypng/python-pypng.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pypng
+#
+################################################################################
+
+PYTHON_PYPNG_VERSION = 0.20220715.0
+PYTHON_PYPNG_SOURCE = pypng-$(PYTHON_PYPNG_VERSION).tar.gz
+PYTHON_PYPNG_SITE = https://files.pythonhosted.org/packages/93/cd/112f092ec27cca83e0516de0a3368dbd9128c187fb6b52aaaa7cde39c96d
+PYTHON_PYPNG_SETUP_TYPE = setuptools
+PYTHON_PYPNG_LICENSE = MIT
+PYTHON_PYPNG_LICENSE_FILES = LICENCE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
