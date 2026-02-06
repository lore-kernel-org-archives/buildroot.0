Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C898EE6B46
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 19:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29AF841A5D;
	Fri,  6 Feb 2026 19:32:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbrI-aaTZzl5; Fri,  6 Feb 2026 19:32:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9609941821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770406343;
	bh=RjUWwoa7ZgwNRlywqtnjKTpE635J81WVGkcESH1XN1M=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hjdjjjbjz4hmqUpIa4FYNHU51u7aTAbTgewxcmMT+Rm/toOqZhwu234CE6kVB4T70
	 sJox8i2C+91hleJNrGIfGRvjjNc6uT6YJuGea1x8UxdoCqNPV2SF1lk5usiDgnKOeN
	 8eK/p2lfCTaBzQew9ErXvH2bCPjSJbFEYjZhWU0P/ah816yBkhgTNiyfiV47FkIodm
	 HzgIbKWoT2RpwEB5ShXohGOFGfBJaooIDYEbS3u/bFtbH3ZzpKt1fJ2Cfy20jXh1mk
	 IJP/opDOlZUjL9jv+Ulqzmi2d9jvmmzaQmwaMUxcyCY/BD70ro8SUGuWcV7CtoAQjl
	 whFK5qAGkPvQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9609941821;
	Fri,  6 Feb 2026 19:32:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E167F173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 19:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3F6741821
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 19:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 04LwfjGwAalo for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 19:32:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.57.108;
 helo=mail.villagedupre.fr; envelope-from=pyk@foss.peewhy.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6C78C4151F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C78C4151F
Received: from mail.villagedupre.fr (villagedupre.fr [163.172.57.108])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C78C4151F
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 19:32:17 +0000 (UTC)
Received: from sejong (82-64-130-240.subs.proxad.net [82.64.130.240])
 by villagedupre.fr (OpenSMTPD) with ESMTPSA id 4450fe0d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 6 Feb 2026 19:32:14 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
Date: Fri,  6 Feb 2026 20:32:03 +0100
Message-ID: <20260206193203.1985834-1-pyk@foss.peewhy.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=foss.peewhy.fr
Subject: [Buildroot] [PATCH] package/nvme: bump package to version 2.16
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/linux-nvme/nvme-cli/releases/tag/v2.16

Signed-off-by: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
---
 package/nvme/nvme.hash | 2 +-
 package/nvme/nvme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nvme/nvme.hash b/package/nvme/nvme.hash
index c6fb9c9aa891..b9cb0f9ca558 100644
--- a/package/nvme/nvme.hash
+++ b/package/nvme/nvme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  93282c426f22dd1ea6d172dec8af043c4e9ff80189becfbbb5378fe1ca0a74ad  nvme-2.15.tar.gz
+sha256  989682ed7b250a2c7a8127e362ffc5d29f5c370127abe405be09c73216da2b97  nvme-2.16.tar.gz
 sha256  a45d0bb572ed792ed34627a72621834b3ba92aab6e2cc4e04301dee7a728d753  LICENSE
diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
index 9f2b086d2a07..afb7d2711204 100644
--- a/package/nvme/nvme.mk
+++ b/package/nvme/nvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVME_VERSION = 2.15
+NVME_VERSION = 2.16
 NVME_SITE = $(call github,linux-nvme,nvme-cli,v$(NVME_VERSION))
 NVME_LICENSE = GPL-2.0+
 NVME_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
