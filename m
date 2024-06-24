Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC518C2D0D1
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 13:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 483AE818C4;
	Mon, 24 Jun 2024 13:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ME_ZojcAuIiC; Mon, 24 Jun 2024 13:53:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2747381754
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2747381754;
	Mon, 24 Jun 2024 13:53:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 189361BF479
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6810A608D0
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hABiqU76zIPH for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 13:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6923360869
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6923360869
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 13:53:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5526482B2F; Mon, 24 Jun 2024 13:53:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 13:55:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40240ac30afc4c6af765794f38e6815162ca61fa
X-Git-Newrev: d1d77eb274761d1f2d24ee4b55a374e917c67a8e
X-Patchwork-Hint: ignore
Message-Id: <20240624135304.5526482B2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: bump version to 5.6.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d1d77eb274761d1f2d24ee4b55a374e917c67a8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- bump version to 5.6.2
- add BSD-0-Clause and update license file hash accordingly (see [1], [2], [3],
  [4], [5], [6], [7] and [8])

For details see [9].

This version skips the 5.6.0 and 5.6.1 releases which had the backdoor.

[1] https://github.com/tukaani-project/xz/commit/b1ee6cf259bb49ce91abe9f622294524e37edf4c
[2] https://github.com/tukaani-project/xz/commit/689e0228baeb95232430e90d628379db89583d71
[3] https://github.com/tukaani-project/xz/commit/28ce45e38fbed4b5f54f2013e38dab47d22bf699
[4] https://github.com/tukaani-project/xz/commit/17aa2e1a796d3f758802df29afc89dcf335db567
[5] https://github.com/tukaani-project/xz/commit/bfd0c7c478e93a1911b845459549ff94587b6ea2
[6] https://github.com/tukaani-project/xz/commit/fd7faa4c338a42a6a40e854b837d285ae2e8c609
[7] https://github.com/tukaani-project/xz/commit/62733592a1cc6f0b41f46ef52e06d1a6fe1ff38a
[8] https://github.com/tukaani-project/xz/commit/6bbec3bda02bf87d24fa095074456e723589921f
[9] https://github.com/tukaani-project/xz/releases/tag/v5.6.2

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/xz/xz.hash | 8 ++++----
 package/xz/xz.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index ff070f6775..6012e1001b 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,11 +1,11 @@
 # Locally calculated after checking pgp signature
-# https://github.com/tukaani-project/xz/releases/download/v5.4.7/xz-5.4.7.tar.bz2.sig
+# https://github.com/tukaani-project/xz/releases/download/v5.6.2/xz-5.6.2.tar.bz2.sig
 # using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
-
-sha256  9976ed9cd0764e962d852d7d519ee1c3a7f87aca3b86e5d021a45650ba3ecb41  xz-5.4.7.tar.bz2
+sha256  e12aa03cbd200597bd4ce11d97be2d09a6e6d39a9311ce72c91ac7deacde3171  xz-5.6.2.tar.bz2
 
 # Hash for license files
-sha256  72d7ef9c98be319fd34ce88b45203b36d5936f9c49e82bf3198ffee5e0c7d87e  COPYING
+sha256  ee3b35b82f7bb0ba5fd9f13ca34ebbe757a59c05bfde5ab9d50ff4188ed33396  COPYING
+sha256  0b01625d853911cd0e2e088dcfb743261034a091bb379246cb25a14cc4c74bf1  COPYING.0BSD
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING.GPLv3
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index d5dceb0eae..10590f6be8 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.4.7
+XZ_VERSION = 5.6.2
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-XZ_LICENSE = Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+
-XZ_LICENSE_FILES = COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
+XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
+XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
