Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC897CA0ECA
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 13:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A9C641BA7;
	Tue, 12 Sep 2023 13:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A9C641BA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJrqWIZcxcOo; Tue, 12 Sep 2023 13:37:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC53A41BAB;
	Tue, 12 Sep 2023 13:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC53A41BAB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E35AB1BF5B3
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 13:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E3B941BA7
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 13:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E3B941BA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a3OPz5HNhjPg for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 13:37:08 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE71741BAF
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 13:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE71741BAF
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A8C9B3520C8A; Tue, 12 Sep 2023 15:36:58 +0200 (CEST)
Date: Tue, 12 Sep 2023 15:36:56 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZQBpeOVq27AGkcF7@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1694525820; bh=yUMGRHNgfyf/yI0ClgGq3WsSKrzvuJadjBlwPUva5Ec=;
 h=Date:From:To:Subject:From;
 b=KW+92uhasHoZ53XksQ7xuxpY/v/YKdYs1VAnXJX5q9+rqUfMsfH3RbYEUijO3yvC2
 kLNcFWzJcqDu9d6zVXlydZa3NGf4cHPxH0NGjYc7LQCEv+40esmL0yitWZymPCraNx
 hAR+2dZC54OoFq7ruZp8ATEUNKX8FEUh8RVcU7tqyS2qNn7NJX2qn6VR3+jwSDaJ1y
 Ym45e6AsZ/flZSMDRly0pZd2wkb6EW0z8AdiPuiqv6WYe5N/EEK8rrIyXL5WGTUp+L
 hEw7GiDnqWlrf8qlsx5hordw8D0XwMw+tgKaCOfigRTtcAiRk3opicj7rxveVCbAI+
 Simy6VS06K/mw==
Subject: [Buildroot] [PATCH] ruby: bump version to 3.2.2
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

Patch is upstream, so remove it from .checkpackageignore.
Host ruby needs libyaml.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .checkpackageignore                           |  1 -
 .../0001-Fix-build-with-LibreSSL-3-5.patch    | 25 -------------------
 package/ruby/ruby.hash                        |  4 +--
 package/ruby/ruby.mk                          |  8 +++---
 4 files changed, 6 insertions(+), 32 deletions(-)
 delete mode 100644 package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index f34df29bfc..5419d4675e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1288,7 +1288,6 @@ package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch Upstream
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
