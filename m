Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BB3D5B873
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3317E60F7D;
	Mon, 15 Dec 2025 21:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yh5Sy9TJJtX7; Mon, 15 Dec 2025 21:39:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4529A60F75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765834745;
	bh=VGsj0EFocKZU8k4jBM7Q6r2iaKWPTmY01U1yv+vR5MI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CCvc9GRKKPv1K+HxNohHpw5Wi4sb3xH2z5P2JYi+yd7ybG9HekFGgignpZMGfPnvg
	 SXFNZ1CHKWcTI1t4Aw6vjKz6aVg9Ib8O2tdIBl787IvYRjYjymJ3noYRwgvvbwXbgS
	 9sk0CwkTLgUvLZKfqNQR4sQ5oAKAa/VDkMx5piOv7s454TU0x6EP6GJNyDOfgm6zoU
	 MeBZ5Q1Ywkpr3E+hQeGxqcGN0R56uXcQxaWHw5bCn/dVLhzT2vAT1OKAX3kSzqRywv
	 GPt9JAuwADEChEAUBPirPyC144yyhmvEXTRrXK6M0Wqh3mXSAuEGF0GXN5TnV6hjOk
	 rO2fOecyBSwKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4529A60F75;
	Mon, 15 Dec 2025 21:39:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14C06117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8089840323
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7XCz-gqDvrPC for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:38:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAAF040951
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAAF040951
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9CA286FC4; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 22:37:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29af58079b17ec3ce6669e0888ee30b4940fb8f7
X-Git-Newrev: 5d973f166d4af5eeaa7d3cee299ef6062634e477
X-Patchwork-Hint: ignore
Message-Id: <20251215213844.C9CA286FC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-referencing: bump version
 to 0.37.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d973f166d4af5eeaa7d3cee299ef6062634e477
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/python-jsonschema/referencing/blob/v0.37.0/docs/changes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-referencing/python-referencing.hash | 4 ++--
 package/python-referencing/python-referencing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-referencing/python-referencing.hash b/package/python-referencing/python-referencing.hash
index 9cbd5e60a5..e407997e98 100644
--- a/package/python-referencing/python-referencing.hash
+++ b/package/python-referencing/python-referencing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/referencing/json
-md5  9d116186b2c5225c4e55254b94b2cd8e  referencing-0.36.2.tar.gz
-sha256  df2e89862cd09deabbdba16944cc3f10feb6b3e6f18e902f7cc25609a34775aa  referencing-0.36.2.tar.gz
+md5  bc9d24d5aec035c707b107cc2d43196b  referencing-0.37.0.tar.gz
+sha256  44aefc3142c5b842538163acb373e24cce6632bd54bdb01b21ad5863489f50d8  referencing-0.37.0.tar.gz
 # Locally computed sha256 checksums
 sha256  42dcd63495f87b4eb7c7757afa379bb55a53f94afd7a5f657d9adf57236e515c  COPYING
diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
index cabc9afa23..b998779132 100644
--- a/package/python-referencing/python-referencing.mk
+++ b/package/python-referencing/python-referencing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REFERENCING_VERSION = 0.36.2
+PYTHON_REFERENCING_VERSION = 0.37.0
 PYTHON_REFERENCING_SOURCE = referencing-$(PYTHON_REFERENCING_VERSION).tar.gz
-PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/2f/db/98b5c277be99dd18bfd91dd04e1b759cad18d1a338188c936e92f921c7e2
+PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/22/f5/df4e9027acead3ecc63e50fe1e36aca1523e1719559c499951bb4b53188f
 PYTHON_REFERENCING_SETUP_TYPE = pep517
 PYTHON_REFERENCING_LICENSE = MIT
 PYTHON_REFERENCING_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
