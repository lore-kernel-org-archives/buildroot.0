Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23FFC5DF9C
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 20:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8685C40564;
	Mon, 24 Aug 2026 20:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GY8joXcgu3ag; Mon, 24 Aug 2026 20:10:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787602205;
	bh=S1P2abKOHOtdBMlpzUfUyX8dOpKBwI42z9We0KZDps8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gnt0eui+fVUkymjZWVGX9kEghwhys3sk9dTJ5rd143U00jv2g09rYGYKoARmSElli
	 QleVA7pCBWzn42h1fcskcP65Hjumxxqb+ihz6DPFOjRZZfviKCLHtaOVKPZ7UO0s8O
	 V2GaKDVM8qxbgKH+36vRGJ5+5ID67kcO4sch7V8DYzl8qwV2yTHMNOhqCLq1vnmgsh
	 Esafl8d9e+EY6FGycrZGknuFPPZTNHV9QENI5hZtU5yRp/CXCF3qs42XPALWTDL982
	 PkozlRN9Hvn8aFwlF1m3dn+5c8pt6YfxZaSrafQKsxapVOz7g1tIvYclKVILZdt12Y
	 LYl9RAZS00ueg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9990740598;
	Mon, 24 Aug 2026 20:10:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8780118
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA74F80D3F
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id luo_3Rq-_8o8 for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 20:10:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D334A80B4C
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:10:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B20FF9058E; Mon, 24 Aug 2026 20:09:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Aug 2026 22:09:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d16e4939ca7ca8e0e464230e0b2edbea843e3e3e
X-Git-Newrev: 8e336d3845db1a7ca22c732b0b30d89a9a6ce048
X-Patchwork-Hint: ignore
Message-Id: <20260824200907.B20FF9058E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/taglib: bump version to 2.3.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8e336d3845db1a7ca22c732b0b30d89a9a6ce048
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/taglib/taglib/blob/v2.3.1/CHANGELOG.md
https://mail.kde.org/pipermail/taglib-devel/2026-July/003124.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/taglib/taglib.hash | 4 ++--
 package/taglib/taglib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index b118f610ec..6c47694c28 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,5 +1,5 @@
-# From https://github.com/taglib/taglib/releases/tag/v2.3
-sha256  7349f6fd942418bc7009ebe743eb7c9d055f02921ec56fa436ec25007c47fd38  taglib-2.3.tar.gz
+# From https://github.com/taglib/taglib/releases/tag/v2.3.1
+sha256  a19d90e6fd41d09a0281ec0fe762d51491d7a6ccffc923c4f7868c5e647ca230  taglib-2.3.1.tar.gz
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 9a111a86c6..0a8f371371 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 2.3
+TAGLIB_VERSION = 2.3.1
 TAGLIB_SITE = https://taglib.org/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_DEPENDENCIES = utfcpp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
