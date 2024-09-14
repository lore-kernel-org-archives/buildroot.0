Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6917BC02190
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 11:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2967F6121E;
	Sat, 14 Sep 2024 11:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_JFL_AH1k9e; Sat, 14 Sep 2024 11:27:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65548611A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65548611A4;
	Sat, 14 Sep 2024 11:27:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5856D1BF2C8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B69F0402E8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uObI-3NhczxY for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 11:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A3E34034B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A3E34034B
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 11:26:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96AC682849; Sat, 14 Sep 2024 11:26:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 13:26:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a81496168e5310af4bf9226d19738e834d6a0bf
X-Git-Newrev: 480d667a1907f84630bf061537c14fdb73a33eda
X-Patchwork-Hint: ignore
Message-Id: <20240914112645.96AC682849@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6svg: host variant depends
 on host-qt6base
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=480d667a1907f84630bf061537c14fdb73a33eda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without this, building just host-qt6svg fails.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6svg/qt6svg.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index a9d7eaef51..08570c7f9c 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -36,5 +36,8 @@ QT6SVG_DEPENDENCIES = \
 	host-pkgconf \
 	qt6base
 
+HOST_QT6SVG_DEPENDENCIES = \
+	host-qt6base
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
