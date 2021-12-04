Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB120C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 17:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F58D409B7;
	Sat,  4 Dec 2021 17:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NRlActi2H1Dw; Sat,  4 Dec 2021 17:23:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4EE140996;
	Sat,  4 Dec 2021 17:23:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C974C1BF95C
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 17:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD19483F25
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 17:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fUF1oa_AdxSA for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 17:23:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9255B83F22
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 17:23:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CA4DB8A558; Sat,  4 Dec 2021 17:18:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 18:04:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a68960b682c06681473f396a4c6d10b77c444fa
X-Git-Newrev: 8be79fbc53523b4b21ff61a51ffc86475b4b31b5
X-Patchwork-Hint: ignore
Message-Id: <20211204171828.CA4DB8A558@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-grubenv: fix modules list
 help and variable
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
Content-Type: multipart/mixed; boundary="===============3370777810833336581=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3370777810833336581==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8be79fbc53523b4b21ff61a51ffc86475b4b31b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The help was missing the regexp module.

The variable assignment was missing spaces around the equal sign.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[yann.morin.1998@free.fr: split to its own patch, fix assignment too]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Köry Maincent <kory.maincent@bootlin.com>
---
 package/mender-grubenv/Config.in         | 2 +-
 package/mender-grubenv/mender-grubenv.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender-grubenv/Config.in b/package/mender-grubenv/Config.in
index 97f785ad3f..38da5b84fe 100644
--- a/package/mender-grubenv/Config.in
+++ b/package/mender-grubenv/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_MENDER_GRUBENV
 	  integrate with the GRUB bootloader.
 
 	  The following Grub modules must be selected for this package:
-	  loadenv hashsum echo halt gcry_sha256 test
+	  loadenv hashsum echo halt gcry_sha256 test regexp
 
 	  https://github.com/mendersoftware/grub-mender-grubenv
 
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index 07df25512c..d7bdcc99eb 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -30,7 +30,7 @@ MENDER_GRUBENV_DEFINES = \
 
 # These grub modules must be built in for the grub scripts to work properly.
 # Without them, the system will not boot.
-MENDER_GRUBENV_MANDATORY_MODULES=loadenv hashsum echo halt gcry_sha256 test regexp
+MENDER_GRUBENV_MANDATORY_MODULES = loadenv hashsum echo halt gcry_sha256 test regexp
 MENDER_GRUBENV_MODULES_MISSING = \
 	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))

--===============3370777810833336581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3370777810833336581==--
