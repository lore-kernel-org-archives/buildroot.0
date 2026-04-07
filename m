Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A854BFF5138
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 20:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6973060E15;
	Tue,  7 Apr 2026 20:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSf8MzSg8hoi; Tue,  7 Apr 2026 20:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 787D460E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775592161;
	bh=pgMHMJvlPIw3cfPJk0/PCoc85A/VfcQ9I0McgybpeeQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DkBwxXWYGAyHngD4RgUU7HBTpbnxEkqenMQlr/r44wlPwpN1Fu9tpicpHMzC02dtR
	 vH2p87aVm9GQmhlcvkTir/53dfDAsfn/WBMdxPCrxjsl41h+kwMkrCLA6Q4dp89RdV
	 TSdPplzQgKH8yg2Fiub/tnh9yzYGXSKA6rWRMTN8m5nc3PG1NZ7aSILE3iuKWXWKpe
	 t8HjwaIrv40wdZBccRD+vzHFjZ3v4xLVnYcw9dQKJLJBzN0aYzjraNBOpIxa/hg4SR
	 fYPu4eKByCqyMV0H+aHhMlDbz4Q6dedhyaGb5Y6ku14H/g/AGrDV/OSBuiXPdjIPGB
	 QmvjSIRDGc03Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 787D460E12;
	Tue,  7 Apr 2026 20:02:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71F9D2C7
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63AC360E18
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vXY-dW_k1Mr for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 20:02:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEAD060DC4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEAD060DC4
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:02:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52E6F807ED; Tue,  7 Apr 2026 20:02:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Apr 2026 21:45:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed283567a84908562bd7b46e9875b9129512b0b5
X-Git-Newrev: 4642f903cd613bc52f9bb8ea94c4d0ab18464c92
X-Patchwork-Hint: ignore
Message-Id: <20260407200239.52E6F807ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in,
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4642f903cd613bc52f9bb8ea94c4d0ab18464c92
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The option is currently unused, which leads to a check-symbol warning.

Suggested-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
[Arnout: squash two patches]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
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
index f51155b0ed..092e84b32a 100644
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
