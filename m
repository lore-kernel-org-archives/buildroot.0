Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEF6C3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 19:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEEC680B64;
	Thu, 29 Dec 2022 19:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEEC680B64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBKUUGF_CJ6l; Thu, 29 Dec 2022 19:50:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0128380B67;
	Thu, 29 Dec 2022 19:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0128380B67
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A6EF1BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7615040181
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7615040181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v2t9xF4mL7tX for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 19:50:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94D1040111
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94D1040111
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 19:50:15 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.174.182])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id E3EA12003C8;
 Thu, 29 Dec 2022 20:49:56 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 20:47:10 +0100
Message-Id: <20221229194729.8085-8-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229194729.8085-1-ju.o@free.fr>
References: <20221229194729.8085-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672343413;
 bh=jD3O5TE+yej+3hyxJ6uYWSk1WBVD1p/i9JX7qUT6OY8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c3aJWx92He+AE4qiV/fsZRdhk23uEgX8jg9P+CDXcpDhsue+MKIDC0KK/YWTBkfrp
 IBd226GcdOUrjPHunU1i5z4RqsqYMD+I9P+lfCO4trS/bXH2xuxO46KZqwgaB1HfR0
 eloGR0AtSdOrU8DykMedoEOBDaxLq/cm1Zvr9GsD66DkID6I4Go4vrpgj4lA5uGoPv
 7WfnYcoUUmCl5lpHGuNyXxBe1GiG+5aC8xScU5G7xvGqrYcqaFli+UZdXk0+8UwD3J
 DXzLRlNH16YQSC19lg7rDzd4cxSKbzyow89bsWWpFF2nQnEYVkhdHOHcWksudM4Ldi
 TRcJEJAFw3lNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c3aJWx92
Subject: [Buildroot] [PATCH 08/27] package/mfgtools: update URLs to NXPmicro
 github organization
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Gary Bisson <bisson.gary@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Gilles Talis <gilles.talis@gmail.com>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Erik Larsson <karl.erik.larsson@gmail.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mfgtools was removed from the github codeauroraforum organization.
It is now redirecting to NXPmicro. This patch updates the link to
directly point to the correct place.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mfgtools/Config.in.host | 2 +-
 package/mfgtools/mfgtools.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mfgtools/Config.in.host b/package/mfgtools/Config.in.host
index 2b506c8f67..f1e7ab58e3 100644
--- a/package/mfgtools/Config.in.host
+++ b/package/mfgtools/Config.in.host
@@ -8,7 +8,7 @@ config BR2_PACKAGE_HOST_MFGTOOLS
 	  production. The communication is done over USB using the
 	  Freescale UTP protocol.
 
-	  https://github.com/codeauroraforum/mfgtools
+	  https://github.com/NXPmicro/mfgtools
 
 comment "host mfgtools needs a toolchain w/ host gcc >= 4.9"
 	depends on BR2_arm
diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
index 48ce5dda28..3de93936b8 100644
--- a/package/mfgtools/mfgtools.mk
+++ b/package/mfgtools/mfgtools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MFGTOOLS_VERSION = 0.02
-MFGTOOLS_SITE = $(call github,codeauroraforum,mfgtools,v$(MFGTOOLS_VERSION))
+MFGTOOLS_SITE = $(call github,NXPmicro,mfgtools,v$(MFGTOOLS_VERSION))
 MFGTOOLS_SUBDIR = MfgToolLib
 MFGTOOLS_LICENSE = BSD-3-Clause or CPOL
 MFGTOOLS_LICENSE_FILES = LICENSE README.txt
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
