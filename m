Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922DAC433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C3B061282;
	Wed, 18 May 2022 19:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fIn5GdC_PGdq; Wed, 18 May 2022 19:22:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51C9D6127F;
	Wed, 18 May 2022 19:22:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 715E11BF9C1
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F08264021C
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:20:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tS1u1Xt_kmpq for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A2D241030
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id ED90886065; Wed, 18 May 2022 19:09:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 21:16:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5962c7ec398cb3b1f0fd4b68f21d66f129104931
X-Git-Newrev: e0c8fb2c6e21a8bc58554c4acef099bb7c1e3d32
X-Patchwork-Hint: ignore
Message-Id: <20220518190952.ED90886065@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/midori: add missing
 !BR2_PACKAGE_GNUPG dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0c8fb2c6e21a8bc58554c4acef099bb7c1e3d32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The !BR2_PACKAGE_GNUPG needs to be propagated from BR2_PACKAGE_GCR.

Fixes:
WARNING: unmet direct dependencies detected for BR2_PACKAGE_GCR
  Depends on [n]: BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && !BR2_STATIC_LIBS [=n] && !BR2_PACKAGE_GNUPG [=y]
  Selected by [y]:
  - BR2_PACKAGE_MIDORI [=y] && BR2_PACKAGE_MIDORI_ARCH_SUPPORTS [=y] && !BR2_STATIC_LIBS [=n] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_HOST_GCC_AT_LEAST_8 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=y] && BR2_TOOLCHAIN_USES_GLIBC [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && BR2_USE_WCHAR [=y] && BR2_PACKAGE_LIBGTK3 [=y] && (BR2_PACKAGE_LIBGTK3_X11 [=y] || BR2_PACKAGE_LIBGTK3_WAYLAND [=n])

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/midori/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index 715295e5a6..308b0a7a42 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -21,10 +21,15 @@ comment "midori needs libgtk3 w/ X11 or wayland backend"
 	depends on !BR2_PACKAGE_LIBGTK3_X11 && \
 		!BR2_PACKAGE_LIBGTK3_WAYLAND
 
+comment "midori is incompatible with gnupg, gnupg2 only"
+	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_GNUPG
+
 config BR2_PACKAGE_MIDORI
 	bool "midori"
 	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS # webkitgtk
+	depends on !BR2_PACKAGE_GNUPG # gcr
 	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
 	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # webkitgtk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
