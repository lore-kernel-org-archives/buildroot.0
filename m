Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED9FC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FE3560A90;
	Mon, 24 Jun 2024 20:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dC8t9So2Xm6f; Mon, 24 Jun 2024 20:03:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E257960EF2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E257960EF2;
	Mon, 24 Jun 2024 20:03:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 186FC1BF95D
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CCB440025
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjD_ItYott5o for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7136A40146
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7136A40146
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DC0782B60; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 21:39:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b6144a9adba4f46d6a64ac7d698bfb64359eb74
X-Git-Newrev: dc3f703913fb726a782079f7570b573272492dbf
X-Patchwork-Hint: ignore
Message-Id: <20240624200226.6DC0782B60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openocd: update the patch to be
 applied with fuzz 0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dc3f703913fb726a782079f7570b573272492dbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit allows the package patch to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/openocd/0001-configure-enable-build-on-uclinux.patch | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/openocd/0001-configure-enable-build-on-uclinux.patch b/package/openocd/0001-configure-enable-build-on-uclinux.patch
index 2f2d320840..d5f1e32958 100644
--- a/package/openocd/0001-configure-enable-build-on-uclinux.patch
+++ b/package/openocd/0001-configure-enable-build-on-uclinux.patch
@@ -1,19 +1,21 @@
-From 11ea78c4d253bb90296e2dd8c3f7fbf59ba397b6 Mon Sep 17 00:00:00 2001
+From 86dd032d77166b7ed59d08c99fbe47b8b7667406 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Thu, 17 Aug 2017 06:30:31 +0200
 Subject: [PATCH] configure: enable build on uclinux
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c680bda7..1a7980a0 100644
+index eee42d4240f8..b0445f92e0b5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -327,7 +327,7 @@ AC_ARG_ENABLE([sysfsgpio],
-   [build_sysfsgpio=$enableval], [build_sysfsgpio=no])
+@@ -342,7 +342,7 @@ AC_ARG_ENABLE([xlnx_pcie_xvc],
+   [build_xlnx_pcie_xvc=$enableval], [build_xlnx_pcie_xvc=no])
  
  AS_CASE([$host_os],
 -  [linux*], [],
@@ -22,5 +24,5 @@ index c680bda7..1a7980a0 100644
      AS_IF([test "x$build_sysfsgpio" = "xyes"], [
        AC_MSG_ERROR([sysfsgpio is only available on linux])
 -- 
-2.11.0
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
