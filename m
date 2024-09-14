Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B410C02180
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 07:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2576E613B4;
	Sat, 14 Sep 2024 07:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdCi95L-fF0q; Sat, 14 Sep 2024 07:20:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24C30607E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24C30607E0;
	Sat, 14 Sep 2024 07:20:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4357F1BF2EC
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E3C360761
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MfTOK6GEx6XD for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 07:19:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2FB1260B04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FB1260B04
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FB1260B04
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 07:19:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A32EDE0005;
 Sat, 14 Sep 2024 07:19:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1spN4M-004zZB-1G;
 Sat, 14 Sep 2024 09:19:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 09:19:29 +0200
Message-Id: <20240914071930.1189715-22-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240914071930.1189715-1-peter@korsgaard.com>
References: <20240914071930.1189715-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 22/23] package/libvirt: fix typo in init script
 comment
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
Cc: Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvirt/S92libvirtd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvirt/S92libvirtd b/package/libvirt/S92libvirtd
index 736519f3d0..35368ef5a2 100644
--- a/package/libvirt/S92libvirtd
+++ b/package/libvirt/S92libvirtd
@@ -47,7 +47,7 @@ load_modules() {
 }
 
 #
-# If libvirtd dies it leves behind one stale dnsmasq per virtual network that
+# If libvirtd dies it leaves behind one stale dnsmasq per virtual network that
 # must be killed before starting libvirtd again.
 #
 rm_stale_dnsmasq() {
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
