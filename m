Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BBBEE01E8
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 529EE60A48;
	Tue, 10 Sep 2024 20:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88fzVVIEaWl0; Tue, 10 Sep 2024 20:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C6FC60AB9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C6FC60AB9;
	Tue, 10 Sep 2024 20:52:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29F101BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BC3D608BD
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1P_lKoSvFBv for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3265B608BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3265B608BF
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F7F486F60; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:49:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a11cb9bdd92da964ce1d5141c21558e6df02808
X-Git-Newrev: be495963ed8c6c3b781915af45fd92c27b2bef1d
X-Patchwork-Hint: ignore
Message-Id: <20240910205131.2F7F486F60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dcron: fix opening typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=be495963ed8c6c3b781915af45fd92c27b2bef1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-main.c-add-newline-to-logfile-openning-error-message.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch b/package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch
index 6abc3105e4..fe0a33d1af 100644
--- a/package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch
+++ b/package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch
@@ -1,7 +1,7 @@
 From 2710bc67cd920323da9b23a3d60193577bd43d71 Mon Sep 17 00:00:00 2001
 From: Carlos Santos <unixmania@gmail.com>
 Date: Sat, 20 Jul 2019 00:27:31 -0300
-Subject: [PATCH] main.c: add newline to logfile openning error message
+Subject: [PATCH] main.c: add newline to logfile opening error message
 
 Signed-off-by: Carlos Santos <unixmania@gmail.com>
 [Upstream status: https://github.com/dubiousjim/dcron/pull/22]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
