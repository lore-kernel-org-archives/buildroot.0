Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F250ED743D9
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 21:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A77CE6FA11;
	Wed, 20 Nov 2024 21:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wHPkq4a6rImv; Wed, 20 Nov 2024 21:04:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7DCE6F61C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7DCE6F61C;
	Wed, 20 Nov 2024 21:04:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D0B4970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59BA8851D9
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGw-4V5jVy2z for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 21:04:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64844851C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64844851C3
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:04:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60B8886503; Wed, 20 Nov 2024 21:04:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Nov 2024 21:38:01 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4c53364d895bd1a605e23d5d5f8949b3e580f857
X-Git-Newrev: 38065ea890737e4d8061d170106b1995632e7842
X-Patchwork-Hint: ignore
Message-Id: <20241120210408.60B8886503@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/qt6/qt6base:
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

commit: https://git.buildroot.net/buildroot/commit/?id=38065ea890737e4d8061d170106b1995632e7842
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
index 471edfb4f9..3c5747db36 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -59,7 +59,6 @@ QT6BASE_INSTALL_STAGING = YES
 
 QT6BASE_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
-	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=OFF \
 	-DFEATURE_sql=OFF \
 	-DFEATURE_testlib=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
