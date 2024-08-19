Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66617C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A3A580E74;
	Mon, 19 Aug 2024 20:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgPa5dqyp4Tc; Mon, 19 Aug 2024 20:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BA7380EB5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BA7380EB5;
	Mon, 19 Aug 2024 20:38:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D95421BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C55EF80EB5
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mc5mMbqP9Q5R for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C9A180E74
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C9A180E74
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03B00860F5; Mon, 19 Aug 2024 20:38:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 22:38:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db32d83e42d88b4a443789dd488fba69d0d271f4
X-Git-Newrev: 4c487171734fc537343571b2cadcd630ac2b09cb
X-Patchwork-Hint: ignore
Message-Id: <20240819203850.03B00860F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flashrom: disable documentation
 and man-pages
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c487171734fc537343571b2cadcd630ac2b09cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build of the manpage currently fails with:

ERROR: File 'doc/man8' could not be found
FAILED: meson-internal__install

As we don't care about man pages and documentation in Buildroot, let's
disable them. The issue has nevertheless been reported at
https://github.com/flashrom/flashrom/issues/329.

Fixes:

  http://autobuild.buildroot.net/results/885a957d1b5305d3b91339487cc2a0d64dc74f5e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flashrom/flashrom.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 030f6816a0..2ef9f4d1b7 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -15,7 +15,9 @@ FLASHROM_CONF_OPTS = \
 	-Dich_descriptors_tool=enabled \
 	-Dtests=disabled \
 	-Duse_internal_dmi=true \
-	-Dwerror=false
+	-Dwerror=false \
+	-Dman-pages=disabled \
+	-Ddocumentation=disabled
 
 FLASHROM_PROGRAMMERS = \
 	buspirate_spi \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
