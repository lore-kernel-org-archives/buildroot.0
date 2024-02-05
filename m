Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB56C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2F3340ADD;
	Mon,  5 Feb 2024 10:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2F3340ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ip0zaVM9MGs; Mon,  5 Feb 2024 10:42:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ACF540B30;
	Mon,  5 Feb 2024 10:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ACF540B30
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A23FF1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B16860F51
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B16860F51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r8YCgyJYCsqv for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:42:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9611960F31
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9611960F31
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 834CD86B0B; Mon,  5 Feb 2024 10:42:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:42:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67b1eb8a6de5378b041cff9a0289a42a6760cbca
X-Git-Newrev: a01c278df7892c8a6736334aa008b2d7c09e9258
X-Patchwork-Hint: ignore
Message-Id: <20240205104226.834CD86B0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ruby: bump to 3.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a01c278df7892c8a6736334aa008b2d7c09e9258
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here for changes:
https://www.ruby-lang.org/en/news/2023/12/25/ruby-3-3-0-released/

Patch applied upstream.

License file LEGAL changed.
[ext/psych/yaml] got removed.
[lib/bundler/vendor/molinillo] got removed.
[lib/bundler/vendor/pub_grub] added with MIT License.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 .../ruby/0001-Fix-build-with-LibreSSL-3-5.patch    | 25 ----------------------
 package/ruby/ruby.hash                             |  6 +++---
 package/ruby/ruby.mk                               |  6 +++---
 4 files changed, 6 insertions(+), 32 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index bcb6aff6ce..095fa5b283 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1182,7 +1182,6 @@ package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch Upstream
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
index 42d8a2497f..c729c59453 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,7 +1,7 @@
-# https://www.ruby-lang.org/en/news/2022/11/24/ruby-3-1-3-released/
-sha512  4b0fd334ae56132ba98b8a69adad54bdcf7f7aeabd5eba5b0f0399a3868e2054f9026ca1b1cb2dbb197a9e9b0610b263481949c0623a62071546bc5adff8ca69  ruby-3.1.3.tar.xz
+# https://www.ruby-lang.org/en/news/2023/12/25/ruby-3-3-0-released/
+sha512  7959c5753bfa0bfc4d6d74060869aabbe9815c1c97930659da11b917ee0803ddbbd80e869e00c48b8694b4ba48709c3b6493fd045568e36e902616c35ababf01  ruby-3.3.0.tar.xz
 
 # License files, Locally calculated
-sha256  794c384f94396ab07e3e6f53a9f8be093facb7eb4193266024302b93b29e12dc  LEGAL
+sha256  e849b28d324423e636a3e6bc5d583cdaf4bd046c2b20872c53886b612d01a4a1  LEGAL
 sha256  967586d538a28955ec2541910cf63c5ac345fcdea94bfb1f1705a1f6eb36bcbb  COPYING
 sha256  36a9a6e7347214bbba599a412617204e65bff065dcbe5c46f5cb454c80de9eb0  BSDL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 28b1ec13ef..b2396010c5 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RUBY_VERSION_MAJOR = 3.1
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
-RUBY_VERSION_EXT = 3.1.0
+RUBY_VERSION_MAJOR = 3.3
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).0
+RUBY_VERSION_EXT = 3.3.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
