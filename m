Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C3BC27C5E
	for <buildroot@archiver.kernel.org>; Mon, 10 Jun 2024 15:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AC61402BC;
	Mon, 10 Jun 2024 15:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXerxnxqASSF; Mon, 10 Jun 2024 15:41:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB8C0404C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB8C0404C6;
	Mon, 10 Jun 2024 15:41:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BCD861BF3BE
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 15:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9969404C6
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 15:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtuzZB_iboh4 for <buildroot@lists.busybox.net>;
 Mon, 10 Jun 2024 15:41:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.53.144.211;
 helo=mail.athaariq.my.id; envelope-from=foss@athaariq.my.id;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BF30C402BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF30C402BC
Received: from mail.athaariq.my.id (unknown [117.53.144.211])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF30C402BC
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 15:41:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.100.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.athaariq.my.id (Postfix) with ESMTPSA id A491E4305B;
 Mon, 10 Jun 2024 15:41:34 +0000 (UTC)
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
To: buildroot@buildroot.org
Date: Mon, 10 Jun 2024 22:40:22 +0700
Message-ID: <20240610154028.792440-1-foss@athaariq.my.id>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=athaariq.my.id
Subject: [Buildroot] [PATCH 1/3] package/go: expose option to enable via
 configurator
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
Cc: Athaariq Ardhiansyah <foss@athaariq.my.id>,
 Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Just in case you forgot it, I re-exposed the configuration option for
enabling host-go virtual package before I'm adding host-go-bin
subpackage.

Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
---
 package/go/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 483393f8e4..32483871e7 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -34,7 +34,7 @@ config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 
 # Go packages should select BR2_PACKAGE_HOST_GO
 config BR2_PACKAGE_HOST_GO
-	bool
+	bool "host go"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 
 if BR2_PACKAGE_HOST_GO
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
