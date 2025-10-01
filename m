Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE31CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 19:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E2AF40D21;
	Wed,  1 Oct 2025 19:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDlkWweGRe3H; Wed,  1 Oct 2025 19:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F2F140E36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F2F140E36;
	Wed,  1 Oct 2025 19:56:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67CAD72
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59A2C61469
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-yojtIZlfFv for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 19:56:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 434076146A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 434076146A
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:56:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D34D866F4; Wed,  1 Oct 2025 19:56:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Oct 2025 21:30:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06ca694d72bf7a490785fba28c1717aa302cc38b
X-Git-Newrev: fd71e2ad7f0291f40e26ebc2858d3984c3b8c476
X-Patchwork-Hint: ignore
Message-Id: <20251001195615.3D34D866F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exfatprogs: bump version to 1.2.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd71e2ad7f0291f40e26ebc2858d3984c3b8c476
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch that is now upstream.

Release notes:
https://github.com/exfatprogs/exfatprogs/blob/1.2.6/NEWS
https://github.com/exfatprogs/exfatprogs/blob/1.2.7/NEWS
https://github.com/exfatprogs/exfatprogs/blob/1.2.8/NEWS
https://github.com/exfatprogs/exfatprogs/blob/1.2.9/NEWS

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...xfatprogs-fix-argument-validation-check-2.patch | 41 ----------------------
 package/exfatprogs/exfatprogs.hash                 |  4 +--
 package/exfatprogs/exfatprogs.mk                   |  2 +-
 3 files changed, 3 insertions(+), 44 deletions(-)

diff --git a/package/exfatprogs/0001-exfatprogs-fix-argument-validation-check-2.patch b/package/exfatprogs/0001-exfatprogs-fix-argument-validation-check-2.patch
deleted file mode 100644
index 28c9a71466..0000000000
--- a/package/exfatprogs/0001-exfatprogs-fix-argument-validation-check-2.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 5055bc4e852e18ddbfc618623cdaa2c0572d5f0e Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Sat, 2 Nov 2024 19:27:46 +0100
-Subject: [PATCH] exfatprogs: fix argument validation check (2)
-
-Since commit 7d354e5be83ed3bb981c59b3435ff64da56d185d
-("exfatprogs: fix argument validation check"), exfatlabel tool
-error out when we try to set a new volume serial or label.
-
-  exfatlabel /dev/sda1 "new label"
-  exfatlabel -i /dev/sda1 0x12345678
-
-Error out only if too few argument is given, ignore
-additional arguments.
-
-Fixes:
-https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992419
-
-Upstream: https://github.com/exfatprogs/exfatprogs/pull/279
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- label/label.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/label/label.c b/label/label.c
-index 12d027b..9c8aff3 100644
---- a/label/label.c
-+++ b/label/label.c
-@@ -78,7 +78,7 @@ int main(int argc, char *argv[])
- 	if (version_only)
- 		exit(EXIT_FAILURE);
- 
--	if (argc - optind != 1)
-+	if (argc - optind < 1)
- 		usage();
- 
- 	ui.dev_name = argv[serial_mode + 1];
--- 
-2.45.0
-
diff --git a/package/exfatprogs/exfatprogs.hash b/package/exfatprogs/exfatprogs.hash
index 5ccad03ca2..e73d9d884b 100644
--- a/package/exfatprogs/exfatprogs.hash
+++ b/package/exfatprogs/exfatprogs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/exfatprogs/exfatprogs/releases/download/1.2.5/exfatprogs-1.2.5.tar.xz.sha256
-sha256  f27160dcc1ddd17c96cd41a6ceef7037adc2796ab5c5633d3d85cf532c3ee2f0  exfatprogs-1.2.5.tar.xz
+# From https://github.com/exfatprogs/exfatprogs/releases/download/1.2.9/exfatprogs-1.2.9.tar.xz.sha256
+sha256  d9a42197c6ff9e6a8e923789413008e317415cf7a4ab85c486c5ffcaf49ca175  exfatprogs-1.2.9.tar.xz
 
 # Hash for license file
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
index a541a63116..638cb9caa4 100644
--- a/package/exfatprogs/exfatprogs.mk
+++ b/package/exfatprogs/exfatprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFATPROGS_VERSION = 1.2.5
+EXFATPROGS_VERSION = 1.2.9
 EXFATPROGS_SOURCE = exfatprogs-$(EXFATPROGS_VERSION).tar.xz
 EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
 EXFATPROGS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
