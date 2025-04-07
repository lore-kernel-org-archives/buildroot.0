Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638F5C36018
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 19:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2698640CD0;
	Mon,  7 Apr 2025 19:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBgbfgZnwYgI; Mon,  7 Apr 2025 19:19:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04DA840C9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04DA840C9A;
	Mon,  7 Apr 2025 19:19:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E1EBDA
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 19:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A232810BA
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 19:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5wJnFgJiP0ch for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 19:19:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.146;
 helo=smtpcmd13146.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A82C81D4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A82C81D4F
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A82C81D4F
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 19:19:11 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 1rzwuTK0X6z5Z1rzxuceNX; Mon, 07 Apr 2025 21:19:09 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Petr Vorel <petr.vorel@gmail.com>
Date: Mon,  7 Apr 2025 21:19:08 +0200
Message-Id: <20250407191908.260835-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407191908.260835-1-giulio.benetti@benettiengineering.com>
References: <20250407191908.260835-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJ8VZucdr8sTLUA8gZnT3WhC9d5GjE4+JJux5LZEz4MLoFvksZoDUZBpbUWM4p/U99Ka+KPcUm1QpWWJRAU+qdDS9PApM6IpnZ9ZQPdAt2KsDpKuRmi2
 cB0HRuh8t06j0iLFHSbIGYTuBRmhSZrUoepa7TOnqMYJslHeLFXyvBhT8uqcEGkik1FV1xRQSmhHlZ/mkWzrzG3Jsk7ctcvX/Ynbe8BWW8UphAPJDZNbufUT
 ZENPanR6mvMZsSzkbdZLAYBJ9i5dq830hV/4KQMdSz6NraGSd62iEv92hcYy+qCfFnJ1hIDaF6d3kwgd77CvykI5pVN2Q6hF1uRlAUaC2g2gY6YMw8pKeF2m
 OJR7ixMn
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1744053549; bh=PKvOLrsjCzFwFCrRC6P0h9OSI1mG78l0rPkCIyjDG+M=;
 h=From:To:Subject:Date:MIME-Version;
 b=fFj7cQdIMt2KDKkc9hrAvU4ikHA+XHIPTS2yq2XZZsfpT6axDGcwi0IinGz6vtNWe
 4YTXiOwWtu67xIMTDU6abihzxfqECf0eYhaDHMtE6B5GPlEwJCdV1B2uuiq5+tGFZV
 BhJv8Wb730j+RlF1iCfuCPw0mIU019U7zchH1ccO2gJ0YukZn6dr40jTua5cqqK9IP
 J4fug5WUOvCceBwaayk00EcN/0D4f5kMB8ZSs2VWRXqS61GX4XCcdZELQKwKVH9PFL
 JwA7VVO2W6SxArVnjEhSyu3emhca+hrlWASKkL/2r3803yp2U/SRj40w15wVz8Jr+M
 /9/D0FQS0Qm9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=fFj7cQdI
Subject: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.8.3
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/nfs-utils/nfs-utils.hash | 4 ++--
 package/nfs-utils/nfs-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index ff3f03799d..af5fc8bd73 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.2/sha256sums.asc
-sha256  a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa8606196d358e7fb15  nfs-utils-2.8.2.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.3/sha256sums.asc
+sha256  11e7c5847a8423a72931c865bd9296e7fd56ff270a795a849183900961711725  nfs-utils-2.8.3.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 60e9c26695..0af0254d3f 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.8.2
+NFS_UTILS_VERSION = 2.8.3
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
