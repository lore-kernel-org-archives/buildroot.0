Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56E9C48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 18:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA68E82166;
	Sun, 18 Feb 2024 18:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oHXl3eXUcPzu; Sun, 18 Feb 2024 18:46:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B588A82169
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B588A82169;
	Sun, 18 Feb 2024 18:46:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3A61BF41F
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 18:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65DCC400C8
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 18:45:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pd1NELKM_3vm for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 18:45:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE5AF40148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE5AF40148
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE5AF40148
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 18:45:42 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bmASrFAK1ce1vbmAWrHZK8; Sun, 18 Feb 2024 19:45:40 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 18 Feb 2024 19:45:36 +0100
Message-Id: <20240218184536.1922309-9-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
References: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPD5j9wmPlTkWrcMaGf2I30KURWS0NCKMGBRQBVsETU4+xjeqOzDLsSGUYEW8bjU9xa5iibmq1vDcIfNLpDcqoUbQwSNh0rvmpY+BQ9uCChM3hslicps
 F8kh0CymdfvNpm/cWyF4DQvYsw7CMyaf/F+wVXB2FGCjL4vZG+2VAcm3rX1ulSr6yW154AMtKS56ZrezK84qp5+38RoukuJyvRi0BGJXEZTdrCgSo2SENkmM
 NLEKzHOMGu1C9YRY0dDRX5kihWr8b2ozGhuZWhi0QyW8aOHls3BJC6eRXL9+Fcf7aHLMmSjJ9QHvIAYsHl83/rTgoodCMKsxrObBMpMar3UEg02d4tA2xw/w
 StIoF8DrV8A0MDNItXOQcBP3cH6AGDkE3MDvY7PtbMSlBlplXgYqhT9rBSdQVIDPnIcN8DAa1BG2jVtHalppLslWyX2urvSznpJHvbg6Q9TlFYj3J6Qaaqh3
 q6PT4cULZLgYlHhaEa9Gs58Wi9oA73tpLHqCi1HKV2n/4zctSuvBrNEq1B3i/yZudZDufacwKqVT/Ha5Nt6GQb/+9Rz9U6eGtDdTTVOC1aQt5pR/7UiKDHwm
 21Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708281940; bh=MGA02+T+s66BGa/+Flq+CcLI58fqJzNiuIkfOFogmew=;
 h=From:To:Subject:Date:MIME-Version;
 b=X+90X6I4O5NYcGj+6oVow90nBH9Osm8oFxerD8EGE/NRa8McZDJdmEQAmvgM3hZGf
 HZHtrf8yxIRjHZO4Iz0pRtfDfw1pZF1vSFw2Oag6LHDNVK6duKA45i503jvwzJV0EH
 R2a2wlDVy8X9LWJq6H//gVjjF/h59YqGFd6ZF6ywF2x2hc0IsP2rLi+1arYiPbp4/J
 d0V+IbyjMWfD1GCozFueQmvKrD9gsamCgcmm+GtJGKqK3pSDNhjlxbd/4Ff0uwpNhD
 xAUi3Rlq8pOYNkFVaewU96nNH6n0dyDZS9awOFuFnTHdb6R9XRowRNtaTS4lEF3Qxe
 51GLaWtf7Q73A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=X+90X6I4
Subject: [Buildroot] [PATCH 8/8] toolchain: remove binutils bug 27597
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Binutils bug 27597 is not present anymore in Buildroot so let's remove it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 407a03c42e..9e6cff1950 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -71,12 +71,6 @@ source "package/gdb/Config.in.host"
 
 comment "Toolchain Generic Options"
 
-# https://sourceware.org/bugzilla/show_bug.cgi?id=27597
-# Affect toolchains built with binutils 2.36.1, still not fixed.
-config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
-	bool
-	default y if BR2_nios2
-
 # https://sourceware.org/bugzilla/show_bug.cgi?id=30730
 # Affect toolchains built with binutils 2.40, still not fixed.
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
