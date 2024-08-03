Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A72BC3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 20:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B9EC80B1F;
	Sat,  3 Aug 2024 20:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6IyVogGz7p2T; Sat,  3 Aug 2024 20:43:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32A8C81160
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32A8C81160;
	Sat,  3 Aug 2024 20:43:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 012881BF35D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F00C081160
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dS2en_hKLAjn for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 20:43:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10CD580B1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10CD580B1F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10CD580B1F
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 20:43:46 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 86F8FB0055E;
 Sat,  3 Aug 2024 22:43:42 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 22:43:31 +0200
Message-ID: <20240803204331.396912-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722717825;
 bh=eBANt7HxutaAkcrLrX8zhPGYvWJ6wp8u/1aZ8B+vOW8=;
 h=From:To:Cc:Subject:Date:From;
 b=Js90pEIkt36BlatS5UTgSrMgKgcvDhprzlBwY1gVOZa1z58nE2HzaMCOInGpJMIFq
 rqwIL+2rwjlf6Xo+RxnHU/WNkJlHdIxd96BZWzq1PLS0xhaAeMcCK9V+7/rft1ZjcH
 R2oFygME4od3EFSlJmL/I8pU7fwc5lXAc4yF980hnLcohpX7vVUElUPd2SgDTKHYSR
 44VImZvoXoDpsGVl6yzxyuJ+cgBYOTN73E5p76NDjCon1icxsVEson2HcnVOVnqfqs
 2I2wLRKpK3R/sqx3BAqYAp4vcPnaKDBGkwZQXao/H6gmY2iOh8V+WJRkD9h4/Z/2K/
 hDH6gq6vNWSMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Js90pEIk
Subject: [Buildroot] [PATCH 1/1] package/genimage: bump to version 18
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For a change list since v17, see:
https://github.com/pengutronix/genimage/compare/v17...v18

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/genimage/genimage.hash | 2 +-
 package/genimage/genimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index e09ffd82be..232ba6ef66 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a8756e3567a0d4d82c36b08ccc1e088250b9006d5670c6b2b014185e6ec60671  genimage-17.tar.xz
+sha256  ebc3f886c4d80064dd6c6d5e3c2e98e5a670078264108ce2f89ada8a2e13fedd  genimage-18.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 2be8e1137e..b8ce7ff3c9 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 17
+GENIMAGE_VERSION = 18
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
 HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
