Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2EEE73153
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66C3440A5A;
	Mon,  2 Feb 2026 10:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Czj56FbL28No; Mon,  2 Feb 2026 10:27:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8659040A0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770028070;
	bh=/rS+ZKQzI5Ut+NNCCZbL2dcp9UHTbxR+hKMbK6AWYZA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Eynu+da41QWcNfmPjI8AMFj1pJ10HrHCbASgg4wAZr6dbhMNFR3ZjlZfmym87Vvjg
	 Knb50bFB+iVkwvFshBYFkKr5nZIF/KQTPfq7f+LCC/icna2MeiLgf06Gt52bebMfvu
	 2CpuMuzbgR8X0YOWWaTUhqOpX0JRN6qI1zyJs9eyMvxwHoBBw72/JIDdq/hNCF1k83
	 NHhybkagFgqIgO5YJ+fpQxmXC+OnB9oosL1A+/xux4F3UnbwC2xwzpR/ijcCrMMz46
	 ichmkX9OF911D9ey1nyfL07bvap4H0LxgPNi380kMySzFwJOXxNNKrSG8hZWjA9VaQ
	 TeBjRkClwV0uQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8659040A0E;
	Mon,  2 Feb 2026 10:27:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80084149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6633760667
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EH21xucaU735 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97015605DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97015605DE
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:27:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DA4581249; Mon,  2 Feb 2026 10:27:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 11:25:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bac34296bfed5282df07496c845d74924beb5da6
X-Git-Newrev: 0403637c2ea98d661188aadc6d572c183b70841c
X-Patchwork-Hint: ignore
Message-Id: <20260202102747.7DA4581249@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fwts: bump to version 25.11.00
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0403637c2ea98d661188aadc6d572c183b70841c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See release announce:
https://lists.ubuntu.com/archives/fwts-devel/2025-November/014113.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fwts/fwts.hash | 2 +-
 package/fwts/fwts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 3f04288fb8..6725c9492d 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
 # Hash from: https://fwts.ubuntu.com/release/SHA256SUMS
-sha256  ecba21d367b1c7aea41b378ad8fd3d43706c0fa4033cc31b59f8152c9cc0d69e  fwts-V25.09.00.tar.gz
+sha256  77d71524feb310236ccdb8b39dd39c6ca73acce5944f3cd54fc05d85a23d6d44  fwts-V25.11.00.tar.gz
 
 # Hash for license file
 sha256  77a5f0ea48e53ee8d67aecc7759cf468bcd340c1caca711ed4307b477a93fb47  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index f8537fbcf5..cdbf1c0366 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = 25.09.00
+FWTS_VERSION = 25.11.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = https://fwts.ubuntu.com/release
 FWTS_LICENSE = GPL-2.0, LGPL-2.1, Custom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
