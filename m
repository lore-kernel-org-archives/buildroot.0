Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF68C64EC4
	for <buildroot@archiver.kernel.org>; Mon,  6 Mar 2023 21:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E67B340116;
	Mon,  6 Mar 2023 21:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E67B340116
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 43uxukaMERcY; Mon,  6 Mar 2023 21:14:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C01F408B1;
	Mon,  6 Mar 2023 21:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C01F408B1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA8AB1BF2E4
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 21:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2896408B1
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 21:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2896408B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LEtkXxcA_zNt for <buildroot@lists.busybox.net>;
 Mon,  6 Mar 2023 21:14:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AEF540116
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7AEF540116
 for <buildroot@buildroot.org>; Mon,  6 Mar 2023 21:14:45 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.227.234])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3864B5FF67;
 Mon,  6 Mar 2023 22:14:41 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  6 Mar 2023 22:14:35 +0100
Message-Id: <20230306211435.2283414-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1678137282;
 bh=QFnU1ybg79rjiE7IJ36XyZCvNhF+HyOiTkyIVOSUhqA=;
 h=From:To:Cc:Subject:Date:From;
 b=N1Ku3xHBwPODc3SHjFQEk/EOqMCZGlmUFr+L/K+GXXy53uOGD3YDNsRR09vsd5ozZ
 WDJVwaUYYxYTd4bs5xNtKwgD5qJ3jEwPeoZRskp4EAbv+M+lBsm8ePfPqFHUrMRd6O
 fDuShu0CFKO0D5Ux1d0GXn8kZRIss4xT3ZxHEV2FES/2a52jNjyh+S6uS2pA1kIRA+
 1sBjhE/Hwgx9Mwjcyx0I1hNCVsrEWV7/pZwoWIHdqMr1Av84UtZ2VdiU7fd6/svvdJ
 ejGd3jl+NR9G8EkD1MHj87F11zbxvu1nwb9Ia7fmXXF6TwJCBfWBSr+mWMpgAwNKtY
 tnmqfYvWJPEBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N1Ku3xHB
Subject: [Buildroot] [PATCH next 1/1] package/gsl: bump to version 2.7.1
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

For change log since 2.6, see:
https://git.savannah.gnu.org/cgit/gsl.git/tree/NEWS?h=release-2-7

This 2.7.1 version includes a minor libtool version fixup on top of 2.7:
https://git.savannah.gnu.org/cgit/gsl.git/commit/?id=77e7c7d008707dace56626020eaa6181912e9841

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit b793f3a with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p gsl
    ...
    45 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/gsl/gsl.hash | 2 +-
 package/gsl/gsl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gsl/gsl.hash b/package/gsl/gsl.hash
index 0d40a75497..153ae4131d 100644
--- a/package/gsl/gsl.hash
+++ b/package/gsl/gsl.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  b782339fc7a38fe17689cb39966c4d821236c28018b6593ddb6fd59ee40786a8  gsl-2.6.tar.gz
+sha256  dcb0fbd43048832b757ff9942691a8dd70026d5da0ff85601e52687f6deeb34b  gsl-2.7.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index 3604f9836c..575cb75462 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSL_VERSION = 2.6
+GSL_VERSION = 2.7.1
 GSL_SITE = $(BR2_GNU_MIRROR)/gsl
 GSL_INSTALL_STAGING = YES
 GSL_LICENSE = GPL-3.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
