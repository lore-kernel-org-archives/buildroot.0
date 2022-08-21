Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EE2C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 13:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB3134026A;
	Sun, 21 Aug 2022 13:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB3134026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rdCvHiOiE7Cn; Sun, 21 Aug 2022 13:15:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB45A404F9;
	Sun, 21 Aug 2022 13:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB45A404F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E3B4D1BF30D
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 13:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD8F54097A
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 13:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD8F54097A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zxtVcv3C9dfi for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 13:15:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A765A4095F
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 13:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A765A4095F
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A205987A25; Sun, 21 Aug 2022 13:01:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Aug 2022 15:13:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0a96f73643fa2f2aff24deaaef17011f4d3e0e6
X-Git-Newrev: d05fa7b3bdde2b2c34747778a4d15e8c16575cfe
X-Patchwork-Hint: ignore
Message-Id: <20220821130109.A205987A25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zeek: needs C++17
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

commit: https://git.buildroot.net/buildroot/commit/?id=d05fa7b3bdde2b2c34747778a4d15e8c16575cfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zeek needs C++17 since its addition in commit
ea36681572255ec906167308c07adc42ed2ac9f9 resulting in the following
build failure:

CMake Error at auxil/bifcl/cmake/RequireCXX17.cmake:46 (message):
  GCC version must be at least 7.0 for C++17 support, detected: 6.3.0

Fixes:
 - http://autobuild.buildroot.org/results/4d11e8bea1f7ed0b04cd7e123ed2f352e7a9e77f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zeek/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/zeek/Config.in b/package/zeek/Config.in
index f2a769621f..114ec4235d 100644
--- a/package/zeek/Config.in
+++ b/package/zeek/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_ZEEK
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-zeek
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
@@ -33,7 +35,9 @@ config BR2_PACKAGE_ZEEK_ZEEKCTL
 
 endif
 
-comment "zeek needs a toolchain w/ C++, wchar, threads, dynamic library"
+comment "zeek needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 7, host gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_HOST_GCC_AT_LEAST_7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
