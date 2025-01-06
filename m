Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52BFE77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 22:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EA22403E7;
	Mon,  6 Jan 2025 22:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XwXl2QBkSY5U; Mon,  6 Jan 2025 22:33:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EC9E4029F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EC9E4029F;
	Mon,  6 Jan 2025 22:33:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D753F1E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B88E600D4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31KTBK3JdQJd for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 22:33:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64EA7606C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64EA7606C1
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:33:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FA2683BE5; Mon,  6 Jan 2025 22:33:06 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Jan 2025 23:32:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0bfb561239a3b7792f5f89e61d416c59feaa1068
X-Git-Newrev: cbb2a917d2fc32cca136646efd67b756ba4eb142
X-Patchwork-Hint: ignore
Message-Id: <20250106223306.4FA2683BE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6quicktimeline: add missing
 select BR2_PACKAGE_QT6DECLARATIVE
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbb2a917d2fc32cca136646efd67b756ba4eb142
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt6quicktimeline has qt6declative in its dependencies, but does not
select BR2_PACKAGE_QT6DECLARATIVE. It does select
BR2_PACKAGE_QT6DECLARATIVE_QUICK, but this option "depends on"
BR2_PACKAGE_QT6DECLARATIVE, and does not select it.

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_QT6DECLARATIVE_QUICK
  Depends on [n]: BR2_PACKAGE_QT6 [=y] && BR2_PACKAGE_QT6DECLARATIVE [=n]
  Selected by [y]:
  - BR2_PACKAGE_QT6QUICKTIMELINE [=y] && BR2_PACKAGE_QT6 [=y]

reported by kconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qt6/qt6quicktimeline/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6quicktimeline/Config.in b/package/qt6/qt6quicktimeline/Config.in
index 4dcf0e1452..466aab23c8 100644
--- a/package/qt6/qt6quicktimeline/Config.in
+++ b/package/qt6/qt6quicktimeline/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QT6QUICKTIMELINE
 	bool "qt6quicktimeline"
+	select BR2_PACKAGE_QT6DECLARATIVE
 	select BR2_PACKAGE_QT6DECLARATIVE_QUICK
 	help
 	  This package corresponds to the Qt Quick Timeline module:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
