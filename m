Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E46BC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25B4760FE2;
	Mon,  4 Apr 2022 19:36:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l0-z0wSUC6OG; Mon,  4 Apr 2022 19:36:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30FBB60E8C;
	Mon,  4 Apr 2022 19:36:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14B381BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0383560E8C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uvM7IN_DTq8s for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:36:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F98F60BEF
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:36:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 929AC82626; Mon,  4 Apr 2022 19:27:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:35:44 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e86a176c9bc9621fa51dd7ad080e89720f74f161
X-Git-Newrev: 3002bbcc4cf998179737a3e353c015e54a1dde08
X-Patchwork-Hint: ignore
Message-Id: <20220404192711.929AC82626@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/xmrig: needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=3002bbcc4cf998179737a3e353c015e54a1dde08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

xmrig needs C++ since its addition in commit
6f70990ccf6cb993fc31519337390e436d15493b:

CMake Error at CMakeLists.txt:2 (project):
  No CMAKE_CXX_COMPILER could be found.

Fixes:
 - http://autobuild.buildroot.org/results/48f4ff6dc8281ffa99a45401b5941b28f2c94bc2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2d806891cb0dc0fd2d30171d14bc9e911abbe76e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xmrig/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/Config.in b/package/xmrig/Config.in
index 7024241017..c5c6b3e37b 100644
--- a/package/xmrig/Config.in
+++ b/package/xmrig/Config.in
@@ -8,15 +8,17 @@ config BR2_PACKAGE_XMRIG
 	# xmrig needs fenv.h which is not provided by uclibc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on !BR2_STATIC_LIBS # libuv
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBUV
 	help
 	  RandomX, CryptoNight, AstroBWT and Argon2 CPU/GPU miner.
 
 	  https://xmrig.com
 
-comment "xmrig needs a glibc or musl toolchain w/ NPTL, dynamic library"
+comment "xmrig needs a glibc or musl toolchain w/ NPTL, dynamic library, C++"
 	depends on BR2_aarch64 || BR2_x86_64 || BR2_i386
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		BR2_TOOLCHAIN_USES_UCLIBC || BR2_STATIC_LIBS
+		BR2_TOOLCHAIN_USES_UCLIBC || BR2_STATIC_LIBS || \
+		!BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
