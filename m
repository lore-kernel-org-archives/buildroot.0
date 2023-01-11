Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB09C6379F
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5575F40104;
	Wed, 11 Jan 2023 09:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5575F40104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Exft8lHxOWmF; Wed, 11 Jan 2023 09:38:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99FFB40C90;
	Wed, 11 Jan 2023 09:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99FFB40C90
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9584A1BF2B3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48AE6402ED
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48AE6402ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sExrmIh_Y_lJ for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:33:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B24F40350
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B24F40350
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AD67878DE; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 10:16:58 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5c880044aeb5af01fe7b7554da2c0f3584c535fd
X-Git-Newrev: 65b8d0d2a33ccb358a52319351efdd115070f0b4
X-Patchwork-Hint: ignore
Message-Id: <20230111093332.8AD67878DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/exfat: drop
 dangling EXFAT_CFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=65b8d0d2a33ccb358a52319351efdd115070f0b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit "98538bb0a2 exfat: bump to version 1.2.1" changed the package
infra from generic to autotools, but dropped all usages of EXFAT_CFLAGS.
This config is ignored by autotools package infra.

So drop the dangling symbol.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fbbbe50173ed4b3ef3323cc7df6c90e0d63678d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exfat/exfat.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index 282a30aa5e..c0ef77a113 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -11,7 +11,6 @@ EXFAT_DEPENDENCIES = libfuse host-pkgconf
 EXFAT_LICENSE = GPL-2.0+
 EXFAT_LICENSE_FILES = COPYING
 EXFAT_CPE_ID_VENDOR = exfat_project
-EXFAT_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
 EXFAT_CONF_OPTS += --exec-prefix=/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
