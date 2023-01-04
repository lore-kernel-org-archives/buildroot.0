Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD560C46467
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 22:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DAA840577;
	Wed,  4 Jan 2023 22:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DAA840577
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CACnbZQrd97T; Wed,  4 Jan 2023 22:06:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DEF540467;
	Wed,  4 Jan 2023 22:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DEF540467
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88F531BF3A3
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 22:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64390418EC
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 22:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64390418EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PAyDh652_53R for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 22:05:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72D7B418EB
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 22:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72D7B418EB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 602D5875AB; Wed,  4 Jan 2023 22:05:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 22:53:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbbbe50173ed4b3ef3323cc7df6c90e0d63678d6
X-Git-Newrev: cbb6a55e6e03ea0b4e0a9b744f289e11da963c62
X-Patchwork-Hint: ignore
Message-Id: <20230104220538.602D5875AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/falcosecurity-libs: drop bogus
 FALCOSECURITY_LIBS_SUPPORTS_IN_SOURCE_BUILD
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbb6a55e6e03ea0b4e0a9b744f289e11da963c62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit "a15e35c4eb falcosecurity-libs: add new package" uses the infras
kernel-module and generic-package. Neither of them support
<pkg>_SUPPORTS_IN_SOURCE_BUILD, only the CMake infra does.

So drop the bogus symbol.

Cc: Francis Laniel <flaniel@linux.microsoft.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/falcosecurity-libs/falcosecurity-libs.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/falcosecurity-libs/falcosecurity-libs.mk b/package/falcosecurity-libs/falcosecurity-libs.mk
index f2c389948f..92d5c61832 100644
--- a/package/falcosecurity-libs/falcosecurity-libs.mk
+++ b/package/falcosecurity-libs/falcosecurity-libs.mk
@@ -9,7 +9,6 @@ FALCOSECURITY_LIBS_SITE = $(call github,falcosecurity,libs,$(FALCOSECURITY_LIBS_
 FALCOSECURITY_LIBS_LICENSE = Apache-2.0 (userspace), MIT or GPL-2.0 (driver)
 FALCOSECURITY_LIBS_LICENSE_FILES = COPYING driver/MIT.txt driver/GPL2.txt
 FALCOSECURITY_LIBS_CPE_ID_VENDOR = falco
-FALCOSECURITY_LIBS_SUPPORTS_IN_SOURCE_BUILD = NO
 
 FALCOSECURITY_LIBS_DEPENDENCIES = \
 	c-ares \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
