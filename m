Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE41C7EE2A
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 17:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DA8684270;
	Wed, 25 Jun 2025 17:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id enymYFwTlR5O; Wed, 25 Jun 2025 17:26:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DA9484231
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DA9484231;
	Wed, 25 Jun 2025 17:26:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D66A7154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3F6B41923
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3jgOrL6srdn for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 17:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D7A840401
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D7A840401
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:26:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26FD184452; Wed, 25 Jun 2025 17:26:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Jun 2025 19:24:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d834b1aad138d5b21dbf51c5d58250fcd5a768d0
X-Git-Newrev: da04cfa26ce7da042c40caa94252c566f47a070c
X-Patchwork-Hint: ignore
Message-Id: <20250625172649.26FD184452@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: sort unexport lines
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

commit: https://git.buildroot.net/buildroot/commit/?id=da04cfa26ce7da042c40caa94252c566f47a070c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The list of environment variables to unexport has grown organically over the
years and is no longer sorted. Sort it alphabetically for clarity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Makefile | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index 26db176674..a052628ac7 100644
--- a/Makefile
+++ b/Makefile
@@ -407,27 +407,27 @@ ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 # Hide troublesome environment variables from sub processes
 #
 ################################################################################
-unexport CROSS_COMPILE
+unexport AR
 unexport ARCH
 unexport CC
-unexport LD
-unexport AR
-unexport CXX
-unexport CPP
-unexport RANLIB
 unexport CFLAGS
+unexport CONFIG_SITE
+unexport CPP
+unexport CROSS_COMPILE
+unexport CXX
 unexport CXXFLAGS
+unexport DEVICE_TREE
+unexport GCC_COLORS
 unexport GREP_OPTIONS
-unexport TAR_OPTIONS
-unexport CONFIG_SITE
-unexport QMAKESPEC
-unexport TERMINFO
+unexport LD
 unexport MACHINE
 unexport O
-unexport GCC_COLORS
-unexport PLATFORM
 unexport OS
-unexport DEVICE_TREE
+unexport PLATFORM
+unexport QMAKESPEC
+unexport RANLIB
+unexport TAR_OPTIONS
+unexport TERMINFO
 
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
