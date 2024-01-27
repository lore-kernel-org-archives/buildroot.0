Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5402FC47422
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 02:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D761783D38;
	Sat, 27 Jan 2024 02:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D761783D38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qay9DT2T5Lq5; Sat, 27 Jan 2024 02:21:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1938E83D71;
	Sat, 27 Jan 2024 02:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1938E83D71
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 394A21BF5EA
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 02:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1163660AC1
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 02:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1163660AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pbb73EzT4bXB for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 02:20:58 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F6D960017
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 02:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F6D960017
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E859B35353E7; Sat, 27 Jan 2024 03:20:54 +0100 (CET)
Date: Sat, 27 Jan 2024 03:20:54 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZbRohvM9uU511czv@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1706322055; bh=MRKfYDVUC31wYxf481IIZ8vTIaBVU1+2id1LpIj4ygw=;
 h=Date:From:To:Subject:From;
 b=MNaas5V5Wkv2W8cEdkilN9TtHzRihxoeij243L7oAZcRicdCbSS2ArGWxQd47iaND
 tTL+0fU1LBHmyahe0dZjQblsQ3GDlNzHHu7pqwB5duRXG1p0kr4BI3LTMIUoHW0aB3
 cN5CcfjNdRiAKtYQKPBw8H7oJOtHY4rZ+m9jCFZVnD0vTHwnr7QUXcf/7qjVeCWZp6
 qct4qQBhGNI2faKWRL4uIz7wEWkwvg/ZtFIcSn4RPhFHiAxhrGtnEUdRIsxFKteKXg
 /rETpvCSvN4t4+n1+6FgJg48o7rH8ur3gcqF/GgTQyYaGjnv6QQgdkOyGTQiQapmYc
 PVvBltpddT7AQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=MNaas5V5
Subject: [Buildroot] [PATCH v2] package/ruby: bump to 3.3.0
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

See here for changes:
https://www.ruby-lang.org/en/news/2023/12/25/ruby-3-3-0-released/

Patch applied upstream.

License file LEGAL changed.
[ext/psych/yaml] got removed.
[lib/bundler/vendor/molinillo] got removed.
[lib/bundler/vendor/pub_grub] added with MIT License.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .checkpackageignore                           |  1 -
 .../0001-Fix-build-with-LibreSSL-3-5.patch    | 25 -------------------
 package/ruby/ruby.hash                        |  6 ++---
 package/ruby/ruby.mk                          |  6 ++---
 4 files changed, 6 insertions(+), 32 deletions(-)
 delete mode 100644 package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 55a55752a2..495135a2ee 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1187,7 +1187,6 @@ package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch Upstream
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
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
