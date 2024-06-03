Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A87C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 17:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BB8F408F2;
	Mon,  3 Jun 2024 17:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yP2EXjjxLbcL; Mon,  3 Jun 2024 17:33:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CF07408E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CF07408E8;
	Mon,  3 Jun 2024 17:33:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 694A81BF232
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 17:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FF21821F0
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 17:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CdX5mOdS0k5Q for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 17:33:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FDFD821E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FDFD821E7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FDFD821E7
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 17:33:17 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8CD80B00572;
 Mon,  3 Jun 2024 19:33:12 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 19:33:03 +0200
Message-ID: <20240603173303.11623-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717435994;
 bh=goM+byyXlVtKl7hHueUpob+CcI+0pTukrV2Mkre8Jus=;
 h=From:To:Cc:Subject:Date:From;
 b=CDbtGnwx1zXsPTjPR0aFy15i9BSopOv+VLkwU66M0ZmKGuhqGa0rRddhU6rez+0d0
 oM4y0d7vNk3eMtmb7DE7FXnApTXpq/cEmsFpkeD/I73CiOaoa7k3/fVfEOSeMHzhUF
 w1RV9TLmyhPbqA/w7eCC88UMgoUiwdQvN0VE0FfXU4oGywTufzj5vK4Opu5q27s6iY
 lqLCezXX2Kbkv6jRtqmkf6/lACzBMjladPeY+pHONXYfvWH4/r7CYmk6/U7bIorIGX
 Z8hTnh9Ql0/um9p68wT6CbOWuy8PsdjQ18ntbbHoMHmp/nwax/q0AtkIJCda5CcVzr
 sVvacLMUeQFAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CDbtGnwx
Subject: [Buildroot] [PATCH next 1/1] package/dmidecode: bump to version 3.6
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://git.savannah.gnu.org/cgit/dmidecode.git/tree/NEWS?h=dmidecode-3-6

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dmidecode/dmidecode.hash | 4 ++--
 package/dmidecode/dmidecode.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dmidecode/dmidecode.hash b/package/dmidecode/dmidecode.hash
index 654c4cc537c..ab1f62be65d 100644
--- a/package/dmidecode/dmidecode.hash
+++ b/package/dmidecode/dmidecode.hash
@@ -1,4 +1,4 @@
 # Locally computed after checking pgp signature from:
-# https://download.savannah.gnu.org/releases/dmidecode/dmidecode-3.5.tar.xz.sig
-sha256  79d76735ee8e25196e2a722964cf9683f5a09581503537884b256b01389cc073  dmidecode-3.5.tar.xz
+# https://download.savannah.gnu.org/releases/dmidecode/dmidecode-3.6.tar.xz.sig
+sha256  e40c65f3ec3dafe31ad8349a4ef1a97122d38f65004ed66575e1a8d575dd8bae  dmidecode-3.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index 353978daa94..550e29d6247 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DMIDECODE_VERSION = 3.5
+DMIDECODE_VERSION = 3.6
 DMIDECODE_SOURCE = dmidecode-$(DMIDECODE_VERSION).tar.xz
 DMIDECODE_SITE = http://download.savannah.gnu.org/releases/dmidecode
 DMIDECODE_LICENSE = GPL-2.0+
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
