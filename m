Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B74D65C63
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7FC1611B7;
	Wed, 17 Dec 2025 21:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iw6WZlTIEwu8; Wed, 17 Dec 2025 21:45:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D6BA611A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007915;
	bh=qVDYS7p726tMiAyEvAR1l/tSd95j7TfTeKUnsPr3itE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oOtZph7AEC1P3YTpoDZ/ZWlpVt74TU8QpixylKIJvaaObznL0vNk19GeQFgISzjY2
	 XCZoD12hVLgTTKNzpBYUbPGBzCurBF8tYsRa6ZOjf2TcC+0AvscsNqQ7AmObLgNqaZ
	 NlG3snSooZFJNDzjWcQxKAmk9abIGnGs6NBa88IwiH2AM2zvbQwHBmwoCdcdCNnIzJ
	 puPL39F9QBEa5qOSq8+43dxe6/zJVrs5OSjqlAUoi993e64D7DJZ2JBFBTgFbAs8qm
	 7YHsojFoQEpyL08vNUoJKWyiIUyM3s2U2UURAf6bskxmYFl/CXyhv2Yh/9mIZInCQd
	 Gv3tgJq2OzaxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D6BA611A7;
	Wed, 17 Dec 2025 21:45:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E137361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BC3240F61
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKIcaA0wQnwi for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0055540F72
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0055540F72
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E54AA8120D; Wed, 17 Dec 2025 21:44:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:04:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f26e29ee5bc6b2d78eedcf17eede9ec4d345e37c
X-Git-Newrev: e4cf03b6af84be3cfac3783e1e7fd118bc437628
X-Patchwork-Hint: ignore
Message-Id: <20251217214457.E54AA8120D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-treq: bump version to 25.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4cf03b6af84be3cfac3783e1e7fd118bc437628
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/twisted/treq/blob/treq-25.5.0/CHANGELOG.rst

Switched build system to hatch:
https://github.com/twisted/treq/commit/88ba8110f82cc721c37da1ce96fbaa83a0e6807b

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-treq/python-treq.hash | 4 ++--
 package/python-treq/python-treq.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-treq/python-treq.hash b/package/python-treq/python-treq.hash
index b44aba35d3..0c2582b4ba 100644
--- a/package/python-treq/python-treq.hash
+++ b/package/python-treq/python-treq.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/treq/json
-md5  a48996ff540651deded304b638ba54ea  treq-24.9.1.tar.gz
-sha256  15da7fc404f3e4ed59d0abe5f8eef4966fabbe618039a2a23bc7c15305cefea8  treq-24.9.1.tar.gz
+md5  b0a3c2e315375388e820019afc59919d  treq-25.5.0.tar.gz
+sha256  25dde3a55ae85ec2f2c56332c99aef255ab14f997d0d00552ebff13538a9804a  treq-25.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7cc1b65e1937b1cc07052bb864ec96d8e5fd413400c0842e5b89a8201a600293  LICENSE
diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
index 65179246f5..a8e451731f 100644
--- a/package/python-treq/python-treq.mk
+++ b/package/python-treq/python-treq.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_TREQ_VERSION = 24.9.1
+PYTHON_TREQ_VERSION = 25.5.0
 PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
-PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/08/94/424f3bb11eaf464880d076cca2e9d0ee21a1be805fe9761b87eccba5b3ae
+PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/ed/7b/b9dba8d947584481aad7e29b01f2ea6bbe794a0352e0cdb68e99ab135c31
 PYTHON_TREQ_LICENSE = MIT
 PYTHON_TREQ_LICENSE_FILES = LICENSE
-PYTHON_TREQ_SETUP_TYPE = setuptools
+PYTHON_TREQ_SETUP_TYPE = hatch
 PYTHON_TREQ_DEPENDENCIES = host-python-incremental
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
