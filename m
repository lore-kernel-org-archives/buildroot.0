Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAACEC6FA86
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 08:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8771141D11;
	Sat, 17 Sep 2022 08:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8771141D11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rWtJXkjRs2-4; Sat, 17 Sep 2022 08:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ECDE41CFD;
	Sat, 17 Sep 2022 08:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ECDE41CFD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21A4F1BF82F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D03E44018F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D03E44018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lv7BwlrLtxFt for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 08:13:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F103A40190
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 08:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F103A40190
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DD92383FAE; Sat, 17 Sep 2022 08:13:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 10:11:12 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5651a7659847719dfaa140e94205fe6469115c55
X-Git-Newrev: 86b97b317474d9f4bcdab8ea926a2026265f17d7
X-Patchwork-Hint: ignore
Message-Id: <20220917081344.DD92383FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/usbguard: needs
 gcc >= 8
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

commit: https://git.buildroot.net/buildroot/commit/?id=86b97b317474d9f4bcdab8ea926a2026265f17d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure raised since the addition of the package
in commit fbff7d7289cc95db991184f890f4ca1fcf8a101e and
https://github.com/USBGuard/usbguard/commit/4b4551023e3298a3639d2c52c559556dbe8d2d54:

checking whether we need to link to -lstdc++fs for PEGTL explicitly... ERROR
configure: error: Link test failed both with and without -lstdc++fs; something is broken, please check file config.log for details.

Fixes:
 - http://autobuild.buildroot.org/results/511c47802ce171caeeb9919371c58e6ad2d11a78

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 442cbf469131fd27d3db7326ff8fc3464cf1b005)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usbguard/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
index ca6d52034b..458caf960d 100644
--- a/package/usbguard/Config.in
+++ b/package/usbguard/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_USBGUARD
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libqb, protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
 	depends on !BR2_STATIC_LIBS # libqb, protobuf
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
@@ -19,9 +19,9 @@ config BR2_PACKAGE_USBGUARD
 
 	  https://usbguard.github.io/
 
-comment "usbguard needs a glibc or uClibc toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+comment "usbguard needs a glibc or uClibc toolchain w/ C++, threads, dynamic library, gcc >= 8"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 \
 		|| BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
