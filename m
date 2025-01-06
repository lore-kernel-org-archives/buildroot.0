Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15023E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 22:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B52DF4056F;
	Mon,  6 Jan 2025 22:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fgRLeVL4OxZQ; Mon,  6 Jan 2025 22:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90DC540702
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90DC540702;
	Mon,  6 Jan 2025 22:30:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1178EDB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E47A4402E6
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3GYYzstdTBs for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 22:30:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0980D400A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0980D400A6
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:30:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E874583BD4; Mon,  6 Jan 2025 22:30:19 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Jan 2025 23:29:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3722998a3d0b771154b5069798f55ff9ea2c81bd
X-Git-Newrev: 0bfb561239a3b7792f5f89e61d416c59feaa1068
X-Patchwork-Hint: ignore
Message-Id: <20250106223019.E874583BD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6quick3d: add missing select
 BR2_PACKAGE_QT6DECLARATIVE
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

commit: https://git.buildroot.net/buildroot/commit/?id=0bfb561239a3b7792f5f89e61d416c59feaa1068
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt6quick3d has qt6declative in its dependencies, but does not select
BR2_PACKAGE_QT6DECLARATIVE. It does select
BR2_PACKAGE_QT6DECLARATIVE_QUICK, but this option "depends on"
BR2_PACKAGE_QT6DECLARATIVE, and does not select it.

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_QT6DECLARATIVE_QUICK
  Depends on [n]: BR2_PACKAGE_QT6 [=y] && BR2_PACKAGE_QT6DECLARATIVE [=n]
  Selected by [y]:
  - BR2_PACKAGE_QT6QUICK3D [=y] && BR2_PACKAGE_QT6 [=y]

reported by kconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qt6/qt6quick3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6quick3d/Config.in b/package/qt6/qt6quick3d/Config.in
index c4b8148039..3ec267734f 100644
--- a/package/qt6/qt6quick3d/Config.in
+++ b/package/qt6/qt6quick3d/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_QT6QUICK3D
 	select BR2_PACKAGE_HOST_QT6BASE_CONCURRENT # Host Quick3DRuntimeRender
 	select BR2_PACKAGE_HOST_QT6BASE_GUI
 	select BR2_PACKAGE_HOST_QT6BASE_WIDGETS
+	select BR2_PACKAGE_QT6DECLARATIVE
 	select BR2_PACKAGE_QT6DECLARATIVE_QUICK
 	help
 	  This package corresponds to the Qt Quick 3D module:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
