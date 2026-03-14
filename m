Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C0510854AA
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 22:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F5FD60E33;
	Sat, 14 Mar 2026 22:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNtcGOp-ckgY; Sat, 14 Mar 2026 22:25:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AE1560F4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773527145;
	bh=4CgbpMGG2D/it8Ei99iQNFmb8/gbEZ6gBBovrTEERzY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hzT9rfTi1aFb7INWVMPgUwC9+3CPbmgD3iYIECPkcC8a+EWhbRyPtKwx+0zlQd7Cb
	 23FmZLajXv2XwizcT6J1YFPH6NcvvppRHAU+fIq8qX4/kioKvTFmDXSgxxyc9vL8Cs
	 0c9Ljge7GMhLl8rX+8gWVTUkMzrUdaxZC5iL01l5SBHO1gRG2Of2s/tBmUBvs1h14G
	 wqxZ/oWv3gfPRsyIERws8Sp9irwFd8OyHNNBIcr6PNwBLMKMlekgEsTDPzSP/X8xMK
	 IyrLd6M0khheHfvetAnD/r7cbxacmkGKZGp/MO4ttbHVAflQF3nAfSj0mm+GPLzir5
	 2yTqp7q66ZdfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AE1560F4C;
	Sat, 14 Mar 2026 22:25:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49B4D1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 22:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F9C4823E0
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 22:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9scyHiYuHtRd for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 22:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A5CB82392
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A5CB82392
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 22:25:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8032483841; Sat, 14 Mar 2026 22:25:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 23:20:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdeb0d0a3208e97645e9f7771d53c14e5fb441b8
X-Git-Newrev: 2e2d0389188681a5bedac73b8fb9ba6147e48887
X-Patchwork-Hint: ignore
Message-Id: <20260314222543.8032483841@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: bump version to 5.8.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2e2d0389188681a5bedac73b8fb9ba6147e48887
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/tukaani-project/xz/releases/tag/v5.8.2
"- Fix the build on ARM64 on glibc versions older than
   2.24 (2016). They don't have HWCAP_CRC32 in <sys/auxv.h>."

Updated license hashes due to upstream commit
https://github.com/tukaani-project/xz/commit/6d287a3ae90e1b990294f3d5264003d81e853c5e

Fixes:
https://autobuild.buildroot.net/results/b0d/b0dbae7b2c884f5fef0017755b28932a83921a5a/
"check/crc32_arm64.h:27:25: fatal error: sys/auxv.h: No such file or directory
   27 | #               include <sys/auxv.h>"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xz/xz.hash | 8 ++++----
 package/xz/xz.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 0e0618ec02..99daa5e9df 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,11 +1,11 @@
 # Locally calculated after checking pgp signature
-# https://github.com/tukaani-project/xz/releases/download/v5.8.1/xz-5.8.1.tar.bz2.sig
+# https://github.com/tukaani-project/xz/releases/download/v5.8.2/xz-5.8.2.tar.bz2.sig
 # using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
-sha256  5965c692c4c8800cd4b33ce6d0f6ac9ac9d6ab227b17c512b6561bce4f08d47e  xz-5.8.1.tar.bz2
+sha256  60345d7c0b9c8d7ffa469e96898c300def3669f5047fc76219b819340839f3d8  xz-5.8.2.tar.bz2
 
 # Hash for license files
 sha256  616a3ad264ce29b8f1cb97e53037b139d406899ca8d1f799651e17bfa09830b8  COPYING
 sha256  0b01625d853911cd0e2e088dcfb743261034a091bb379246cb25a14cc4c74bf1  COPYING.0BSD
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING.GPLv2
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING.GPLv3
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LGPLv2.1
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index b1e210a172..8aa0716b18 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.8.1
+XZ_VERSION = 5.8.2
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
