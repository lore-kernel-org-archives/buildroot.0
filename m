Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18F5D1BDE5
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 18:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A902607C4;
	Mon,  4 Nov 2024 18:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9014uNzA0Pq; Mon,  4 Nov 2024 18:58:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BFBA607D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BFBA607D0;
	Mon,  4 Nov 2024 18:58:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 418023B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 18:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F41940612
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 18:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRDAT1Hre5ZZ for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 18:58:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E843540603
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E843540603
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E843540603
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 18:58:32 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3B3B2B00573;
 Mon,  4 Nov 2024 19:58:26 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
	Julien Olivain <ju.o@free.fr>
Date: Mon,  4 Nov 2024 19:58:17 +0100
Message-ID: <20241104185817.171086-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730746709;
 bh=cKpOqmMj6ZJLMvNtJyblH2b8FMraCAMtzxOlRSMGJLs=;
 h=From:To:Cc:Subject:Date:From;
 b=GvSV4QEUo7EHkCy+q9/DERhBgOVAHyzFCmsIRLFOfKfa5lhcIyMVvUYuJrteXZDyu
 wavDe2oyKJ1yV0c2QvbN5HV++55wh3s/9lBRBwfFjxcMIoCM8VBLDPPApQvns1HMC/
 6aL4HHXO6M4HyCFmzr/Vyw87wA4KScKERbbB+za5Ny5g1emRWVubRfOueqSsoB/ikn
 ZNhe/N1E/8idounXTeSwc7IbY1FqtvumzSsmz2uYUVPWqODwkEtzx4oWkzZcrRZeVb
 nBgKkTiTlj7NQ/M7XnHx3sJVowWQotZJ9a3PiSHvhJ1HvUP05LEtUG6uYdiOLssiOk
 aRuiAPTq0skDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GvSV4QEU
Subject: [Buildroot] [PATCH 1/1] package/libsolv: bump version to 0.7.30
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

For a change log since 0.7.25, see:
https://github.com/openSUSE/libsolv/blob/0.7.30/NEWS#L4

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested (compilation only) in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1526685818
---
 package/libsolv/libsolv.hash | 2 +-
 package/libsolv/libsolv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsolv/libsolv.hash b/package/libsolv/libsolv.hash
index b18a682ccf..97259ae93f 100644
--- a/package/libsolv/libsolv.hash
+++ b/package/libsolv/libsolv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b382bba4196b19c36eb34e0ef02546c0b922be601c6f73390c9ab643895b656a  libsolv-0.7.25.tar.gz
+sha256  ce4aa2f0e3c5c9ab99dced6a1810af3f670f1b98892394edc68ccabe7b272133  libsolv-0.7.30.tar.gz
 sha256  57f15acfb29fbef7749779e096a5885c60b716633e34484a21bb717554c0198f  LICENSE.BSD
diff --git a/package/libsolv/libsolv.mk b/package/libsolv/libsolv.mk
index 2a9f1bf208..2317d3e663 100644
--- a/package/libsolv/libsolv.mk
+++ b/package/libsolv/libsolv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOLV_VERSION = 0.7.25
+LIBSOLV_VERSION = 0.7.30
 LIBSOLV_SITE = $(call github,openSUSE,libsolv,$(LIBSOLV_VERSION))
 LIBSOLV_LICENSE = BSD-3-Clause
 LIBSOLV_LICENSE_FILES = LICENSE.BSD
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
