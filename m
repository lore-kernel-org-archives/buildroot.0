Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8740C433F5
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 12:33:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46E13619E5
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 12:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46E13619E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18326607B0;
	Mon, 15 Nov 2021 12:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z5Vn22DBUOmt; Mon, 15 Nov 2021 12:33:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7538560784;
	Mon, 15 Nov 2021 12:33:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1541BF343
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 12:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38DA7401F1
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 12:33:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sOf9Vld_Sikb for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 12:33:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4D0E4020B
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 12:33:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [151.43.3.160])
 by serv15.avernis.de (Postfix) with ESMTPSA id 0F901C22A818;
 Mon, 15 Nov 2021 13:33:14 +0100 (CET)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Mon, 15 Nov 2021 13:32:11 +0100
Message-Id: <20211115123212.11841-2-br015@umbiko.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211114160803.5ce09ba5@windsurf>
References: <20211114160803.5ce09ba5@windsurf>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH v2 1/2] package/mpd: correct typo in help message
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
Cc: Andreas Ziegler <br015@umbiko.net>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
Changes v1 -> v2 (after review by Thomas Petazzoni):
 - Config.in: create separate patch for toolchain version typo

 package/mpd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 5e49e69442..eb05f25a0b 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -391,7 +391,7 @@ config BR2_PACKAGE_MPD_ID3TAG
 
 endif
 
-comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 7, host gcc >= 7"
+comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 8, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
