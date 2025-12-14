Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49356D5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA6A5607D0;
	Sun, 14 Dec 2025 21:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXpOEb7yDMjP; Sun, 14 Dec 2025 21:21:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9D3C608BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765747301;
	bh=F6sz6nHp7jZkmgsTzrxBggBLE8eYTucFhjS7b2pc1HE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LuZxmTKqR8aEVUF7vweuW1LhU9Bm5X9ovfVUOOHAu/yzKc+3TdmvoBLTBdKB4SoIW
	 0fvLfJwBJnswqaaXJbriSCKgxGctihB5alMC5p/3woMrvXxG56ItPdv43aW8OES0Sx
	 ZsLUXMSJuIAxGbVMFlbVUI4vI9Ynz6tsZF+L7U0cZJTy3XghJsJjl+cXNjXF5Jthq4
	 sD9Me4CFV7PKVA8MMJnbmP52hKF92Ue5qO4NbjPhG3/6HE2K/YSCFqi1IitRNOxCtC
	 KAgo47HkSD8VDEyq1v254fbBYXFFivvKxF+ttLK/7+SgkHIu1iYzvopH2lpxkh6IHH
	 eIF2vlGDChTAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9D3C608BA;
	Sun, 14 Dec 2025 21:21:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF3C02D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A64F640686
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7Gvey7jIuRt for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C55504063C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C55504063C
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A39A37FF02; Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 22:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70d868991bb29a6e8870cbf63b6fd0b712097a9e
X-Git-Newrev: 880668faf7eaea8f73671c47f634852be45c0617
X-Patchwork-Hint: ignore
Message-Id: <20251214212139.A39A37FF02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cssselect2: bump version to
 0.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=880668faf7eaea8f73671c47f634852be45c0617
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/Kozea/cssselect2/blob/0.8.0/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cssselect2/python-cssselect2.hash | 4 ++--
 package/python-cssselect2/python-cssselect2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssselect2/python-cssselect2.hash b/package/python-cssselect2/python-cssselect2.hash
index 13bdca9a39..214be0a5fb 100644
--- a/package/python-cssselect2/python-cssselect2.hash
+++ b/package/python-cssselect2/python-cssselect2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect2/json
-md5  594ebe75a12dfd6cc288858faeb77415  cssselect2-0.7.0.tar.gz
-sha256  1ccd984dab89fc68955043aca4e1b03e0cf29cad9880f6e28e3ba7a74b14aa5a  cssselect2-0.7.0.tar.gz
+md5  45b5f89f2934fbcb52490483367c3997  cssselect2-0.8.0.tar.gz
+sha256  7674ffb954a3b46162392aee2a3a0aedb2e14ecf99fcc28644900f4e6e3e9d3a  cssselect2-0.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd97229a1d1b0f6a8b41e109f413426dbc0874b1e03746d66cc33282601c2c2  LICENSE
diff --git a/package/python-cssselect2/python-cssselect2.mk b/package/python-cssselect2/python-cssselect2.mk
index 67907f9bcd..7a4e2a2342 100644
--- a/package/python-cssselect2/python-cssselect2.mk
+++ b/package/python-cssselect2/python-cssselect2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT2_VERSION = 0.7.0
+PYTHON_CSSSELECT2_VERSION = 0.8.0
 PYTHON_CSSSELECT2_SOURCE = cssselect2-$(PYTHON_CSSSELECT2_VERSION).tar.gz
-PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/e7/fc/326cb6f988905998f09bb54a3f5d98d4462ba119363c0dfad29750d48c09
+PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/9f/86/fd7f58fc498b3166f3a7e8e0cddb6e620fe1da35b02248b1bd59e95dbaaa
 PYTHON_CSSSELECT2_SETUP_TYPE = flit
 PYTHON_CSSSELECT2_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
