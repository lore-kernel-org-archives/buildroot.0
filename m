Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B47C27C40
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 18:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98E64415C4;
	Thu, 24 Aug 2023 18:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98E64415C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gIrPYc0hccar; Thu, 24 Aug 2023 18:59:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE51840569;
	Thu, 24 Aug 2023 18:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE51840569
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D20F1BF20B
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 18:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D8FC60F69
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 18:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D8FC60F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-O3OZWaUN5a for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 18:59:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CE2E60BDA
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 18:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CE2E60BDA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CAC28623C; Thu, 24 Aug 2023 18:59:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Aug 2023 20:58:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 670329f057b656be06b217fab411d90695988b41
X-Git-Newrev: bdaade3e34394aefe376d3578d598a863c2ba1a1
X-Patchwork-Hint: ignore
Message-Id: <20230824185935.6CAC28623C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: remove leftover
 comment about headers
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
Content-Type: multipart/mixed; boundary="===============0943425082755569048=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0943425082755569048==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bdaade3e34394aefe376d3578d598a863c2ba1a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 0a8ef2f3f7bc211d38a5a37007bdeb489bd37aae bumped the headers
version requirements, but did not update the associated comment.

Remove the comment entirely, as it does not apply anymore.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

--===============0943425082755569048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0943425082755569048==--
