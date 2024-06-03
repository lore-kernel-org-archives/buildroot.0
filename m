Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C6CC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 17:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C1CF40922;
	Mon,  3 Jun 2024 17:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kby-26lCgUXy; Mon,  3 Jun 2024 17:34:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 324F8408E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 324F8408E3;
	Mon,  3 Jun 2024 17:34:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 928311BF232
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 17:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F53B607C7
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 17:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RC1smPc2NvVX for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 17:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC2FE6077C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC2FE6077C
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 17:34:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A256787A1C; Mon,  3 Jun 2024 17:34:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 18:00:23 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 923ab8a7d57ba93adda9b46866705d6a74f41f8c
X-Git-Newrev: 5dcf2d88497cbdafd7b224ab58616eb8b9d7ab27
X-Patchwork-Hint: ignore
Message-Id: <20240603173429.A256787A1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/ivi-homescreen:
 drop bogus comment dependency on NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=5dcf2d88497cbdafd7b224ab58616eb8b9d7ab27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

As part of the review process of the ivi-homescreen package, which
landed in commit 9d8497e79de3ced144877ba6ee38cc5b7181aaeb, it was
deemed that the dependency on BR2_TOOLCHBAIN_HAS_THREAD_NPTL was not
needed, as it was implied by glibc. According to the commit log:

    [yann.morin.1998@free.fr:
      - propagate BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS to comments
      - drop NPTL, implied by glibc
      - reorder dependencies in a more logical way
      - reorder comments
      - drop undefined BR2_PACKAGE_IVI_HOMESCREEN_HAS_CLIENT
      - grammar ("for to change")
    ]
    Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

However, while the BR2_TOOLCHBAIN_HAS_THREAD_NPTL dependency was
removed from the BR2_PACKAGE_IVI_HOMESCREEN option definition, the
corresponding dependency in the Config.in comment was not
dropped. Let's bring things back in sync.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b9b072f83c1f2a55b54405b2dc28e6586b59b74b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ivi-homescreen/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
index c24df05b6d..dc2ccb0c97 100644
--- a/package/ivi-homescreen/Config.in
+++ b/package/ivi-homescreen/Config.in
@@ -250,10 +250,10 @@ comment "OpenGL texture plugin needs an EGL backend"
 
 endif # BR2_PACKAGE_IVI_HOMESCREEN
 
-comment "ivi-homescreen needs a glibc toolchain w/ wchar, C++, gcc >= 5, dynamic library, host gcc >= 5, NPTL"
+comment "ivi-homescreen needs a glibc toolchain w/ wchar, C++, gcc >= 5, dynamic library, host gcc >= 5"
 	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+	depends on !BR2_TOOLCHAIN_USES_GLIBC \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
 		|| !BR2_HOST_GCC_AT_LEAST_5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
