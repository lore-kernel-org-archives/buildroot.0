Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D870CE79AC
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 04:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D6CC40136;
	Wed, 20 Sep 2023 04:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D6CC40136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DMlri-9c3kuy; Wed, 20 Sep 2023 04:37:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB8504021C;
	Wed, 20 Sep 2023 04:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB8504021C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5494D1BF419
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 04:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E18641DD0
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 04:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E18641DD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9m8mU5iEfxM7 for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 04:37:30 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94A3C41DC9
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 04:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94A3C41DC9
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.97]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mg6e4-1rKtLN1zFG-00hcUp for <buildroot@buildroot.org>; Wed, 20 Sep 2023
 06:37:27 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Wed, 20 Sep 2023 06:36:58 +0200
Message-ID: <20230920043658.37553-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:rGG+toJ2+Uiu/6E4/br7Uv4HzOu8gNpOZOGPL25sla9jO2mJ27M
 2YMJKPqzhUPNUMRjAUnCjEjzkCg78MGeJGLrsHJcezdqZT1LXyPeqKql9pGRS3X8NBObu+M
 wo9Q1f+b1ImvI8JCdfpvYJu8YlCDX94EnEzr9Nt7+FGtCY0KE8UUvZ7Lt+u6dIw728Cd7BQ
 S6pP7roCuLTXmkoDzWAdg==
UI-OutboundReport: notjunk:1;M01:P0:2OB5L/+KdCU=;oTqNJdylkj+nrBz/AfXLCEkVEmx
 q2PkbX2zlpxe8xVRcdsyvYj7VcoVu+zAEHnUnu92FrYcY0Ed78ViI8LgtXRwNDRB3ppvbPtcS
 uzKMtT5zU/iGscT4/8E1AbQWOXr4fMVYw56OiCUvO28FbellrilI60E1VDyR7W1corxIxng73
 gUIHv4yV5uI7T4DBOJCoBPHZMco0vzLtN96C04r07aIkcTnsUtWVBDXsrb1TpNpojsEA6RuuJ
 UxVkdmYiDh8pcnQ2E5HdB3vCKjN5PweHDdpEBnLsqAfyV4JIMaRhK8PBNrsIg2l9FCOH58s9Q
 IJ6Wqsn7FI2MOBW5jPUXe0Hu4TC6OThO3/mkYCDCX7W4bLGA1gSVAOWi9M3EypEjhiziBGauw
 atWon9hi5TfdaHD0MUzQe4hsN3EcQe1it//DXZA4usUVB+f9oe58zkDklDJL7IeDO8Tc6Kqjh
 CzoTcLBh2CcAPHIfVc4K+X8M8N1KjeRWbV7fPIHcI4S6FPAcF0pDUyzI5zB6e55c0Is755A6k
 4KlFzSAK4Q20PBfBnyLdih5/+RuDZdZfIxdPovRczG3b67WlOvYCguKPhJye+MS5YITFWQxbp
 wJPISmy59EgPpII67P+oNA/CRNkbMqhmzvLoNYhrT5TPkGXkAOhY+uOlmdg3O2EATcUk+Kqgs
 8+qy2mb/oMzIrcVfawWAFmtB4QvktcOdR2mf3ioVgNyMcMNp/QajVwVk/e0r2Zeaq+wIWUrhe
 8Gq+CSlxnDCJMLcMG0tdQ0IvJ3kLj5dVnO71iNEI6lUIqmMW/LQoC7XAOXiLPuD3ClMKC/Jwd
 +atzFr7+bhEGo99gs8wzEvJX8OTIO39GtbBVxGmmpwinX3heSDoyTmB1lnF9K9gbTPffvPhFB
 Ul4Er0yYVnbdCXsOWvuCtyRifUHizUmDahHRCQJOZyhu3N+jAtY2jB1G88iV8wjP3tYz1WLYQ
 buWSCxvbKYraNwKtkuh16DE3Tk4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1695184647; x=1695789447; i=dalang@gmx.at;
 bh=HiCz8u3ar+pOgUtHjA9Bh1yIZpRLvTmMfpAtCNx+YzE=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=SPuWXnUqQfYHFoWf0grAMAHRRthWBo1gHPu/h/b/SNmxEM52YwaGhJMe+KY8MkNOFH0IlfvCCg3
 bT3JZAivjQrhcAc1chxW/dQ/KesyB5kc1v16blgCWxUWfzJoGnFasLuiOe9S+Ru5VnsMhw1f8EXag
 9Q25ihHrFqlEu+slW2EmVyVeTj0WvVBJkMezhD0zswd6m9TjnZfgTr2SvVTE4iEKgTxtNDyHsWFME
 mftGa3dBCeOnwEt/SQIxySj1hjHbmFGvXDcJXbsm1mxh5yLocLylThNJfMFKZyZxb8vEQHszKq2Oy
 QDYVX6oNE4M4XSP9MqLC0gvUNifMm6OWL3Yg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=SPuWXnUq
Subject: [Buildroot] [PATCH] package/e2fsprogs: drop CVE-2022-1304
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CVE-2022-1304 only affects e2fsprogs 1.46.5.
The mentioned patch was removed in 6a21733f when bumping to 1.47.0.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/e2fsprogs/e2fsprogs.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 80090621bf..7491f4c067 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -12,9 +12,6 @@ E2FSPROGS_LICENSE_FILES = NOTICE lib/ss/mit-sipb-copyright.h lib/et/internal.h
 E2FSPROGS_CPE_ID_VENDOR = e2fsprogs_project
 E2FSPROGS_INSTALL_STAGING = YES
 
-# 0001-libext2fs-add-sanity-check-to-extent-manipulation.patch
-E2FSPROGS_IGNORE_CVES += CVE-2022-1304
-
 # Use libblkid and libuuid from util-linux for host and target packages.
 # This prevents overriding them with e2fsprogs' ones, which may cause
 # problems for other packages.
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
