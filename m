Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590C6C7EE23
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 13:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED65441299;
	Sun, 11 Jun 2023 13:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED65441299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bV9FNVvOw2gW; Sun, 11 Jun 2023 13:34:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE46241295;
	Sun, 11 Jun 2023 13:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE46241295
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78E9F1BF2A3
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 13:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 526BC40488
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 13:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 526BC40488
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d8yZaABeP4tA for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 13:34:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F70B4047B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F70B4047B
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 13:34:13 +0000 (UTC)
Received: from b52572-12.ea.freescale.net (unknown
 [IPv6:2a01:e0a:43e:e970:8763:f5a3:4adf:bb86])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8D864B00592;
 Sun, 11 Jun 2023 15:34:08 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 15:34:01 +0200
Message-ID: <20230611133401.8977-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1686490451;
 bh=w7IP3cczqpsRKrpafAhGYaqH1NDeyF/CdPcjr4rQvKo=;
 h=From:To:Cc:Subject:Date:From;
 b=jMtmkhMG/A2fJlWykhpaj4ejk7uO/sjr8AkEOV421UpMaEOzfBSuFGNM21QCXGPps
 +SP67x7l3NuONIV2nI4lbAnreUXdl1umot9UiJ4kkJtg1ZDbQAfCUkigur8T4nO9mj
 cmbV/GBbACduwBxdiU8hBKopl5EppEodr23JxxQKcNf/kR5G2cHhf2AHbP/wQ5S75Q
 mxtrYsbfpRSBo0NCrsvooLxivd2eMiDgQCDOtU3aD3+76lwwL2ZB3pbzK+3r2kgp6t
 UUn4KKSp7G+rrGRPfeVQc8ae1H1XED1f7SfUTGOwJyQ17Kf1DfZEipMdlwpzSDZXQZ
 hQ4kr0MxvdHkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jMtmkhMG
Subject: [Buildroot] [PATCH 1/1] package/dmidecode: bump to version 3.5
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
https://git.savannah.gnu.org/cgit/dmidecode.git/tree/NEWS?h=dmidecode-3-5

Note: this patch also adds a comment about pgp signature verification in
the hash file.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dmidecode/dmidecode.hash | 5 +++--
 package/dmidecode/dmidecode.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/dmidecode/dmidecode.hash b/package/dmidecode/dmidecode.hash
index ec5484e667..654c4cc537 100644
--- a/package/dmidecode/dmidecode.hash
+++ b/package/dmidecode/dmidecode.hash
@@ -1,3 +1,4 @@
-# Locally computed
-sha256  43cba851d8467c9979ccdbeab192eb6638c7d3a697eba5ddb779da8837542212  dmidecode-3.4.tar.xz
+# Locally computed after checking pgp signature from:
+# https://download.savannah.gnu.org/releases/dmidecode/dmidecode-3.5.tar.xz.sig
+sha256  79d76735ee8e25196e2a722964cf9683f5a09581503537884b256b01389cc073  dmidecode-3.5.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index 352cdb106c..353978daa9 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DMIDECODE_VERSION = 3.4
+DMIDECODE_VERSION = 3.5
 DMIDECODE_SOURCE = dmidecode-$(DMIDECODE_VERSION).tar.xz
 DMIDECODE_SITE = http://download.savannah.gnu.org/releases/dmidecode
 DMIDECODE_LICENSE = GPL-2.0+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
