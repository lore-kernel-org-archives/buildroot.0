Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1E6C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86E514060C;
	Tue, 14 Dec 2021 20:12:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZqjvyAOwCf90; Tue, 14 Dec 2021 20:12:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA2D4405ED;
	Tue, 14 Dec 2021 20:12:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B70A1BF30E
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3689940114
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fe9uoMHiy4a7 for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:10:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57B0F405ED
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:10:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 53D0F81EB3; Tue, 14 Dec 2021 20:05:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 20:56:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86f91e14b5c158d4533909656c8174b6f28760af
X-Git-Newrev: 250e96580391e130951152ae1bf9abc485d637bb
X-Patchwork-Hint: ignore
Message-Id: <20211214200520.53D0F81EB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirt: fix dependencies in
 Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=250e96580391e130951152ae1bf9abc485d637bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious "depends on WCHAR" added with commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1 and adds missing wchar comment

While at it, drop BR2_USE_MMU from comment as it is already added by
BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS and fix indentation before
(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 || !BR2_aarch64))

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
