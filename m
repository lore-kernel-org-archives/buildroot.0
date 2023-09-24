Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2468CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 18:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65333417B5;
	Sun, 24 Sep 2023 18:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65333417B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VMs-X6td4Skl; Sun, 24 Sep 2023 18:36:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36EA4417AE;
	Sun, 24 Sep 2023 18:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36EA4417AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 781031BF337
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51E0C40A92
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51E0C40A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tiq6hMmV_aRa for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 18:36:49 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A90F540A15
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 18:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A90F540A15
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 18037A4C0CC6;
 Sun, 24 Sep 2023 20:36:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42944)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qkTxu-0008Qi-2c;
 Sun, 24 Sep 2023 20:36:22 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 20:36:22 +0200
Message-Id: <20230924183622.41519-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230924183622.41519-1-bernd@kuhls.net>
References: <20230924183622.41519-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695580583;
 bh=v3NOmoHw5WQmIqoYQtnLamDpHchY73d5kt6nyPcWvKo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Eo1/Yi05Q+4ytpvdtIPdWpYH8/T8uRADtwyUJUdWPicT+cBOWgLabSLekcWA1+po4
 fYzQskSqT3H6OAUogMBMHacAI7jomg+Gecj9yXKyA5UlDNpQ/8HScxuwXDBFeRADof
 NT1wM6Pt74LHC+tFBljxnY5QXclc5slmdfa0T2lPUb186UXuyHH+fAMXf98vh/PraT
 jPcOxqGUrKD8fAx6BGue/gejY5jEgY0jHjI5XNaRtFilSrngsO3X4OJymXVsSOIR3+
 83wsHVDSLdgCcZvpEaHG6PR/beMYGT46AvME7MJRuAXq1N3GwHls/xzAhJfrXFSGy6
 uog5Hr4Y4jLqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Eo1/Yi05
Subject: [Buildroot] [PATCH 3/3] package/onevpl-intel-gpu: bump version to
 23.3.3
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
 package/onevpl-intel-gpu/onevpl-intel-gpu.hash | 2 +-
 package/onevpl-intel-gpu/onevpl-intel-gpu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.hash b/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
index 70af121d28..fab7ca0eae 100644
--- a/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
+++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  311658f18b45645ffa9337a6307d59a1025b6f77f8fe122c332f536a14e1ef44  onevpl-intel-gpu-23.3.2.tar.gz
+sha256  4f31a10d51fb09c87fa62afb6da51778f0d946de900f3367816864dc0e096b29  onevpl-intel-gpu-23.3.3.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
index cbc612f4f3..311ab88b4e 100644
--- a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
+++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONEVPL_INTEL_GPU_VERSION = 23.3.2
+ONEVPL_INTEL_GPU_VERSION = 23.3.3
 ONEVPL_INTEL_GPU_SITE = $(call github,oneapi-src,oneVPL-intel-gpu,intel-onevpl-$(ONEVPL_INTEL_GPU_VERSION))
 ONEVPL_INTEL_GPU_LICENSE = MIT
 ONEVPL_INTEL_GPU_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
