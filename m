Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1907D74941
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 21:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79CE960035;
	Tue, 29 Oct 2024 21:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1EFuoaaqZ1K; Tue, 29 Oct 2024 21:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CF3A60586
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CF3A60586;
	Tue, 29 Oct 2024 21:29:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5383A4EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4176D60586
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1prPvAE--Hr9 for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 21:29:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7993C60035
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7993C60035
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:29:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63C1184A58; Tue, 29 Oct 2024 21:29:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 22:28:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bde7b963e539c288b15fa09e5346b84bf9bb2e46
X-Git-Newrev: 2de79d7065bc27c94b654232b12acd0af582a0ad
X-Patchwork-Hint: ignore
Message-Id: <20241029212931.63C1184A58@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: remove
 -DFEATURE_concurrent=OFF from uncondtional options
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

commit: https://git.buildroot.net/buildroot/commit/?id=2de79d7065bc27c94b654232b12acd0af582a0ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit
a39e0b95e1d927599e212098d1db4d2fafb2a35c ("package/qt6/qt6base: add
support for concurrent module"), we have an explicit option that
enables/disables concurrent support, so it no longer makes sense to
explicitly disable it unconditionnally first.

Signed-off-by: Hannah Kiekens <hannah.kiekens@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/qt6base.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 5ab61ba3e0..888654a216 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -43,7 +43,6 @@ QT6BASE_INSTALL_STAGING = YES
 QT6BASE_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DINSTALL_ARCHDATADIR=lib/qt6 \
-	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=OFF \
 	-DFEATURE_sql=OFF \
 	-DFEATURE_testlib=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
