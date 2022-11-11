Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12714C4332F
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 19:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7315F418AC;
	Fri, 11 Nov 2022 19:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7315F418AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WEYBtlhlTO11; Fri, 11 Nov 2022 19:15:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 539F4418AD;
	Fri, 11 Nov 2022 19:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 539F4418AD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F0471BF5DA
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 19:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1950E418AD
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 19:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1950E418AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id crcu5oklxQuD for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 19:15:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5B95418AC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5B95418AC
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 19:15:17 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.170.13.176])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 55A8B2003F2;
 Fri, 11 Nov 2022 20:15:13 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 20:14:58 +0100
Message-Id: <20221111191458.1292483-1-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668194114;
 bh=QplZi47M7/3ylWGCFFfAtQTRR4TVa/l+jJOQ1USoabw=;
 h=From:To:Cc:Subject:Date:From;
 b=dvypwG4IoatVkLYVjPsZywaIvn1TovoI/sq199CRIVqguMGms3WD7NXfAU6qs7GvB
 fCiWtszZtOY6L6bAcnoHVRYN482e3neZUekUTWhQ1u1/vQh2e4gPdipkltTH2TelFA
 C3OFm889b+jSz+h7hBQ8eoFBCw+dFPo6pgBo79Bj2K652+2EWzSPVh5+Kp2FC98AAX
 KYgyaOXnwIALSi/vg8Wzi+1UpUTlzVrq0sFuHplfjNGROaaNvVUNlRt4XnPbXeCANL
 BNOaaKIvC98RUhJI+zmnQAbbWlws7GMeub8IdlgWHjOXDbnFp9YVLRaLA7IWt+dnrs
 wjVbm9zltHSfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dvypwG4I
Subject: [Buildroot] [PATCH next 1/1] package/octave: bump to version 7.3.0
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

For change log since 7.2.0, see:
https://octave.org/news/release/2022/11/02/octave-7.3.0-released.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Commit tested on branch next at commit a85f5f2, with commands:

    make check-package
    ...
    0 warnings generated

    ./utils/test-pkg -p octave
    ...
    6 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    support/testing/run-tests \
        -d dl \
        -o output_folder \
        tests.package.test_octave.TestOctave
    ...
    OK
---
 package/octave/octave.hash | 2 +-
 package/octave/octave.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/octave/octave.hash b/package/octave/octave.hash
index 81d7311eeb..9696f2a00a 100644
--- a/package/octave/octave.hash
+++ b/package/octave/octave.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  009388289b82fdcc920a2371355049cb6958c735ee9aa3893a256df4a6bf7515  octave-7.2.0.tar.lz
+sha256  fdb32602252289e068431329add2eed146e6f26301cbb5fc4412f9d972db9475  octave-7.3.0.tar.lz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index b28617438a..647f988a3f 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCTAVE_VERSION = 7.2.0
+OCTAVE_VERSION = 7.3.0
 OCTAVE_SITE = https://ftp.gnu.org/gnu/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
