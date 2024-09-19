Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C52CF3963
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 20:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5644B43336;
	Thu, 19 Sep 2024 20:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eHR_sVn9jeg6; Thu, 19 Sep 2024 20:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF7AB4332B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF7AB4332B;
	Thu, 19 Sep 2024 20:01:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33B4F1BF215
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D31C6F4AD
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nB34a38qjAfD for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 19:59:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD7076F4EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD7076F4EF
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 19:59:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A906A82160; Thu, 19 Sep 2024 19:59:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 13:56:03 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 83d384ac0f4907c7c6cc8100a47553a918ce88bb
X-Git-Newrev: 7495b6bb4f9ae8dd1f94cc6ffc7eea1d97b5499c
X-Patchwork-Hint: ignore
Message-Id: <20240919195949.A906A82160@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/libnetconf2: fix
 library typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=7495b6bb4f9ae8dd1f94cc6ffc7eea1d97b5499c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c805d1e7c7a7de0b88157e08860fb3bc3ae3b50d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnetconf2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnetconf2/Config.in b/package/libnetconf2/Config.in
index 34934325fa..1763243120 100644
--- a/package/libnetconf2/Config.in
+++ b/package/libnetconf2/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBNETCONF2
 
 	  https://github.com/CESNET/libnetconf2
 
-comment "libnetconf2 needs a toolchain w/ threads, dynamic libraray"
+comment "libnetconf2 needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
