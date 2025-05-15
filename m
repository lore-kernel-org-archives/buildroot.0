Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B911DC3ABDD
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7682F41E16;
	Fri, 16 May 2025 11:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCJhe4RyvpH8; Fri, 16 May 2025 11:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91FC641E03
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91FC641E03;
	Fri, 16 May 2025 11:22:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4AC5185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25B6D40B08
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6_VZmfiO8rr for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C70140ADB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C70140ADB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A57B86A10; Fri, 16 May 2025 11:21:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 17:06:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1f565bda6e0a40b28abe0eb42e911ec3bd996cd4
X-Git-Newrev: 196043d0e8b485da4e725798bb2e113ef28e48cf
X-Patchwork-Hint: ignore
Message-Id: <20250516112155.6A57B86A10@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Config.in: introduce
 BR2_HOST_GCC_AT_LEAST_{12..15}
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

commit: https://git.buildroot.net/buildroot/commit/?id=196043d0e8b485da4e725798bb2e113ef28e48cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fedora 42 is planned to be released on 2025-04-22 [1].
It is also planned to include the upcoming gcc 15 release.
Gcc 15 is changing the default C language from -std=gnu17
to -std=gnu23 [2].

This change is expected to possibly introduce build failures [3].
In order to be prepared to fix those, this commit introduces the
BR2_HOST_GCC_AT_LEAST_{12..15} symbols.

[1] https://fedorapeople.org/groups/schedule/f-42/f-42-key-tasks.html
[2] https://gcc.gnu.org/gcc-15/changes.html#c
[3] https://savannah.gnu.org/support/?111150

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cca8d68461e6b49b4751dd4134fb8d574e5192db)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in | 20 ++++++++++++++++++++
 Makefile  |  2 +-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index a543091d4f..d730f2034b 100644
--- a/Config.in
+++ b/Config.in
@@ -74,6 +74,26 @@ config BR2_HOST_GCC_AT_LEAST_11
 	default y if BR2_HOST_GCC_VERSION = "11"
 	select BR2_HOST_GCC_AT_LEAST_10
 
+config BR2_HOST_GCC_AT_LEAST_12
+	bool
+	default y if BR2_HOST_GCC_VERSION = "12"
+	select BR2_HOST_GCC_AT_LEAST_11
+
+config BR2_HOST_GCC_AT_LEAST_13
+	bool
+	default y if BR2_HOST_GCC_VERSION = "13"
+	select BR2_HOST_GCC_AT_LEAST_12
+
+config BR2_HOST_GCC_AT_LEAST_14
+	bool
+	default y if BR2_HOST_GCC_VERSION = "14"
+	select BR2_HOST_GCC_AT_LEAST_13
+
+config BR2_HOST_GCC_AT_LEAST_15
+	bool
+	default y if BR2_HOST_GCC_VERSION = "15"
+	select BR2_HOST_GCC_AT_LEAST_14
+
 # When adding new entries above, be sure to update
 # the HOSTCC_MAX_VERSION variable in the Makefile.
 
diff --git a/Makefile b/Makefile
index 5ca31caa27..d59a333d2e 100644
--- a/Makefile
+++ b/Makefile
@@ -353,7 +353,7 @@ export HOSTARCH := $(shell LC_ALL=C $(HOSTCC_NOCCACHE) -v 2>&1 | \
 
 # When adding a new host gcc version in Config.in,
 # update the HOSTCC_MAX_VERSION variable:
-HOSTCC_MAX_VERSION := 11
+HOSTCC_MAX_VERSION := 15
 
 HOSTCC_VERSION := $(shell V=$$($(HOSTCC_NOCCACHE) --version | \
 	sed -n -r 's/^.* ([0-9]*)\.([0-9]*)\.([0-9]*)[ ]*.*/\1 \2/p'); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
