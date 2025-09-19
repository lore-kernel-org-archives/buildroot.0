Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A52CCAC5A8
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 09:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C17E741405;
	Sat, 20 Sep 2025 09:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nrW9Q5C5o7QH; Sat, 20 Sep 2025 09:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB4484141A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB4484141A;
	Sat, 20 Sep 2025 09:11:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AC9BE7
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 09:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3153D40D4F
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 09:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3vP4poUEXtgh for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 09:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18791403B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18791403B6
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 09:11:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07BA185CCE; Sat, 20 Sep 2025 09:11:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 19 Sep 2025 21:21:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36357247d5826386b57de8c8cf5d16ca3d471789
X-Git-Newrev: 90e8845b1393bc3042ea8c9edc1172f3951742fe
X-Patchwork-Hint: ignore
Message-Id: <20250920091135.07BA185CCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poco: bump to v1.14.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=90e8845b1393bc3042ea8c9edc1172f3951742fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump includes the security fix for CVE-2025-6375 which was addressed
in the previous patch.

With this version bump, some code has been marked as deprecated. See:
https://github.com/pocoproject/poco/issues/4426

For more details on the version bump, see:
 - https://github.com/pocoproject/poco/releases/tag/poco-1.13.3-release
 - https://github.com/pocoproject/poco/releases/tag/poco-1.14.0-release
 - https://github.com/pocoproject/poco/releases/tag/poco-1.14.1-release
 - https://github.com/pocoproject/poco/releases/tag/poco-1.14.2-release
 - https://github.com/pocoproject/poco/releases/tag/poco-1.14.2-release
 - https://github.com/pocoproject/poco/compare/poco-1.13.2..poco-1.14.2

Since upstream commit
https://github.com/pocoproject/poco/commit/92e06497f51893fcb068c34192a37882874651ca
poco Foundation now requires utf8proc. This commit adds this new
dependency.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: add dependency to utf8proc]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch | 34 ----------------------
 package/poco/Config.in                             |  1 +
 package/poco/poco.hash                             |  2 +-
 package/poco/poco.mk                               |  6 ++--
 4 files changed, 4 insertions(+), 39 deletions(-)

diff --git a/package/poco/0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch b/package/poco/0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch
deleted file mode 100644
index cfb22d690a..0000000000
--- a/package/poco/0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6f2f85913c191ab9ddfb8fae781f5d66afccf3bf Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?G=C3=BCnter=20Obiltschnig?= <guenter.obiltschnig@appinf.com>
-Date: Wed, 16 Apr 2025 09:15:33 +0200
-Subject: [PATCH] fix(Net): A SEGV at Net/src/MultipartReader.cpp:164:1 #4915
- (move assertion out of ctor)
-
-Upstream: https://github.com/pocoproject/poco/commit/6f2f85913c191ab9ddfb8fae781f5d66afccf3bf
-CVE: CVE-2025-6375
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- Net/src/MultipartReader.cpp | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/Net/src/MultipartReader.cpp b/Net/src/MultipartReader.cpp
-index f3a2f2bba2..f4aa27dd86 100644
---- a/Net/src/MultipartReader.cpp
-+++ b/Net/src/MultipartReader.cpp
-@@ -36,7 +36,6 @@ MultipartStreamBuf::MultipartStreamBuf(std::istream& istr, const std::string& bo
- 	_boundary(boundary),
- 	_lastPart(false)
- {
--	poco_assert (!boundary.empty() && boundary.length() < STREAM_BUFFER_SIZE - 6);
- }
- 
- 
-@@ -47,7 +46,7 @@ MultipartStreamBuf::~MultipartStreamBuf()
- 
- int MultipartStreamBuf::readFromDevice(char* buffer, std::streamsize length)
- {
--	poco_assert_dbg (length >= _boundary.length() + 6);
-+	poco_assert (!_boundary.empty() && _boundary.length() < length - 6);
- 
- 	static const int eof = std::char_traits<char>::eof();
- 	std::streambuf& buf = *_istr.rdbuf();
diff --git a/package/poco/Config.in b/package/poco/Config.in
index db1b36964e..fa23e6aa59 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_POCO
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_PACKAGE_POCO_ARCH_SUPPORTS
 	select BR2_PACKAGE_PCRE2
+	select BR2_PACKAGE_UTF8PROC
 	select BR2_PACKAGE_ZLIB
 	help
 	  The C++ Portable Components Libraries
diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 0a1e900b3f..6979a9a1e4 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c01221870aa9bccedf1de39890279699207848fe61a0cfb6aeec7c5942c4627f  poco-1.13.2.tar.gz
+sha256  47394ea7ddb7b0a40e1a5be896f8f5dc77cfdc4f561d2e7131ecf582df5a0c3a  poco-1.14.2.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index f7d9cdc009..a471a24adf 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,18 +4,16 @@
 #
 ################################################################################
 
-POCO_VERSION = 1.13.2
+POCO_VERSION = 1.14.2
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
 POCO_CPE_ID_VENDOR = pocoproject
 POCO_INSTALL_STAGING = YES
 
-# 0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch
-POCO_IGNORE_CVES += CVE-2025-6375
-
 POCO_DEPENDENCIES = \
 	pcre2 \
+	utf8proc \
 	zlib \
 	$(if $(BR2_PACKAGE_POCO_CRYPTO),openssl) \
 	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mariadb) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
