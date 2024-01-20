Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8A0C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 21:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDA1041E26;
	Sat, 20 Jan 2024 21:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDA1041E26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d-rxGYjb1a58; Sat, 20 Jan 2024 21:44:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 018A541EC7;
	Sat, 20 Jan 2024 21:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 018A541EC7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E13351BF346
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EC7460EEB
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EC7460EEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r0v-eT55P106 for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 21:43:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A39FA60F15
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 21:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A39FA60F15
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 903F486309; Sat, 20 Jan 2024 21:43:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 22:28:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b84262aaa656268a661e0de0b529f7b3e7c1a54
X-Git-Newrev: 1cc2c4bb866d8dbb7e6fd7dff7b61e61fdff18af
X-Patchwork-Hint: ignore
Message-Id: <20240120214300.903F486309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-gallery: use canonical
 pub-get
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cc2c4bb866d8dbb7e6fd7dff7b61e61fdff18af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The canonical name for the 'pub' action is 'pub', while 'packages' is
just an alias. Switch to using the canonical name.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr: split off to its own commit]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flutter-gallery/flutter-gallery.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flutter-gallery/flutter-gallery.mk b/package/flutter-gallery/flutter-gallery.mk
index 57a476b1ab..a7e7b76070 100644
--- a/package/flutter-gallery/flutter-gallery.mk
+++ b/package/flutter-gallery/flutter-gallery.mk
@@ -18,7 +18,7 @@ define FLUTTER_GALLERY_BUILD_CMDS
 	cd $(@D) && \
 		FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) \
 		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) packages get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
 		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle && \
 		$(HOST_FLUTTER_SDK_BIN_DART_BIN) package:gallery/main.dart && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
