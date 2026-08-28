Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB96C61DDA
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E63BE60890;
	Fri, 28 Aug 2026 14:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jM6s3tour86Z; Fri, 28 Aug 2026 14:26:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927172;
	bh=nGOczkTHAAbaFk7ZbNcLAqB6ReJK4AJjnwaboDJ1Kbo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ME/Y/ku+cGsMvzSgi6vD2YHg1DZGim0fRi5K48ew/mRvys9qPVvodgKlGsoiUX08/
	 ZpWwHMpKO9DlLdAPMsYN5+UQDL1DMeTBY1mQz8WtEULGCC75DRxcTTe+FCbN1oasdN
	 35T+sYOOrF1O+6WNXpeyMpPHB4Ne9XCe2GVFoxVmR1exYshNwliFYVfSJbV5emptJw
	 AzCL+8LWikcsHhju1Z6eqrO4O989lL6U+7PRAIU7wooVsoAllem7C7R5xrQwa1aefr
	 y8IE9DnDquqXzTGvwDIU6p9Mr3kSsMOr86UYpQdqFjkW2dzdgYn5SqC4T24OyefSuY
	 mNsK4cLtMvU1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CE0060893;
	Fri, 28 Aug 2026 14:26:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73D52D2C
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7207F6072E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SskXX2NdLAKv for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC2DA60823
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA06E921FA; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:05 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: a40212568cb602b949992aae4a079b36633781dc
X-Git-Newrev: 0266c972b854438f368775251e40629d920dcf66
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.DA06E921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/webkitgtk: fix
 wrong config option
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0266c972b854438f368775251e40629d920dcf66
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Commit 713d63b "package/webkitgtk: add option to enable MiniBrowser",
added support to select BR2_PACKAGE_WEBKITGTK_MINIBROWSER, but forgot
to drop the default -DENABLE_MINIBROWSER=ON entry.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Acked-By: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9f292bb7a1dc383c4b552a155c07040ef3e4ea9e)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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
