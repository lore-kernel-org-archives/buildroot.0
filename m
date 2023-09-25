Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67825CE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 06:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FD1B401DD;
	Mon, 25 Sep 2023 06:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FD1B401DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DW_oQA41vvtn; Mon, 25 Sep 2023 06:43:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A10F41507;
	Mon, 25 Sep 2023 06:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A10F41507
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CB491BF308
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 06:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE30D60DF9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 06:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE30D60DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJSZ0ehFWika for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 06:43:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E00B560F45
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 06:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E00B560F45
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5F78876E8; Mon, 25 Sep 2023 06:43:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 08:41:43 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: cd75458a17aaafe623d9dc8da74569586a32e4e1
X-Git-Newrev: c890cf539bc4ad8ecadec153b18f9309ba633ebd
X-Patchwork-Hint: ignore
Message-Id: <20230925064303.C5F78876E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/xterm: security
 bump to version 384
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

commit: https://git.buildroot.net/buildroot/commit/?id=c890cf539bc4ad8ecadec153b18f9309ba633ebd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

- Fix CVE-2023-40359: xterm before 380 supports ReGIS reporting for
  character-set names even if they have unexpected characters (i.e.,
  neither alphanumeric nor underscore), aka a pointer/overflow issue.
  This can only occur for xterm installations that are configured at
  compile time to use a certain experimental feature.
- Update COPYING hash (update in year and version)

https://invisible-island.net/xterm/xterm.log.html#xterm_384

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 164d635f3782522c324c710b767ef21c598228c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xterm/xterm.hash | 4 ++--
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index 12cd2e639b..1a2ad8fea0 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  1e5bb7aad068fb31d6d3cbb77f80c7ad1526cd4c956a4ddcf2c5cf28af5334e1  xterm-376.tgz
+sha256  31ef870740ceae020c3c4b4a9601c7f47bfd46672c1aaf2d213a565d64cbc373  xterm-384.tgz
 # Locally calculated
-sha256  9521ef761474cd31ea406f56a751646a7b42a9287cdc6f2f8e52ed4c4d2a73e7  COPYING
+sha256  98d02d0b7f7b8aabb742b05e6960caaa9ae20e26d2f0d0dc57808362f2ac79bc  COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index d01b608d99..2fc2f734c8 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 376
+XTERM_VERSION = 384
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
