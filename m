Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6335C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78279608F4;
	Mon, 24 Jun 2024 20:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jn_gpElkGUEN; Mon, 24 Jun 2024 20:02:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AD20608FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AD20608FB;
	Mon, 24 Jun 2024 20:02:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27AE81BF95D
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13023408E8
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4EjmkW56V09K for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 121E4408E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 121E4408E4
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A63E82B80; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 21:29:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0be7dc36881457ffb44b418c49587ac34a3fab03
X-Git-Newrev: d2c26c125e6b78ecefe0d97bbc487fb47dcb729d
X-Patchwork-Hint: ignore
Message-Id: <20240624200226.0A63E82B80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/syslinux: update the patches to be
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2c26c125e6b78ecefe0d97bbc487fb47dcb729d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit allows the syslinux patches to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 boot/syslinux/0015-efi-main.c-include-efisetjmp.h.patch | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/boot/syslinux/0015-efi-main.c-include-efisetjmp.h.patch b/boot/syslinux/0015-efi-main.c-include-efisetjmp.h.patch
index 2fd61ecbc8..15adfc49f3 100644
--- a/boot/syslinux/0015-efi-main.c-include-efisetjmp.h.patch
+++ b/boot/syslinux/0015-efi-main.c-include-efisetjmp.h.patch
@@ -1,4 +1,4 @@
-From 7d68fa68cd9f2987bd85339f3391913a8b0e58c7 Mon Sep 17 00:00:00 2001
+From 26979f738518404b1d3dc9ecdcf4fa5811412c49 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Tue, 24 Mar 2020 10:21:27 +0100
 Subject: [PATCH] efi/main.c: include <efisetjmp.h>
@@ -38,13 +38,15 @@ This is due to gnu-efi commit 486ba3c3bdd147b7d98159b9e650be60bce0f027
 So we act as specified, and include <efisetjmp.h> from efi/main.c.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 Upstream: https://www.syslinux.org/archives/2020-March/026621.html
 ---
  efi/main.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/efi/main.c b/efi/main.c
-index 6a748412..e924cfb1 100644
+index 71d31a5c1f13..7dc7bca7aeba 100644
 --- a/efi/main.c
 +++ b/efi/main.c
 @@ -12,6 +12,7 @@
@@ -54,7 +56,7 @@ index 6a748412..e924cfb1 100644
 +#include <efisetjmp.h>
  #include "fio.h"
  #include "version.h"
- #include "efi_pxe.h"
+ 
 -- 
-2.25.1
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
