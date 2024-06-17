Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFAEC27C79
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 15:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 277AC4095F;
	Mon, 17 Jun 2024 15:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reSR_5YOHJvU; Mon, 17 Jun 2024 15:11:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF9BB4096F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF9BB4096F;
	Mon, 17 Jun 2024 15:11:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D78D01BF296
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 15:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D04C7408C5
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 15:11:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TmcJC8VLwTnl for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 15:11:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=flaniel@linux.microsoft.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BFF694046B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFF694046B
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFF694046B
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 15:11:21 +0000 (UTC)
Received: from pwmachine.numericable.fr
 (75.red-83-59-17.dynamicip.rima-tde.net [83.59.17.75])
 by linux.microsoft.com (Postfix) with ESMTPSA id 7789220B7004;
 Mon, 17 Jun 2024 08:11:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7789220B7004
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jun 2024 16:10:17 +0100
Message-Id: <20240617151020.31120-2-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617151020.31120-1-flaniel@linux.microsoft.com>
References: <20240617151020.31120-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1718637079;
 bh=WsQSsiXdQ1BUq/V+AHi0MheR8lWpk/ZIQ7RKeBqQBr8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZA6RwPXFURuShs6p1ukS38ldf06WZe/1fhKicujR6T0PzSIXH9oBwXJPipbtWkBlt
 Olv0NWTPYPlrWkvdZQHdfpOYZ7fbEGZXu8+Y2AO5qGHwROeAnj8BOi7Cod/Ag+w9vT
 00RkIDW8isjWiP1lJ+XDn6oKsyG33Vfcf8XPKHlc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=ZA6RwPXF
Subject: [Buildroot] [RFC PATCH v1 1/4] package/pahole: bump to version 1.27
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/NEWS?h=v1.27

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 package/pahole/pahole.hash | 2 +-
 package/pahole/pahole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pahole/pahole.hash b/package/pahole/pahole.hash
index 9dc676d9f4..a2d3d044da 100644
--- a/package/pahole/pahole.hash
+++ b/package/pahole/pahole.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  db31d13c3dad8d9f4e38296bd35c4586e98b9c950e07dabba212985e6d051631  pahole-1.25.tar.gz
+sha256  87223298d4f8f9ada9b3cc5cef1bedd7aeb447cd8295abc466e009a26accff13  pahole-1.27.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pahole/pahole.mk b/package/pahole/pahole.mk
index 1a3e156ebb..ffbe4ff925 100644
--- a/package/pahole/pahole.mk
+++ b/package/pahole/pahole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHOLE_VERSION = 1.25
+PAHOLE_VERSION = 1.27
 PAHOLE_SITE = https://git.kernel.org/pub/scm/devel/pahole/pahole.git/snapshot
 HOST_PAHOLE_DEPENDENCIES = \
 	host-elfutils \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
