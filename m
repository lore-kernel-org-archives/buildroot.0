Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2519BC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 19:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD83E82F76;
	Tue,  5 Apr 2022 19:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HDoe2v5bT7_3; Tue,  5 Apr 2022 19:49:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50F79828BA;
	Tue,  5 Apr 2022 19:49:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E510C1BF21A
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 19:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2FE7405E8
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 19:49:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v5XMHWBJdoJG for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 19:49:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3172B402F3
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 19:49:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 417C183621; Tue,  5 Apr 2022 19:39:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Apr 2022 21:48:14 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6de440a5c533b68d45614e13bba5fc296ca5d483
X-Git-Newrev: b927353cb6606c415566c3a83b12b4d14ae0bbed
X-Patchwork-Hint: ignore
Message-Id: <20220405193949.417C183621@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/wireshark: needs
 C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=b927353cb6606c415566c3a83b12b4d14ae0bbed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

wireshark needs C++ since switch to cmake-package in commit
7cb7fb8191fc52c1e2cc8b4b15ea52fd12c30d9a:

CMake Error at CMakeLists.txt:32 (project):
  No CMAKE_CXX_COMPILER could be found.

Fixes:
 - http://autobuild.buildroot.org/results/1ce9bc2a2330e27dfaceae682139d222feb806ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 3763c30214d6c16c744c1e03a9ae7fe6fd061165)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 95fc9b38f3..fdeb9da259 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_WIRESHARK
 	depends on BR2_USE_MMU # fork(), glib2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGCRYPT
@@ -45,8 +46,8 @@ comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL, host
 
 endif # BR2_PACKAGE_WIRESHARK
 
-comment "wireshark needs a toolchain w/ wchar, threads, dynamic library"
+comment "wireshark needs a toolchain w/ wchar, threads, dynamic library, C++"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
