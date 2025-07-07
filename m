Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588B4C8303C
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 13:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA63741731;
	Mon,  7 Jul 2025 13:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KVEJ0zbXjqXo; Mon,  7 Jul 2025 13:10:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5B9C415E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5B9C415E7;
	Mon,  7 Jul 2025 13:10:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2F7015F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 13:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D45C981F62
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 13:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_AY4-ejILMj for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 13:10:28 +0000 (UTC)
X-Greylist: delayed 307 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 07 Jul 2025 13:10:27 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DDCE081F60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDCE081F60
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.67.18.14;
 helo=smtprelay02.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de
 [80.67.18.14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDCE081F60
 for <buildroot@busybox.net>; Mon,  7 Jul 2025 13:10:27 +0000 (UTC)
Received: from [91.21.118.37] (helo=mail.go-sys.de)
 by smtprelay02.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98)
 (envelope-from <mf@go-sys.de>) id 1uYlWo-0000000040d-1azh
 for buildroot@busybox.net; Mon, 07 Jul 2025 15:05:02 +0200
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 7 Jul
 2025 15:05:15 +0200
Received: from go-sys.de (192.168.1.210) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.57 via Frontend Transport;
 Mon, 7 Jul 2025 15:05:15 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
CC: Michael Fischer <mf@go-sys.de>
Date: Mon, 7 Jul 2025 15:05:14 +0200
Message-ID: <20250707130514.27071-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=go-sys.de
Subject: [Buildroot] [PATCH] package/gnuplot: bump version to 6.0.3
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

For release note, see:
http://www.gnuplot.info/ReleaseNotes_6_0_3.html

SHA256 hash now from:
https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.3/gnuplot-6.0.3.tar.gz.sha256

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/gnuplot/gnuplot.hash | 8 ++++----
 package/gnuplot/gnuplot.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index 980fe6858d..bac1cb9d2d 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.2/
-md5  ea0931758fc180e3b1950931b9869921  gnuplot-6.0.2.tar.gz
-sha1  be803916e4ea32720b4a646f2ffc98d6ad3a0dc2  gnuplot-6.0.2.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.3/
+md5  c897ca69062010e2cf5f7483e39e5acc  gnuplot-6.0.3.tar.gz
+sha1  b31779d6760f432f57136600fc0c2bf65f4d4013  gnuplot-6.0.3.tar.gz
+sha256  ec52e3af8c4083d4538152b3f13db47f6d29929a3f6ecec5365c834e77f251ab  gnuplot-6.0.3.tar.gz
 # Locally computed
-sha256  f68a3b0bbb7bbbb437649674106d94522c00bf2f285cce0c19c3180b1ee7e738  gnuplot-6.0.2.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index b363e761ef..2a1072a55c 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 6.0.2
+GNUPLOT_VERSION = 6.0.3
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
