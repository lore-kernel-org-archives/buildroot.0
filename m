Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9784DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F75983E53;
	Wed, 26 Jan 2022 20:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tBDiUz12VkQq; Wed, 26 Jan 2022 20:49:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1D8983E82;
	Wed, 26 Jan 2022 20:49:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6977D1BF4D7
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57C7383E53
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:49:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GCgfZHHa-qjy for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:49:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3FC183E50
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4ECE68282D; Wed, 26 Jan 2022 20:42:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 21:46:49 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 7263cf4946682c4674dd63881fd166f81e3f0921
X-Git-Newrev: ae3a6754176de54a4c068e8dcbf3b97d22e10c23
X-Patchwork-Hint: ignore
Message-Id: <20220126204254.4ECE68282D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/mpd: fix comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae3a6754176de54a4c068e8dcbf3b97d22e10c23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Commit 1bf512e9fff9fef1eb5f58c3279ca007cbabd0ab wrongly added that
BR2_USE_WCHAR is due to flac dependency but flac is optional so remove
this comment and add boost instead

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 20584d1ef270d5c1851c1cd537833ec5882edcba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index eb05f25a0b..0d58bd6756 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -1,7 +1,7 @@
 menuconfig BR2_PACKAGE_MPD
 	bool "mpd"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # flac
+	depends on BR2_USE_WCHAR # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
