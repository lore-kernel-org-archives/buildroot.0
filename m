Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB7CC3DA45
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 08:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB5898108D;
	Mon,  8 Jul 2024 08:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30JqfF-b1PZJ; Mon,  8 Jul 2024 08:49:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F34D680E37
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F34D680E37;
	Mon,  8 Jul 2024 08:49:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4C221BF2CD
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 08:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0878403AF
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 08:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9VAuzuhjyInT for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 08:49:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C0A4401F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C0A4401F3
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 08:49:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 739BF83D5A; Mon,  8 Jul 2024 08:49:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 08:40:13 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 9068c31eff297494078a27146d7a3864d629f14f
X-Git-Newrev: ebc3216762bfa76bfcaebce01d48f2252c2f42b8
X-Patchwork-Hint: ignore
Message-Id: <20240708084933.739BF83D5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 support/scripts/apply-patches: use appropriate TAR
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebc3216762bfa76bfcaebce01d48f2252c2f42b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Note that here, it is in fact not really relevant. We only extract a
tarball, and we don't use any "modern" or GNU-only options like
--strip-components. However, for consistency it's better to use the same
tar everywhere.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: "Maier, Brandon L Collins" <Brandon.Maier@collins.com>
Reviewed-by: brandon.maier@collins.com
[Arnout: quote TAR="..."]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit f77d698f83b230f7efcb7d28af3aacfa9589cc89)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in              | 2 +-
 support/scripts/apply-patches.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 3e276d23d6..d610a28925 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -244,7 +244,7 @@ endif
 INSTALL := $(shell which install || type -p install)
 UNZIP := $(shell which unzip || type -p unzip) -q
 
-APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
+APPLY_PATCHES = TAR="$(TAR)" PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
 
 HOST_CPPFLAGS  = -I$(HOST_DIR)/include
 HOST_CFLAGS   ?= -O2
diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 6da83f6826..4e633b23be 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -146,7 +146,7 @@ function scan_patchdir {
                 unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
                 rm -rf "$unpackedarchivedir" 2> /dev/null
                 mkdir "$unpackedarchivedir"
-                tar -C "$unpackedarchivedir" -xaf "${path}/$i"
+                ${TAR} -C "$unpackedarchivedir" -xaf "${path}/$i"
                 scan_patchdir "$unpackedarchivedir"
             else
                 apply_patch "$path" "$i"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
