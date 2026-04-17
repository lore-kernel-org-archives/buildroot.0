Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F183AF436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2F42816FE;
	Fri, 17 Apr 2026 15:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MwLHMNF4Fr_Z; Fri, 17 Apr 2026 15:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 369C2816F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439221;
	bh=Nya2vUvex6fZ1LSvsWVlcZamA7QtUZrP/wSTgfD/jEA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TiHEWfR3AEVns128oRybbWyL7B63KrNPZr4r+TRQ2W8MV3eQnUVs0E2Cf667e29+I
	 9qOw8aKlaFyC69YJQYFlSuobov+wCDwrsTF7gQ4bByZww7hF6PFgDHH8HrPJ+x9rXF
	 JA1BE/puFO5x7GFvhF2PObtIuRWa/KMj7ZMP5avEy6LfcXb5VwqnJ/7n5WEIlizmia
	 iDP5re18Bc8lCVXlWnf8fv4Bm4nUZ/Z0WxLQ7jUMFgvyzHRW1h8pvULgQYXpTC7gRs
	 9QGepSEM9TbcFNswn2XCcFwjKp07rIuio1b5nCBTAN5LK6p9co1CzlDOSpWmXF8jRz
	 3ThZljj5NfdTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 369C2816F1;
	Fri, 17 Apr 2026 15:20:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33542259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2D774057A
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02PkgKcb1bu3 for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B5734057D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B5734057D
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C645819B7; Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 16:03:12 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4e7de3c11cd7134d3bc042c62520d99f3d455c15
X-Git-Newrev: 0e8f97b0496450991c57d29d91ede57fcb0560c0
X-Patchwork-Hint: ignore
Message-Id: <20260417152008.3C645819B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Config.in,
 Makefile: add BR2_HIDE_SECONDARY_TARGET_OPTIONS
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0e8f97b0496450991c57d29d91ede57fcb0560c0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The option is currently unused, which leads to a check-symbol warning.

Suggested-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
[Arnout: squash two patches]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 4642f903cd613bc52f9bb8ea94c4d0ab18464c92)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in | 4 ++++
 Makefile  | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/Config.in b/Config.in
index d730f2034b..0bfe6d1ab5 100644
--- a/Config.in
+++ b/Config.in
@@ -15,6 +15,10 @@ config BR2_HAVE_DOT_CONFIG
 config BR2_BROKEN
 	bool
 
+config BR2_HIDE_SECONDARY_TARGET_OPTIONS
+	bool
+	option env="BR2_HIDE_SECONDARY_TARGET_OPTIONS"
+
 config BR2_VERSION
 	string
 	option env="BR2_VERSION_FULL"
diff --git a/Makefile b/Makefile
index b92d5ade10..e2cb6a687b 100644
--- a/Makefile
+++ b/Makefile
@@ -251,6 +251,13 @@ export LANG = C
 export LC_ALL = C
 endif
 
+# we set a default value here to avoid a Kconfig warning about unset
+# environment varilable. This option is passed as an environment
+# variable to be controlled by autobuilders. The purpose is to test
+# less frequently some uncommon configurations which tend to generate
+# more build failures.
+export BR2_HIDE_SECONDARY_TARGET_OPTIONS ?= n
+
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
 ifeq ("$(origin V)", "command line")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
