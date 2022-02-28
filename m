Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F25EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 18:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9701040142;
	Mon, 28 Feb 2022 18:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-GRh15akkFp; Mon, 28 Feb 2022 18:48:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2792740124;
	Mon, 28 Feb 2022 18:48:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3941F1BF2CE
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 18:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 340E540110
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 18:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g3_1kcQKBfT1 for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 18:48:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37BD0400CD
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 18:48:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 94BFF823A2; Mon, 28 Feb 2022 18:40:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 19:36:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db0f8006c1c8685dc98446b5b9e768e52d2f2591
X-Git-Newrev: 2de5cd85423083662eb0625978ef6da7577d76c6
X-Patchwork-Hint: ignore
Message-Id: <20220228184000.94BFF823A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xterm: security bump to version 371
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2de5cd85423083662eb0625978ef6da7577d76c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-24130: xterm through Patch 370, when Sixel support is
enabled, allows attackers to trigger a buffer overflow in set_sixel in
graphics_sixel.c via crafted text.

Update hash of COPYING (update in year)

https://invisible-island.net/xterm/xterm.log.html#xterm_371

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xterm/xterm.hash | 4 ++--
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index d6d80ad977..3f6ec765ce 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  27f1a8b1c756e269fd5684e60802b545f0be9b36b8b5d6bdbc840c6b000dc51f  xterm-367.tgz
+sha256  32f888277b19e28ebc0a3112bff000607c07bed0679caa0beebb36f9cad484f5  xterm-371.tgz
 # Locally calculated
-sha256  dfb668cc977e24649500f3cc54de3e2b793928d210715a445ab1227930b07ba6  COPYING
+sha256  9521ef761474cd31ea406f56a751646a7b42a9287cdc6f2f8e52ed4c4d2a73e7  COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index e09d350a7d..95984f1cf9 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 367
+XTERM_VERSION = 371
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
