Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EA9E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 22:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8529F407D0;
	Mon, 16 Dec 2024 22:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K0uWvN_6FcCx; Mon, 16 Dec 2024 22:05:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A580407D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A580407D1;
	Mon, 16 Dec 2024 22:05:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 143DDC5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8B6660BC2
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LF8yKxnMH7FL for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 22:05:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A21A860B42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A21A860B42
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A21A860B42
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:05:51 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9D429B00585;
 Mon, 16 Dec 2024 23:05:48 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 16 Dec 2024 23:05:41 +0100
Message-ID: <20241216220541.1074832-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734386749;
 bh=BHnoJR2q4o5moCGrzg7zk9ko6ncTrAyPVcsxLcFdRbg=;
 h=From:To:Cc:Subject:Date:From;
 b=dxSLaSl61WrnB9E/+Q1eygfh2Uq/lXU0ArVpDa+orgDQbXsYztQSLyAXYKo2NgVoE
 h4c23sPznJckQB0++Uuml565wAA1gD1UyQ35kwvPMpVkC0AfLnKsGTFqLUhHABdqjw
 RGFTCe0NVFGqLDYx13oDoE+MFiLwfFt6l3yjPaedczqBrgTnn9GhvWrYudDNXJMTys
 65NsPv5wOiXuKrNt9t09TJPMnsNkYrUT60/IrjBrsPwHd7cOUQbEbj3YD4rbtx4wSj
 BuBo3LxTkoil8shz5wqFiE/F5G56aK3l8sE4FAisOZ6YXsSQEGb5PyxeofjyoT6Pz9
 UiwomCbmfGuIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dxSLaSl6
Subject: [Buildroot] [PATCH 1/1] package/octave: bump to version 9.3.0
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

See release announce:
https://octave.org/news/release/2024/12/15/octave-9.3.0-released.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8657897631
---
 package/octave/octave.hash | 4 ++--
 package/octave/octave.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/octave/octave.hash b/package/octave/octave.hash
index d9313734f1..5d96f9232c 100644
--- a/package/octave/octave.hash
+++ b/package/octave/octave.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-# https://ftp.gnu.org/gnu/octave/octave-9.2.0.tar.lz.sig
+# https://ftp.gnu.org/gnu/octave/octave-9.3.0.tar.lz.sig
 # using key DBD9C84E39FE1AAE99F04446B05F05B75D36644B
-sha256  dcb2c098701cfcbc083f07e90e146261d15cdbf5e89c031032422112c89b47da  octave-9.2.0.tar.lz
+sha256  166e3ee492b2b1cade136cca50180c6adbbbd134fd1f34ae46e2948544a598ec  octave-9.3.0.tar.lz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 34d9288c75..3989b85a4a 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCTAVE_VERSION = 9.2.0
+OCTAVE_VERSION = 9.3.0
 OCTAVE_SITE = $(BR2_GNU_MIRROR)/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
