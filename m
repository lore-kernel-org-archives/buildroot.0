Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF23C27C4F
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70ED16083C;
	Mon,  3 Jun 2024 07:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uyZaOGAGKc-3; Mon,  3 Jun 2024 07:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81F0D6082F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81F0D6082F;
	Mon,  3 Jun 2024 07:17:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34AAB1BF2EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C4608420E
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ss0qShE4sKVm for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:17:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 03A8E84247
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03A8E84247
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03A8E84247
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:17:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F9EEE0009;
 Mon,  3 Jun 2024 07:17:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sE1wh-002Ear-2W;
 Mon, 03 Jun 2024 09:17:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 09:17:11 +0200
Message-Id: <20240603071726.532652-8-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603071726.532652-1-peter@korsgaard.com>
References: <20240603071726.532652-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 08/23] package/libnetfilter_acct: use https for
 _SITE
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

http redirects to https, so use that instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnetfilter_acct/Config.in            | 2 +-
 package/libnetfilter_acct/libnetfilter_acct.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnetfilter_acct/Config.in b/package/libnetfilter_acct/Config.in
index ecfef6dc64..614af27fe1 100644
--- a/package/libnetfilter_acct/Config.in
+++ b/package/libnetfilter_acct/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_LIBNETFILTER_ACCT
 	  libnetfilter_acct is the userspace library providing interface
 	  to extended accounting infrastructure.
 
-	  http://www.netfilter.org/projects/libnetfilter_acct/
+	  https://www.netfilter.org/projects/libnetfilter_acct/
diff --git a/package/libnetfilter_acct/libnetfilter_acct.mk b/package/libnetfilter_acct/libnetfilter_acct.mk
index e791f6f13f..6763ad27dd 100644
--- a/package/libnetfilter_acct/libnetfilter_acct.mk
+++ b/package/libnetfilter_acct/libnetfilter_acct.mk
@@ -6,7 +6,7 @@
 
 LIBNETFILTER_ACCT_VERSION = 1.0.3
 LIBNETFILTER_ACCT_SOURCE = libnetfilter_acct-$(LIBNETFILTER_ACCT_VERSION).tar.bz2
-LIBNETFILTER_ACCT_SITE = http://www.netfilter.org/projects/libnetfilter_acct/files
+LIBNETFILTER_ACCT_SITE = https://www.netfilter.org/projects/libnetfilter_acct/files
 LIBNETFILTER_ACCT_INSTALL_STAGING = YES
 LIBNETFILTER_ACCT_DEPENDENCIES = host-pkgconf libmnl
 LIBNETFILTER_ACCT_LICENSE = LGPL-2.1+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
