Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95C9C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 21:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5361440317;
	Sun, 28 Jul 2024 21:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6hVbZP1V0GM; Sun, 28 Jul 2024 21:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0823D40319
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0823D40319;
	Sun, 28 Jul 2024 21:43:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01D1B1BF42E
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 21:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFBAB403A9
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 21:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wc-bKNr1Mf7W for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 21:43:43 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=188.68.63.98; helo=relay.yourmailgateway.de;
 envelope-from=mail@t-voltmer.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 68435401D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68435401D8
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.98])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68435401D8
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 21:43:41 +0000 (UTC)
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
 by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4WXFNn2W98z613l
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 23:43:37 +0200 (CEST)
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4WXFNn1ndnz4xGj
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 23:43:37 +0200 (CEST)
Received: from mxe217.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4WXFNn03M2z8sZV
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 23:43:36 +0200 (CEST)
Received: from cygn.lan (ipb21a3d34.dynamic.kabel-deutschland.de
 [178.26.61.52])
 by mxe217.netcup.net (Postfix) with ESMTPSA id C72FB83A87;
 Sun, 28 Jul 2024 23:43:31 +0200 (CEST)
From: Torben Voltmer <mail@t-voltmer.net>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 23:42:22 +0200
Message-ID: <20240728214222.2515625-1-mail@t-voltmer.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Rspamd-Queue-Id: C72FB83A87
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: oknwbnAPm9I4MN0Opl52W2PYwy6rurn4FiVlGQHmFuzjwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=t-voltmer.net
X-Mailman-Original-Authentication-Results: mors-relay-2501.netcup.net;
 dkim=permerror (bad
 message/signature format)
Subject: [Buildroot] [PATCH 1/1] package/espflash: add BR2_PACKAGE_HAS_UDEV
 dependency
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
Cc: Torben Voltmer <mail@t-voltmer.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adding the dependency on BR2_PACKAGE_HAS_UDEV, since espflash links libudev
(via the libudev-sys crate). This should fix some of the autobuilder
failures caused by the espflash package.

Signed-off-by: Torben Voltmer <mail@t-voltmer.net>
---
 package/espflash/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/espflash/Config.in b/package/espflash/Config.in
index 2a7a0f6b38..62b1dc381c 100644
--- a/package/espflash/Config.in
+++ b/package/espflash/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ESPFLASH
 	bool "espflash"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  Serial flasher utilities for Espressif devices, based
@@ -8,3 +9,6 @@ config BR2_PACKAGE_ESPFLASH
 	  ESP32-C2/C3/C6, ESP32-H2, ESP32-P4, and ESP32-S2/S3.
 
 	  https://github.com/esp-rs/espflash
+
+comment "espflash needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
\ No newline at end of file
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
