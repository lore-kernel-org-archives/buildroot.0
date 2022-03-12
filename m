Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C46C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 19:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4377410E6;
	Sat, 12 Mar 2022 19:45:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4G_410fB61y; Sat, 12 Mar 2022 19:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16AAA410D0;
	Sat, 12 Mar 2022 19:45:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 104361BF3E8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 19:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D7818194A
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 19:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WWfpAgGeysie for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 19:44:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A29B381975
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 19:44:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AC31282D98; Sat, 12 Mar 2022 19:35:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 20:44:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5d5089789eb2a2c7881ac9b38ae547d901df997
X-Git-Newrev: 94d1a54d8b941a44e7be93fc0f82913deaed34a6
X-Patchwork-Hint: ignore
Message-Id: <20220312193555.AC31282D98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "heimdal: disable parallel make"
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

commit: https://git.buildroot.net/buildroot/commit/?id=94d1a54d8b941a44e7be93fc0f82913deaed34a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit f6980126f26c63421d04a32b6710d9e3a380476a.

Parallel make was disabled back in 2017:
https://git.buildroot.net/buildroot/commit/?id=f6980126f26c63421d04a32b6710d9e3a380476a

Build-test with -j99 was successful.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/heimdal/heimdal.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index ce509c7afa..a8d87531ec 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -8,7 +8,6 @@ HEIMDAL_VERSION = 7.7.0
 HEIMDAL_SITE = https://github.com/heimdal/heimdal/releases/download/heimdal-$(HEIMDAL_VERSION)
 HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf
 HEIMDAL_INSTALL_STAGING = YES
-HEIMDAL_MAKE = $(MAKE1)
 # static because of -fPIC issues with e2fsprogs on x86_64 host
 HOST_HEIMDAL_CONF_OPTS = \
 	--disable-shared \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
