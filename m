Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD97FA0C36
	for <buildroot@archiver.kernel.org>; Wed, 15 Apr 2026 06:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70E0C4287A;
	Wed, 15 Apr 2026 06:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3WXIA6m7cep; Wed, 15 Apr 2026 06:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FB644287C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776234073;
	bh=7KkbRoZUTe7n/rQDr/ltFyWhGtFA9mi2ijeKX5rxiD0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=URl7ZKrMwfsazDr72tYlBJS+De8qXvFVSTlIABJFWQqDNSWy3BOPiFGxXi2lDEoJD
	 PLH/T5UOv5Rvtz5vmbKgtoBnsgTR3O1CoP7+cDuqEC1AGxZwhMQjXlYP8EJQrHtE4i
	 l0EOcdDVnmLZ2GlCHXA8xFxh5lAZEM5yPdFy6DOlUQ9Jc132IKDqmPIE4+paVvJw3a
	 jS57kWf3Ua9ko9pz6n2Mb5NlP6M9TK/p8nQrMs4bJPiHKdYHszBFIzgGnvHlAwPlO3
	 X1Kim1UEKmcOVb7MJHlSDPtmzpvPH6HQoAHaKnv2EkouY44cq+SMszQgNlLi+gfqCY
	 x0iTgNE4uVQBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FB644287C;
	Wed, 15 Apr 2026 06:21:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52610394
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 06:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33B4442875
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 06:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5OJbR8dgGEw for <buildroot@buildroot.org>;
 Wed, 15 Apr 2026 06:21:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03D0242845
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03D0242845
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 06:21:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8790C7FF16; Wed, 15 Apr 2026 06:21:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Apr 2026 08:17:35 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 8f19b5b8096f5a919707255a7c4d5f046ac1ba10
X-Git-Newrev: a3ef297e0e0449ca163d6827b0c45973a1972f09
X-Patchwork-Hint: ignore
Message-Id: <20260415062109.8790C7FF16@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/xz: bump version
 to 5.8.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a3ef297e0e0449ca163d6827b0c45973a1972f09
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit 2e2d0389188681a5bedac73b8fb9ba6147e48887)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
