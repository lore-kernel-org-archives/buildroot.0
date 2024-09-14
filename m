Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D54C0219B
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 14:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5520A40688;
	Sat, 14 Sep 2024 14:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gLPUt3QSFozW; Sat, 14 Sep 2024 14:32:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FCA2406E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FCA2406E9;
	Sat, 14 Sep 2024 14:32:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9A551BF28C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8AB260771
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hUPBhEoO2w5i for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 14:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBE42606E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBE42606E7
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:32:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E35E682D13; Sat, 14 Sep 2024 14:32:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 16:32:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce4e5fd129b557ac0411d0a0704be43717310d6d
X-Git-Newrev: 8d5468491806dee13f3cf51cccedd11c21081c38
X-Patchwork-Hint: ignore
Message-Id: <20240914143256.E35E682D13@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6core5compat: enable QML
 compat modules
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d5468491806dee13f3cf51cccedd11c21081c38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_PACKAGE_QT6DECLARATIVE_QUICK is enabled the QML compatibility
modules should be built and installed.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6core5compat/qt6core5compat.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt6/qt6core5compat/qt6core5compat.mk b/package/qt6/qt6core5compat/qt6core5compat.mk
index 0b6d9369cb..aeb5ddd931 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.mk
+++ b/package/qt6/qt6core5compat/qt6core5compat.mk
@@ -36,4 +36,10 @@ QT6CORE5COMPAT_DEPENDENCIES = \
 	host-pkgconf \
 	qt6base
 
+# When Qt::Quick is available, qt6core5compat will build additional
+# QML compatibility modules
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE_QUICK),y)
+QT6CORE5COMPAT_DEPENDENCIES += qt6declarative
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
