Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3398C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A57B419DC;
	Mon,  4 Dec 2023 21:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A57B419DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KmhPMXLXeMSk; Mon,  4 Dec 2023 21:18:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F8CA41917;
	Mon,  4 Dec 2023 21:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F8CA41917
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D61C11BF30E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF4484096D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF4484096D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t6lYI4fFxVok for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:18:45 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AB9D40969
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AB9D40969
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CCC31A4C0F37;
 Mon,  4 Dec 2023 22:18:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47898)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGKN-0007Q9-1g;
 Mon, 04 Dec 2023 22:18:07 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:18:07 +0100
Message-Id: <20231204211807.12746-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204211807.12746-1-bernd@kuhls.net>
References: <20231204211807.12746-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724687;
 bh=NPJ/v1UwfjJLvWYPnh/cYHve2hsssvP/Qga8ypMhuF4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GaM2LEzsUc8uVVevyzVWIUKJJoxxzQ5Lv6az6zPWUfBrRQ265qQedHCrPrKMgZiqe
 0+F1SpsvqQnySZ8qfShVIoMjhp7cMMbSLYQs67y4rpfJ+hNLfS1BRFhxiEu1YjJMuv
 w+OkNIOtk1jTuf3+7up/XUrpSrHDWKBg6y7osX5GSxIbrmS1SgGCkgwOzR94rEdGqj
 TMOMHuJqGZ6ebNsvXmCwjdJ4DQiAF4I/ZwDdU16HUviiiR7PhuiwHPOVIvcQcyNlGH
 CBmVbRCuoOL7e0FLw3JDA5FNXz+TGpcMUuow0D5D3MbRGrjuFECjehA42KYedNX0ZH
 1bWMyhBKaBmeg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=GaM2LEzs
Subject: [Buildroot] [PATCH 4/4] package/onevpl-intel-gpu: bump version to
 23.4.2
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
index 5f7728e5f9..319bd37de0 100644
--- a/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
+++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0939232daa2ef3e35b453e4aa0d25674a9b2376b4ef814fb64712cf587654787  onevpl-intel-gpu-23.4.0.tar.gz
+sha256  ab530e9e221d94f6bfaab853a8aa4528ec2d4de7d48aed95cd4c7ee633095577  onevpl-intel-gpu-23.4.2.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
index 8c9275fe75..98b228f9fc 100644
--- a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
+++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONEVPL_INTEL_GPU_VERSION = 23.4.0
+ONEVPL_INTEL_GPU_VERSION = 23.4.2
 ONEVPL_INTEL_GPU_SITE = $(call github,oneapi-src,oneVPL-intel-gpu,intel-onevpl-$(ONEVPL_INTEL_GPU_VERSION))
 ONEVPL_INTEL_GPU_LICENSE = MIT
 ONEVPL_INTEL_GPU_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
