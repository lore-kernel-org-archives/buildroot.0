Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF47C5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37FD981759;
	Fri, 21 Aug 2026 15:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xSx6N4MxGnP; Fri, 21 Aug 2026 15:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325147;
	bh=P/9itd6lePKnO/16NfjDCWzEvf74lDJm3IxZ2ru6yHM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HRtUh3/huTZWCXpgXkN/EOifDY9IrY++CfAPBx+6nWpwvjluivUf+0aRI4Ov1S50t
	 k8iWWJ7WhDY18jGiPifh3gMkDBWq51bap6e5JjcUbcfNUZYe3gaHhq3nKEWuGT1pcI
	 DmYaLRfG5nI8Q9722ldTVLqpN5J+RXTtxCrdx/yfK2AGq9EWcKJaUKXV/XsQ8DplAj
	 AtE2eda9J4CzPsVhCVQxBYe3vDoimsT7DgRVOl1kL4rOBXCLr2d77Fs9enxN7dlXIi
	 FZ0UPQBHVHa8cnfEOSzgPk6ZXeAuWdgRPhDKleo3wx1p8pvOj/HyCQjT5AZ7cCO4tD
	 d/keHd+i4NpMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 386C281ED9;
	Fri, 21 Aug 2026 15:12:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DA2629B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70FB040A1E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 038PZm6RcxXG for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C969940A15
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CAB18D669; Fri, 21 Aug 2026 15:10:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 15:05:02 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 00baa69565dcf756b4ab1060517822aa51bf016b
X-Git-Newrev: 6700a74d5e899f0f6ab88bcc85c4be2a71634092
X-Patchwork-Hint: ignore
Message-Id: <20260821151018.3CAB18D669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/quickjs: bump to
 2026-06-04
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6700a74d5e899f0f6ab88bcc85c4be2a71634092
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

See here for a Changelog:
https://bellard.org/quickjs/Changelog

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1f48599867d9fe45433c14d9f23eb3bd8fe07a7f)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/quickjs/quickjs.hash | 2 +-
 package/quickjs/quickjs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quickjs/quickjs.hash b/package/quickjs/quickjs.hash
index 70dfb2d19c..4509e54e99 100644
--- a/package/quickjs/quickjs.hash
+++ b/package/quickjs/quickjs.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6f1f322aea3bb3a90858db85c9fe717013fde4df7dfcafe2f57e78f5bb4b4a0c  quickjs-2025-09-13.tar.xz
+sha256  b376e839b322978313d929fd20663b11ba58b75df5a46c126dd19ea2fa70ad2a  quickjs-2026-06-04.tar.xz
 sha256  598fd7fc928e4350abce36e337ba5a1346923c5c692f5be92c3d8e29ddd7c18d  LICENSE
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index 511f142456..72535ff4ef 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUICKJS_VERSION = 2025-09-13
+QUICKJS_VERSION = 2026-06-04
 QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
 QUICKJS_SITE = https://bellard.org/quickjs
 QUICKJS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
