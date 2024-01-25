Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B105CC47258
	for <buildroot@archiver.kernel.org>; Thu, 25 Jan 2024 21:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F4A64ECCE;
	Thu, 25 Jan 2024 21:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F4A64ECCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FsSbB8ivPL6C; Thu, 25 Jan 2024 21:43:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EC714ECAB;
	Thu, 25 Jan 2024 21:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EC714ECAB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10B711BF5DA
 for <buildroot@lists.busybox.net>; Thu, 25 Jan 2024 21:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92A0343986
 for <buildroot@lists.busybox.net>; Thu, 25 Jan 2024 21:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92A0343986
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zKDtpMBSNuE9 for <buildroot@lists.busybox.net>;
 Thu, 25 Jan 2024 21:22:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89E9D43640
 for <buildroot@buildroot.org>; Thu, 25 Jan 2024 21:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89E9D43640
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74801864CF; Thu, 25 Jan 2024 21:22:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 25 Jan 2024 22:19:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09243186df3168022f0b23b8a9677c6313033769
X-Git-Newrev: 6a49c394925da19aa933a8f60a6b5ad750710b41
X-Patchwork-Hint: ignore
Message-Id: <20240125212237.74801864CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xterm: bump to version 389
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a49c394925da19aa933a8f60a6b5ad750710b41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of COPYING (update in year)
- This bump will fix the following musl build failure raised since bump
  to version 384 in commit 164d635f3782522c324c710b767ef21c598228c4:

./main.c:802:34: error: 'TAB3' undeclared here (not in a function); did you mean 'TAB0'?
  802 |     { -1,       XTTYMODE__tabs,  TAB3 },
      |                                  ^~~~
      |                                  TAB0

https://invisible-island.net/xterm/xterm.log.html#xterm_389

Fixes:
 - http://autobuild.buildroot.org/results/51f98577b851bdbb0a0ab93c9ef94977776c1b1b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xterm/xterm.hash | 4 ++--
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index 1a2ad8fea0..e0fdcfe66e 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  31ef870740ceae020c3c4b4a9601c7f47bfd46672c1aaf2d213a565d64cbc373  xterm-384.tgz
+sha256  1cd5763d94d9370fed10d804e831a089b2ace0e7a74b6f56ef5a16a766bde7be  xterm-389.tgz
 # Locally calculated
-sha256  98d02d0b7f7b8aabb742b05e6960caaa9ae20e26d2f0d0dc57808362f2ac79bc  COPYING
+sha256  e38de4a0780954b5a7e69b5fa6c571daa8a1bfbacb4f2c5b2f07099e1a1d7c93  COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 2fc2f734c8..c2c97dd318 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 384
+XTERM_VERSION = 389
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
