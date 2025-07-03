Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1CDC83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7C946163D;
	Fri,  4 Jul 2025 06:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pdP5gwJRitXS; Fri,  4 Jul 2025 06:24:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31AC16163A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31AC16163A;
	Fri,  4 Jul 2025 06:24:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B45F1EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33D1E41060
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0BdSUltf85rI for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74E514104D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74E514104D
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72DFC85E09; Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 10:53:44 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 4aad0cdeef33fd8b9a2d50bba3a1f75aac153077
X-Git-Newrev: c7221c53dfd1f0b65f7c975470ff2669c15187c8
X-Patchwork-Hint: ignore
Message-Id: <20250704062432.72DFC85E09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] Makefile: sort unexport
 lines
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7221c53dfd1f0b65f7c975470ff2669c15187c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The list of environment variables to unexport has grown organically over the
years and is no longer sorted. Sort it alphabetically for clarity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit da04cfa26ce7da042c40caa94252c566f47a070c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Makefile | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index a0ad100980..8cafcaf834 100644
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
