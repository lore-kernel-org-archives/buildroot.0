Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3860C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86723405FA;
	Wed, 27 Jul 2022 15:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86723405FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i0pxlTBbFZJL; Wed, 27 Jul 2022 15:02:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6BEA405E0;
	Wed, 27 Jul 2022 15:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6BEA405E0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71DAA1BF4E4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C6BA60BDD
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:02:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C6BA60BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iRgCDgXCIDHD for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:02:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E39560B00
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E39560B00
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3CF54866CE; Wed, 27 Jul 2022 14:48:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 17:00:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3146e0a179b8f88512e3d0978f20a8667cd512a
X-Git-Newrev: 0defd5391b549ea2d23285927f61510f2b02e60b
X-Patchwork-Hint: ignore
Message-Id: <20220727144847.3CF54866CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package: drop csky conditionals
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0defd5391b549ea2d23285927f61510f2b02e60b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-greenlet/Config.in | 1 -
 package/sedutil/Config.in         | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-greenlet/Config.in b/package/python-greenlet/Config.in
index c73eeb7b15..9f66ebe119 100644
--- a/package/python-greenlet/Config.in
+++ b/package/python-greenlet/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_GREENLET_ARCH_SUPPORTS
 	bool
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_aarch64
-	default y if BR2_csky
 	default y if BR2_m68k
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
diff --git a/package/sedutil/Config.in b/package/sedutil/Config.in
index f3452b60fb..e695f2bed7 100644
--- a/package/sedutil/Config.in
+++ b/package/sedutil/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SEDUTIL_ARCH_SUPPORTS
 	bool
 	# no big endian support
-	default y if BR2_arcle || BR2_arm || BR2_aarch64 || BR2_csky \
+	default y if BR2_arcle || BR2_arm || BR2_aarch64 \
 	       || BR2_i386 || BR2_microblazeel || BR2_mipsel \
 	       || BR2_mips64el || BR2_nios2 || BR2_powerpc64le \
 	       || BR2_sh4 || BR2_sh4a || BR2_x86_64 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
