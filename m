Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA45D6A22E
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 20:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 484FF605B0;
	Thu, 14 Nov 2024 20:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbHk1RaLruRl; Thu, 14 Nov 2024 20:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51664605C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51664605C0;
	Thu, 14 Nov 2024 20:47:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C5B99BF
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 20:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3C6F84608
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 20:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0n4ZpzSGn5A for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 20:47:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7789B84602
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7789B84602
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7789B84602
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 20:47:11 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C4C96B005FE;
 Thu, 14 Nov 2024 21:47:07 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Thu, 14 Nov 2024 21:47:01 +0100
Message-ID: <20241114204701.40561-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731617229;
 bh=13UEhhVmKXc6qbp5N17Gqv6lx0osMPlN43oxH74tfmk=;
 h=From:To:Cc:Subject:Date:From;
 b=CFyWXltlYAfp7rUyekKToUr4aUHRiDJioFMKZVc2zdQPJyEG/YOsYkukPVqK6KDTk
 1SHekOc+Cxu0H51mNYiEya4kIXEPORXeKQ/mxzvpNg+uawWtBSeENSRvMaykM/I+o/
 3AKw8qSe7apXjwp2uiXUTZGJRhrrxr0iVq25SkIcD4uGOXdnWXZGdqhumJU0eC4W7N
 TFSNtvdd3WqUEe7fycuMqYkDLkvHn5lJO1U8txM7+yo9aVu3OEiNQAAqPIuYTeRBRt
 +t1I7d4lCSM8dGV6DADxy/n/yX0b8B5BhIPD/Il++rLcLZEtGhDbV0HIwY2vhE6sVK
 aWBKyuLc1+0Ww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CFyWXltl
Subject: [Buildroot] [PATCH next 1/1] package/tinycompress: bump to version
 1.2.13
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

For commit log, see:
https://github.com/alsa-project/tinycompress/commits/v1.2.13/

This commit also adds in the hash file a commit with the pgp signature
source and key id used for the verification.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tinycompress/tinycompress.hash | 4 +++-
 package/tinycompress/tinycompress.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/tinycompress/tinycompress.hash b/package/tinycompress/tinycompress.hash
index f86b75f346..1a2b2c0203 100644
--- a/package/tinycompress/tinycompress.hash
+++ b/package/tinycompress/tinycompress.hash
@@ -1,5 +1,7 @@
 # Locally calculated after checking pgp signature
-sha256  ebbe788c28328e7cca245aaf9194a5ad0dc91e9e0dc883c2cf9feb6d42c9f3fc  tinycompress-1.2.11.tar.bz2
+# from https://www.alsa-project.org/files/pub/tinycompress/tinycompress-1.2.13.tar.bz2.sig
+# with key F04DF50737AC1A884C4B3D718380596DA6E59C91
+sha256  0efe6cbd7bff31983e0d416df0436767665cc4cd70d278c06ce0e83e0eeab5db  tinycompress-1.2.13.tar.bz2
 
 # Locally calculated
 sha256  912ea37a4435594a3b3c35f04efa4b5b7af2e68a05f5319c16c881711a31e4b7  COPYING
diff --git a/package/tinycompress/tinycompress.mk b/package/tinycompress/tinycompress.mk
index fabd5884b2..b5764ea293 100644
--- a/package/tinycompress/tinycompress.mk
+++ b/package/tinycompress/tinycompress.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYCOMPRESS_VERSION = 1.2.11
+TINYCOMPRESS_VERSION = 1.2.13
 TINYCOMPRESS_SOURCE = tinycompress-$(TINYCOMPRESS_VERSION).tar.bz2
 TINYCOMPRESS_SITE = https://www.alsa-project.org/files/pub/tinycompress
 TINYCOMPRESS_LICENSE = BSD-3-Clause and LGPL-2.1
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
