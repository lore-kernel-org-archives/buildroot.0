Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43000C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 21:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2D3E81ECE;
	Tue, 28 Feb 2023 21:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2D3E81ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KddEed8A3U-4; Tue, 28 Feb 2023 21:26:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1276281E84;
	Tue, 28 Feb 2023 21:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1276281E84
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3E1D1BF870
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 21:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C610611DB
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 21:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C610611DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ehGGvXZDgoj for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 21:26:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66EC860B0F
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 21:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66EC860B0F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3517886DEA; Tue, 28 Feb 2023 21:26:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 21:56:05 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1d613d478ee2e4f16cf68e508451d1a26a7a612a
X-Git-Newrev: d48b5b3652a1c724a4c04d97ab35f4c1484a9785
X-Patchwork-Hint: ignore
Message-Id: <20230228212610.3517886DEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/x11r7/xserver_xorg-server: security bump version to 21.1.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=d48b5b3652a1c724a4c04d97ab35f4c1484a9785
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Release notes:
https://lists.x.org/archives/xorg-announce/2023-February/003321.html

Fixes CVE-2023-0494:
https://lists.x.org/archives/xorg-announce/2023-February/003320.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d8f0c02574b485e3250030d8cbf5c057ced578a7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 0c3c807ff3..e2a2a251c3 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003310.html
-sha256  1eb86ed674d042b6c8b1f9135e59395cbbca35ed551b122f73a7d8bb3bb22484  xorg-server-21.1.6.tar.xz
-sha512  5e3cf879facf3a04aa64b7f6129226ea68a97109a7daca5146b57b4c707cc76a4fbad1924997dd319efd8c8c20eb5bb59570a719101b76ae07e923b7e9656239  xorg-server-21.1.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-February/003321.html
+sha256  d9c60b2dd0ec52326ca6ab20db0e490b1ff4f566f59ca742d6532e92795877bb  xorg-server-21.1.7.tar.xz
+sha512  e2a093381e28da9b2aa700c6609349fa851f4ca8df23c776f30e4e2733e7a6c1b257576b93f4c4e87fb09df901385bf52528982f6e7a6ad469597aeae8640bb5  xorg-server-21.1.7.tar.xz
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 04eb5e90b7..33b35b7979 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.6
+XSERVER_XORG_SERVER_VERSION = 21.1.7
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
