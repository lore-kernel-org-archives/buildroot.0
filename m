Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4BCC02190
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 11:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C93D36071D;
	Sat, 14 Sep 2024 11:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZB24uCDhu_i; Sat, 14 Sep 2024 11:27:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76CD06139A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76CD06139A;
	Sat, 14 Sep 2024 11:27:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E3471BF2C8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44B2840130
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1n5tQHWmiV-u for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 11:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 546AB403C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 546AB403C9
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 11:26:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 891768284C; Sat, 14 Sep 2024 11:26:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 12:46:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aba638007f198bc12f01d7e6511baa3d3fecb2f6
X-Git-Newrev: 4a81496168e5310af4bf9226d19738e834d6a0bf
X-Patchwork-Hint: ignore
Message-Id: <20240914112645.891768284C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6tools: enable QML support
 in linguist
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a81496168e5310af4bf9226d19738e834d6a0bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_PACKAGE_QT6DECLARATIVE_QUICK is enabled the qt linuguist tool
lupdate should support QML/JS files.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6tools/qt6tools.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index e5e74f117e..b063f08887 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -49,6 +49,12 @@ HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
 
 ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS),y)
 HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=ON
+# When we have qt6declarative for the target, we need to build the
+# linguist tool with host-qt6declarative support so that it handles
+# QML/JS files
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+HOST_QT6TOOLS_DEPENDENCIES += host-qt6declarative
+endif
 else
 HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
