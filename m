Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD4AC46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 21:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12E5F837AC;
	Wed, 27 Dec 2023 21:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12E5F837AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fFI617HxRMAC; Wed, 27 Dec 2023 21:40:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 578718378A;
	Wed, 27 Dec 2023 21:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 578718378A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65D0D1BF2A3
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 21:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49A68418A6
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 21:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49A68418A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sik388Yq20uP for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 21:40:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 436BC41741
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 21:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 436BC41741
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C0B3836A6; Wed, 27 Dec 2023 21:40:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 22:39:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9a56ab6fd98125ca09078bdeb7c8d55d53aa35e
X-Git-Newrev: 03dc0fbd5cfb109e90531be1bc7c44ba70df0436
X-Patchwork-Hint: ignore
Message-Id: <20231227214032.2C0B3836A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: make GDB 13.x the default
 version
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

commit: https://git.buildroot.net/buildroot/commit/?id=03dc0fbd5cfb109e90531be1bc7c44ba70df0436
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the addition of GDB 14.x, let's make GDB 13.x the default.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gdb/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 670818cb0e..0c6f75a3eb 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -41,7 +41,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_12
+	default BR2_GDB_VERSION_13
 	depends on !BR2_arc
 	help
 	  Select the version of gdb you wish to use.
@@ -69,8 +69,8 @@ config BR2_GDB_VERSION
 	string
 	default "arc-2020.09-release-gdb" if BR2_arc
 	default "11.2"     if BR2_GDB_VERSION_11
-	default "12.1"     if BR2_GDB_VERSION_12 || !BR2_PACKAGE_HOST_GDB
-	default "13.2"     if BR2_GDB_VERSION_13
+	default "12.1"     if BR2_GDB_VERSION_12
+	default "13.2"     if BR2_GDB_VERSION_13 || !BR2_PACKAGE_HOST_GDB
 	# When making 14.x the default, or 14.x becomes the oldest version,
 	# be sure to update the target variant to properly select mpfr.
 	default "14.1"     if BR2_GDB_VERSION_14
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
