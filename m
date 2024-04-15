Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D4AC4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 16:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51296817A2;
	Mon, 15 Apr 2024 16:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Sto5SWMqeqg; Mon, 15 Apr 2024 16:27:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0665B817C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0665B817C0;
	Mon, 15 Apr 2024 16:27:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68A731BF298
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53D864065C
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qYojEsgYne9e for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 16:27:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 470894065B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 470894065B
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 16:27:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D5AE860E3; Mon, 15 Apr 2024 16:27:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 15 Apr 2024 18:06:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e019fed31257a156965c95561ca7c83333a7565
X-Git-Newrev: 256aa8ed85f8fd65ea0f0f242adb55f95a13eb2b
X-Patchwork-Hint: ignore
Message-Id: <20240415162719.3D5AE860E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bmap-tools: bump to version 3.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=256aa8ed85f8fd65ea0f0f242adb55f95a13eb2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that, although not explicitly specified in the changelog, version
3.7 renamed the file COPYING to LICENSE, requiring corresponding changes
in Bildroot related to the license file (specifically, the name and hash).

Release notes:

- bmap-tools 3.7:
  * Use GitHub Actions for CI (#109)
  * Add `poetry` for dependency management and `black` for code
    formatting (#104)
  * Add functionality for copying from standard input (#99)
  * Switch from gpg to gpgme module (#103)

- bmaptool 3.8.0:
  * use 'df -P' for POSIX portable output
  * bmaptool has new maintainers
  * bmaptool has a new home
  * bmaptool is now only called 'bmaptool' and not one of a dozen such
    variations
  * switch to use an X.Y.Z versioning number scheme

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bmap-tools/bmap-tools.hash | 4 ++--
 package/bmap-tools/bmap-tools.mk   | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/bmap-tools/bmap-tools.hash b/package/bmap-tools/bmap-tools.hash
index 82a570ecac..28a68e8b8e 100644
--- a/package/bmap-tools/bmap-tools.hash
+++ b/package/bmap-tools/bmap-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0658afb972e7221aa16fece3f84e29e5102e901c929253d7fb6040bde28243f7  bmap-tools-3.6.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  3c741ccdd5049b5cb6983bc186f7be8040a132ed7e9c2afda4d9e7390888163c  bmap-tools-3.8.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
index 69a22c4745..3455063e21 100644
--- a/package/bmap-tools/bmap-tools.mk
+++ b/package/bmap-tools/bmap-tools.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-BMAP_TOOLS_VERSION = 3.6
+BMAP_TOOLS_VERSION = 3.8.0
 BMAP_TOOLS_SITE = $(call github,yoctoproject,bmaptool,v$(BMAP_TOOLS_VERSION))
 BMAP_TOOLS_LICENSE = GPL-2.0
-BMAP_TOOLS_LICENSE_FILES = COPYING
+BMAP_TOOLS_LICENSE_FILES = LICENSE
 BMAP_TOOLS_SETUP_TYPE = setuptools
+BMAP_TOOLS_DEPENDENCIES = host-python-poetry-core
+HOST_BMAP_TOOLS_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
