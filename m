Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BA6E7DF11
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B8AB60B64;
	Mon,  2 Feb 2026 17:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aT77Y4RsGEQ0; Mon,  2 Feb 2026 17:25:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D6C360BF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770053111;
	bh=jmnOHyfyedtSj7o/B1vglmtVBaSYVplolHTXfbdIRX4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ry4xHeqopaOMOiAe5Rqauq/Kq4rPKqcfLWtydLkRVFxg8rWsC2dzaacZgLi9/3ZjL
	 jdDsc01oYflXGMr1BzMLsNK8p2IknpinE+Ef/rEMm/bdyjqz0dg37NNp/5tMuOT+D3
	 zXBjcwe8VbwOMu+gs/kNmrjZ4qFTa0XrvE/6Z0IHyuoHsy4+oF5slNW+0xU/58h4/A
	 uBzgA6/o9NTNwzpeRiDxhWov30b6WjkrHBjTfOPvqPqRSA+UUk2yOJGKQ7YO4y2YFq
	 5S5zmy1uXuUMFn0eYBNqw6rucU6ThV8i+Lb7ZVjUL3EaTrJLAYkJH0kxDIq3U1Mjif
	 AuOaleDnBU9Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D6C360BF1;
	Mon,  2 Feb 2026 17:25:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95F84149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84E2081585
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2h8yF4FH_mS for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:25:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACB6581547
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACB6581547
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:25:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92213863F1; Mon,  2 Feb 2026 17:25:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 18:24:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c740aaba8a0f772770e2056503b49390923bb919
X-Git-Newrev: 86eb131c763a38eea9b2407ad99219847a1088ba
X-Patchwork-Hint: ignore
Message-Id: <20260202172508.92213863F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avocado: bump version to 113.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=86eb131c763a38eea9b2407ad99219847a1088ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our avocado version is old and requires fixes introduced in 112.0 to
support python 3.14 [1].

[1] https://github.com/avocado-framework/avocado/commit/c1de44fabc047f149d6a9f742adecd8ed5cf939d

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797019

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avocado/avocado.hash | 2 +-
 package/avocado/avocado.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/avocado/avocado.hash b/package/avocado/avocado.hash
index 117d708611..1801ad290b 100644
--- a/package/avocado/avocado.hash
+++ b/package/avocado/avocado.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bec1bfab821030f04306a93d2b2061a4a28db538873702f746d5bc050d92685b  avocado-98.0.tar.gz
+sha256  a916c90b43e67d4593feef121f820d3fd8c93c2aca2dbd2d8865f83a622d3487  avocado-113.0.tar.gz
 sha256  680ce56e9c4043826f0f1420935d2453ea3ddacd1582cb6f1cef26c1077fcc93  LICENSE
diff --git a/package/avocado/avocado.mk b/package/avocado/avocado.mk
index b308a37b37..1fda9d14aa 100644
--- a/package/avocado/avocado.mk
+++ b/package/avocado/avocado.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AVOCADO_VERSION = 98.0
+AVOCADO_VERSION = 113.0
 AVOCADO_SITE = $(call github,avocado-framework,avocado,$(AVOCADO_VERSION))
 AVOCADO_SETUP_TYPE = setuptools
 AVOCADO_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
