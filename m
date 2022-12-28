Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B01C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A7294028B;
	Mon, 20 Feb 2023 22:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A7294028B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mUnJZ9S_-h8u; Mon, 20 Feb 2023 22:48:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8FCC4EBD3;
	Mon, 20 Feb 2023 22:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8FCC4EBD3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F094E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C93394170F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C93394170F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qAt6-8qCkYIJ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E706A41194
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E706A41194
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2CA786495; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 11:04:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6264dfae49af69d7358f2d6fef21bd720e62440f
X-Git-Newrev: 620a77dc9d93365d87c7b18545f091c8e962509e
X-Patchwork-Hint: ignore
Message-Id: <20230220205216.E2CA786495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lua-cqueues: force
 using libopenssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=620a77dc9d93365d87c7b18545f091c8e962509e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As building lua-cqueues fails to build with libressl, we force the use
of libopenssl instead.

Fixes:

  http://autobuild.buildroot.net/results/032d6c9bf84b0d4e50d3c27f37b71c0564c52312/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-cqueues/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lua-cqueues/Config.in b/package/lua-cqueues/Config.in
index 60f022848b..a8c38950cf 100644
--- a/package/lua-cqueues/Config.in
+++ b/package/lua-cqueues/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LUA_CQUEUES
 	bool "lua-cqueues"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  Continuation Queues: Embeddable asynchronous networking,
 	  threading, and notification framework for Lua on Unix.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
