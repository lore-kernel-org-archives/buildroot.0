Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19615EE645B
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 12:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C3994193C;
	Fri, 15 Sep 2023 12:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C3994193C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HhjzHzybRxYi; Fri, 15 Sep 2023 12:59:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AB0341938;
	Fri, 15 Sep 2023 12:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AB0341938
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98F481BF271
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 12:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B4DB61346
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 12:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B4DB61346
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G3X-sOV-ddGJ for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 12:59:20 +0000 (UTC)
X-Greylist: delayed 566 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 15 Sep 2023 12:59:19 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87FF761341
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87FF761341
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 12:59:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DA3151814B9; Fri, 15 Sep 2023 14:49:48 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 14:49:33 +0200
Message-Id: <20230915124933.2975234-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1694782190; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=2FT+zhRCaH+u478dXiQPJNlQKeo69/51kg++s44iISs=;
 b=AwSvtSOgxFPIPVawTeUea2Q+QLE/GkJ9ukaDd+bL7um3xytAa1x0pxX1lbLL9nJMy76+rn
 5F2IyX4elV61puPaivc3LfwKcXYRVDjdvaz+PZZCHl6YT8lRyauuxaEvYnEyTeXO8nYLx7
 nkB0qJT+9KS2Chk6XuxfLWE9s5z0wdA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=AwSvtSOg
Subject: [Buildroot] [PATCH] package/boost: bump to version 1.83.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- add upstream patch for Unordered available on the Release Page.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---

Compile-tested with the following defconfigs:

BR2_arm=y
BR2_cortex_a15=y
BR2_ARM_FPU_NEON=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_CC_TOOL=y
BR2_PACKAGE_LIBUBOOTENV=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_BOTAN=y
BR2_PACKAGE_LOG4CXX=y
BR2_PACKAGE_LIBCPPRESTSDK=y
BR2_PACKAGE_BOOST_CONTRACT=y
BR2_PACKAGE_BOOST_COROUTINE=y
BR2_PACKAGE_BOOST_EXCEPTION=y
BR2_PACKAGE_BOOST_FIBER=y
BR2_PACKAGE_BOOST_GRAPH=y
BR2_PACKAGE_BOOST_GRAPH_PARALLEL=y
BR2_PACKAGE_BOOST_IOSTREAMS=y
BR2_PACKAGE_BOOST_JSON=y
BR2_PACKAGE_BOOST_LOCALE=y
BR2_PACKAGE_BOOST_LOG=y
BR2_PACKAGE_BOOST_MATH=y
BR2_PACKAGE_BOOST_MPI=y
BR2_PACKAGE_BOOST_NOWIDE=y
BR2_PACKAGE_BOOST_PYTHON=y
BR2_PACKAGE_BOOST_SERIALIZATION=y
BR2_PACKAGE_BOOST_STACKTRACE=y
BR2_PACKAGE_BOOST_TEST=y
BR2_PACKAGE_BOOST_TYPE_ERASURE=y
BR2_PACKAGE_BOOST_URL=y
BR2_PACKAGE_BOOST_WAVE=y
BR2_PACKAGE_BITCOIN=y
BR2_PACKAGE_I2PD=y

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_PULSEVIEW=y
BR2_PACKAGE_GNURADIO=y

