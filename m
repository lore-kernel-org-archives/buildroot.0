Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BB5CD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 12:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37ACA81B23;
	Sat, 16 Sep 2023 12:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37ACA81B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yu2AfSzN1HBx; Sat, 16 Sep 2023 12:20:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 615E28198D;
	Sat, 16 Sep 2023 12:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 615E28198D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FC991BF860
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6DC58198D
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6DC58198D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dvH179RYMzW2 for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 12:20:15 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2191181980
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 12:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2191181980
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9A6F4353A916; Sat, 16 Sep 2023 14:20:12 +0200 (CEST)
Date: Sat, 16 Sep 2023 14:20:12 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZQWdfMVaJjzX9Vfr@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1694866812; bh=vN8I/Adp0dFUk3PT8BBJV20ez/rGP4stk4UCp6FN78Q=;
 h=Date:From:To:Subject:From;
 b=SIeUy9A3d74t/ceACk0JeHD9LRz6olu4C7RTLOEAY2JNd1+avOzSdqQOZ7Tj0JEX8
 GHygknRLHfOarhPtbonb52/NBvahDaP1+JU/DykIl+mnuN/IpJKxxEy3EOnScjd0R2
 JAj+Le1T2ZGQKAhG2cAMCKwi+ci7hqXuEshyMp5mKfdi3DQ8SCXhgU0QOPG0058f+Q
 b9JR7PMo7w99q7rnwyPH1e/ZwJxDJN+V0fDny9IvHMyarbTrJznU9xy5gFLKi8wBoT
 uysDJFxxqidANqPXhd5NQgmc28zRv/MHZsEpd47ru4Ym4SzhrLznfPftwUX0lvNh2T
 jygdQaipNzk+Q==
Subject: [Buildroot] [PATCH v2] ruby: bump version to 3.2.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patch is included upstream, remove it and the reference in .checkpackageignore.

Host build fails with following error:
<internal:/buildroot/output/build/host-ruby-3.2.2/lib/rubygems/core_ext/kernel_require.rb>:85:in `require': cannot load such file -- psych (LoadError)
        from <internal:/buildroot/output/build/host-ruby-3.2.2/lib/rubygems/core_ext/kernel_require.rb>:85:in `require'
        from /buildroot/output/build/host-ruby-3.2.2/lib/rubygems.rb:608:in `load_yaml'

Fix it by adding host-libyaml to the dependencies.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 v1->v2:
  - add failure for host build requested by Thomas Petazzoni
---
 .checkpackageignore                           |  1 -
 .../0001-Fix-build-with-LibreSSL-3-5.patch    | 25 -------------------
 package/ruby/ruby.hash                        |  4 +--
 package/ruby/ruby.mk                          |  8 +++---
 4 files changed, 6 insertions(+), 32 deletions(-)
 delete mode 100644 package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 73a00d610c..7b89234827 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1277,7 +1277,6 @@ package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch Upstream
 package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch Upstream
 package/rubix/0001-dont-use-legacy-functions.patch Upstream
 package/rubix/0002-misc-fixes.patch Sob Upstream
-package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch Upstream
 package/rygel/0001-build-Add-man_pages-build-options.patch Upstream
 package/rygel/0002-meson.build-fix-g_ir_compiler-calls.patch Upstream
 package/rygel/S99rygel Indent Shellcheck Variables
diff --git a/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch b/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
deleted file mode 100644
index 805dfd2f89..0000000000
--- a/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From e25fb0d0d86da5a9398ebdc9216b2ea89f80fa3d Mon Sep 17 00:00:00 2001
-From: Jeremy Evans <code@jeremyevans.net>
-Date: Fri, 25 Mar 2022 13:11:31 -0700
-Subject: [PATCH] Fix build with LibreSSL 3.5
-
-[Retrieved from:
-https://github.com/ruby/openssl/commit/e25fb0d0d86da5a9398ebdc9216b2ea89f80fa3d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- ext/openssl/ossl_pkey.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ext/openssl/ossl_pkey.c b/ext/openssl/ossl_pkey.c
-index 2a4835a2..24d0da46 100644
---- a/ext/openssl/ossl_pkey.c
-+++ b/ext/openssl/ossl_pkey.c
-@@ -710,7 +710,7 @@ ossl_pkey_export_traditional(int argc, VALUE *argv, VALUE self, int to_der)
- 	}
-     }
-     else {
--#if OPENSSL_VERSION_NUMBER >= 0x10100000 && !defined(LIBRESSL_VERSION_NUMBER)
-+#if OSSL_OPENSSL_PREREQ(1, 1, 0) || OSSL_LIBRESSL_PREREQ(3, 5, 0)
- 	if (!PEM_write_bio_PrivateKey_traditional(bio, pkey, enc, NULL, 0,
- 						  ossl_pem_passwd_cb,
- 						  (void *)pass)) {
diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 42d8a2497f..bbe77ce1c1 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2022/11/24/ruby-3-1-3-released/
-sha512  4b0fd334ae56132ba98b8a69adad54bdcf7f7aeabd5eba5b0f0399a3868e2054f9026ca1b1cb2dbb197a9e9b0610b263481949c0623a62071546bc5adff8ca69  ruby-3.1.3.tar.xz
+# https://www.ruby-lang.org/en/news/2023/03/30/ruby-3-2-2-released/
+sha512  a29f24cd80f563f6368952d06d6273f7241a409fa9ab2f60e03dde2ac58ca06bee1750715b6134caebf4c061d3503446dc37a6059e19860bb0010eef34951935  ruby-3.2.2.tar.xz
 
 # License files, Locally calculated
 sha256  794c384f94396ab07e3e6f53a9f8be093facb7eb4193266024302b93b29e12dc  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 28b1ec13ef..4278e6584d 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RUBY_VERSION_MAJOR = 3.1
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
-RUBY_VERSION_EXT = 3.1.0
+RUBY_VERSION_MAJOR = 3.2
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
+RUBY_VERSION_EXT = 3.2.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 
@@ -20,7 +20,7 @@ RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 RUBY_CPE_ID_VENDOR = ruby-lang
 
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
-HOST_RUBY_DEPENDENCIES = host-pkgconf host-openssl
+HOST_RUBY_DEPENDENCIES = host-pkgconf host-openssl host-libyaml
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_CONF_OPTS = --disable-install-doc --disable-rpath --disable-rubygems
 HOST_RUBY_CONF_OPTS = \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
