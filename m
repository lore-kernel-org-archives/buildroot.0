Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9716DC6FA82
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 14:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46A59830FB;
	Tue, 13 Sep 2022 14:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46A59830FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u8oB9N7XZule; Tue, 13 Sep 2022 14:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBF88830E2;
	Tue, 13 Sep 2022 14:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBF88830E2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BBCF1BF9B5
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 767D460EA7
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 767D460EA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s1DRe7vzGWlH for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 14:52:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09C7C600CB
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 14:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09C7C600CB
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EC03B8380C; Tue, 13 Sep 2022 14:52:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 16:39:15 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: e7f84216d4f0b4610520fd5755552e2f12a03586
X-Git-Newrev: fad6cb4d628da66ea8c7478c4184f53dbfcf8bbf
X-Patchwork-Hint: ignore
Message-Id: <20220913145250.EC03B8380C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] support/scripts: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=fad6cb4d628da66ea8c7478c4184f53dbfcf8bbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
