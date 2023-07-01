Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F925EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 21:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C52AA81E53;
	Sat,  1 Jul 2023 21:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C52AA81E53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id boP3ZGQvhlAa; Sat,  1 Jul 2023 21:08:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1933181E86;
	Sat,  1 Jul 2023 21:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1933181E86
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 924F81BF868
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 21:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72BFE60AE9
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 21:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72BFE60AE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lsc95S2tKl9u for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 21:07:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2A4660AC9
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 21:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2A4660AC9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9003986386; Sat,  1 Jul 2023 21:07:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 23:07:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2d794416cebe20f0ea270332641593b329027fc
X-Git-Newrev: fb50eab8a5e6b82dd0a2916b6805ab712d4d7350
X-Patchwork-Hint: ignore
Message-Id: <20230701210743.9003986386@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: switch to 2.39.x as the
 default version
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb50eab8a5e6b82dd0a2916b6805ab712d4d7350
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that 2.40 has been released, let's use 2.39.x as the default
binutils version.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index fe1755683c..a1800e49e2 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_38_X if !BR2_arc
+	default BR2_BINUTILS_VERSION_2_39_X if !BR2_arc
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	help
 	  Select the version of binutils you wish to use.
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index e34dd79f6f..0dd8526b26 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2020.09-release
 else
-BINUTILS_VERSION = 2.38
+BINUTILS_VERSION = 2.39
 endif
 endif # BINUTILS_VERSION
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
