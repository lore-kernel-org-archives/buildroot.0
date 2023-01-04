Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B3DC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F4CE82792;
	Mon, 20 Feb 2023 23:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F4CE82792
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gVl5RA4Bv-I0; Mon, 20 Feb 2023 23:05:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B21F6827AA;
	Mon, 20 Feb 2023 23:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B21F6827AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CEE971BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FB4A414ED
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FB4A414ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aQwHvlym7GH0 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 711AA41717
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 711AA41717
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E31386495; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 22:55:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c4f2459e8a94c1f30c0fcbeb3cd72b62b5ee3e64
X-Git-Newrev: ec6e8c632bf372c1fad7889ca6323166b90e1599
X-Patchwork-Hint: ignore
Message-Id: <20230220205225.6E31386495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gobject-introspection:
 drop bogus GOBJECT_INTROSPECTION_AUTORECONF
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec6e8c632bf372c1fad7889ca6323166b90e1599
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit "7687a396e8 package/gobject-introspection: new package" added the
package using the meson infra for both target and host variants.

Meson infra does not support <pkg>_AUTORECONF.

So drop the bogus symbol.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gobject-introspection/gobject-introspection.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index c8ad9b3c72..0d8c666ba1 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -9,7 +9,6 @@ GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
 GOBJECT_INTROSPECTION_SITE = http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
 GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
 GOBJECT_INTROSPECTION_INSTALL_STAGING = YES
-GOBJECT_INTROSPECTION_AUTORECONF = YES
 GOBJECT_INTROSPECTION_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-2-Clause
 GOBJECT_INTROSPECTION_LICENSE_FILES = COPYING.LGPL COPYING.GPL giscanner/scannerlexer.l
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
