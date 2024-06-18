Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A14FC2BA15
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 09:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0243A820E7;
	Tue, 18 Jun 2024 09:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvenaoJCOQXf; Tue, 18 Jun 2024 09:23:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21F598210C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21F598210C;
	Tue, 18 Jun 2024 09:23:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E81441BF281
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 09:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D39D18210C
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 09:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TmLS1NtJf9ED for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 09:23:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.149;
 helo=smtpdh19-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 086D5820E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 086D5820E7
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 086D5820E7
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 09:23:34 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JV3qsp0SMGPpWJV3qsz1qM; Tue, 18 Jun 2024 11:23:30 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 11:23:29 +0200
Message-Id: <20240618092329.800791-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfG7++udntdj06JPojqqFIfTNu2tSZOb4y/BWq26eIGdwTAGSQ7jIK2PCxdPRraSUk/Rfb0/om314E0YlO5fpLwp2GJy081wYATk9pAbCpvpPekMv3dzV
 umBQuE00beursUXyXxcMtuNtL8gAsd4GJeSixqrAwc43vF+fryhWbE2Qbgq8MFNIOfcQ3sulxeOUKdcpWoovcZmBj/yjw8V46HP8ZQIUO6pjzT3tX4jEM7QP
 dNjk/6yAUKruk/o0l8ejjmZHkdlQUr6N1dExpeXbat0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1718702610; bh=a3J22fq+f5mirbhQshAqAXAvsLOkwBwfcAh79EuLJsI=;
 h=From:To:Subject:Date:MIME-Version;
 b=cWmvWSTnWyqn0LKTghiWKomU0DZ3owhIaEW/mZgoW/2zwYZcq6hYZ3ir7DCgdFQkc
 kT+c2XDGzbaVX+9UnKRvDuNerdMl22Jj2nETdV6ShsNXm1+h2Yd8Lq2VaWkZVU1odS
 IBjW7y0IBjOZEWM4LSEUXweApKCSJHKQjHWUkk5cAMnF3S2xbF9UP7xzKpD4oEXX9m
 e0+fsVU3Sdn9FOFfor8wktR7cGPQOBRbXuJriosNlrU4wbqVZoREWbHj+fNe93qjvk
 Coj8n7bNKkvjS5s7YTqXMrT6sikAZC+vpytuWld98Yp9BtWiia298HgVpQBz8/hiPj
 KuP0itgexw8jQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=cWmvWSTn
Subject: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.7.3
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index 531432aaaf..dfee537a4a 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.7/sha256sums.asc
-sha256  da5d1419e2a86e01aa32fd79582cd54d208857cb541bca2fd426a5ff1aaabbc3  cryptsetup-2.7.1.tar.xz
+sha256  b772ae4f6df0cee7200b28cea960e4daaff2a203d2fd502beab3c1317b07a456  cryptsetup-2.7.3.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index b15f458576..d5046d9943 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.7
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).1
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).3
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
