Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A86FC53210
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 22:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5AF382066;
	Wed,  4 Jan 2023 22:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5AF382066
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uigwcv6XEFNo; Wed,  4 Jan 2023 22:06:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1576682060;
	Wed,  4 Jan 2023 22:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1576682060
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E234B1BF3A3
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 22:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBB318204B
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 22:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBB318204B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SKacKxAWrmLe for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 22:05:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 694E082041
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 22:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 694E082041
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52E7E875A9; Wed,  4 Jan 2023 22:05:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 22:52:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4432cf65ee7ec0fe9cc23bcac251adca16aeb014
X-Git-Newrev: fbbbe50173ed4b3ef3323cc7df6c90e0d63678d6
X-Patchwork-Hint: ignore
Message-Id: <20230104220538.52E7E875A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exfat: drop dangling EXFAT_CFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbbbe50173ed4b3ef3323cc7df6c90e0d63678d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit "98538bb0a2 exfat: bump to version 1.2.1" changed the package
infra from generic to autotools, but dropped all usages of EXFAT_CFLAGS.
This config is ignored by autotools package infra.

So drop the dangling symbol.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
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
