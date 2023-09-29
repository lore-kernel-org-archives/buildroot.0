Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AC4E77343
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 22:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD22F42214;
	Fri, 29 Sep 2023 22:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD22F42214
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GFjDWIU3OaZi; Fri, 29 Sep 2023 22:29:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DABE242272;
	Fri, 29 Sep 2023 22:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DABE242272
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 42CC91BF4D8
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 22:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D159403E5
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 22:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D159403E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XHaMUVZ0r8we for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 22:29:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56B1B40150
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 22:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56B1B40150
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 434C9837B8; Fri, 29 Sep 2023 22:29:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 00:27:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f0af11cee31e95a1aace471803dc02b7cc66c8f
X-Git-Newrev: 540e512f9f88c028e48a6c0936c7bf2c12c1c1f8
X-Patchwork-Hint: ignore
Message-Id: <20230929222920.434C9837B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] checkpagage: drop ignore pattern fr
 removed pppd patches
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

commit: https://git.buildroot.net/buildroot/commit/?id=540e512f9f88c028e48a6c0936c7bf2c12c1c1f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 0c15169f5ae5 (package/pppd: bump version to 2.5.0) forgot to drop
the check-package exclusion when it dropped the patches.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 5d0fc1fa69..7ff14366a9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1108,8 +1108,6 @@ package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.
 package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch Upstream
 package/postgresql/S50postgresql Variables
 package/powertop/0001-dont-force-stack-smashing-protection.patch Upstream
-package/pppd/0001-pppd-Fix-compilation-with-older-glibc-or-kernel-headers.patch Upstream
-package/pppd/0002-pppd-eap-tls.c-fix-build-with-libressl.patch Upstream
 package/pptp-linux/0001-susv3-legacy.patch Upstream
 package/pptp-linux/0002-fix-parallel-build.patch Upstream
 package/prboom/0001-libpng-1.4.patch Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
