Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6C0C6FA82
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 14:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19D108146E;
	Tue, 13 Sep 2022 14:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19D108146E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eznluujr8nbc; Tue, 13 Sep 2022 14:53:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32D2D813F3;
	Tue, 13 Sep 2022 14:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32D2D813F3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8814F1BF2F3
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 645CF40AA5
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 645CF40AA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FAIVj3s3xHZ1 for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 14:53:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 940ED409DE
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 14:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 940ED409DE
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 841758382A; Tue, 13 Sep 2022 14:53:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 16:38:59 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 03c52fef81d68719e0ff73104b9d20cd4e78606b
X-Git-Newrev: 4d8512dc76282ec8ecc7bf299248d1ef2a432242
X-Patchwork-Hint: ignore
Message-Id: <20220913145313.841758382A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] support/scripts: fix
 TABs/spaces in check-host-rpath
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d8512dc76282ec8ecc7bf299248d1ef2a432242
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit c4e6d5c8be6a (core: implement per-package SDK and target)
introduced leading TABs in that otherwise-space-indented script.

Convert all to spaces, for homogeneity

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2a592f0b2a400825a95e19113ce996bbc5c431d7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
