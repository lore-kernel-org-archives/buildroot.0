Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FD2C48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 18:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C585981F41;
	Sun, 18 Feb 2024 18:46:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5tWtn1vEyouZ; Sun, 18 Feb 2024 18:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A734082173
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A734082173;
	Sun, 18 Feb 2024 18:46:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B6E81BF86C
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 18:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 163D2405BD
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 18:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qfm4rBmaAkbN for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 18:45:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BA54340731
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA54340731
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA54340731
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 18:45:42 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bmASrFAK1ce1vbmAWrHZJt; Sun, 18 Feb 2024 19:45:40 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 18 Feb 2024 19:45:35 +0100
Message-Id: <20240218184536.1922309-8-giulio.benetti@benettiengineering.com>
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
 t=1708281940; bh=jHFO1XTMWT6VtOkf8Amh1cAwAq8QZpwiiZGMzHIfz3A=;
 h=From:To:Subject:Date:MIME-Version;
 b=JxSRmxoAzu5B//ngtheL/Cwm7+c+f370LWSEofaOchlCbrQ1eCss0kOvQV0/emf87
 QbwQwZjvYA3+o/xR4upxKihhDNs16BW167/HPeCsAQEsVR0ETfdEHWpR1WL1TyvuoL
 u7OLq9r4/yLEzmmryamRZBBN1ySpSVfFDpiuvuNILIo/O3v7I9CgrZUkxFeeVVOUFd
 TTxI1QVd2HPKhk9D8pZbK+wseUF1E+Vye9O0S8Ox1ZwsiTzFIkEsMxsRJjsL/JyClp
 57tfXhT0nJXVpTyKy2mCwq3WuQDQhegrNMNCbNvMGX0cMDxQu0u7VZViiFrjZKm2Wo
 KiNSBdyEaB65A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=JxSRmxoA
Subject: [Buildroot] [PATCH 7/8] package/postgis: drop nios2 binutils bug
 27597 dependency
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

Now that binutils patch has been backported to every Buildroot binutils
version we can drop nios2 binutils bug 27597 dependency.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/postgis/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 7d42390677..78569d63be 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_POSTGIS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgeos
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgeos, proj
 	depends on BR2_USE_WCHAR # libgeos, proj
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 # libgeos
 	select BR2_PACKAGE_LIBGEOS
 	select BR2_PACKAGE_PROJ
 	select BR2_PACKAGE_LIBXML2
@@ -18,7 +17,6 @@ config BR2_PACKAGE_POSTGIS
 
 	  https://postgis.net/
 
-comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.9, not binutils bug 27597"
+comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
