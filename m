Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52ACC4706C
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 20:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2960C41B85;
	Tue,  9 Jan 2024 20:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2960C41B85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6-6hyAiEFYVI; Tue,  9 Jan 2024 20:04:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65DAE41B79;
	Tue,  9 Jan 2024 20:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65DAE41B79
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B4A01BF2CC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 20:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2B2341B79
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 20:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2B2341B79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dAy2iQE_bv9L for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 20:03:55 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 354484032A
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 20:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 354484032A
Received: from fli4l.lan.fli4l (p5b3a0630.dip0.t-ipconnect.de [91.58.6.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D8799A4C02B8;
 Tue,  9 Jan 2024 21:03:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59682)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rNIKF-000000000gY-1vip;
 Tue, 09 Jan 2024 21:03:51 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 21:03:51 +0100
Message-Id: <20240109200351.144904-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240109200351.144904-1-bernd@kuhls.net>
References: <20240109200351.144904-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1704830631;
 bh=XqQRMLwdD1Gd+ebytZPzVLQG6wnxEslDp+ZY7PM9PQo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fwELs8cthQmyfODB8jgQuf8mxj++lcuUpgZnmOk3DsrRbwlyCMIzcOYS39+CkKXxa
 pa73B89NlKVQfVtiwPe55IdDeO7+J9fRYf9olTTfRDBaWzPHwPqlnk5FvTOqpPHkv9
 qTEuo4xyRx/K52KtSkySlvFVr4R5Ux5R39SBqN1MvX58Q8m34YayLv61HOp/KvNt26
 e/+blcTWgRnhyiXDvM0busp8yKWdjjuTng3OV9Up2uAW66CU0td4wcXOKO1rKN6UOz
 uP8do31qBxCeugcTSTwDupD4XhQSxLYoSxurdaEOQBPDx8WtvG9DQJzBB9QgyO6o3w
 GGgig92wLoBig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=fwELs8ct
Subject: [Buildroot] [PATCH 2/2] package/intel-mediadriver: bump version to
 24.1.1
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
index b021d05301..feade4974c 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  83b95eefe86c9d58d92c2a77793541ea3cb643dff419599ffa87899fd58738cd  intel-media-23.4.3.tar.gz
+sha256  da90f3c38176936f6315bb4b0f04f6f83080f9a6a228294538aa6befe9ce20e0  intel-media-24.1.1.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 6b4ea543d4..efff3d44b0 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 23.4.3
+INTEL_MEDIADRIVER_VERSION = 24.1.1
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
