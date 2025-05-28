Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F20C5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 13:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D35F60E52;
	Wed, 28 May 2025 13:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7FIoUwHwpaW; Wed, 28 May 2025 13:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3321660E49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3321660E49;
	Wed, 28 May 2025 13:44:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48537DCA
 for <buildroot@buildroot.org>; Wed, 28 May 2025 13:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A65640BCF
 for <buildroot@buildroot.org>; Wed, 28 May 2025 13:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9DFzx3vGvTj for <buildroot@buildroot.org>;
 Wed, 28 May 2025 13:44:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1831940085
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1831940085
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1831940085
 for <buildroot@buildroot.org>; Wed, 28 May 2025 13:44:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 91DB743A1E;
 Wed, 28 May 2025 13:44:07 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>
Date: Wed, 28 May 2025 15:44:05 +0200
Message-ID: <20250528134406.72189-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeegudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtffdttdelvdegfeevgeeftdejvdevledtveekfffgjeegieevieejuedvveegueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedvrgdtudemtggsudelmeelvddtsgemgeejtddtmegsvdgtrgemsggtvdekmeekfhgtmegvudehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeelvddtsgemgeejtddtmegsvdgtrgemsggtvdekmeekfhgtmegvudehiedphhgvlhhopeifihhnughsuhhrfhdrhhhomhgvpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtl
 hhinhdrtghomhdprhgtphhtthhopehguhhilhhlrghumhgvrdgthhgrhigvseiivggvthhimhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748439847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=C1OSAmE9POA34k/F+kIyLRTtSb2GHvNS7wNbTPMTccg=;
 b=g/6WsQR6oJ6MQNXAaXTQ0c9tC7yN93DrP0WacZS4hocWMAOLpHersm28L2LrAN2J4CQX/W
 tyhSv4GH/thsUBlZ4hfdJx3suUX87Uprpik2uLpSsurZduHHRh8KzXN9tc7sJyT7GPcf9y
 Ig4BdpCRqV8erl+atDuyuvAseOeztZU7zAoS+9IQ1JoX0WBWbV4ntHMDl7fXv1jT3qUss4
 UWv0o3HtE2mjXq/WXVD1MC4hvEhYvxbaFGf/XpTHviiWBzV7KIM7iC1VoIZi0h/lV751k5
 xXgeX8LCza0oSaWk9ol9+2/itYkjlgFfyu80MMvWRGyq+uSTkkwWw4f8xoYsog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g/6WsQR6
Subject: [Buildroot] [PATCH] package/sane-airscan: propagate dependencies of
 selects
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When the sane-airscan package was introduced in
f78280bf262ceb1c1abbdade9de77fcc4add74ae, the depends on of options
that is selects were not properly accounted for, so let's fix this.

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_GNUTLS
  Depends on [n]: !BR2_STATIC_LIBS [=n] && BR2_USE_WCHAR [=n]
  Selected by [y]:
  - BR2_PACKAGE_SANE_AIRSCAN [=y]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sane-airscan/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/sane-airscan/Config.in b/package/sane-airscan/Config.in
index f35e244ea6..b7cf224741 100644
--- a/package/sane-airscan/Config.in
+++ b/package/sane-airscan/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_SANE_AIRSCAN
 	bool "sane-airscan"
+	depends on !BR2_STATIC_LIBS # avahi, gnutls, sane-backends
+	depends on BR2_TOOLCHAIN_HAS_THREADS # avahi, dbus
+	depends on BR2_USE_WCHAR # avahi, gnutls
+	depends on BR2_USE_MMU # dbus, sane-backends
 	select BR2_PACKAGE_AVAHI
 	select BR2_PACKAGE_AVAHI_DAEMON # needed to get avahi-client
 	select BR2_PACKAGE_DBUS # needed by avahi to get avahi-client
@@ -18,3 +22,8 @@ config BR2_PACKAGE_SANE_AIRSCAN
 	  support "driverless" scanning.
 
 	  https://github.com/alexpevzner/sane-airscan
+
+comment "sane-airscan needs a toolchain w/ wchar, dynamic library, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
