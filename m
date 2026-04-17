Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4D8F436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C331160E25;
	Fri, 17 Apr 2026 15:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CAf7Ssn9f7f; Fri, 17 Apr 2026 15:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BC7560E3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439371;
	bh=tPu7L2hgz93LpPTEi95Bs1hxjUYqrJJywcDKg0W7LgQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=snAa+AEjtGvLlCFB0q2dwiGgzpqV/QTYfcIWVdqWzEyMqErwAusiKZJLn5ue55e4b
	 z0evKBS3oNhO6ZE/4mZofPUd8f7v9GXGQbheDLDyDd7yB0FVwPGJ0p2Qay2/ISy+V4
	 N/KctfJL6AN+DVlmOnm7BqD5RYd6/UTrQRR9B5MkozYsiUNmgeOg/R7vD+S1ycCkYt
	 z9hIL17NM1LijMHtFochfUcUaxEXCJtlHnDD4jbY9l/jgL8ucfw5IkdYvCjdDuHu2B
	 wbyFGLxmkLxyNzQoQAEORVjuUnxh8Pbf2fWnot2IfdGLEcXTGWh0ZL8fapAjcvazUp
	 ERwLBa6LgLgkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BC7560E3A;
	Fri, 17 Apr 2026 15:22:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A5D6704
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DA3960E32
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GjfqRMY90hW4 for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A656D60E1F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A656D60E1F
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5641E81DD5; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:21:02 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 2512acc8621bd78b02c8c185857416c4adf6582f
X-Git-Newrev: bf5c58e0d36220cd3a15873453db63819a7b8e99
X-Patchwork-Hint: ignore
Message-Id: <20260417152246.5641E81DD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] Config.in,
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bf5c58e0d36220cd3a15873453db63819a7b8e99
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
index 8e2cb0ae14..176c0391bf 100644
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
