Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D5BC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF56382193;
	Wed,  7 Feb 2024 09:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id koFqBj3EoytB; Wed,  7 Feb 2024 09:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E5C382318
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E5C382318;
	Wed,  7 Feb 2024 09:41:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EF391BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6962041496
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fxJapTUJHd21 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:41:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F46D40A00
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F46D40A00
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:41:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B2D48753F; Wed,  7 Feb 2024 09:41:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 10:39:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a572abf8a552b42f3107a05871255f44d77f217
X-Git-Newrev: 7b13cc2c264d20698d7f48a4bbbbdffc0698b06f
X-Patchwork-Hint: ignore
Message-Id: <20240207094101.7B2D48753F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uuu: bump to version 1.5.165
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b13cc2c264d20698d7f48a4bbbbdffc0698b06f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It requires the host-tinyxml2 package.

The hash of README.md has changed because a reference to the tinyxml2
license has been added:

    + - tinyxml (zlib license) is from https://github.com/leethomason/tinyxml2

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.163
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.165

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[yann.morin.1998@free.fr:
  - split long dependency line
  - reorder dependencies alphabetically
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uuu/uuu.hash |  4 ++--
 package/uuu/uuu.mk   | 10 ++++++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 20816b5081..c231d5d729 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  6972c7a1e76d60a22212913a8867b737104410c2a47ad88c8af460bd4885ec09  uuu_source-uuu_1.5.141.tar.gz
+sha256  6e65fc028afacc94b805ae376e3da3864dcb2570d425037820e716207ab70373  uuu_source-uuu_1.5.165.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
-sha256  2d872c6e5aaea15ec1932bfb378fb62e24ee7ec399fe7f998f03d9b728215335  README.md
+sha256  1b3d030a1824d633f75194743bd92bc1ed2d9a4bf1915bc11e49bf4c0c54012d  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 93c748ee46..80d5e1937a 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,11 +4,17 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.141
+UUU_VERSION = 1.5.165
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
 UUU_LICENSE_FILES = LICENSE README.md
-HOST_UUU_DEPENDENCIES = host-bzip2 host-openssl host-zlib host-libusb host-zstd
+HOST_UUU_DEPENDENCIES = \
+	host-bzip2 \
+	host-libusb \
+	host-openssl \
+	host-tinyxml2 \
+	host-zlib \
+	host-zstd
 
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
