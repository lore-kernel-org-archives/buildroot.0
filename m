Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F27EB64DD
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 21:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2985D81FA7;
	Mon, 24 Jul 2023 21:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2985D81FA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ff1AsA7eGCXK; Mon, 24 Jul 2023 21:14:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A9E781FBB;
	Mon, 24 Jul 2023 21:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A9E781FBB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F34D1BF2FB
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 21:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0242860B42
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 21:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0242860B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qorAiz2aa4vv for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 21:14:27 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5206660AC1
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 21:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5206660AC1
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 70288A4C00BA
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 23:14:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34618)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qO2sr-0003HY-0j
 for buildroot@buildroot.org; Mon, 24 Jul 2023 23:14:25 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 24 Jul 2023 23:14:25 +0200
Message-Id: <20230724211425.2059699-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690233265;
 bh=1PPhmBlc4cpDoSPvi+uQBi7DopSPVN69TBsn3yH+npg=;
 h=From:To:Subject:Date:From;
 b=GTJoXAEIOWpNLyKSRYH2UqS3KbdYaWg13s1M+FtzXrUhQyjCFTxPwQxmfCpXHr4yq
 jUPre96WUe8me2DpF/ybZFmlhs4cGCDqLKhfDjmjZOFXRo6ma6r4s3TXeptq1seEC1
 KvwvA+CSnqe3nND2TiuqSOiE3Fo2z+3KGDUHUB1aI9I7b9lf9++I4R/8fmi6Cwle7r
 PSmrexVQum/JXMDL5P3JT9nOVyeofPam+x5W25LW2iJqADMBNlu0okjZgpka2DAyQu
 FjP9lHVbcjoxkpwqw4q+ku1K6T/+e4hg9q4MReUyzSe4YD/Ary/JYw82yVYRlYMmd0
 xzsCU98FA+3Vg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=GTJoXAEI
Subject: [Buildroot] [PATCH 1/1] package/opensc: renumber patch
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

Buildroot commit c02707a34226c15426b9cac35aefda7d7e9b0125 added two
upstream patches with the same number, renumber the younger patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...0.patch => 0002-fixed-compatibility-with-LibreSSL-3.7.0.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/opensc/{0001-fixed-compatibility-with-LibreSSL-3.7.0.patch => 0002-fixed-compatibility-with-LibreSSL-3.7.0.patch} (100%)

diff --git a/package/opensc/0001-fixed-compatibility-with-LibreSSL-3.7.0.patch b/package/opensc/0002-fixed-compatibility-with-LibreSSL-3.7.0.patch
similarity index 100%
rename from package/opensc/0001-fixed-compatibility-with-LibreSSL-3.7.0.patch
rename to package/opensc/0002-fixed-compatibility-with-LibreSSL-3.7.0.patch
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
