Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54770C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 14:47:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3C1B60F00
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 14:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3C1B60F00
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6282F606E6;
	Sat, 31 Jul 2021 14:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CO2uTBPptd-Y; Sat, 31 Jul 2021 14:47:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0A64606A3;
	Sat, 31 Jul 2021 14:47:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29ADA1BF2EB
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 14:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1493583440
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 14:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7iBz2ax6Lawt for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 14:47:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC6F88343B
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 14:46:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BC6961827C4; Sat, 31 Jul 2021 16:46:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1627742814; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=HC1TZKaNTXwzyZCgvrGNYaptTX+npbMqnPN1gylc1Fk=;
 b=kiC2aVX10AKTgqw/Pt/vpIRB1y0oqi2QcgB8HkDWby+j02otgpxuYKLsXEv2rqmpC4niRQ
 sh8+LjIdCKfp9BsP/lTFTgJhS6L0W3Eyrv3Gy4xdyDQmQPMdxlbIHlJHNiAlp/ZzVm30Bb
 tmngirPVCF528KUy/H/ECMxrRUUFR1c=
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 16:46:20 +0200
Message-Id: <20210731144622.66168-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH] package/neard: update url
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff <buildroot@heine.tech>, Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

01.org url is permission denied. There seems to be no project page
anymore. Use kernel.org repo with cleaner https url.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/neard/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/neard/Config.in b/package/neard/Config.in
index 277e467ced..a60fb3f8f6 100644
--- a/package/neard/Config.in
+++ b/package/neard/Config.in
@@ -13,9 +13,7 @@ config BR2_PACKAGE_NEARD
 	  daemon is a part of the NFC stack provided by the Linux NFC
 	  project.
 
-	  http://git.kernel.org/?p=network/nfc/neard.git;a=summary
-
-	  https://01.org/linux-nfc/
+	  https://git.kernel.org/pub/scm/network/nfc/neard.git
 
 if BR2_PACKAGE_NEARD
 
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
