Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31887CCFA00
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C432411A8;
	Thu, 30 Oct 2025 08:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZOfQcRa5c9a; Thu, 30 Oct 2025 08:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18A7D411E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18A7D411E5;
	Thu, 30 Oct 2025 08:23:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DAD82A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BA2B6138C
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKQvxKl9iQhA for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 632BD61385
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 632BD61385
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 406F987A0E; Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:17:47 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 6f06b87b7886ceca6f2934a410e75ba55ac6ab0c
X-Git-Newrev: 03587fbb4469177f8de08654ce85ee3384640b69
X-Patchwork-Hint: ignore
Message-Id: <20251030082228.406F987A0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x]
 package/qt6/qt6multimedia: add dependency to qt6svg for examples
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=03587fbb4469177f8de08654ce85ee3384640b69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Buildroot commit 553c55e9bd3cfa05cb84fa4cdfc5d25d51c3486b added the
qt6multimedia package including an option to build examples which
contains a dependency to qt6svg without selecting the package in
Config.in.

Fixes:
https://autobuild.buildroot.org/results/c94670cf255a1a6975e99d7b22a159f7fdc6f850/

    Makefile:578: *** qt6svg is in the dependency chain of qt6multimedia
    that has added it to its _DEPENDENCIES variable without selecting it
    or depending on it from Config.in.  Stop.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f37c48faf62cdd337bc9733e74cb46544dbdeea9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/qt6/qt6multimedia/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
index f64f60a004..8cdd95f3e8 100644
--- a/package/qt6/qt6multimedia/Config.in
+++ b/package/qt6/qt6multimedia/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_QT6MULTIMEDIA_ALSA
 
 config BR2_PACKAGE_QT6MULTIMEDIA_EXAMPLES
 	bool "examples"
+	select BR2_PACKAGE_QT6SVG
 	help
 	  This option enables the Qt6 Multimedia examples.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
