Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E1DC432BE
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 22:05:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FF7360EFD
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 22:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FF7360EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0397382553;
	Sat, 31 Jul 2021 22:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k4X3M_eiBfs9; Sat, 31 Jul 2021 22:05:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E26E82566;
	Sat, 31 Jul 2021 22:05:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4E3D1BF2C1
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 22:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 908314021E
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 22:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MuBr-zoJ0GZl for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 22:04:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0F3040124
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 22:04:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D655D8A3F5; Sat, 31 Jul 2021 22:04:52 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 00:02:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5527ec47dee19559c206462931d0258b657d277c
X-Git-Newrev: b61c0830c3b4bd6f6a64be543ce6f13f88bb4fa7
X-Patchwork-Hint: ignore
Message-Id: <20210731220452.D655D8A3F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nut: fix SELinux
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=b61c0830c3b4bd6f6a64be543ce6f13f88bb4fa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add apache module as for now it is unconditionally used in nut.fc to
fix build failure raised since 991c33e61cbc161d2e4735919591157a61fe07fe

Fixes:
 - http://autobuild.buildroot.org/results/bac65366065d332e250a12f15523f071ce7ee51c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nut/nut.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 3f214c5606..db0247dc2c 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -8,7 +8,7 @@ NUT_VERSION = 03c3bbe8df9a2caf3c09c120ae7045d35af99b76
 NUT_SITE = $(call github,networkupstools,nut,$(NUT_VERSION))
 NUT_LICENSE = GPL-2.0+, GPL-3.0+ (python scripts), GPL/Artistic (perl client)
 NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
-NUT_SELINUX_MODULES = nut
+NUT_SELINUX_MODULES = apache nut
 NUT_INSTALL_STAGING = YES
 NUT_DEPENDENCIES = host-pkgconf host-perl
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
