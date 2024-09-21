Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B8ECF9C68
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 08:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3102E405CA;
	Sat, 21 Sep 2024 08:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_uT5EaoViVa; Sat, 21 Sep 2024 08:09:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDF4440294
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDF4440294;
	Sat, 21 Sep 2024 08:09:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B08001BF3D8
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 08:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F4F540360
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 08:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0316QvE2svnT for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 08:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6761F40245
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6761F40245
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 08:08:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4ED0783CF0; Sat, 21 Sep 2024 08:08:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 09:36:10 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: ecd1646cc8295a65bea08fc615361024a0aca069
X-Git-Newrev: cadcb1f90819533e71067306d35a4d8b1f443e9e
X-Patchwork-Hint: ignore
Message-Id: <20240921080815.4ED0783CF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x]
 package/qt6/qt6core5compat: enable QML compat modules
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cadcb1f90819533e71067306d35a4d8b1f443e9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

When BR2_PACKAGE_QT6DECLARATIVE_QUICK is enabled the QML compatibility
modules should be built and installed.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8d5468491806dee13f3cf51cccedd11c21081c38)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
