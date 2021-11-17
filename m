Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90556C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:10:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53CD961BCF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53CD961BCF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20C8E4091F;
	Wed, 17 Nov 2021 15:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NUgiGLWDzvbi; Wed, 17 Nov 2021 15:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 705D440934;
	Wed, 17 Nov 2021 15:10:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 602461BF36B
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BB6C40494
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:09:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z8b_3JEaUlEP for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 15:09:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 929AE40926
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 15:09:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 270188D47B; Wed, 17 Nov 2021 15:05:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 16:04:01 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 384f34e1df41ac13a27b42cd4932b5e0c91f27c8
X-Git-Newrev: dc50e2a152ddd70ea0a1a4b9ba3353a8e7f74bac
X-Patchwork-Hint: ignore
Message-Id: <20211117150507.270188D47B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] boot/uboot: don't
 override dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc50e2a152ddd70ea0a1a4b9ba3353a8e7f74bac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Don't override UBOOT_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9de2c792e19d572645d1a2e813516fd8e541fa4f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 4f3c9b7c3a..6b6d67990a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -500,7 +500,7 @@ UBOOT_DEPENDENCIES += \
 $(eval $(generic-package))
 else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
 UBOOT_MAKE_ENV = $(TARGET_MAKE_ENV)
-UBOOT_KCONFIG_DEPENDENCIES = \
+UBOOT_KCONFIG_DEPENDENCIES += \
 	$(BR2_MAKE_HOST_DEPENDENCY) \
 	$(BR2_BISON_HOST_DEPENDENCY) \
 	$(BR2_FLEX_HOST_DEPENDENCY)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
