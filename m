Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5DDC433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7669640569;
	Thu,  5 May 2022 20:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NoVGu0QUUijh; Thu,  5 May 2022 20:10:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 844A5404C0;
	Thu,  5 May 2022 20:10:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 258871BF342
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2286983E20
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fevuz1K3iTpT for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:10:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8008283E1F
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:10:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9C6E085B11; Thu,  5 May 2022 19:59:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 May 2022 22:09:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c2f0c698ca81889a127107c5ea1b197631b3130
X-Git-Newrev: 64f67ede01699c47ca3c8801ae5dd440295f1874
X-Patchwork-Hint: ignore
Message-Id: <20220505195933.9C6E085B11@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: bump to latest master
 commit 8a845ab078c3fe12ac4edd16c8cbac5b7ec03b98
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

commit: https://git.buildroot.net/buildroot/commit/?id=64f67ede01699c47ca3c8801ae5dd440295f1874
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This brings in numerous improvements in ipu3 and rpi IPAs as well as
adding support for Black Level Correction, auto gain and auto white
balance algorithms to rkisp IPA. A handful of new camera sensors are
also supported.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Acked-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 8d5abf0e62..181bb1349a 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  3624c71ba492c602c5335aab3dc87798193f7596c6cc75f7cfb847165f180930  libcamera-1966b9a58436fab51f8270aad6a228b935e4fac4-br1.tar.gz
+sha256  9aa62d41470238ac8c3bb847601d1a803ac7a270d3b5e87f722e9c93c867d18d  libcamera-8a845ab078c3fe12ac4edd16c8cbac5b7ec03b98-br1.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 9cbb1910dc..77381ab3ca 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = 1966b9a58436fab51f8270aad6a228b935e4fac4
+LIBCAMERA_VERSION = 8a845ab078c3fe12ac4edd16c8cbac5b7ec03b98
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
