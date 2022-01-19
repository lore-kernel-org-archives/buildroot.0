Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3774C433F5
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 21:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7865A4158B;
	Wed, 19 Jan 2022 21:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C4Jr4w3DSToW; Wed, 19 Jan 2022 21:39:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB9F941581;
	Wed, 19 Jan 2022 21:39:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26BAD1BF3FC
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1580B408D2
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nWjoqXTE8XY7 for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 21:38:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F1D44154B
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 21:38:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9A7FF835AB; Wed, 19 Jan 2022 21:32:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Jan 2022 22:34:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3d5b27d5d24079d6c30c568c58e3a5e7c6e3fc7
X-Git-Newrev: f6297befe176a2f33b8c598139f73d7e0b9f91c9
X-Patchwork-Hint: ignore
Message-Id: <20220119213205.9A7FF835AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/enlightenment: change download URL
 to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6297befe176a2f33b8c598139f73d7e0b9f91c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998@free.fr: also change in Config.in]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/enlightenment/Config.in        | 2 +-
 package/enlightenment/enlightenment.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index cd2b8cfe54..cdf4d9211f 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -27,7 +27,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	  KDE. Enlightenment can be used as a substitute for a full
 	  desktop environment.
 
-	  http://www.enlightenment.org/
+	  https://www.enlightenment.org/
 
 comment "enlightenment needs udev /dev management and a toolchain w/ wchar, C++, threads, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 640d5a62bb..24bbd96cd0 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -6,7 +6,7 @@
 
 ENLIGHTENMENT_VERSION = 0.25.0
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
-ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
+ENLIGHTENMENT_SITE = https://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2-Clause, OFL-1.1 (font)
 ENLIGHTENMENT_LICENSE_FILES = COPYING \
 	src/modules/wl_weekeyboard/themes/default/fonts/LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
