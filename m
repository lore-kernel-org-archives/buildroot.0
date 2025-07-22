Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA39C83F1A
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 17:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E7FF41680;
	Tue, 22 Jul 2025 17:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nk8MSD8AitzR; Tue, 22 Jul 2025 17:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8134141625
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8134141625;
	Tue, 22 Jul 2025 17:58:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 508E6DA
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41448807CE
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7MUhQAQFqlz for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 17:58:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 76B508069F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76B508069F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76B508069F
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:58:44 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C0F07B00571;
 Tue, 22 Jul 2025 19:58:41 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue, 22 Jul 2025 19:58:36 +0200
Message-ID: <20250722175837.2860402-1-ju.o@free.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753207123;
 bh=RxY80GtXMEv5xy3hWrT99F3KOta8P3SIlyElof5yG04=;
 h=From:To:Cc:Subject:Date:From;
 b=iMMe0YaePiifIw79U1HrqBQmnBrCGc47tgVE9nBQGecg/9MshvEs1ZRIJnocXSDPf
 V9MRJHDHwu9Nxd2Vs2A2l02GEoZSo7Rx2Q2duWeHqaJqpNpdvPZ7sbgdYCuU2U4QBA
 lFCJOQi3nV86com0GQ2Fts/8c2n9EbDWOIlr9cz8qKDGEPqjIvoVdQTQTl/P39TWIG
 yyzCjA2rmmZVPiRiMLAHhF5ORHPWc4uC5VNtGzZO/rOWhpwjRleIyJREH45MdLfC3i
 hLKawlJB/ur+WuQSne00D04ZMEIhQo1ShYgKMuI2DwaVr6pLxjusVRUi3WN+qvRTdR
 fFbErYzt2F/eA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iMMe0Yae
Subject: [Buildroot] [PATCH 1/1] package/openmpi: bump to version 4.1.8
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 4.1.5, see:
https://github.com/open-mpi/ompi/blob/v4.1.8/NEWS#L62

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openmpi/openmpi.hash | 6 +++---
 package/openmpi/openmpi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openmpi/openmpi.hash b/package/openmpi/openmpi.hash
index 567ffe4833..78c60b2bf1 100644
--- a/package/openmpi/openmpi.hash
+++ b/package/openmpi/openmpi.hash
@@ -1,6 +1,6 @@
 # From: https://www.open-mpi.org/software/ompi/v4.1/
-md5  bb045df2d600744c2231c78b31a20da3  openmpi-4.1.5.tar.bz2
-sha1  eba2e6f9ee0c39fbca0a8cf53a79c9ed29643284  openmpi-4.1.5.tar.bz2
-sha256  a640986bc257389dd379886fdae6264c8cfa56bc98b71ce3ae3dfbd8ce61dbe3  openmpi-4.1.5.tar.bz2
+md5  72e95168a62a5b951da9afe4f48b0be9  openmpi-4.1.8.tar.bz2
+sha1  821df691e2c37ecc40b2784237cfdfda734bf13a  openmpi-4.1.8.tar.bz2
+sha256  466f68e3132a1dc02710cc2011fafced8336d98359fa2dae4dddcfd5719f12a9  openmpi-4.1.8.tar.bz2
 # Locally computed
 sha256  2db71de9577ebfe15c186605844c470dcecd3717f4ef0118c9440d801c0f58f8  LICENSE
diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
index 82a4b3eb1c..eab87b5987 100644
--- a/package/openmpi/openmpi.mk
+++ b/package/openmpi/openmpi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OPENMPI_VERSION_MAJOR = 4.1
-OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).5
+OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).8
 OPENMPI_SITE = https://www.open-mpi.org/software/ompi/v$(OPENMPI_VERSION_MAJOR)/downloads
 OPENMPI_SOURCE = openmpi-$(OPENMPI_VERSION).tar.bz2
 OPENMPI_LICENSE = BSD-3-Clause
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
