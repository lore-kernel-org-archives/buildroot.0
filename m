Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AC4C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:25:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5227614C8
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5227614C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7744E6074E;
	Mon,  4 Oct 2021 20:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SNjku2oCbf4y; Mon,  4 Oct 2021 20:25:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE73D60727;
	Mon,  4 Oct 2021 20:25:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32C6C1BF97D
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2192240594
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L23v8kc_Bt24 for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 20:25:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 179D840593
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 20:25:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8C3C41814B9; Mon,  4 Oct 2021 22:25:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1633379149; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=0pY/FTePTGhL7QPN65plPujDmLrG+vpIFHFFY8E88WM=;
 b=Qrvd4+TJtjYdeqAPq20BGC5EMnpN3+edOlWrKzlU8qPP4WaK4amEogS0MDDtJFfVNGtwTQ
 VysyXOdBGn0e0Pffc7O/w1V2GrbgCbbZLo8RbgxTl91D19aYnp804NefMd5ULVW8lritYA
 AjjuoggEtXhV2bb+E5zR0mfo/kArXLw=
To: buildroot@buildroot.org
Date: Mon,  4 Oct 2021 22:25:23 +0200
Message-Id: <20211004202528.50828-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH] package/grpc: bump version to 1.41.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/grpc/grpc.hash | 2 +-
 package/grpc/grpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index ed773c59d7..26d0d315d8 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  13e7c6460cd979726e5b3b129bb01c34532f115883ac696a75eb7f1d6a9765ed  grpc-1.40.0.tar.gz
+sha256  e5fb30aae1fa1cffa4ce00aa0bbfab908c0b899fcf0bbc30e268367d660d8656  grpc-1.41.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index c61f90be7e..1bb4bd2b98 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.40.0
+GRPC_VERSION = 1.41.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0
 GRPC_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
