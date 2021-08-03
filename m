Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00EFC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:14:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A34FE61037
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A34FE61037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B44A42393;
	Wed,  4 Aug 2021 01:14:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ja0q_uN1e1Gn; Wed,  4 Aug 2021 01:14:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B16754225C;
	Wed,  4 Aug 2021 01:14:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2D5D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45F7340493
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6xqveRX5iOJi for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9112941514
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DC21E84394; Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 22:49:16 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d7a260f8bc94f1577006c0dab1e3289242039f4d
X-Git-Newrev: bef605b08a40efa5e4d5e9845822141a00b8eef3
X-Patchwork-Hint: ignore
Message-Id: <20210803211028.DC21E84394@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/armadillo: allow to
 select between lapack or openblas
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=bef605b08a40efa5e4d5e9845822141a00b8eef3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

armadillo can use lapack or openblas as BLAS provider. LAPACK support is
optional.

This patch
- adds an _ARCH_SUPPORTS variable to check if one is available
- adds an option to choose lapack or openblas as BLAS provider

The choice is required since applications may potentially need lapack.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/armadillo/Config.in    | 34 ++++++++++++++++++++++++++--------
 package/armadillo/armadillo.mk | 18 +++++++++++++++++-
 2 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index b2b61a3233..7aed4fd02f 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -1,20 +1,38 @@
 comment "armadillo needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_powerpc
-	depends on !BR2_m68k_cf
 
-comment "armadillo needs a glibc toolchain w/ C++"
-	depends on BR2_powerpc
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_TOOLCHAIN_USES_UCLIBC
+comment "armadillo needs a toolchain w/ fortran, C++"
+	depends on !BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # otherwise, see comment above
+	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_ARMADILLO
 	bool "armadillo"
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS || \
+		(BR2_PACKAGE_LAPACK_ARCH_SUPPORTS && BR2_TOOLCHAIN_HAS_FORTRAN)
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
-	depends on !BR2_m68k_cf # clapack
-	select BR2_PACKAGE_CLAPACK
 	help
 	  Armadillo: An Open Source C++ Linear Algebra Library for
 	  Fast Prototyping and Computationally Intensive Experiments.
 
 	  http://arma.sourceforge.net/
+
+if BR2_PACKAGE_ARMADILLO
+
+choice
+	prompt "BLAS implementation"
+
+config BR2_PACKAGE_ARMADILLO_OPENBLAS
+	bool "openblas"
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
+	select BR2_PACKAGE_OPENBLAS
+
+config BR2_PACKAGE_ARMADILLO_LAPACK
+	bool "lapack"
+	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS && BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_PACKAGE_LAPACK
+
+endchoice
+
+endif
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 624b842ef6..dcac2bf8cd 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -7,11 +7,27 @@
 ARMADILLO_VERSION = 9.900.2
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
-ARMADILLO_DEPENDENCIES = clapack
 ARMADILLO_INSTALL_STAGING = YES
 ARMADILLO_LICENSE = Apache-2.0
 ARMADILLO_LICENSE_FILES = LICENSE.txt
 
 ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false
 
+# blas support may be provided by lapack (libblas.a) or openblas (libopenblas.a)
+ARMADILLO_CONF_OPTS += -DBLAS_FOUND=ON
+ifeq ($(BR2_PACKAGE_ARMADILLO_OPENBLAS),y)
+ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lopenblas
+ARMADILLO_DEPENDENCIES = openblas
+else
+# Since BR2_PACKAGE_LAPACK is selected in this case, the dependency on it is
+# added below.
+ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lblas
+endif
+
+# lapack support is optional and can only be provided by lapack, not openblas
+ifeq ($(BR2_PACKAGE_LAPACK),y)
+ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
+ARMADILLO_DEPENDENCIES += lapack
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
