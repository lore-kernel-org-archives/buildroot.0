Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97968C433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 07:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CD3141C63;
	Thu, 27 Jan 2022 07:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PfXfR5nRN3Te; Thu, 27 Jan 2022 07:14:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FE5A41C5D;
	Thu, 27 Jan 2022 07:14:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6845A1BF470
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6522784EE8
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WBIWc7dV2Of4 for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 07:12:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B240F84ECB
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 07:12:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5AD2A8285F; Thu, 27 Jan 2022 07:05:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 21:46:56 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6b40f28f808123748c87da7af323c26aa5dd9eee
X-Git-Newrev: 28d817c058aa7cbb24ccd3f67c17012fbd22f8ce
X-Patchwork-Hint: ignore
Message-Id: <20220127070548.5AD2A8285F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/mpd: fix comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=28d817c058aa7cbb24ccd3f67c17012fbd22f8ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
index 7731b203b9..e1da654450 100644
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
