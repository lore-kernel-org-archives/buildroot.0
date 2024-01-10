Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBAEC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 23:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8455E43780;
	Wed, 10 Jan 2024 23:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8455E43780
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w7DawkaT71b2; Wed, 10 Jan 2024 23:20:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FDB343772;
	Wed, 10 Jan 2024 23:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FDB343772
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 444181BF398
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 23:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AACC61591
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 23:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AACC61591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R2kYU32A3niE for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 23:20:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6969F61588
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 23:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6969F61588
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5108C85E54; Wed, 10 Jan 2024 23:20:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 23:47:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75d78e42259e46ca575f4a07879d3e68d2e3a811
X-Git-Newrev: 681286564ebd8aeabb52fa353c24f315404a20d8
X-Patchwork-Hint: ignore
Message-Id: <20240110232026.5108C85E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-sdk-bin: bump version to
 3.16.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=681286564ebd8aeabb52fa353c24f315404a20d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream changed their --{en,dis}able-telemetry option, and replaced it
with --{en,dis}able-analytics.

A subsequent look at the rest of the file including the logic around the
change of the name of the above option provides no other elevant changes
that would apply to this package update.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index a204de1807..f0a855f2c9 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b6bc6f93423488c67110e0fe56523cd2260f3a4c379ed015cd1c7fab66362739  flutter_linux_3.13.9-stable.tar.xz
+sha256  57e59fa3a31be7e87b3847cdf782f1323578bbf70a0cd35f3615f01ab429ac29  flutter_linux_3.16.5-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index e8e71b6ab0..a28cf645f3 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.13.9
+FLUTTER_SDK_BIN_VERSION = 3.16.5
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
@@ -25,7 +25,7 @@ HOST_FLUTTER_SDK_BIN_ENV = \
 HOST_FLUTTER_SDK_BIN_CONF_OPTS = \
 	--clear-features \
 	--no-analytics \
-	--disable-telemetry \
+	--disable-analytics \
 	--enable-custom-devices \
 	--enable-linux-desktop \
 	--no-enable-android \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
