Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E27D743D9
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 21:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 921C6610C6;
	Wed, 20 Nov 2024 21:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRxID2mF1C4e; Wed, 20 Nov 2024 21:03:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F979610C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F979610C1;
	Wed, 20 Nov 2024 21:03:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D6765B28
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40F4960A5D
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKY1qoDrGRJW for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 21:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5104060646
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5104060646
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:02:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49029860B6; Wed, 20 Nov 2024 21:02:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Nov 2024 21:38:41 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 35069b0ab586f85d141b157754348948fd47d141
X-Git-Newrev: 9ffb14ced94a106e05b81de4f3029ee711d127b2
X-Patchwork-Hint: ignore
Message-Id: <20241120210257.49029860B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/qt6/qt6base:
 remove -DFEATURE_concurrent=OFF from unconditional options
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9ffb14ced94a106e05b81de4f3029ee711d127b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Since commit
a39e0b95e1d927599e212098d1db4d2fafb2a35c ("package/qt6/qt6base: add
support for concurrent module"), we have an explicit option that
enables/disables concurrent support, so it no longer makes sense to
explicitly disable it unconditionally first.

Signed-off-by: Hannah Kiekens <hannah.kiekens@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2de79d7065bc27c94b654232b12acd0af582a0ad)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt6/qt6base/qt6base.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 4c0392f92d..e3c8f8920a 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -46,7 +46,6 @@ QT6BASE_INSTALL_STAGING = YES
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
