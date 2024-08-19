Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA47C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 21:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2268605AF;
	Mon, 19 Aug 2024 21:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ccH-250O-N0v; Mon, 19 Aug 2024 21:05:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1D24605C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1D24605C6;
	Mon, 19 Aug 2024 21:05:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03C661BF398
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 21:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F136D80F5B
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 21:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWwFb345Vei1 for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 21:05:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F47480C5D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F47480C5D
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 21:05:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B18F86103; Mon, 19 Aug 2024 21:05:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 23:05:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa50907d83947091117e869fbf98bca1747637bd
X-Git-Newrev: 10a70b1af67cf79986c2e401f7a54aa850ea82d6
X-Patchwork-Hint: ignore
Message-Id: <20240819210553.0B18F86103@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/botan: needs gcc >= 11
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

commit: https://git.buildroot.net/buildroot/commit/?id=10a70b1af67cf79986c2e401f7a54aa850ea82d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "using enum" was added in gcc 11.x [0] (see also [1]).

Compile successfully tested with internal Buildroot toolchain for
sparc with gcc 12.x as gcc 11.x is not available anymore.

The autobuild failure will be avoided now and fixed with newer external
bootlin toolchains.

Fixes:
 - http://autobuild.buildroot.org/results/ab8/ab83b920156f5a1e51ef960e4007769b5c27d0a1

[0] https://gcc.gnu.org/projects/cxx-status.html#cxx20
[1] https://stackoverflow.com/questions/75018634/how-to-use-the-using-keyword-in-gcc-10-4

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/botan/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index c61b368801..305cc2fe8c 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 config BR2_PACKAGE_BOTAN
 	bool "botan"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11 # C++20
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
@@ -24,8 +24,8 @@ config BR2_PACKAGE_BOTAN
 
 	  http://botan.randombit.net
 
-comment "botan needs a toolchain w/ threads, C++, gcc >= 10"
+comment "botan needs a toolchain w/ threads, C++, gcc >= 11"
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_11 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
