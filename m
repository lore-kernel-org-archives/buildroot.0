Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB740CD98E5
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 20:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD0FA41A3A;
	Mon, 15 Jun 2026 20:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SuABC4667pKR; Mon, 15 Jun 2026 20:36:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5663B41A2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781555790;
	bh=yTzL1HT3EN/ObenorE/G4EwNzuf316fzwAZcEuzjXNY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cKu+fkZ+6DWheBCnL0+asm8gUHd0akro9HUuUQDPgbXlGKiwxp46tTNVbrTahHqVe
	 cwoUx5YMBe3pchWI27xxm8xSopgd/uyZhLM1u3EgqzwAW0P2PkmOexgx6+oqCRSrzU
	 ZM4iI6i2G7yxegvuCaP23a16b/gzUTbXeg4NNyr/xZMdbBbcPRsz40/ivpznRzIwPr
	 CQ6JAoV7vcs96RgG/ByOTZEM/mVu1PSed/cZnZXdGt+UTZs7yZClircg4QMhF0RbtZ
	 1+ecdQh5swXSLA72Divyw0VdWAlQXyiqGuqc6SREhX9zLdOxLEOcjfOEEs353s2S7H
	 qTthyOqIjMTzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5663B41A2E;
	Mon, 15 Jun 2026 20:36:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34ECC2F3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A5E584546
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3SI48u9LzE3T for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 20:36:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 346CB84545
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 346CB84545
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:36:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58A8E7FE1C; Mon, 15 Jun 2026 20:36:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 22:11:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8d850342d738798885602c6ca7b463240237753
X-Git-Newrev: 5e154896a5ca4036f167fd6f415f9383e3271948
X-Patchwork-Hint: ignore
Message-Id: <20260615203606.58A8E7FE1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
 26.2.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5e154896a5ca4036f167fd6f415f9383e3271948
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/media-driver/releases/tag/intel-media-26.2.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index a5d012dc2e..d4ec60476e 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  65bc05de32869ed73bcc6e7275d425987adfff792152565440f45d6b54fe1b9d  intel-media-26.2.1.tar.gz
+sha256  48e7b2f6614041a4710f4f4d191a3dc7dd8b86d43de4ae7aa99ec24c3820f2c0  intel-media-26.2.2.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 2cc7372342..778470ef8e 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.2.1
+INTEL_MEDIADRIVER_VERSION = 26.2.2
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
