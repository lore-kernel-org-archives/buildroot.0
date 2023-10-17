Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A082ACDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 17:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57782821F3;
	Tue, 17 Oct 2023 17:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57782821F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rc0fTMFq5eew; Tue, 17 Oct 2023 17:54:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14FC2821ED;
	Tue, 17 Oct 2023 17:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14FC2821ED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45CCE1BF32B
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 17:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A5044046B
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 17:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A5044046B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4pd1-ZUgB_s3 for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 17:54:03 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DED59400F3
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 17:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DED59400F3
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 89CB9A4C00FF
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 19:53:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51622)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qsoGV-0003vc-0v
 for buildroot@buildroot.org; Tue, 17 Oct 2023 19:53:59 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 19:53:59 +0200
Message-Id: <20231017175359.71952-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697565239;
 bh=ToJ5GOE/94Gkb7L6EFrO64WOGIKCzze5FwEnfcWLCMY=;
 h=From:To:Subject:Date:From;
 b=Fgm5ZKPJWpiPSgcProzo8d7+f0/ocwd6zFHPjqg4FF6uTo2pNRw+9wVdFCW8CT8mE
 ykIHHa810/2wmUKMFyW/88w02Xej0nwB4wLc5jHfOvLR3Qk6tG4CXoFK9AuuiLmUml
 +YVmVmmwSvgLHKaDPxbY45wzfK4VUjBvRKh8SsPaGwwOtrvxAuRiywRYvPlDZZVSa/
 ASg2tHSpE6honvQXt3Uo7OtK03z113ygRSNbdUhkjJEMD5kT0n/GHr/wQ0VZtnvB+Q
 yJ5Dj3TLXZwYLzGKxvwBHhpPLJaCkQZ33c3mE7iGuOSeRsv4n+5tHH58BsfNEy2zJd
 GZ0KGujoENzpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Fgm5ZKPJ
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
index 92ea8cdb88..c6e7ce858c 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  0d09ea448005c9cfe5383e4c72a872b39188b928f8c44e146b03b1b7851fbb8c  linux-6.5.7.tar.xz
-sha256  f9ebfe3ddc5152d87b37e33be30e31875d137433be10a57ce29d2eae7b6e91b1  linux-6.1.57.tar.xz
+sha256  ce987ed3d2f640b3a2a62a0a8573d538a36dfd3cc31e2d7a239ce5a16c1c21ad  linux-6.1.58.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  14835e629e237f136cfed484fdb533c95242429809bdcdb2a2d66dfcb7447170  linux-5.15.135.tar.xz
 sha256  2b141fce994364fbbf137b01e7910d3518b8cdbdf18f1811b48470ab4ce2fa05  linux-5.10.198.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a93458c399..c7d34d91cf 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -409,7 +409,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.258"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.198"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.135"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.57"	if BR2_KERNEL_HEADERS_6_1
+	default "6.1.58"	if BR2_KERNEL_HEADERS_6_1
 	default "6.5.7"		if BR2_KERNEL_HEADERS_6_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
