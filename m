Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F255EA71A1
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 19:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4BB760FFE;
	Sun, 19 Apr 2026 19:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Uj6XorNE18x; Sun, 19 Apr 2026 19:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F09960FF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776627054;
	bh=RSOrto1zVdSHnBYr8GY/USejt0Ee26Tjjhx/0xMCVr8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NafwiVzQb9nipeUsw8+iGuKuG653ALZ+7A6Zz35M1XbxV4+WilW5qqPgFXlXfnC8o
	 mZ06RKD0nieFoGcSOiCRGdhSppu6jznKGy/jy3IYNUKxeHnlg59NBL4FW/1FSIMfms
	 wXQSwmuLJ24M5ot9Hp6zKtDSMsKfpMg8XtWb2llxb7/H3ETvT1Gczkx/+3S9C1gh8Q
	 t3tYzmwmhr5YF3QTPrlGyfIHRfsohi2KwreLWok2IKYlQKgszo985PlGzs6/Gyrzgh
	 14v2L/0yFdiLkLy46ZPuE7o8bcg+rWgxXMisCHbNhd/i9k5OjPTPDwEEGiP3/gUYWV
	 85z43SLnCqAUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F09960FF2;
	Sun, 19 Apr 2026 19:30:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DFA9259
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F40660FF1
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XmxKgTa_UPhF for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 19:30:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1769C60C23
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1769C60C23
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:30:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C08EC81F7F; Sun, 19 Apr 2026 19:30:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 21:27:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dcf78651abe57bf745703d6bd95aed6ae2c12af3
X-Git-Newrev: 5f78b5661f6d44daead89f28346c2c573b33954d
X-Patchwork-Hint: ignore
Message-Id: <20260419193050.C08EC81F7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwebsockets: bump version to
 4.5.8
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5f78b5661f6d44daead89f28346c2c573b33954d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/warmcat/libwebsockets/compare/v4.5.7...v4.5.8

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libwebsockets/libwebsockets.hash | 2 +-
 package/libwebsockets/libwebsockets.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 6d708135d5..654d3007e6 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d08df7634da0a377a4e077400ed6b2d1d25cf0b239e89397cd39432c5eb437ac  libwebsockets-4.5.7.tar.gz
+sha256  b6ade658f4af3a823d0dc806ae5ef0623f0f4f5e2aeb895a0f77c4783840c30e  libwebsockets-4.5.8.tar.gz
 sha256  6ff2868dd9d9e251de27574342663f4773a8c2f954128899eb6f3c2ba9d9a245  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 3c7e778ccc..51f3df80f1 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 4.5.7
+LIBWEBSOCKETS_VERSION = 4.5.8
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
