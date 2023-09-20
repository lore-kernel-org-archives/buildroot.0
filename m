Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454EEC04ABA
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 17:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 003806136F;
	Wed, 20 Sep 2023 17:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 003806136F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rrnNzBiHFI2u; Wed, 20 Sep 2023 17:38:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36D7061376;
	Wed, 20 Sep 2023 17:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36D7061376
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 982791BF95F
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ED8B83BBE
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ED8B83BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eEgQGtJVm-ys for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 17:38:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1E4B83BBA
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 17:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1E4B83BBA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF423873B4; Wed, 20 Sep 2023 17:38:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 20 Sep 2023 19:38:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc0c7552735d299107385458c1889c7dc4633864
X-Git-Newrev: 164d635f3782522c324c710b767ef21c598228c4
X-Patchwork-Hint: ignore
Message-Id: <20230920173840.AF423873B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xterm: security bump to version 384
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

commit: https://git.buildroot.net/buildroot/commit/?id=164d635f3782522c324c710b767ef21c598228c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2023-40359: xterm before 380 supports ReGIS reporting for
  character-set names even if they have unexpected characters (i.e.,
  neither alphanumeric nor underscore), aka a pointer/overflow issue.
  This can only occur for xterm installations that are configured at
  compile time to use a certain experimental feature.
- Update COPYING hash (update in year and version)

https://invisible-island.net/xterm/xterm.log.html#xterm_384

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
