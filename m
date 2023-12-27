Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6D8C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 22:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A95C641BAA;
	Wed, 27 Dec 2023 22:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A95C641BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eDeRIY9sU2MY; Wed, 27 Dec 2023 22:18:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 013BC41B8B;
	Wed, 27 Dec 2023 22:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 013BC41B8B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F2021BF2E4
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD04F826D6
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD04F826D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6uO93LMfqM5L for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 22:18:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7EA980C65
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 22:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7EA980C65
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C252E8373F; Wed, 27 Dec 2023 22:18:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 23:18:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 782d268abadc2541953d1782d79d142a7b6f07b1
X-Git-Newrev: f29c5b57f97bc329b9f20bba66460c4d9aa8cc35
X-Patchwork-Hint: ignore
Message-Id: <20231227221839.C252E8373F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in.legacy: fix check-package errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=f29c5b57f97bc329b9f20bba66460c4d9aa8cc35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index bca483215f..46ae84997e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -153,7 +153,7 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
 	select BR2_LEGACY
 	select BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4
 	help
-	  Since version ... the libcamera pipeline option 'raspberrypi' was
+	  Since version 0.1.0, the pipeline option 'raspberrypi' was
 	  renamed to 'rpi/vc4'.
 
 config BR2_GDB_VERSION_11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
