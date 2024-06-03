Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8F7C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CCE26082E;
	Mon,  3 Jun 2024 07:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJ_9xT5NsiM5; Mon,  3 Jun 2024 07:18:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BE5C60A80
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BE5C60A80;
	Mon,  3 Jun 2024 07:18:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38BD41BF2EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D8B64045C
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcfcWOJhds9M for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:17:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F45C4022E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F45C4022E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F45C4022E
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:17:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2381C000D;
 Mon,  3 Jun 2024 07:17:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sE1wn-002Ed3-0w;
 Mon, 03 Jun 2024 09:17:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 09:17:21 +0200
Message-Id: <20240603071726.532652-18-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603071726.532652-1-peter@korsgaard.com>
References: <20240603071726.532652-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 18/23] package/ulogd: use https for _SITE
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
 package/ulogd/Config.in | 2 +-
 package/ulogd/ulogd.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ulogd/Config.in b/package/ulogd/Config.in
index e0e199961a..6631076ae7 100644
--- a/package/ulogd/Config.in
+++ b/package/ulogd/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_ULOGD
 	  ulogd is a userspace logging daemon for netfilter/iptables
 	  related logging.
 
-	  http://www.netfilter.org/projects/ulogd/
+	  https://www.netfilter.org/projects/ulogd/
 
 comment "ulogd needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 2ebf076d9a..8ef8ec5701 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -6,7 +6,7 @@
 
 ULOGD_VERSION = 2.0.8
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
-ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
+ULOGD_SITE = https://www.netfilter.org/projects/ulogd/files
 ULOGD_DEPENDENCIES = host-pkgconf \
 	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
 	libnfnetlink
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
