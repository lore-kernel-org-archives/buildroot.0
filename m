Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F2DC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 16:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F9A44161A;
	Sun,  7 Aug 2022 16:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F9A44161A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTek9hNgQRtX; Sun,  7 Aug 2022 16:56:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E11E5415EB;
	Sun,  7 Aug 2022 16:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E11E5415EB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C33D1BF681
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 16:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 677A840524
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 16:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 677A840524
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oU9900CmfgUA for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 16:55:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 853B04051C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 853B04051C
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 16:55:57 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.115.116])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0A93C60131;
 Sun,  7 Aug 2022 18:55:52 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 18:55:38 +0200
Message-Id: <20220807165538.850640-2-ju.o@free.fr>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220807165538.850640-1-ju.o@free.fr>
References: <20220807165538.850640-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659891355;
 bh=O6bTRgdaVXC1M8Y5JQcqPe81ZS7llz6oAu7P2W2PHfA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jextQ5QefxKg1Rc77RpcjDJgxR99SXVFWik78kcxSLY+oV0o1qoQnYUAEAvmFYP0I
 Gu9QDQKm7C2zwpRNjCBCdG7a9Hc8M2ZcAcWkEPxBfXfNzfnFGsXItDKUc9mb8qKDFm
 7MAk1g0sLhmG3BwGNwxdNe/rn8ojnsWHp3WbhZFgeiL2iFco4hpXlBuA6jKYeeh3/m
 zVaXyH7/X6w20D2qF806LrE//xfMVhqVGwbdewhljJ8s5zjhsKWGQN4xOiMLcaBUGW
 Slvb+Tv7g/LZ27VbQxrNMQ1J6z+NHI6sOFhECSuPuSBAqHafm6HZX0aiNnX/YOi5jO
 r0Egep+gYibjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jextQ5Qe
Subject: [Buildroot] [PATCH 2/2] package/octave: bump to version 7.2.0
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

For change log since 7.1.0, see:
- https://octave.org/news/release/2022/07/28/octave-7.2.0-released.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Commit tested with:

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
index 72d47cdf54..81d7311eeb 100644
--- a/package/octave/octave.hash
+++ b/package/octave/octave.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9e8d1f4d64fa1bcfa30a571e240dc83715dbaede1de96a982bdc89cac7ced42c  octave-7.1.0.tar.lz
+sha256  009388289b82fdcc920a2371355049cb6958c735ee9aa3893a256df4a6bf7515  octave-7.2.0.tar.lz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 4e828eb734..b28617438a 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCTAVE_VERSION = 7.1.0
+OCTAVE_VERSION = 7.2.0
 OCTAVE_SITE = https://ftp.gnu.org/gnu/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
