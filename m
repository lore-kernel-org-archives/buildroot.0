Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD971C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 18:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21984404D1;
	Mon, 19 Aug 2024 18:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qjns1qaEKkAa; Mon, 19 Aug 2024 18:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7DC4404D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7DC4404D8;
	Mon, 19 Aug 2024 18:56:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BEC4E1BF3CD
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 18:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC7EF60826
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 18:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lk1HK_FhVJNn for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 18:56:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E7487607FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7487607FC
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7487607FC
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 18:56:07 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0954335211C6; Mon, 19 Aug 2024 20:56:04 +0200 (CEST)
Date: Mon, 19 Aug 2024 20:56:04 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsOVRIrcjpiq+uxh@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724093765; bh=jJoET3lnqkglNm3woQw2YElL4it+cylBv5a7yb+Z/qw=;
 h=Date:From:To:Subject:From;
 b=Qj2uBtqbXUZ4kAaE1Yjwl5By36g5vyXXlP2ahgvBxTMtpTvXUeb2W/5wKPGKBiYv4
 Gw5DSlWcQDPvtrOPDh9t7AS+LqUKgI1DoflPe8H+iUnrsYwrDz4Igm76LF/UycVeMA
 wMBU3VTP2e45dayFU+54DYbcnCvFdNVxkoW9ESMHFZP7wJkgrxddmniBMepCyL7dvc
 pBM4F5geLP/oQn12VKZK1GDd4AXaSKRgDK6aopSuonHfeDZFL07wwc+M6dvV2cfczj
 M5gqRCPfu/KYjIb2Vyeun9T/59zapJ0Pl+aZBhnqQQ0VA6lOwzcNNTqhqW85K5LY9r
 320njpWqX3ytg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Qj2uBtqb
Subject: [Buildroot] [PATCH] package/asterisk: security update to 20.9.2
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

See here for a changelog:
https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-20.9.2.md

And here for the security advisory:
https://github.com/asterisk/asterisk/security/advisories/GHSA-c4cg-9275-6w44

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index ee21d88d98..9889a18c9d 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  c928c715dc5ff783ea6cf62cca3eebdc1dc9c5d40ce9b37b0213c0eac7f4090f  asterisk-20.9.1.tar.gz
+sha256  6bc4d982a238397bf6b3bfa523f63a75a2d9b19edd6f33f79264f2385d05bc42  asterisk-20.9.2.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 64ec740d46..9d44782a08 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 20.9.1
+ASTERISK_VERSION = 20.9.2
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
