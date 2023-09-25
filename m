Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B68CCE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 06:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D87594021C;
	Mon, 25 Sep 2023 06:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D87594021C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yxunn_2C9cav; Mon, 25 Sep 2023 06:43:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AA2D40A73;
	Mon, 25 Sep 2023 06:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AA2D40A73
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 92AB11BF308
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 06:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC83260F75
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 06:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC83260F75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9rKYhmAWbM7q for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 06:43:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFC5F60EDC
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 06:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFC5F60EDC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD976876E7; Mon, 25 Sep 2023 06:43:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 08:39:20 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: e1cbd0808b0a541bc48424d9b45e7e71a3224aa4
X-Git-Newrev: cd75458a17aaafe623d9dc8da74569586a32e4e1
X-Patchwork-Hint: ignore
Message-Id: <20230925064303.BD976876E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/e2fsprogs: drop
 CVE-2022-1304
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd75458a17aaafe623d9dc8da74569586a32e4e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

CVE-2022-1304 only affects e2fsprogs 1.46.5.
The mentioned patch was removed in 6a21733f when bumping to 1.47.0.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit dc0c7552735d299107385458c1889c7dc4633864)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/e2fsprogs/e2fsprogs.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 80090621bf..7491f4c067 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -12,9 +12,6 @@ E2FSPROGS_LICENSE_FILES = NOTICE lib/ss/mit-sipb-copyright.h lib/et/internal.h
 E2FSPROGS_CPE_ID_VENDOR = e2fsprogs_project
 E2FSPROGS_INSTALL_STAGING = YES
 
-# 0001-libext2fs-add-sanity-check-to-extent-manipulation.patch
-E2FSPROGS_IGNORE_CVES += CVE-2022-1304
-
 # Use libblkid and libuuid from util-linux for host and target packages.
 # This prevents overriding them with e2fsprogs' ones, which may cause
 # problems for other packages.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
