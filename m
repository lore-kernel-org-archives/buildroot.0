Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C798C55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 20:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D172540648;
	Mon,  3 Aug 2026 20:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Grs_PszVfeJu; Mon,  3 Aug 2026 20:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F7AE40612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785789531;
	bh=Ko/yQrDCpXwN0zkQTfnpy9Di5ZwkKQPxqLz0Id/rDXI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=geNB4BhMJjRVN6r+G5p3T08Pz1wLbK6SkvMVhICsi2e/RRgajW7qp5IRPjQJ2n+pc
	 VOFzyvORTgaam7rQGIo44bEqImivGCRtnmDLnHDYuqfhx3MPZi1xmrHZe44txSmxMM
	 8/RyTZtN9/fL160aRte44N+PcH7/kc8kqZrQc130/RftfVF5QCY7/cO36swuuDRUJm
	 pd9uSFFQOEVnQMamulVEL+x404SF00vHBqIrtwGH2wnlbfiXsTQdlmlLmQFfRN0gWU
	 +3V2puNyC/x/PTQiTf4B/Nmaekrp8XbBNXfZXbmKjippysJrgrdRmerSk1TBAyXta8
	 nyX2clkuOOjuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F7AE40612;
	Mon,  3 Aug 2026 20:38:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B72EC194
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 20:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A01D360648
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 20:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hr7B7Ye1evIU for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 20:38:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDB906061D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDB906061D
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 20:38:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08B148B860; Mon,  3 Aug 2026 20:38:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Aug 2026 22:37:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95cdea9bddf322b94970a61f129c4b75fed94c27
X-Git-Newrev: fef9cad1fe84b4366e705adb03470e12199ffd25
X-Patchwork-Hint: ignore
Message-Id: <20260803203804.08B148B860@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlsec1: bump version to 1.3.12
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4181848876973161948=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4181848876973161948==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fef9cad1fe84b4366e705adb03470e12199ffd25
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update libxmlsec from 1.3.9 to 1.3.12. The package then needs a few
adjustments:
- there are undefined references to xmlDebugDumpDocument ([1]):

  unit_tests/transform_helpers_unit_tests.c:291:9: error: implicit
  declaration of function ‘xmlDebugDumpDocument’
  [-Wimplicit-function-declaration]

This is due to xmlsec1 unit tests being built systematically, and
depending on libxml2 being built with --with-debug, so patch
apps/Makefile.am accordingly at build time to disable unit tests build.

- the build can fail with older GCC versions due to an unimplemented
  parameter ([2]):

  aarch64-linux-gcc.br_real: error: unrecognized command line option \
  ‘-Wformat-overflow=2’; did you mean ‘-Wstrict-overflow=’?

This format-overflow parameter has been implemented in GCC 7, so make
the package depend on GCC >= 7. Another solution could have been to
pass --disable-pedantic to the package's configure, but that sounds a
bit strong just to disable a parameter that has been exisiting for
almost 10 years.

- the build can fail on missing atomics ([3]):

  [...]/bootlin-m68k-5208-uclibc/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real:
  [...]/bootlin-m68k-5208-uclibc/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/libcrypto.a(libcrypto-lib-threads_pthread.o):
  in function `CRYPTO_atomic_store': threads_pthread.c:(.text+0xcd2):
  undefined reference to `__atomic_is_lock_free'

So make the package depend on libatomic.

This commit updates the license hash, after a year update in [4].

[1] https://gitlab.com/jolivain/buildroot/-/pipelines/2527527034
[2] https://gitlab.com/jolivain/buildroot/-/jobs/14449681615
[3] https://gitlab.com/jolivain/buildroot/-/jobs/14449681621
[4] https://github.com/lsh123/xmlsec/commit/2e557ee8a0b895f03be2f0295cb99e4035b3b53e

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Co-Developed-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
[Julien: update license hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libxmlsec1/Config.in       |  5 +++++
 package/libxmlsec1/libxmlsec1.hash |  4 ++--
 package/libxmlsec1/libxmlsec1.mk   | 10 +++++++++-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/package/libxmlsec1/Config.in b/package/libxmlsec1/Config.in
index 4a686853ae..782e6ced7c 100644
--- a/package/libxmlsec1/Config.in
+++ b/package/libxmlsec1/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBXMLSEC1
 	bool "libxmlsec1"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 #-Wformat-overflow
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBXML2
 	help
@@ -10,3 +12,6 @@ config BR2_PACKAGE_LIBXMLSEC1
 
 	  https://www.aleksey.com/xmlsec/
 	  https://github.com/lsh123/xmlsec
+
+comment "libxmlsec1 needs a toolchain w/ gcc >= 7"
+	depends on  !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_TOOLCHAIN_HAS_ATOMIC
diff --git a/package/libxmlsec1/libxmlsec1.hash b/package/libxmlsec1/libxmlsec1.hash
index 9e0e67e732..d9cb16a1c2 100644
--- a/package/libxmlsec1/libxmlsec1.hash
+++ b/package/libxmlsec1/libxmlsec1.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a631c8cd7a6b86e6adb9f5b935d45a9cf9768b3cb090d461e8eb9d043cf9b62f  xmlsec1-1.3.9.tar.gz
-sha256  d5e9388534256360c6a009d4f19ab2b8d6ec0aa7ff32a51e22d899ed7beb5c48  Copyright
+sha256  24045199af12d93fe5fdbbbf7e386e823e4842071e9432e2b90ac108b889a923  xmlsec1-1.3.12.tar.gz
+sha256  a6d217151f3d423e06639c075bad8e442ea1936828d3a660105122ef78ecd96d  Copyright
diff --git a/package/libxmlsec1/libxmlsec1.mk b/package/libxmlsec1/libxmlsec1.mk
index 29222bc16f..88f0ae9fd9 100644
--- a/package/libxmlsec1/libxmlsec1.mk
+++ b/package/libxmlsec1/libxmlsec1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXMLSEC1_VERSION = 1.3.9
+LIBXMLSEC1_VERSION = 1.3.12
 LIBXMLSEC1_SOURCE = xmlsec1-$(LIBXMLSEC1_VERSION).tar.gz
 LIBXMLSEC1_SITE = https://github.com/lsh123/xmlsec/releases/download/$(LIBXMLSEC1_VERSION)
 LIBXMLSEC1_LICENSE = MIT
@@ -22,6 +22,14 @@ LIBXMLSEC1_CONF_OPTS = \
 	--without-nss \
 	--disable-des
 
+# xmlsec_unit_tests needs xmlDebugDumpDocument() from libxml2 which is not
+# present in buildroot because libxml2 is build with -without-debug
+define LIBXMLSEC1_DISABLE_UNIT_TESTS
+	$(SED) 's/noinst_PROGRAMS = xmlsec_unit_tests/noinst_PROGRAMS =/' \
+		$(@D)/apps/Makefile.am
+endef
+LIBXMLSEC1_POST_PATCH_HOOKS += LIBXMLSEC1_DISABLE_UNIT_TESTS
+
 HOST_LIBXMLSEC1_CONF_OPTS = \
 	--enable-crypto-dl=no \
 	--with-openssl \

--===============4181848876973161948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4181848876973161948==--
