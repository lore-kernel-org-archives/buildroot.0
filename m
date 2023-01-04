Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6EEC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC1A082330;
	Mon, 20 Feb 2023 23:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC1A082330
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MqE1w3Wk5WC3; Mon, 20 Feb 2023 23:05:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 480A982796;
	Mon, 20 Feb 2023 23:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 480A982796
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC4AF1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F26DC4172B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F26DC4172B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nU0hzpjJk5VU for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40425414ED
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40425414ED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DE8086495; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 22:52:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4432cf65ee7ec0fe9cc23bcac251adca16aeb014
X-Git-Newrev: fbbbe50173ed4b3ef3323cc7df6c90e0d63678d6
X-Patchwork-Hint: ignore
Message-Id: <20230220205225.3DE8086495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/exfat: drop dangling
 EXFAT_CFLAGS
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
