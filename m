Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6468BC67861
	for <buildroot@archiver.kernel.org>; Sat,  6 Apr 2024 23:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D116D40721;
	Sat,  6 Apr 2024 23:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEu6Pzf_odHB; Sat,  6 Apr 2024 23:03:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FE9140785
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FE9140785;
	Sat,  6 Apr 2024 23:03:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C65891BF2F1
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 23:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C011C40721
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 23:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3BzRs_ICD94 for <buildroot@lists.busybox.net>;
 Sat,  6 Apr 2024 23:03:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3426C4070F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3426C4070F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3426C4070F
 for <buildroot@buildroot.org>; Sat,  6 Apr 2024 23:03:46 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 57D21B004FF;
 Sun,  7 Apr 2024 01:03:42 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 01:03:36 +0200
Message-ID: <20240406230336.9906-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712444623;
 bh=8U/hlqWlw5Fn58rq1evmQKfMR/zSi/oqVGdKlkN+2to=;
 h=From:To:Cc:Subject:Date:From;
 b=g4ZPLeNuzoztTl8/gtRKOJWlntMDGZmpiY7YycnpxJE14GWUjpCEhOvfp8oSCLaWh
 rosCKGxy9qWEgRGaaXi+mazPKNAzg+r2R5+ZDcQGbQc6NFqhrV2zQgjb6zfdJ3ULfH
 p5C2yZ5vFGFe8tBUqw9Ikjc4GL89KXbtliObg8VAlSWZ+pzICvgMF8yf5G73Uf46rN
 52q2UPTb0TiAvDADQhd5UeTid1DZM/rKQROgiDzNCUl089kQ6D3m+/vCISA7PRlQI1
 PaJWD5+u9Hto0mSJkrxSVwhvsYKSCkiNRmGBwAXzB1ik5IVXpW/nyhieopTPx3Iiwd
 ml+wSFs8Ofh6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=g4ZPLeNu
Subject: [Buildroot] [PATCH 1/1] package/openblas: bump to version v0.3.27
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since v0.3.26, see:
https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.27

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openblas/openblas.hash | 6 +++---
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index a0f054dab78..cd594969080 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.26
-md5  bd496a1c81769ed19a161c1f8f904ccd  openblas-0.3.26.tar.gz
+# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.27
+md5  ef71c66ffeb1ab0f306a37de07d2667f  openblas-0.3.27.tar.gz
 # Locally calculated
-sha256  4e6e4f5cb14c209262e33e6816d70221a2fe49eb69eaf0a06f065598ac602c68  openblas-0.3.26.tar.gz
+sha256  aa2d68b1564fe2b13bc292672608e9cdeeeb6dc34995512e65c3b10f4599e897  openblas-0.3.27.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index a678153d7b6..a3c7a194cf2 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.26
+OPENBLAS_VERSION = 0.3.27
 OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
