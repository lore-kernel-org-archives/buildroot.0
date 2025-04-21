Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397E7C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E07370910;
	Mon, 19 May 2025 10:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNe6Rn13Ljs3; Mon, 19 May 2025 10:54:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1744070908
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1744070908;
	Mon, 19 May 2025 10:54:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A3CFE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B99BA42438
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ss0WsxLSekfV for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 416A041264
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 416A041264
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D9A38348A; Mon, 19 May 2025 10:39:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 23:50:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e954dd0a212a00744c537e8cba2eb6604cf16e0a
X-Git-Newrev: cca8d68461e6b49b4751dd4134fb8d574e5192db
X-Patchwork-Hint: ignore
Message-Id: <20250519103955.3D9A38348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Config.in: introduce
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cca8d68461e6b49b4751dd4134fb8d574e5192db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
index 5bf5abfe3b..411e1de515 100644
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
