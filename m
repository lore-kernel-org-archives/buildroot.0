Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047AEC46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C5E3419C1;
	Wed, 11 Jan 2023 09:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C5E3419C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gRRcIIkluWia; Wed, 11 Jan 2023 09:35:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EE9541A15;
	Wed, 11 Jan 2023 09:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EE9541A15
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 638AF1BF2B3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29B7740320
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29B7740320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XR67-kpwZZt0 for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:33:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB0E440341
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB0E440341
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2D81878DD; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 10:18:36 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7463502768b1b0ac265c61b11002020c8391fc89
X-Git-Newrev: 8a2e60a43d9473f00ed5cf9b2c768d7447fa908b
X-Patchwork-Hint: ignore
Message-Id: <20230111093332.A2D81878DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/gobject-introspection: drop bogus GOBJECT_INTROSPECTION_AUTORECONF
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a2e60a43d9473f00ed5cf9b2c768d7447fa908b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit "7687a396e8 package/gobject-introspection: new package" added the
package using the meson infra for both target and host variants.

Meson infra does not support <pkg>_AUTORECONF.

So drop the bogus symbol.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ec6e8c632bf372c1fad7889ca6323166b90e1599)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gobject-introspection/gobject-introspection.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 41d64171a7..99f4a7e2fe 100644
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
