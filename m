Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901D7CD0402
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 20:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D02360AAC;
	Mon,  5 Jan 2026 20:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Dtvdn6H9QVG; Mon,  5 Jan 2026 20:50:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64A03607CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767646234;
	bh=PWQZcjIRYsZ5mZ7DKXBFhICFk20M2PaTE956VF0ZGjE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d3e1XSFAZ3gVOjYIqhSkgXth8GNl1C9vuzKzmBy2tqdbQ7jm9waCjxDpiiy6Ycjkf
	 UVR+CLEDo7YgI9dJYVVjBe83qXm7C9cP4c5ZlYPeRDdAtj+8BdHXwtNmPu2gPeVp7O
	 9aMtaRfuIyobszPUDX6/p8IfJpayCYlgynEE3DgSQuoPPQa/ktq9DqGVZuuoQR/r7k
	 7HvJERJUSNIM3mTMNldlnSnlz7nA708Pa9kU0njLN02uzQZavSpTXZqsGSLL3DGHXf
	 mTzFpRWZHFC+NDEIqj65AUimqcJtwzskMj1X4ZK9jUdsvLFbcTtwVUw4g2XjgB+LbE
	 HZOnuEImWbG7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64A03607CD;
	Mon,  5 Jan 2026 20:50:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3DE4976
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D65EE8119B
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82R7VkCONcxH for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 20:50:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11DDA81157
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11DDA81157
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3AB08427E; Mon,  5 Jan 2026 20:50:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Jan 2026 21:38:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 431e80e843c6f38b499b9f8f49a798749c1b8ed8
X-Git-Newrev: 668b97a68024805bac7101b181f7b243dc2644e9
X-Patchwork-Hint: ignore
Message-Id: <20260105205030.E3AB08427E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-textual: bump to version
 7.0.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=668b97a68024805bac7101b181f7b243dc2644e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-mdit-py-plugins runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-textual/Config.in           | 1 +
 package/python-textual/python-textual.hash | 4 ++--
 package/python-textual/python-textual.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-textual/Config.in b/package/python-textual/Config.in
index aecf050ec9..103264fc5d 100644
--- a/package/python-textual/Config.in
+++ b/package/python-textual/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_TEXTUAL
 	bool "python-textual"
 	select BR2_PACKAGE_PYTHON_MARKDOWN_IT_PY # runtime
+	select BR2_PACKAGE_PYTHON_MDIT_PY_PLUGINS # runtime
 	select BR2_PACKAGE_PYTHON_PLATFORMDIRS # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
 	select BR2_PACKAGE_PYTHON_RICH # runtime
diff --git a/package/python-textual/python-textual.hash b/package/python-textual/python-textual.hash
index 692e0d757b..7a9c2d403e 100644
--- a/package/python-textual/python-textual.hash
+++ b/package/python-textual/python-textual.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/textual/json
-md5  cb43b8d6d3903ca171330a626cfa05e5  textual-5.3.0.tar.gz
-sha256  1b6128b339adef2e298cc23ab4777180443240ece5c232f29b22960efd658d4d  textual-5.3.0.tar.gz
+md5  e8d6a911d150acdf7b46dc30a1a1d94d  textual-7.0.0.tar.gz
+sha256  617638a2be74fb7507aff3ea6ec9374148be02e5a7bb1d02396d1d557b66c0a9  textual-7.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  94f290a762376dfdb7768e42070618b0abfd2a2799eab1b1c097816c3a39eb57  LICENSE
diff --git a/package/python-textual/python-textual.mk b/package/python-textual/python-textual.mk
index 49cccc299d..77187b3102 100644
--- a/package/python-textual/python-textual.mk
+++ b/package/python-textual/python-textual.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTUAL_VERSION = 5.3.0
+PYTHON_TEXTUAL_VERSION = 7.0.0
 PYTHON_TEXTUAL_SOURCE = textual-$(PYTHON_TEXTUAL_VERSION).tar.gz
-PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/ba/ce/f0f938d33d9bebbf8629e0020be00c560ddfa90a23ebe727c2e5aa3f30cf
+PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/d4/9c/ebc9ca1f95366bef4c0e8360f4a77400d47a79aeecc08747de1990ef8bdc
 PYTHON_TEXTUAL_SETUP_TYPE = poetry
 PYTHON_TEXTUAL_LICENSE = MIT
 PYTHON_TEXTUAL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
