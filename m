Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9E8C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEB0860B8D;
	Sun, 30 Jul 2023 10:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEB0860B8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BjbHYwp5y5_p; Sun, 30 Jul 2023 10:34:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F320860655;
	Sun, 30 Jul 2023 10:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F320860655
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46DC01BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C8164099F
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C8164099F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oiMzOWp4fsQp for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:33:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EB2D408D3
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EB2D408D3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B4B783BC7; Sun, 30 Jul 2023 10:33:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:32:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4350a1f1035dffc48e9ef3155f8f7f9aa3903069
X-Git-Newrev: 801419c8112d1fc021be9db5faac3fc75eb18903
X-Patchwork-Hint: ignore
Message-Id: <20230730103358.2B4B783BC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-imagedecoder-heif/Config.in:
 fix bogus double backslash
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

commit: https://git.buildroot.net/buildroot/commit/?id=801419c8112d1fc021be9db5faac3fc75eb18903
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-imagedecoder-heif/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi-imagedecoder-heif/Config.in b/package/kodi-imagedecoder-heif/Config.in
index 32f375be3e..7cf2d1ef6e 100644
--- a/package/kodi-imagedecoder-heif/Config.in
+++ b/package/kodi-imagedecoder-heif/Config.in
@@ -14,5 +14,5 @@ config BR2_PACKAGE_KODI_IMAGEDECODER_HEIF
 
 comment "kodi-imagedecoder-heif needs a toolchain w/ C++, threads, gcc >= 4.8"
 	depends on !BR2_m68k_cf # libheif
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \\
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
