Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F24C77B7F
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 21:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D8734049F;
	Sat, 13 May 2023 21:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D8734049F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2n9io5f5zxbs; Sat, 13 May 2023 21:39:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DBF5400A6;
	Sat, 13 May 2023 21:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DBF5400A6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4584B1BF315
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 21:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BCDB400A6
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 21:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BCDB400A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtGPvBkmWGqO for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 21:39:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 152934000B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 152934000B
 for <buildroot@buildroot.org>; Sat, 13 May 2023 21:39:30 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.247.97])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id DB304780503;
 Sat, 13 May 2023 23:39:25 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 23:39:18 +0200
Message-Id: <20230513213918.802893-1-ju.o@free.fr>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684013967;
 bh=ikE+g9wPMpcKtLEWv/dXSL4AzwJLudYBwGJsahi7Wp0=;
 h=From:To:Cc:Subject:Date:From;
 b=drXSdlM82bfDgDf29y87L8kGjfNBaZ1LALak47ZY8/Kwgio8R/pkPuwqT8Nyf+zmF
 9ycNN6cuAMIBDwlf1H41vuXVLTEjIfJInHuanSd1938zicQ3ddsvf/oNHt1GkeVscs
 kvd4ajno4o9lr/LjYD5V9O+pbGDAjcOC20tyZefFEdgqBLbk/h5hNT2+He/2Sf5Voz
 kVmuozg4k/21oBBghpp5A2eqQNJ/cMmfnwxp2DLt1nzEKNW4ZwjvrIeEcqnPmG58GZ
 IafXj0LLXDGPpMTsxop01ENF5sz1DreoqFos9sKoqsEQ1WhSWnjKIzSS8fbgZBADam
 WpYZTNjKiy9ig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=drXSdlM8
Subject: [Buildroot] [PATCH 1/1] package/octave: bump to version 8.2.0
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

See release note:
https://octave.org/news/release/2023/04/13/octave-8.2.0-released.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit b36e4b1 with commands:

    utils/docker-run make check-package
    382265 lines processed
    0 warnings generated

    support/testing/run-tests \
        -d dl \
        -o output_folder \
        tests.package.test_octave
    ...
    OK
---
 package/octave/octave.hash | 4 ++--
 package/octave/octave.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/octave/octave.hash b/package/octave/octave.hash
index f301feb6fd..6e82a589ec 100644
--- a/package/octave/octave.hash
+++ b/package/octave/octave.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-# https://ftp.gnu.org/gnu/octave/octave-8.1.0.tar.lz.sig
+# https://ftp.gnu.org/gnu/octave/octave-8.2.0.tar.lz.sig
 # using key DBD9C84E39FE1AAE99F04446B05F05B75D36644B
-sha256  79f35c249e5ed71c6cafcf26ef72ffcf4845637093efde309b499a6690154b4f  octave-8.1.0.tar.lz
+sha256  8ac875a9f8e44b8eb4b75ca8638531e2ca47cd9d13a6ca39d3a0eccd175f8a05  octave-8.2.0.tar.lz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 63265e7d25..81954bbdd3 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCTAVE_VERSION = 8.1.0
+OCTAVE_VERSION = 8.2.0
 OCTAVE_SITE = https://ftp.gnu.org/gnu/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
