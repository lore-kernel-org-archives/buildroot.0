Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6923CC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F57E60A3E;
	Mon,  8 Jul 2024 20:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-TTAR7eSzMf; Mon,  8 Jul 2024 20:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B46E60ACD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B46E60ACD;
	Mon,  8 Jul 2024 20:21:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AD2C1BF275
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E16860826
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92eUvM6hLp17 for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B6B9608E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B6B9608E9
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8685583FF6; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:14:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1f2e09e042b2db32750bec9537a516d6e40bd76
X-Git-Newrev: 39d124dd7f169e2e7d4dad9bdd1dfd0eff4f3d24
X-Patchwork-Hint: ignore
Message-Id: <20240708202013.8685583FF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sane-backends: update the patches
 to be applied with fuzz 0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=39d124dd7f169e2e7d4dad9bdd1dfd0eff4f3d24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, sane-backends fails to build with output:

    Applying 0001-sane_backend-add-missing-config.h.patch using patch:
    patching file include/sane/sanei_backend.h
    Hunk #1 FAILED at 8.
    1 out of 1 hunk FAILED -- saving rejects to file include/sane/sanei_backend.h.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sane-backends/0001-sane_backend-add-missing-config.h.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sane-backends/0001-sane_backend-add-missing-config.h.patch b/package/sane-backends/0001-sane_backend-add-missing-config.h.patch
index 8e56b0284b..f379693338 100644
--- a/package/sane-backends/0001-sane_backend-add-missing-config.h.patch
+++ b/package/sane-backends/0001-sane_backend-add-missing-config.h.patch
@@ -28,6 +28,8 @@ Fixes:
 http://autobuild.buildroot.net/results/9f1/9f1f1cb727b5c5407e69172280a3dee880e55cdf
 
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  include/sane/sanei_backend.h | 1 +
  1 file changed, 1 insertion(+)
@@ -42,8 +44,8 @@ index 1b5afe2..2a96532 100644
  
 +#include "../include/sane/config.h"
  
- /*
-  * Compiler related options
+ /** @name Compatibility macros
+  * @{
 -- 
 2.5.5
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