BR2_sh=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE=y
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_CONTRACT=y
BR2_PACKAGE_BOOST_EXCEPTION=y
BR2_PACKAGE_BOOST_GRAPH=y
BR2_PACKAGE_BOOST_GRAPH_PARALLEL=y
BR2_PACKAGE_BOOST_IOSTREAMS=y
BR2_PACKAGE_BOOST_JSON=y
BR2_PACKAGE_BOOST_LOCALE=y
BR2_PACKAGE_BOOST_LOG=y
BR2_PACKAGE_BOOST_MATH=y
BR2_PACKAGE_BOOST_MPI=y
BR2_PACKAGE_BOOST_NOWIDE=y
BR2_PACKAGE_BOOST_PROGRAM_OPTIONS=y
BR2_PACKAGE_BOOST_RANDOM=y
BR2_PACKAGE_BOOST_SERIALIZATION=y
BR2_PACKAGE_BOOST_STACKTRACE=y
BR2_PACKAGE_BOOST_TEST=y
BR2_PACKAGE_BOOST_TYPE_ERASURE=y
BR2_PACKAGE_BOOST_URL=y
BR2_PACKAGE_BOOST_WAVE=y

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_CONTRACT=y
BR2_PACKAGE_BOOST_COROUTINE=y
BR2_PACKAGE_BOOST_EXCEPTION=y
BR2_PACKAGE_BOOST_FIBER=y
BR2_PACKAGE_BOOST_GRAPH=y
BR2_PACKAGE_BOOST_GRAPH_PARALLEL=y
BR2_PACKAGE_BOOST_IOSTREAMS=y
BR2_PACKAGE_BOOST_JSON=y
BR2_PACKAGE_BOOST_LOCALE=y
BR2_PACKAGE_BOOST_LOG=y
BR2_PACKAGE_BOOST_MATH=y
BR2_PACKAGE_BOOST_MPI=y
BR2_PACKAGE_BOOST_NOWIDE=y
BR2_PACKAGE_BOOST_PROGRAM_OPTIONS=y
BR2_PACKAGE_BOOST_RANDOM=y
BR2_PACKAGE_BOOST_SERIALIZATION=y
BR2_PACKAGE_BOOST_STACKTRACE=y
BR2_PACKAGE_BOOST_TEST=y
BR2_PACKAGE_BOOST_TYPE_ERASURE=y
BR2_PACKAGE_BOOST_URL=y
BR2_PACKAGE_BOOST_WAVE=y
---
 .../0001-unordered-fix-copy-assign.patch      | 22 +++++++++++++++++++
 package/boost/boost.hash                      |  4 ++--
 package/boost/boost.mk                        |  2 +-
 3 files changed, 25 insertions(+), 3 deletions(-)
 create mode 100644 package/boost/0001-unordered-fix-copy-assign.patch

diff --git a/package/boost/0001-unordered-fix-copy-assign.patch b/package/boost/0001-unordered-fix-copy-assign.patch
new file mode 100644
index 0000000000..55f5ccf245
--- /dev/null
+++ b/package/boost/0001-unordered-fix-copy-assign.patch
@@ -0,0 +1,22 @@
+Upstream Patch for Unordered
+
+Prevent erroneous copying of groups data, update max load to properly propagate
+
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+Upstream: https://github.com/boostorg/unordered/pull/210
+diff --git a/include/boost/unordered/detail/foa/core.hpp b/include/boost/unordered/detail/foa/core.hpp
+index 239d05d3..7ae9f2c8 100644
+--- a/boost/unordered/detail/foa/core.hpp
++++ b/boost/unordered/detail/foa/core.hpp
+@@ -1870,9 +1870,10 @@ private:
+ 
+   void fast_copy_elements_from(const table_core& x)
+   {
+-    if(arrays.elements){
++    if(arrays.elements&&x.arrays.elements){
+       copy_elements_array_from(x);
+       copy_groups_array_from(x);
++      size_ctrl.ml=std::size_t(x.size_ctrl.ml);
+       size_ctrl.size=std::size_t(x.size_ctrl.size);
+     }
+   }
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index 36de2b9b06..14403758ac 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,5 +1,5 @@
-# From https://www.boost.org/users/history/version_1_82_0.html
-sha256  a6e1ab9b0860e6a2881dd7b21fe9f737a095e5f33a3a874afc6a345228597ee6  boost_1_82_0.tar.bz2
+# From https://www.boost.org/users/history/version_1_83_0.html
+sha256  6478edfe2f3305127cffe8caf73ea0176c53769f4bf1585be237eb30798c3b8e  boost_1_83_0.tar.bz2
 
 # Locally computed
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index d432ab48cc..9b1baec5bf 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.82.0
+BOOST_VERSION = 1.83.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = https://boostorg.jfrog.io/artifactory/main/release/$(BOOST_VERSION)/source
 BOOST_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
