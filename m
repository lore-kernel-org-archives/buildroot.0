Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C8EC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A89560D62;
	Mon, 15 Aug 2022 09:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A89560D62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1_7yKnycciaI; Mon, 15 Aug 2022 09:35:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E68160AF7;
	Mon, 15 Aug 2022 09:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E68160AF7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D7B211BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1FC760AF7
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1FC760AF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AIXufygcK4oY for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:35:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05D5860AD4
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05D5860AD4
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 07F82875C5; Mon, 15 Aug 2022 09:20:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:34:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 106e2b448c5249aa905aeaa0a5a1d1f87cf8f694
X-Git-Newrev: a53be62fadd5d7bbe54f3ada1b5e41f69705ac1e
X-Patchwork-Hint: ignore
Message-Id: <20220815092037.07F82875C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/q5doc: fix dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=a53be62fadd5d7bbe54f3ada1b5e41f69705ac1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit fa917d0ca96baf4ef877a80e57d438bfbb8cdf2d forgot to add
BR2_PACKAGE_QT5_JSCORE_AVAILABLE dependency:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_QT5DECLARATIVE
  Depends on [n]: BR2_PACKAGE_QT5 [=y] && BR2_PACKAGE_QT5_JSCORE_AVAILABLE [=n]
  Selected by [y]:
  - BR2_PACKAGE_QT5DOC [=y] && BR2_PACKAGE_QT5 [=y]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5doc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5doc/Config.in b/package/qt5/qt5doc/Config.in
index 1ab5f8d333..e9685a4d50 100644
--- a/package/qt5/qt5doc/Config.in
+++ b/package/qt5/qt5doc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QT5DOC
 	bool "qt5doc (includes quick demos)"
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
 	select BR2_PACKAGE_QT5BASE_EXAMPLES
 	select BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
