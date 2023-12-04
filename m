Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66E3C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 737A9419D5;
	Mon,  4 Dec 2023 21:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 737A9419D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jtXFXv4Q09BA; Mon,  4 Dec 2023 21:18:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73392419B9;
	Mon,  4 Dec 2023 21:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73392419B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2126F1BF30E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E343341763
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E343341763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ikypFUk_py1T for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:18:21 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E80214174F
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E80214174F
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A19E2A4C0EB0;
 Mon,  4 Dec 2023 22:18:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47898)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGKN-0007Q9-14;
 Mon, 04 Dec 2023 22:18:07 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:18:05 +0100
Message-Id: <20231204211807.12746-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204211807.12746-1-bernd@kuhls.net>
References: <20231204211807.12746-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724687;
 bh=BGEeaSljyk5DH2wE9BpiNNsq1Owoze4DoNRZ/jBGwvw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FPtJ01kfXWSx4yUV5+0OQ8ywJ1ZggWE/ewLZ4YlCSvIAWVDPrBxnSSvPf1o18F0Aj
 NOns6raCMuSbb8aR//faJx7SNf6IyFWjldUUnkja7ilXP3iB6fTP+RqBFSVTxhMxMa
 dLmAssXZlDw89eqFXitl8kTBTLU10V1uVre/brVLdEJFKcnK2CqU3wkGsEtLd+qF2F
 ZM7CVscwoON75WXE2sJRRp9CuJaBojHGZeFVP6fEcHBc5NnWfcBeB+bv/TKqEAVEKF
 aK7piDb1Q1EfAGq8LqzK5QMtxXtWdGNkA6tVmPnYn5cNUIUgtEkuGkLHQDeDWzu3yG
 OBB4gS1fP4fsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=FPtJ01kf
Subject: [Buildroot] [PATCH 2/4] package/onevpl: bump version to 2023.4.0
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/onevpl/onevpl.hash | 2 +-
 package/onevpl/onevpl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/onevpl/onevpl.hash b/package/onevpl/onevpl.hash
index c9ca1e6c04..328fa94487 100644
--- a/package/onevpl/onevpl.hash
+++ b/package/onevpl/onevpl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4411543519486a2450f6f5af06a077596e7888a551768594e9dfa2a46b23b6f5  onevpl-2023.3.1.tar.gz
+sha256  978398c7bb1665a6ad7a1a15cc57dc0204608e56c88436e376b717320a9e63fd  onevpl-2023.4.0.tar.gz
 sha256  bf1cfac2e2792b6e1e995ce103d70796aecaf2ec7e4c5fe5474f7acec7b4a677  LICENSE
diff --git a/package/onevpl/onevpl.mk b/package/onevpl/onevpl.mk
index 601e121a55..1a580d0636 100644
--- a/package/onevpl/onevpl.mk
+++ b/package/onevpl/onevpl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONEVPL_VERSION = 2023.3.1
+ONEVPL_VERSION = 2023.4.0
 ONEVPL_SITE = $(call github,oneapi-src,oneVPL,v$(ONEVPL_VERSION))
 ONEVPL_LICENSE = MIT
 ONEVPL_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
