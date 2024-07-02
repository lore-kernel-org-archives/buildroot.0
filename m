Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1AEC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6926F810C4;
	Tue,  2 Jul 2024 07:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KACRSETkzORV; Tue,  2 Jul 2024 07:59:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F081D810C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F081D810C9;
	Tue,  2 Jul 2024 07:59:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 306241BF97C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CC36409B4
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fB9gSh6UiiVs for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10FC040490
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10FC040490
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:59:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A27183AC8; Tue,  2 Jul 2024 07:59:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 09:54:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93a52a7410292148eda9e1dc6e700f3b0032fb76
X-Git-Newrev: b2c2c485310c9f5d392cb247eddf4dce35c87e09
X-Patchwork-Hint: ignore
Message-Id: <20240702075920.0A27183AC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-kobs: update the
 patches to be applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2c2c485310c9f5d392cb247eddf4dce35c87e09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, imx-kobs fails to build with output:

    Applying 0001-Fix-musl-build.patch using patch:
    patching file src/mtd.c
    Hunk #1 FAILED at 31.
    1 out of 1 hunk FAILED -- saving rejects to file src/mtd.c.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch b/package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch
index ce123de9cc..373b34ffce 100644
--- a/package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch
+++ b/package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch
@@ -1,6 +1,8 @@
 [PATCH] Fix musl build
 
 Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/mtd.c | 1 +
  src/mtd.h | 5 +++++
@@ -17,6 +19,7 @@ index 1edc441..6d2264c 100644
 +#include <stddef.h>
  #include <sys/types.h>
  #include <sys/ioctl.h>
+ #include <sys/utsname.h>
  
 diff --git a/src/mtd.h b/src/mtd.h
 index bd21add..debfc84 100644
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
