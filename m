Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C947DCF9C55
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 16:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95AB542CEC;
	Fri, 20 Sep 2024 16:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szN0rxjN8LbC; Fri, 20 Sep 2024 16:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E8A242D15
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E8A242D15;
	Fri, 20 Sep 2024 16:00:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E3A31BF38E
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 16:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58F666F5E2
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 16:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WB89JKzJuTPb for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 16:00:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 95CD56F656
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95CD56F656
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95CD56F656
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 16:00:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB5956000D;
 Fri, 20 Sep 2024 16:00:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1srg3D-00H66B-1C;
 Fri, 20 Sep 2024 18:00:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 17:59:54 +0200
Message-Id: <20240920155955.4074868-6-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240920155955.4074868-1-peter@korsgaard.com>
References: <20240920155955.4074868-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 6/6] utils/update-rust: fix 'following' typo
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
 utils/update-rust | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/update-rust b/utils/update-rust
index 3301434d70..0f40f2e2b6 100755
--- a/utils/update-rust
+++ b/utils/update-rust
@@ -27,7 +27,7 @@ RUST_HOSTS = [
 #       BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
 # - package/rustc/rustc.mk:
 #       RUSTC_TARGET_NAME
-# and check whether one of the follwoing needs updating:
+# and check whether one of the following needs updating:
 # - package/rustc/Config.in.host:
 #       BR2_PACKAGE_HOST_RUSTC_ARCH
 #       BR2_PACKAGE_HOST_RUSTC_ABI
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
