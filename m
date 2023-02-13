Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4984C636CC
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 15:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A48660F6D;
	Mon, 13 Feb 2023 15:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A48660F6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FsfxbZJaFejg; Mon, 13 Feb 2023 15:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F01060FCF;
	Mon, 13 Feb 2023 15:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F01060FCF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A67051BF346
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 15:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 808BB81444
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 15:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 808BB81444
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yPoR9FgNXjjA for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 15:10:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC8DD8143A
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC8DD8143A
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 15:10:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 753661814B9; Mon, 13 Feb 2023 16:10:53 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 13 Feb 2023 16:10:39 +0100
Message-Id: <20230213151039.4073397-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1676301053; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=UXuSlygiNYnXAnAT0OM4PaVT392oVkafUjTNwxOAhcs=;
 b=TLdnn1EhfSdvNDcXt8LoeMhWTSoAEZWYVSWfV5eifge1B0QbuLCbrXaH+igC/igbbSweDn
 qNBSac5SJn6yvMegOhJHS20Ae6pHpXrkhORmusDr4iI2hQitdeKqkkaD9jp+iwhdrME8tx
 cuH0FFYoUGrDG8fobOiSTfhz0h5YcHQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=TLdnn1Eh
Subject: [Buildroot] [PATCH] package/networkd-dispatcher: bump to version
 2.2.4
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/networkd-dispatcher/networkd-dispatcher.hash | 2 +-
 package/networkd-dispatcher/networkd-dispatcher.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/networkd-dispatcher/networkd-dispatcher.hash b/package/networkd-dispatcher/networkd-dispatcher.hash
index ffb4fa846a..f50dd75163 100644
--- a/package/networkd-dispatcher/networkd-dispatcher.hash
+++ b/package/networkd-dispatcher/networkd-dispatcher.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  61270b4c2f39c36da4b0a62724a3cc01f6732493fed0f166ee675bafedff11df  networkd-dispatcher-2.2.3.tar.bz2
+sha256  993086fa2dab11ba6b54a121adaccbd4c679ce3c8b3193cfa5c00500c28cbdf9  networkd-dispatcher-2.2.4.tar.bz2
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/networkd-dispatcher/networkd-dispatcher.mk b/package/networkd-dispatcher/networkd-dispatcher.mk
index 2b1aa257ce..a3e0319c10 100644
--- a/package/networkd-dispatcher/networkd-dispatcher.mk
+++ b/package/networkd-dispatcher/networkd-dispatcher.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETWORKD_DISPATCHER_VERSION = 2.2.3
+NETWORKD_DISPATCHER_VERSION = 2.2.4
 NETWORKD_DISPATCHER_SOURCE = networkd-dispatcher-$(NETWORKD_DISPATCHER_VERSION).tar.bz2
 NETWORKD_DISPATCHER_SITE = https://gitlab.com/craftyguy/networkd-dispatcher/-/archive/$(NETWORKD_DISPATCHER_VERSION)
 NETWORKD_DISPATCHER_LICENSE = GPL-3.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
