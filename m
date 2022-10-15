Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E81C433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 14:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B419F81BA9;
	Sat, 15 Oct 2022 14:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B419F81BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2eAJKCuFVn_y; Sat, 15 Oct 2022 14:35:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D429681B48;
	Sat, 15 Oct 2022 14:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D429681B48
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7751B1BF307
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 14:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53F1D405EF
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 14:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53F1D405EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id edpjjlFg1wMF for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 14:34:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 968714012B
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 14:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 968714012B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8094486BE3; Sat, 15 Oct 2022 14:34:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 16:31:02 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 47572329d8156ffbd9fffba7c446b577ffb9dfff
X-Git-Newrev: 207ffb044339bf063e2bd15c6863deb5c0edb2fa
X-Patchwork-Hint: ignore
Message-Id: <20221015143434.8094486BE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/volk: needs C++17,
 not boost
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

commit: https://git.buildroot.net/buildroot/commit/?id=207ffb044339bf063e2bd15c6863deb5c0edb2fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Since volk 2.5.1, C++17 is required, and no Boost component is used
anymore.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[yann.morin.1998@free.fr: split out to its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 66215faa5237e3704d55ff171537468079dda9c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/volk/Config.in | 9 ++-------
 package/volk/volk.mk   | 2 +-
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/volk/Config.in b/package/volk/Config.in
index 95b4a8bdb5..83d58d64ab 100644
--- a/package/volk/Config.in
+++ b/package/volk/Config.in
@@ -1,20 +1,15 @@
 comment "volk needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_VOLK
 	bool "volk"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
-	depends on BR2_USE_WCHAR # boost
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
-	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  VOLK is the Vector-Optimized Library of Kernels. It is a
 	  library that contains kernels of hand-written SIMD code
diff --git a/package/volk/volk.mk b/package/volk/volk.mk
index e7b004b87f..1b36ea69c8 100644
--- a/package/volk/volk.mk
+++ b/package/volk/volk.mk
@@ -15,7 +15,7 @@ VOLK_LICENSE_FILES = COPYING COPYING-LGPL
 VOLK_SUPPORTS_IN_SOURCE_BUILD = NO
 
 # host-python-mako are needed for volk to compile
-VOLK_DEPENDENCIES = host-python3 host-python-mako boost
+VOLK_DEPENDENCIES = host-python3 host-python-mako
 
 VOLK_CONF_OPTS = \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
