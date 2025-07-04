Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92458C8303D
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 17:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6494A40D8C;
	Fri,  4 Jul 2025 17:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xkHf7bVEnpIo; Fri,  4 Jul 2025 17:15:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 919F040C81
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 919F040C81;
	Fri,  4 Jul 2025 17:15:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11F637AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0363283FA8
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2ZTc1pepxo4 for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 17:15:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2EAA683FA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EAA683FA2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2EAA683FA2
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:15:56 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E649EB0054E;
 Fri,  4 Jul 2025 19:15:50 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 Julien Olivain <ju.o@free.fr>
Date: Fri,  4 Jul 2025 19:15:41 +0200
Message-ID: <20250704171541.1068130-1-ju.o@free.fr>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751649354;
 bh=dXNDQ6BFJ1ZPrr05rg7zRjHe+D8yXkToNub90+Phy5Y=;
 h=From:To:Cc:Subject:Date:From;
 b=M4Q49AUDfkAqe64Qm6F1443UqLFMolu+oBKyL8yMZI3wqCtX6WWAW/pd4RvtjWOHG
 QXmKorm9/dsrQKvN75KHYd4HQL/va3+vysgP0vmSYIr3EO97WOJVwv2CxZeEHDcKN2
 qfuHTynUMCd+tyDHz6ol6Od9XHRy7X/JchOLb1SUKQIp671S9trj8FUgs9VG5I6UjR
 cEFt8ICCY3WWMneHkZ36BYN7T1T/lQr9UFRJ2N1DbeND/4munltLWWkfBV18Ew4udx
 pNsU+nkeCggBdJ+LUJ5jytlLVCuMqZKkb3qlNyN/vp9skjyRzdp719QL6iXNH+7mng
 bViIdB3yT6hCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M4Q49AUD
Subject: [Buildroot] [PATCH 1/1] package/clinfo: bump to version 3.0.25.02.14
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

For change list since 3.0.21.02.21, see:
https://github.com/Oblomov/clinfo/compare/3.0.21.02.21...3.0.25.02.14

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/clinfo/clinfo.hash | 2 +-
 package/clinfo/clinfo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clinfo/clinfo.hash b/package/clinfo/clinfo.hash
index e433b6740c..f40aaefcd4 100644
--- a/package/clinfo/clinfo.hash
+++ b/package/clinfo/clinfo.hash
@@ -1,4 +1,4 @@
 # locally calculated
-sha256  e52f5c374a10364999d57a1be30219b47fb0b4f090e418f2ca19a0c037c1e694  clinfo-3.0.21.02.21.tar.gz
+sha256  48b77dc33315e6f760791a2984f98ea4bff28504ff37d460d8291585f49fcd3a  clinfo-3.0.25.02.14.tar.gz
 sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  legalcode.txt
 sha256  2a7a9321be169ea6edbc6b1010e8f7bb0f4c1482a2f65c34a49e9719f129b79a  LICENSE
diff --git a/package/clinfo/clinfo.mk b/package/clinfo/clinfo.mk
index d4c1df90d4..6235f4974e 100644
--- a/package/clinfo/clinfo.mk
+++ b/package/clinfo/clinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLINFO_VERSION = 3.0.21.02.21
+CLINFO_VERSION = 3.0.25.02.14
 CLINFO_SITE = $(call github,Oblomov,clinfo,$(CLINFO_VERSION))
 CLINFO_LICENSE = CC0-1.0
 CLINFO_LICENSE_FILES = legalcode.txt LICENSE
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
