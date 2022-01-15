Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7D0C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92EB6401EE;
	Sat, 15 Jan 2022 11:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2zkzWtNdOdVR; Sat, 15 Jan 2022 11:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8042408DC;
	Sat, 15 Jan 2022 11:21:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C35491BF2E4
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABC564010E
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S3dW1l8fuTp6 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:20:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 976E6400C8
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:20:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A769282A39; Sat, 15 Jan 2022 11:13:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 12:16:00 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: b287106c74d969c0c185d7da389fe7065e5e167b
X-Git-Newrev: d87b0813b2555dfc855daac54074f0638a2b22b6
X-Patchwork-Hint: ignore
Message-Id: <20220115111353.A769282A39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libvirt: fix
 dependencies in Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=d87b0813b2555dfc855daac54074f0638a2b22b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Drop spurious "depends on WCHAR" added with commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1 and adds missing wchar comment

While at it, drop BR2_USE_MMU from comment as it is already added by
BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS and fix indentation before
(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 || !BR2_aarch64))

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 250e96580391e130951152ae1bf9abc485d637bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvirt/Config.in | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 5693ecb4cc..e75f1cf15f 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -5,12 +5,12 @@ config BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
 	default y if BR2_x86_64
 	depends on BR2_USE_MMU # fork()
 
-comment "libvirt needs udev /dev management, a toolchain w/ threads, dynamic library, kernel headers >= 3.12 (4.11 for AArch64)"
+comment "libvirt needs udev /dev management, a toolchain w/ threads, dynamic library, wchar, kernel headers >= 3.12 (4.11 for AArch64)"
 	depends on BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
-	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || !BR2_USE_MMU || \
-		!BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		!(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 && \
-		  (BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 || !BR2_aarch64))
+			(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 || !BR2_aarch64))
 
 config BR2_PACKAGE_LIBVIRT
 	bool "libvirt"
@@ -19,7 +19,6 @@ config BR2_PACKAGE_LIBVIRT
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 || !BR2_aarch64
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GNUTLS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
