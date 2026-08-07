Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03C4C5AC9E
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AC6C60A51;
	Fri,  7 Aug 2026 09:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhXumkGDjVZi; Fri,  7 Aug 2026 09:35:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11C4160A40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095354;
	bh=WLB6fB5F981z5B8ICBhSZmZj+xJVYxEce1j7JJiSZmc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qa6i2KTjHo7HrYUmjZxsuOzN7mehEwr1bLFsZExXgP0BxxfkHyVPcFAsNpQ6zbM9K
	 knSV2rErHy4J39LZ9vOamJXmi1ot6P8oNaLKneoL33PUMdETjfRfCz/03/nW/IR/uf
	 gNxUq7PxvGWaV9ZhmX77j9URDRvtMwrNEdTZA8mdlu6Xx2FEw/6FvtpJ1pydTGr5PC
	 Z+ULJSmOLQNq3Jj7+bPgV3rXKfDt4r8btghbF6HxPsUh19HCBHkp/4stqgbacB/FzT
	 lTGWlq9F7TXuusLK20D6YSoQI0BSgh/d0Wy376aFPaf096MjqRcwnGg1IrO7dadkub
	 T9Al+QRaErQog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11C4160A40;
	Fri,  7 Aug 2026 09:35:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B51ED3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 894B1409FB
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qjl_hQUjQpQa for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6C7B40A19
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6C7B40A19
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C8258CA43; Fri,  7 Aug 2026 09:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:12:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 66e1be310b3a6638e4625dd507f8fe9b05b99e5f
X-Git-Newrev: 67b026da25c1b87709b0eea8d94d8ee2ca51cd06
X-Patchwork-Hint: ignore
Message-Id: <20260807093442.6C8258CA43@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/armadillo: needs
 gcc >= 8
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/67b026da25c1b87709b0eea8d94d8ee2ca51cd06
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Upstream bumped the minimum required gcc version from 6.1 to 8.1 in
commit 84ec3ddf9fd3 ("bump minimum gcc version to 8.1"), so the build
now fails with "Compiler too old; need at least gcc 8.1" on older
toolchains.

There is no gcc 8.0.x release (the 8.x series starts at 8.1.0), so
BR2_TOOLCHAIN_GCC_AT_LEAST_8 is enough to express this dependency.

While at it, add the gcc version to the openblas-arch comment, which
only checked for C++ support and would therefore stay hidden on
toolchains that are too old.

Fixes: 597d5d10ec77 ("package/armadillo: bump to version 15.0.1")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cec50f48d6b2f2d2b8683b1637e4513a5acb0d5a)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/armadillo/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index 7a93343d41..7b66179fb8 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -1,19 +1,19 @@
-comment "armadillo needs a toolchain w/ C++"
+comment "armadillo needs a toolchain w/ C++, gcc >= 8"
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
-comment "armadillo needs a toolchain w/ fortran, C++, gcc >= 4.9"
+comment "armadillo needs a toolchain w/ fortran, C++, gcc >= 8"
 	depends on !BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # otherwise, see comment above
 	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_ARMADILLO
 	bool "armadillo"
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS || \
 		(BR2_PACKAGE_LAPACK_ARCH_SUPPORTS && BR2_TOOLCHAIN_HAS_FORTRAN)
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # armadillo requires gcc >= 8.1
 	help
 	  Armadillo: An Open Source C++ Linear Algebra Library for
 	  Fast Prototyping and Computationally Intensive Experiments.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
