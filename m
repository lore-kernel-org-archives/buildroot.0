Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF936C76188
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 07:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0BBE4177F;
	Wed,  5 Apr 2023 07:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0BBE4177F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id luUqjV0Lma6u; Wed,  5 Apr 2023 07:47:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 226314175E;
	Wed,  5 Apr 2023 07:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 226314175E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9907A1C2A09
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 07:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 727CC405DF
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 07:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 727CC405DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lUh2RygXA0j9 for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 07:47:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBE34400DD
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBE34400DD
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 07:47:18 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 398295C2606;
 Wed,  5 Apr 2023 09:47:16 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Date: Wed,  5 Apr 2023 09:47:03 +0200
Message-Id: <5b01e389dc18bb36fc9a6c4e1231ca88585126f5.1680680807.git.stefan@agner.ch>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <fbe678c521be19c519bb86f7b86528b43266f8b0.1680680807.git.stefan@agner.ch>
References: <fbe678c521be19c519bb86f7b86528b43266f8b0.1680680807.git.stefan@agner.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1680680836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SV/J+g7UwxDcpprAANAxWbGDl0NW8l8ayvMARUDr7zc=;
 b=PPzr6R/GZNnDGm1RTygQeIZgLxqMSGcIcidjB2FRCuvue/whWHJ00DT119YFXw1Srf76vO
 NqM47aVsEEpDJfZvA2kF8YKcLIcYJDS9uPJmHuskqGVu995288q98G83cs/2ZSRcRhEB7G
 mlRxjNphOMhhHVMRSqGo3IcEG5223n4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=PPzr6R/G
Subject: [Buildroot] [PATCH] package/docker-cli: bump version to v23.0.3
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
Cc: Stefan Agner <stefan@agner.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release contains some fixes and small improvements. For the
full list see:
https://github.com/moby/moby/releases/tag/v23.0.3

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index a8ee6c7a34..891ccf4b4e 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bef4fc68b9f81ab2ae8bb2605e16a0965a3c4a82f0c0cf9d9f5d2cee8e95415d  docker-cli-23.0.2.tar.gz
+sha256  7d67500372b560110e8200815f7111962ccec7d0eb3b743f80e262c38e2f7b82  docker-cli-23.0.3.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 5473edf1ef..69c4f76ee6 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 23.0.2
+DOCKER_CLI_VERSION = 23.0.3
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
