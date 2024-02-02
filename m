Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1782C4828F
	for <buildroot@archiver.kernel.org>; Fri,  2 Feb 2024 22:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AFEC60C15;
	Fri,  2 Feb 2024 22:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AFEC60C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yDXeOGoKXqz9; Fri,  2 Feb 2024 22:20:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4081260E6F;
	Fri,  2 Feb 2024 22:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4081260E6F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35F5F1BF841
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 22:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BE5284D5B
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 22:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BE5284D5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SBri45WWyMzB for <buildroot@lists.busybox.net>;
 Fri,  2 Feb 2024 22:20:45 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFA138464F
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 22:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFA138464F
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 699AAA4C09D2;
 Fri,  2 Feb 2024 23:20:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59162)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rW1tp-0000000048Q-0ZpK;
 Fri, 02 Feb 2024 23:20:41 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Feb 2024 23:20:39 +0100
Message-Id: <20240202222040.2390770-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1706912441;
 bh=5enHaneoYgxtTKsKTRsvtLXS83j+uEUuTPwHbzr7yHc=;
 h=From:To:Cc:Subject:Date:From;
 b=JcbxUo6SsXxUHo+gph0YUXvZHcQx7NmiV0ZUnSemrptJlvG/0RF8Oft8mwk7KA0Vo
 jxRf7Ua0O5ExLojhZHlNUtkZk7CoDEEzOR3x+6p3hmyZh8lqsuvZdbHOP3Y+BSsIR/
 02m1Hn+k81aZA5GiyPg5HNFp5Ar31lK9jTXpjx62Ca8fs5yhOnASEY7hrD+SuSkIzP
 jz/n3yPNLTcC4U+ELCvdlQgVZxTLPYC5QokTEt4D0kRuC4c4DAbyIn9Sy/Hh0ReScJ
 hVB9t6p/PnUvDtFGRLWCKyluK0j55S5G7TxuXNS3yAn7C8aclYbebcSw71i/QJqvNv
 lku9lKiuu1QgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=JcbxUo6S
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 24.1.3
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
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index feade4974c..a1b098094b 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  da90f3c38176936f6315bb4b0f04f6f83080f9a6a228294538aa6befe9ce20e0  intel-media-24.1.1.tar.gz
+sha256  a024e96abd662193e4295f427a76c5894087503df46bd82c0e5bea103e44b171  intel-media-24.1.3.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index efff3d44b0..efedf407e5 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 24.1.1
+INTEL_MEDIADRIVER_VERSION = 24.1.3
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
