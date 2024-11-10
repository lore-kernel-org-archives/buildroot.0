Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14BAD12D55
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 21:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60F16605FC;
	Sun, 10 Nov 2024 21:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4nls7h69bXty; Sun, 10 Nov 2024 21:12:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D04360645
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D04360645;
	Sun, 10 Nov 2024 21:12:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 615B9D8F
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 21:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42F5A80DA8
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 21:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xXurrZXpfw1 for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 21:11:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E5AE80DA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E5AE80DA1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E5AE80DA1
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 21:11:58 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1341CB0051B;
 Sun, 10 Nov 2024 22:11:52 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 10 Nov 2024 22:11:44 +0100
Message-ID: <20241110211144.720818-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731273115;
 bh=wPX1s0imVk3bqUhHTyPk85cwYmEROGg2T5gULnx/wY4=;
 h=From:To:Cc:Subject:Date:From;
 b=INuoNSARLV35NMniXAoCX71Ql/zFf07Fl21gtU1TfV5iksStqD2SevNrQM98YUg7k
 eQQKjjdmHZIG+zuidrQ140VSG7YsSDKYiI2innvsd1HrIi35PVWQbeI8NuqRwJVQBY
 Wkfg2IBmp5lPxNPAi1IBTbgJZs3SIJKdDV/ine6qKVW/nKZFLzcdxbIKxImreGkiDZ
 RukEfeBEEaUnLCRJrCFenCbrXHNql8tTpdU2rF2ppQKpqQ6GDrxhX8FtPldYWTHyxx
 /iJia+tC3CufF04NlGZBD4M2prkL9f/YbIOyEehqZvFpUJz4z+uhhvL+fx4+eeVtly
 hC9NNSZDfLrMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=INuoNSAR
Subject: [Buildroot] [PATCH 1/1] package/motion: bump version to 4.7.0
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

For the change log, see:
https://github.com/Motion-Project/motion/releases/tag/release-4.7.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested (compilation only) in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1535518810
---
 package/motion/motion.hash | 2 +-
 package/motion/motion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/motion/motion.hash b/package/motion/motion.hash
index e8bbfbcbcb..1d1a005e7a 100644
--- a/package/motion/motion.hash
+++ b/package/motion/motion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9268df31a5ebeaf8daca4747cdcd01c86e223625b6f971e9bcec98edf35ec06f  motion-4.6.0.tar.gz
+sha256  657b7d8ee59f42cf06e00da04f0627f3ff42ff5344c9a1da33d16207c4451a03  motion-4.7.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index ff5e2c1403..fc70349221 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOTION_VERSION = 4.6.0
+MOTION_VERSION = 4.7.0
 MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
 MOTION_LICENSE_FILES = LICENSE
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
