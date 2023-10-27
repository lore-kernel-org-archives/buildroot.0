Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E79FC25B47
	for <buildroot@archiver.kernel.org>; Fri, 27 Oct 2023 05:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7DE54ECEB;
	Fri, 27 Oct 2023 05:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7DE54ECEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F34w10H6O0rN; Fri, 27 Oct 2023 05:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10F3B4ECE7;
	Fri, 27 Oct 2023 05:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10F3B4ECE7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0AE2A1BF427
 for <buildroot@lists.busybox.net>; Fri, 27 Oct 2023 05:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D81A084B0E
 for <buildroot@lists.busybox.net>; Fri, 27 Oct 2023 05:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D81A084B0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tuS2Daxkevs2 for <buildroot@lists.busybox.net>;
 Fri, 27 Oct 2023 05:08:21 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70E9484B0D
 for <buildroot@buildroot.org>; Fri, 27 Oct 2023 05:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70E9484B0D
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 32A0FA4C028D
 for <buildroot@buildroot.org>; Fri, 27 Oct 2023 07:08:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55116)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qwF4z-0000GP-34
 for buildroot@buildroot.org; Fri, 27 Oct 2023 07:08:17 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 27 Oct 2023 07:08:17 +0200
Message-Id: <20231027050817.17828-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1698383298;
 bh=HWpZyAOj+BtG2elJH7/57Tl4OHVBTANJf8c3/lHT+yQ=;
 h=From:To:Subject:Date:From;
 b=sAyH7SE6H+c8omcQWFi6hxHcZ4lYd4PrH4SoRI2RUDOql91hnjWCf5TP4+epfrFnu
 PEZ5EJz+JdswIiGWljKZnVvhGQ84Kx1FRbAthoj9opGbHdYYev7Mvv/7KfpHhH0lP5
 KU5eIX/yeQBLnd+2L5mtKI5oziCqhd0Fiw+XSr/3e++5hhP+ULM1IEKfEiuemGfDhz
 41bbD2NguZxhnwXQHgNMzCBSId7z6M0mlNsZ8Z+FJnHG/o45lXcmIC+VBYB/Jab4Ym
 +I0kSq1d3VylTi7jwuB+iQvpggSQTIaBKO2Sg6OsCka7ztrWEHXyB28dydXajMiCN0
 TUv5xeHRXC/uQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=sAyH7SE6
Subject: [Buildroot] [PATCH 1/1] package/onevpl-intel-gpu: bump version to
 23.4.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/onevpl-intel-gpu/onevpl-intel-gpu.hash | 2 +-
 package/onevpl-intel-gpu/onevpl-intel-gpu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.hash b/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
index fa25c507eb..5f7728e5f9 100644
--- a/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
+++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9de6bfd17259b7434f2bb4fb6d2874decf9b1d4587ec9b90d91188049921e32f  onevpl-intel-gpu-23.3.4.tar.gz
+sha256  0939232daa2ef3e35b453e4aa0d25674a9b2376b4ef814fb64712cf587654787  onevpl-intel-gpu-23.4.0.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
index c7c557e9e2..8c9275fe75 100644
--- a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
+++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONEVPL_INTEL_GPU_VERSION = 23.3.4
+ONEVPL_INTEL_GPU_VERSION = 23.4.0
 ONEVPL_INTEL_GPU_SITE = $(call github,oneapi-src,oneVPL-intel-gpu,intel-onevpl-$(ONEVPL_INTEL_GPU_VERSION))
 ONEVPL_INTEL_GPU_LICENSE = MIT
 ONEVPL_INTEL_GPU_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
