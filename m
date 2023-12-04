Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91260C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B37D4011A;
	Mon,  4 Dec 2023 21:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B37D4011A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7uas5XZRnL_w; Mon,  4 Dec 2023 21:15:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40AE941466;
	Mon,  4 Dec 2023 21:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40AE941466
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A5B5B1BF30E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D30082190
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D30082190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uL81D1fHbN8j for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:15:13 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BE8582185
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BE8582185
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CB9D4A4C042A
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 22:15:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33606)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGHX-0006uZ-1w
 for buildroot@buildroot.org; Mon, 04 Dec 2023 22:15:11 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:15:11 +0100
Message-Id: <20231204211511.12653-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724511;
 bh=vsXQl31elgZx7ZazOqcSc6aF76tMshkcz5VVw+h8vrQ=;
 h=From:To:Subject:Date:From;
 b=gkcf2ZtgwsBvap58bgaO3gmKWFL2PTxBLShGU92ExrxaPRW+N/655lJY7NO2h0qtu
 cdou/jtQAhE2Y/EaEPXBHFZ5IOnwzWu8HaHMM563karJfvqeAxltH8C++tMIPJDEqO
 56mUb+JRmX643Uv99EeAgs+LRuMFHEm+8c16dOh8bhYnx7IVGbSWNERGnAndKtjXhd
 4uWiXnGF5SFj8NVZAc9R59qQDheTei8wsI9eBcelnI3rJK2ShbN2ylrnJQtE3ofarF
 JHw2NIxpjd/WsMs+y2V9wVOQjVom255pxjCO++Z75fH7WnZVJ8subC50HPXRgUIAhq
 HKC2jX0X2qoPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=gkcf2Ztg
Subject: [Buildroot] [PATCH 1/1] package/libgcrypt: bump to version 1.10.3
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

Release notes:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=blob;f=NEWS;h=b767dc1170eb479b9a311cca4074c58e4eedaf0b;hb=aa1610866f8e42bdc272584f0a717f32ee050a22
https://dev.gnupg.org/T6817

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libgcrypt/libgcrypt.hash | 4 ++--
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index cfbf9eaf17..ffe30e1455 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  0b9555960d84a09ea14e52360808f2e02e9c12d2  libgcrypt-1.10.2.tar.bz2
-sha256  3b9c02a004b68c256add99701de00b383accccf37177e0d6c58289664cce0c03  libgcrypt-1.10.2.tar.bz2
+sha1  359e1d01ad2eb9cd2db964ea96ef3712d0c2c649  libgcrypt-1.10.3.tar.bz2
+sha256  8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa  libgcrypt-1.10.3.tar.bz2
 # Locally calculated
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index b74838b649..2e4bf7448e 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.10.2
+LIBGCRYPT_VERSION = 1.10.3
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
