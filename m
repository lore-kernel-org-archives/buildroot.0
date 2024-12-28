Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE224E7718F
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 10:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EC99403C0;
	Sat, 28 Dec 2024 10:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Potwu-FhJH84; Sat, 28 Dec 2024 10:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31BA4403B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31BA4403B2;
	Sat, 28 Dec 2024 10:32:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BC36E0
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C4978055C
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8s_fOaWOPMoj for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 10:32:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34A3980553
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34A3980553
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:32:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B3DB87532; Sat, 28 Dec 2024 10:32:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 11:29:42 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 9e727017609893fb214bdfa7e3770f024105bc69
X-Git-Newrev: 03da88e053a0f48ccd67c34df71fc66e0409aae5
X-Patchwork-Hint: ignore
Message-Id: <20241228103227.1B3DB87532@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/webkitgtk: needs
 NPTL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=03da88e053a0f48ccd67c34df71fc66e0409aae5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Fixes build error

/home/buildroot/buildroot/output/build/webkitgtk-2.44.2/Source/WTF/wtf/StackBounds.cpp: In static member function 'static WTF::StackBounds WTF::StackBounds::newThreadStackBounds(WTF::PlatformThreadHandle)':
/home/buildroot/buildroot/output/build/webkitgtk-2.44.2/Source/WTF/wtf/StackBounds.cpp:117:5: error: 'pthread_getattr_np' was not declared in this scope; did you mean 'pthread_attr_t'?
  117 |     pthread_getattr_np(thread, &sattr);

using this defconfig (and libvpx bump to 1.15.0 reverted)

BR2_arm=y
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PTHREADS=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_RPI_USERLAND=y
BR2_PACKAGE_LIBGTK3=y
BR2_PACKAGE_WEBKITGTK=y

A backport of this patch should be considered because the code is
present since 2011:
https://github.com/WebKit/WebKit/blame/03f678fac7076e4d69318bfaae065e4c0eab0f9e/Source/WTF/wtf/StackBounds.cpp#L117

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 054e5c4d22e9e235d1818baa1333ca4abace50ea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index e6ab405cd5..dca62cf0f8 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -16,11 +16,11 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 10, host gcc >= 4.9"
+comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 10, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		!BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
@@ -32,7 +32,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_LIBGTK3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
