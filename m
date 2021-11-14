Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13E9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:13:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E7B560EE7
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E7B560EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7932080BE6;
	Sun, 14 Nov 2021 14:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3t2nRrjzFbnS; Sun, 14 Nov 2021 14:13:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D534280BD8;
	Sun, 14 Nov 2021 14:13:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E36031BF973
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E08FE80B8F
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sWZ168rOhmzB for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:13:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26ED880B8E
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:13:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B7A338D215; Sun, 14 Nov 2021 14:09:30 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:13:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 74d8e71cd72a2caf2e3089ada566be6ddf74d5ba
X-Git-Newrev: 914a8133a0e4c7e356a3016cf10bf65441a08e9a
X-Patchwork-Hint: ignore
Message-Id: <20211114140930.B7A338D215@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt5declarative: move
 the qt5gui select from qt5declarative to qt5quick
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
Content-Type: multipart/mixed; boundary="===============5979013536545048573=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5979013536545048573==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=914a8133a0e4c7e356a3016cf10bf65441a08e9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As requested/suggested by Sergey Kuzminov([1]) move the qt5gui select from
qt5declarative to qt5quick.

The qt5declarative (without qt5quick) compiles and installs fine without
qt5gui enabled and code inspection of the qt5declarative souce package *.pro
files shows the unconditionally gui dependencies only in for doc-snippets
and/or test projectes or real the qt5quick moduls.

[1] https://lore.kernel.org/buildroot/6fd05f97-7fb9-96d8-cca0-5063be8ad620@gmail.com

Reported-by: "Кузьминов Сергей" <kuzminov.sergey81@gmail.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5declarative/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index 3ba9224c22..5ec83daa27 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_QT5DECLARATIVE
 	bool "qt5declarative"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	select BR2_PACKAGE_QT5BASE_GUI
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -16,6 +15,7 @@ if BR2_PACKAGE_QT5DECLARATIVE
 
 config BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	bool "quick module"
+	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5_GL_AVAILABLE
 
 endif

--===============5979013536545048573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5979013536545048573==--
