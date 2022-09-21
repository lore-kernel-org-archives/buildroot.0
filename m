Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E9EC32771
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5BB36107E;
	Wed, 21 Sep 2022 20:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5BB36107E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4726iE09vaNR; Wed, 21 Sep 2022 20:55:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCFD561079;
	Wed, 21 Sep 2022 20:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCFD561079
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 497561BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 935E960FC0
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 935E960FC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yf7s9dGTW4xb for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:55:37 +0000 (UTC)
X-Greylist: delayed 00:05:14 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2B2E60757
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2B2E60757
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:55:36 +0000 (UTC)
Date: Wed, 21 Sep 2022 20:49:59 +0000
To: buildroot@buildroot.org
Message-ID: <20220921204916.3420825-1-fhunleth@troodon-software.com>
Feedback-ID: 38965776:user:proton
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=troodon-software.com; s=protonmail2; t=1663793409; x=1664052609;
 bh=UoSgf35FOgfgP0JRlDEo1zTXTerFdquVq1bjSf5I7nU=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID;
 b=QMwnQywPYB6j2Vw0wzsw+dANO5UPkSzXzE3bYS4GurSH9UNXbqkJX/i3/Ne+UNor4
 SDgftvga5BqDeslcqXKE3xjMYldCmz+3vhOrH/jiCUScAowIs9P/kCiOQrbeQ3/ZNx
 youR+KxIeEXgbxSE93RnOIUbkN45StYk/Zu/PqbGnTOJQ4A9TQ9f9eBfGDQvY+RZ1K
 UmJWQySPThsZZtXUEb+CNFE+YcuY6i+FBZLWFhORGI23LIsKws40so0aHaR4B7I6tU
 vYFNpeOU2WCywA56y7rqnQEbRo/d/lBWTZ8oRwTXPbAUpuajvulByyN5OlifpJrGLS
 Ffh0mgYC2XFBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=troodon-software.com header.i=@troodon-software.com
 header.a=rsa-sha256 header.s=protonmail2 header.b=QMwnQywP
X-Mailman-Original-Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (2048-bit key) header.d=troodon-software.com
 header.i=@troodon-software.com header.b="QMwnQywP"
Subject: [Buildroot] [PATCH] package/erlang: support aarch64 host-erlang
 builds
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
From: Frank Hunleth via buildroot <buildroot@buildroot.org>
Reply-To: Frank Hunleth <fhunleth@troodon-software.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following warning when building erlang on aarch64
machines:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_ERLANG
  Depends on [n]: BR2_USE_MMU [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_PACKAGE_ERLANG_ARCH_SUPPORTS [=n]

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 15931b5896..5198f35efc 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
 	bool
 	default y if BR2_HOSTARCH = "x86_64"
 	default y if BR2_HOSTARCH = "x86"
+	default y if BR2_HOSTARCH = "aarch64"

 config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	bool
--
2.34.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
