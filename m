Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830A3C5DF81
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 19:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D5836061B;
	Sun, 23 Aug 2026 19:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBdWn099YCE5; Sun, 23 Aug 2026 19:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787514153;
	bh=cw0aIT9ryISynin9kP+ekPjtXo/v62f78GFGamFn4Ys=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=moEZYvgJ4rAmPHnmjcdLpxXDrOe/qrFzigjsi9yh4pCK8a2DSDSMFlu83wqtsYsmZ
	 lOuaGnB1KOjMzH6bEZnkquKHCPjvE0wfLExTMw7SyeOzv++6BBJn6n0vvZTVL0uMwI
	 2t7UIRGu8sAJUi6d7VRLNtAR/Ezq9M8PEYtb3mLAkg993TuC1F+VQHi5q22jmHHbi2
	 OuCq9DtW6H6tL/74JF3f8KB+4xhPpGB9ZfQUtgbMQQRskuy6yMqJ33ZUTw73xvR+4f
	 8+EfJ6gM6yI9pXYMG9Ma42hcOThbqI89iBzGtD/+pL4UKJP5P9PzjWGRTQ2ELsy5E5
	 53T5ReXOI0wxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CA2A60622;
	Sun, 23 Aug 2026 19:42:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DF01E336
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5FF640059
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EedZD5wgL-g9 for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 19:42:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44F3E40057
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:42:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9351D8EF56; Sun, 23 Aug 2026 19:41:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Aug 2026 21:38:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 566bdcb97f5706aa08f40a88e4728e4a0bed8257
X-Git-Newrev: 9f292bb7a1dc383c4b552a155c07040ef3e4ea9e
X-Patchwork-Hint: ignore
Message-Id: <20260823194135.9351D8EF56@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: fix wrong config option
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f292bb7a1dc383c4b552a155c07040ef3e4ea9e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 713d63b "package/webkitgtk: add option to enable MiniBrowser",
added support to select BR2_PACKAGE_WEBKITGTK_MINIBROWSER, but forgot
to drop the default -DENABLE_MINIBROWSER=ON entry.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Acked-By: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 6cab2c6a24..ee9e707cb5 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -27,7 +27,6 @@ WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
 	-DENABLE_DOCUMENTATION=OFF \
 	-DENABLE_GEOLOCATION=OFF \
-	-DENABLE_MINIBROWSER=ON \
 	-DENABLE_SPELLCHECK=ON \
 	-DENABLE_WEB_RTC=OFF \
 	-DPORT=GTK \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
