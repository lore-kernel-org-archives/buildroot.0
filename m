Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D347CD98C5
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 18:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A850240EC8;
	Mon, 15 Jun 2026 18:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id excGcfEWtI00; Mon, 15 Jun 2026 18:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A46B340E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781547627;
	bh=pSXO1Swka8bbv0ggcE6PHPcw75754XsQgfeqyz/od58=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iWxi849cRXauxJP4JGq1dJbAr4LhAz9ekGSFkqhHu3l1LYhaPEWG8A8zBR28KlBQJ
	 rN0Q0b2jWe5xrThKKh7pGCOfqerk49ynv7ZJ+KrNETszko/k1Ho6azhlZLNw0MfwjV
	 8ZKHoAu7YIrw199vKb5Yw5VPyez2HXOb4KkZUl6Pj+w7X8CVMIN+J+B7wjgP59fzu1
	 83dWTbMSDN7/WftOXSHfqw6hmzV0ErnjwrqnKwW4Mbsh+fgJAUckYLfb0YDNeyX+2W
	 d7o0j+zF0+UJpZLs9ac7Q2BONcVeFK909KYDLU5UrO3oLEndTshxTyIiMDVFEhR4hG
	 3z00c+cH1NOxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A46B340E7B;
	Mon, 15 Jun 2026 18:20:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67FA02B8
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6584E41351
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwY685nrQrOM for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 18:20:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B33744040A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B33744040A
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:20:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E714C88353; Mon, 15 Jun 2026 18:20:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 19:59:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2f607a19bc0b466e4a511396ab326364ae883c5
X-Git-Newrev: ca5c7817621b208cd06a00c89f580525da22da28
X-Patchwork-Hint: ignore
Message-Id: <20260615182004.E714C88353@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang-jiffy: bump to version 2.0.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ca5c7817621b208cd06a00c89f580525da22da28
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release Notes:
https://github.com/davisp/jiffy/releases/tag/2.0.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/erlang-jiffy/erlang-jiffy.hash | 2 +-
 package/erlang-jiffy/erlang-jiffy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
index 615bd02104..73e4200b5f 100644
--- a/package/erlang-jiffy/erlang-jiffy.hash
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d4ef3fe9a231f4fa3d2f5b4be905c2d2a116b96d56433c66b5d7bd2dace5d52c  erlang-jiffy-2.0.0.tar.gz
+sha256  e5c1951f819f553a34f61f33124b4c8dba1d665d9bba422e15752fe4fb52337d  erlang-jiffy-2.0.1.tar.gz
 sha256  2d1a98e412143fbcdfdaed110614017b267b007252e1b4e121f9fc921edf9ec7  LICENSE
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index b07db71a09..ae1ae0004f 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JIFFY_VERSION = 2.0.0
+ERLANG_JIFFY_VERSION = 2.0.1
 ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
 ERLANG_JIFFY_LICENSE = Apache-2.0, \
 	MIT (core), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
