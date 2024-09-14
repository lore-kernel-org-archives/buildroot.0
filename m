Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EA2C02180
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 07:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34CC9614A3;
	Sat, 14 Sep 2024 07:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mdi9baF-jvt; Sat, 14 Sep 2024 07:20:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00E3C614A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00E3C614A2;
	Sat, 14 Sep 2024 07:20:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4A9E1BF2EC
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FD8E846E9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zA_1RWM90CSA for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 07:19:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 513A6846FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 513A6846FE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 513A6846FE
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 07:19:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90F2B60006;
 Sat, 14 Sep 2024 07:19:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1spN4L-004zZ2-2e;
 Sat, 14 Sep 2024 09:19:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 09:19:28 +0200
Message-Id: <20240914071930.1189715-21-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240914071930.1189715-1-peter@korsgaard.com>
References: <20240914071930.1189715-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 21/23] package/libpeas: fix typo in help text
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpeas/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpeas/Config.in b/package/libpeas/Config.in
index 430e668ee7..33fae14d4c 100644
--- a/package/libpeas/Config.in
+++ b/package/libpeas/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LIBPEAS
 	select BR2_PACKAGE_GOBJECT_INTROSPECTION
 	select BR2_PACKAGE_LIBGLIB2
 	help
-	  libpeas is a gobject-based plugins engine, and is targetted at
+	  libpeas is a gobject-based plugins engine, and is targeted at
 	  giving every application the chance to assume its own
 	  extensibility. It also has a set of features including, but
 	  not limited to:
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
