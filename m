Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FB2C54E90
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 22:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B19080B67;
	Wed, 21 May 2025 22:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OrDchl-GsGAd; Wed, 21 May 2025 22:46:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B997E80BB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B997E80BB1;
	Wed, 21 May 2025 22:46:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 37BF1758
 for <buildroot@buildroot.org>; Wed, 21 May 2025 22:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E5E4612E8
 for <buildroot@buildroot.org>; Wed, 21 May 2025 22:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MI6C0BwyssMQ for <buildroot@buildroot.org>;
 Wed, 21 May 2025 22:46:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.87;
 helo=smtpcmd0987.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F92F606DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F92F606DE
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F92F606DE
 for <buildroot@buildroot.org>; Wed, 21 May 2025 22:45:59 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id HsCDuqElQ0WuxHsCDu1Te8; Thu, 22 May 2025 00:45:57 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Thu, 22 May 2025 00:45:56 +0200
Message-Id: <20250521224556.560897-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250521224556.560897-1-giulio.benetti@benettiengineering.com>
References: <20250521224556.560897-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJaVOJ2skI8/lv16Kn8mZei+F0O+ELlnWLg6rn3S1k7ZyGV3G+0FjlGT13i9pBl6aNJhL+OF5eii0cTa8VL4O7hUSInmwKTrfgGqGlZf6JTj8QrZ/Til
 AsCSSNII25fqQ8MoCebHyzy0qbrgNhu9WRmTPGAVXnvej1OXedGe3mw2rAm73/m2O3ARWMtg0Inp/iEa2909PyibekDSxvA5wyhpbUKz1Z3C9ZkvgoOZJX+l
 b0385f2sjuYvlVBfN3+id48T1JI2kak3H8oP43yO3ZaJr2ivdIofZLdmgmwhLe2KZ5QZxnMVroN7Z90qgksCEg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1747867557; bh=WjHjJ8j9JJW7KJhTLi0dkt4RKWGZKCFRsYTwK2KnRQQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=bX0IiL3UflluW/Q+s5sVCjMGerTOR7dfaEE97yEccCle6loUAbdQoa652hWCxQnKR
 MN7F5PH7epmUS1Wmmv9USQqAuKxM3pvlSSoSBJ4YmvjeDSn8uF4MKtm0qAKq8JsnrM
 xgMsF2KPCH4FRJQdJ1lXPzo8WUKgkPazZChgcb4oAk/BMtUSSZm+Tx7T8m1PPk9oT1
 2x0e/lpM30l527q4Oz/fMIn8DUruBP1FOy9tPCZ1ItI4pE1Q+v+E2Pn2Dx4DqfLFBp
 9bwemHRjF7iptkOhEcSUqt+ntDp+VL+cVZsHqeSYCcpHOlpGhgToxgC2o5CaKWS+ph
 8OSkcAZ8ulS9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=bX0IiL3U
Subject: [Buildroot] [PATCH] package/mongoose: bump to version 7.18
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

https://github.com/cesanta/mongoose/releases/tag/7.18

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 18b5e222ac..1a8774b056 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b6a6f69912c2cd0c67f85633c6b578d4dcdf385c3628acdcd21de28787c676e5  mongoose-7.17.tar.gz
+sha256  8b661e8aceb00528fc21993afe218b1da0f0154575a61b63ce0791ad8b66b112  mongoose-7.18.tar.gz
 sha256  9abc2509d90c01ff2a0c91abf73582cdbcf1d2dbcc0b7973097eced43cf4cdd4  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index b41f6a054d..04993316fb 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.17
+MONGOOSE_VERSION = 7.18
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
