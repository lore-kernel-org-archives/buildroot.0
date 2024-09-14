Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAC2C02180
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93538847B4;
	Sat, 14 Sep 2024 08:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6M765juB6Cny; Sat, 14 Sep 2024 08:23:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 648A6847AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 648A6847AE;
	Sat, 14 Sep 2024 08:23:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA69C1BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80E6A6069C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZG_DOArF5sU for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:22:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C44B60723
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C44B60723
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:22:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 189D686F5B; Sat, 14 Sep 2024 08:22:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 10:19:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6e32b6910fdcd1c41bbcc5fe4357d6488175006
X-Git-Newrev: c805d1e7c7a7de0b88157e08860fb3bc3ae3b50d
X-Patchwork-Hint: ignore
Message-Id: <20240914082255.189D686F5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnetconf2: fix library typo
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c805d1e7c7a7de0b88157e08860fb3bc3ae3b50d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
