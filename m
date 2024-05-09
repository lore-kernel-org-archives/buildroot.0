Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFCEC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1538416B7;
	Thu,  9 May 2024 16:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7cL2Op1Jutn; Thu,  9 May 2024 16:54:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C7D5416BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C7D5416BA;
	Thu,  9 May 2024 16:54:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B37AD1BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD93660FC9
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IU33CDmec42n for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 003FD6067E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 003FD6067E
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:54:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF18086D09; Thu,  9 May 2024 16:54:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 18:52:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93a7b372f1ffff2d1b0e373d2490777bdee2157e
X-Git-Newrev: b9b072f83c1f2a55b54405b2dc28e6586b59b74b
X-Patchwork-Hint: ignore
Message-Id: <20240509165424.CF18086D09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ivi-homescreen: drop bogus comment
 dependency on NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9b072f83c1f2a55b54405b2dc28e6586b59b74b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
