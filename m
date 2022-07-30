Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E172C04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 16:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 834D6831E3;
	Sat, 30 Jul 2022 16:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 834D6831E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rR7qVsUbHQiF; Sat, 30 Jul 2022 16:17:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6145824C1;
	Sat, 30 Jul 2022 16:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6145824C1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E2FA1BF33A
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 16:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAE28402FD
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 16:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAE28402FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cwdFy1xA1YdX for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 16:17:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6031400C1
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 16:17:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6031400C1
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 953F186A21; Sat, 30 Jul 2022 16:03:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Jul 2022 18:15:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4b13b21024a894a2fc682090f3e01d53bd699e9
X-Git-Newrev: 2a592f0b2a400825a95e19113ce996bbc5c431d7
X-Patchwork-Hint: ignore
Message-Id: <20220730160309.953F186A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts: fix TABs/spaces in
 check-host-rpath
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a592f0b2a400825a95e19113ce996bbc5c431d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c4e6d5c8be6a (core: implement per-package SDK and target)
introduced leading TABs in that otherwise-space-indented script.

Convert all to spaces, for homogeneity

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/check-host-rpath | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index f36677cc96..41aa0aa1ed 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -93,11 +93,11 @@ check_elf_has_rpath() {
             dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
             [ "${dir}" = "${hostdir}/lib" ] && return 0
             [ "${dir}" = "\$ORIGIN/../lib" ] && return 0
-	    # This check is done even for builds where
-	    # BR2_PER_PACKAGE_DIRECTORIES is disabled. In this case,
-	    # PER_PACKAGE_DIR and therefore ${perpackagedir} points to
-	    # a non-existent directory, and this check will always be
-	    # false.
+            # This check is done even for builds where
+            # BR2_PER_PACKAGE_DIRECTORIES is disabled. In this case,
+            # PER_PACKAGE_DIR and therefore ${perpackagedir} points to
+            # a non-existent directory, and this check will always be
+            # false.
             [[ ${dir} =~ "${perpackagedir}/"[^/]+/host/lib ]] && return 0
         done
     done < <( readelf -d "${file}" 2>/dev/null                                  \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
