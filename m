Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89BEEDEC7C
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 16:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8505582F19;
	Wed, 13 Sep 2023 16:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8505582F19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id baMtsZN3Y9oU; Wed, 13 Sep 2023 16:01:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B78E98309A;
	Wed, 13 Sep 2023 16:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B78E98309A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 717201BF98E
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B1CC610DF
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B1CC610DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pv5qsj_P4GIj for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 16:01:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7238B6108F
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 16:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7238B6108F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60CF986E11; Wed, 13 Sep 2023 16:01:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 17:57:58 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 0f4e4a75ad21b2e41b6d81a851a5b78b1a5cdd9a
X-Git-Newrev: 44f9d1189694f50c9d63388078aeb9a1e6b67e20
X-Patchwork-Hint: ignore
Message-Id: <20230913160117.60CF986E11@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/network-manager:
 remove leftover comment about headers
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
Content-Type: multipart/mixed; boundary="===============6620613135871684619=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6620613135871684619==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=44f9d1189694f50c9d63388078aeb9a1e6b67e20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Commit 0a8ef2f3f7bc211d38a5a37007bdeb489bd37aae bumped the headers
version requirements, but did not update the associated comment.

Remove the comment entirely, as it does not apply anymore.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bdaade3e34394aefe376d3578d598a863c2ba1a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 37c4a79d16..57d7543131 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	# Tested with 3.2, but may even work with earlier versions
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
 	depends on BR2_TOOLCHAIN_USES_GLIBC # CLOCK_BOOTTIME, IPTOS_CLASS_*
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2

--===============6620613135871684619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6620613135871684619==--
