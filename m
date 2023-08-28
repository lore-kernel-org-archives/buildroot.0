Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856BAC83F11
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 16:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA6F440911;
	Mon, 28 Aug 2023 16:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA6F440911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1gg2rs9Zhpsp; Mon, 28 Aug 2023 16:24:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D766240907;
	Mon, 28 Aug 2023 16:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D766240907
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1ED1BF276
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 16:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B2328175A
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 16:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B2328175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oh8RkijfGzHx for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 16:24:21 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFCA081638
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 16:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFCA081638
Received: from fli4l.lan.fli4l (p54a1bab3.dip0.t-ipconnect.de [84.161.186.179])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 92BFCA4C0173
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 18:24:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56610)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qaf2H-00081O-0j
 for buildroot@buildroot.org; Mon, 28 Aug 2023 18:24:17 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 28 Aug 2023 18:24:17 +0200
Message-Id: <20230828162417.389154-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1693239857;
 bh=zfmCmH/NQqJbL7VYp5Zi6+il54U1Y2krkk9FKYSRAUM=;
 h=From:To:Subject:Date:From;
 b=wZSSv0cZizjtc39L+/Zn6HDznOLpkmgywrcJXMxIhIvMs6KC6CYRMnJ7iVZNm7Z41
 oxyWyRZuVHhAkNctQ9B/d5q3OzJHBf9mOVfMDx0TLlL/GddJ1ylWMtMmJ53QxfwgIr
 peHoIEVZi16dULEcpVoxIqkCJeXpHoEB4H1rfb95xlzjFCX1qJvljBe4nxTiPtK9ZX
 6hQdq/zjYo7H7YEsyTixrmcZ34D1ws/noAoQR+lkxDj3up59Osue6Zr1FLCpNUBE9F
 Fna4Ox8eSkmTYylNk3sAJ3t+58PQ7QHkkgjVftbavTqGXPS+fG4Zh5YvPsRnTRtTdV
 GYjE65PSy6HHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=wZSSv0cZ
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.1.x series
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index d236dadad8..fb2bfebd61 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  cca91be956fe081f8f6da72034cded96fe35a50be4bfb7e103e354aa2159a674  linux-6.4.12.tar.xz
-sha256  c606cbd0353e677df6fae73cc16ba3c9244b98372ed7771d551024016f55ac31  linux-6.1.48.tar.xz
+sha256  c9ea14231ca4ca6e3882a9339a8c3c414e4c91519d3e50af6822f47e99057a0f  linux-6.1.49.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  0f2eca845183fd76f53b0c867c97f12b9ace2d7e8ee2cdeec7eb2897651b80de  linux-5.15.128.tar.xz
 sha256  c40d11ee56e50a132429badbd1ba1c53e42b3312590b2a39be34c241d1b0b5b9  linux-5.10.192.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ba8d0f897c..deb3067b60 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -405,7 +405,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.254"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.192"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.128"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.48"	if BR2_KERNEL_HEADERS_6_1
+	default "6.1.49"	if BR2_KERNEL_HEADERS_6_1
 	default "6.4.12"	if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
