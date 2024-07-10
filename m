Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E823C38150
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 07:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD6D64046C;
	Wed, 10 Jul 2024 07:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72773yVgAO-r; Wed, 10 Jul 2024 07:44:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B19D1409E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B19D1409E5;
	Wed, 10 Jul 2024 07:44:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB6041BF5EA
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 07:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6A67810F1
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 07:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7T7Y6hkoUaGQ for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 07:44:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.67.31.35;
 helo=smtprelay01.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C9AB5810ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9AB5810ED
Received: from smtprelay01.ispgateway.de (smtprelay01.ispgateway.de
 [80.67.31.35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9AB5810ED
 for <buildroot@busybox.net>; Wed, 10 Jul 2024 07:44:31 +0000 (UTC)
Received: from [84.191.232.240] (helo=mail.go-sys.de)
 by smtprelay01.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.97.1)
 (envelope-from <mf@go-sys.de>) id 1sRRzu-000000006Dp-0qKz
 for buildroot@busybox.net; Wed, 10 Jul 2024 09:44:18 +0200
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Jul
 2024 09:44:27 +0200
Received: from go-sys.de (192.168.1.175) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.39 via Frontend Transport;
 Wed, 10 Jul 2024 09:44:27 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Wed, 10 Jul 2024 09:44:25 +0200
Message-ID: <20240710074425.21518-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=go-sys.de
Subject: [Buildroot] [PATCH] package/gnuplot: bump version to 6.0.1
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
Cc: Michael Fischer <mf@go-sys.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/gnuplot/gnuplot.hash | 8 ++++----
 package/gnuplot/gnuplot.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index dd587a8220..4072338885 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.0/
-md5  10246eb96bbf3a151d6eb9bbcc223e4e  gnuplot-6.0.0.tar.gz
-sha1  3abea0cccad89b0c8fb6619ad51b83a971ee24b9  gnuplot-6.0.0.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.1/
+md5  744fde2362fb20db6cfc58de73f96e9c  gnuplot-6.0.1.tar.gz
+sha1  ce1aaeff632c78cba2b3ca8142cf130bfd411478  gnuplot-6.0.1.tar.gz
 # Locally computed
-sha256  635a28f0993f6ab0d1179e072ad39b8139d07f51237f841d93c6c2ff4b1758ec  gnuplot-6.0.0.tar.gz
+sha256  e85a660c1a2a1808ff24f7e69981ffcbac66a45c9dcf711b65610b26ea71379a  gnuplot-6.0.1.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index e34dd2a60b..adb9ce6ad1 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 6.0.0
+GNUPLOT_VERSION = 6.0.1
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
