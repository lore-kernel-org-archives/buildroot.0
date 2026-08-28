Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A94C61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEA1580F4D;
	Fri, 28 Aug 2026 14:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKOBRMW3SCMK; Fri, 28 Aug 2026 14:23:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927024;
	bh=WsTXkxRcQjmE1S/l+i8LvC/rMVVxN58brn1ukcU1USU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QZ3vzsVwkoDBIh9lgnjtgAUS13jo6dBdX8chTsLuOUnMvPsfdhUQFgD8tYGiTkt08
	 +0ba7kE4Udmw+1LPegcXT36rrF8yJOwAU3jmk7SO4lH9azvyuEiE3jfaLp/4uGbbBP
	 9t8l7n7ppMctVjwzzf2RYrQCr077TnQokTfbk/3eGEVMMlqb3+DYtM13IfECTYqrI5
	 rSjFqHeMILsZdpWeH23fjr0k5KZDcbRbr4SJNdq8+7rO7hiVEncRM/cMESK8b+2A5i
	 lEvf83DsLxLwSog7Zn1Q6sYUwYPv1obJmpMdK6vFPeLGyp1Ew2h1Fw78rU1x7AgvLu
	 mDD7kxVaNm5mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2677180F4A;
	Fri, 28 Aug 2026 14:23:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6339CD2B
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 611C46072E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CjbrHBRPmzie for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9A2B60749
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABBA3921FA; Fri, 28 Aug 2026 14:22:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:57:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4f1d3b786deb4e234bd4a7e20bd9c975ee544017
X-Git-Newrev: fb230744a02fc4a7708d30e69278867495fb3349
X-Patchwork-Hint: ignore
Message-Id: <20260828142241.ABBA3921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/webkitgtk: fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fb230744a02fc4a7708d30e69278867495fb3349
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
