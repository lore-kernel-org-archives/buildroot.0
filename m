Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4350DCA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 15:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00E306161D;
	Sun, 24 Aug 2025 15:11:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rN-PPKO_uieq; Sun, 24 Aug 2025 15:11:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D50F760BD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D50F760BD7;
	Sun, 24 Aug 2025 15:11:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E7B9CA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 15:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ACB88457F
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 15:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Xhm4xS4_E3S for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 15:11:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AF5F843BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AF5F843BA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 15:11:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 977E7807D7; Sun, 24 Aug 2025 15:11:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 17:08:56 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: aea7c89396f20570b5ce32c4a235f7011ad0bd01
X-Git-Newrev: 519d03657c6a247f739003a3590c93948e6a48d8
X-Patchwork-Hint: ignore
Message-Id: <20250824151126.977E7807D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cpp-httplib: bump to
 v0.25.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=519d03657c6a247f739003a3590c93948e6a48d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release notes since v0.19.0, see:
https://github.com/yhirose/cpp-httplib/releases

Since v0.23.0 (see [1]), meson options removed the `cpp-httplib_`
prefix.

This bump contains the fix for CVE-2025-46728 that has been adressed in
the previous patch.

For more information on the releases, see:
  - https://github.com/yhirose/cpp-httplib/releases/tag/v0.20.0
  - https://github.com/yhirose/cpp-httplib/releases/tag/v0.20.1
  - https://github.com/yhirose/cpp-httplib/releases/tag/v0.21.0
  - https://github.com/yhirose/cpp-httplib/releases/tag/v0.22.0
  - https://github.com/yhirose/cpp-httplib/releases/tag/v0.23.0
  - https://github.com/yhirose/cpp-httplib/releases/tag/v0.23.1
  - https://github.com/yhirose/cpp-httplib/releases/tag/v0.24.0
  - https://github.com/yhirose/cpp-httplib/releases/tag/v0.25.0

[1] https://github.com/yhirose/cpp-httplib/commit/4ff7a1c858faeab14d0f9e8d533a9787cab1de08

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../cpp-httplib/0001-merge-commit-from-fork.patch  | 103 ---------------------
 package/cpp-httplib/cpp-httplib.hash               |   2 +-
 package/cpp-httplib/cpp-httplib.mk                 |  21 ++---
 3 files changed, 10 insertions(+), 116 deletions(-)

diff --git a/package/cpp-httplib/0001-merge-commit-from-fork.patch b/package/cpp-httplib/0001-merge-commit-from-fork.patch
deleted file mode 100644
index 180bb22e11..0000000000
--- a/package/cpp-httplib/0001-merge-commit-from-fork.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 7b752106ac42bd5b907793950d9125a0972c8e8e Mon Sep 17 00:00:00 2001
-From: Ville Vesilehto <ville@vesilehto.fi>
-Date: Sat, 3 May 2025 11:39:01 +0300
-Subject: [PATCH] Merge commit from fork
-
-* fix(parser): Limit line length in getline
-
-Prevents potential infinite loop and memory exhaustion in
-stream_line_reader::getline by enforcing max line length.
-
-Signed-off-by: Ville Vesilehto <ville@vesilehto.fi>
-
-* fix: increase default max line length to 32k
-
-LONG_QUERY_VALUE test is set at 25k.
-
-Signed-off-by: Ville Vesilehto <ville@vesilehto.fi>
-
-* test(client): expect read error with too long query
-
-Adds a test case (`TooLongQueryValue`) to verify client behavior
-when the request URI is excessively long, exceeding
-`CPPHTTPLIB_MAX_LINE_LENGTH`. In this scenario, the server is
-expected to reset the connection.
-
-Signed-off-by: Ville Vesilehto <ville@vesilehto.fi>
-
-CVE: CVE-2025-46728
-Upstream: https://github.com/yhirose/cpp-httplib/commit/7b752106ac42bd5b907793950d9125a0972c8e8e
-[thomas: adapt lines numbers to v0.19.0]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- httplib.h    |  9 +++++++++
- test/test.cc | 15 +++++++++++++++
- 2 files changed, 24 insertions(+)
-
-diff --git a/httplib.h b/httplib.h
-index cb182c4129..a2aa24f96b 100644
---- a/httplib.h
-+++ b/httplib.h
-@@ -145,6 +145,10 @@
- #define CPPHTTPLIB_LISTEN_BACKLOG 5
- #endif
- 
-+#ifndef CPPHTTPLIB_MAX_LINE_LENGTH
-+#define CPPHTTPLIB_MAX_LINE_LENGTH 32768
-+#endif
-+
- /*
-  * Headers
-  */
-@@ -2998,6 +3002,11 @@ inline bool stream_line_reader::getline() {
- #endif
- 
-   for (size_t i = 0;; i++) {
-+    if (size() >= CPPHTTPLIB_MAX_LINE_LENGTH) {
-+      // Treat exceptionally long lines as an error to
-+      // prevent infinite loops/memory exhaustion
-+      return false;
-+    }
-     char byte;
-     auto n = strm_.read(&byte, 1);
- 
-diff --git a/test/test.cc b/test/test.cc
-index 4fd9983bd8..7f5cc8a9d0 100644
---- a/test/test.cc
-+++ b/test/test.cc
-@@ -42,6 +42,9 @@ const int PORT = 1234;
- const string LONG_QUERY_VALUE = string(25000, '@');
- const string LONG_QUERY_URL = "/long-query-value?key=" + LONG_QUERY_VALUE;
- 
-+const string TOO_LONG_QUERY_VALUE = string(35000, '@');
-+const string TOO_LONG_QUERY_URL = "/too-long-query-value?key=" + TOO_LONG_QUERY_VALUE;
-+
- const std::string JSON_DATA = "{\"hello\":\"world\"}";
- 
- const string LARGE_DATA = string(1024 * 1024 * 100, '@'); // 100MB
-@@ -2839,6 +2842,11 @@ class ServerTest : public ::testing::Test {
-                EXPECT_EQ(LONG_QUERY_URL, req.target);
-                EXPECT_EQ(LONG_QUERY_VALUE, req.get_param_value("key"));
-              })
-+        .Get("/too-long-query-value",
-+             [&](const Request &req, Response & /*res*/) {
-+               EXPECT_EQ(TOO_LONG_QUERY_URL, req.target);
-+               EXPECT_EQ(TOO_LONG_QUERY_VALUE, req.get_param_value("key"));
-+             })
-         .Get("/array-param",
-              [&](const Request &req, Response & /*res*/) {
-                EXPECT_EQ(3u, req.get_param_value_count("array"));
-@@ -3624,6 +3632,13 @@ TEST_F(ServerTest, LongQueryValue) {
-   EXPECT_EQ(StatusCode::UriTooLong_414, res->status);
- }
- 
-+TEST_F(ServerTest, TooLongQueryValue) {
-+  auto res = cli_.Get(TOO_LONG_QUERY_URL.c_str());
-+
-+  ASSERT_FALSE(res);
-+  EXPECT_EQ(Error::Read, res.error());
-+}
-+
- TEST_F(ServerTest, TooLongHeader) {
-   Request req;
-   req.method = "GET";
diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
index 0984bd359b..89f9ae5540 100644
--- a/package/cpp-httplib/cpp-httplib.hash
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c9b9e0524666e1cd088f0874c57c1ce7c0eaa8552f9f4e15c755d5201fc8c608  cpp-httplib-0.19.0.tar.gz
+sha256  ac7c59fa72325d4cb9f73af266312d82632ac35a5c4c8a1be620c1f946ec9cea  cpp-httplib-0.25.0.tar.gz
 sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index 928cef8a86..c7171d0ea0 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -4,20 +4,17 @@
 #
 ################################################################################
 
-CPP_HTTPLIB_VERSION = 0.19.0
+CPP_HTTPLIB_VERSION = 0.25.0
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
 CPP_HTTPLIB_CPE_ID_VALID = YES
 CPP_HTTPLIB_INSTALL_STAGING = YES
 CPP_HTTPLIB_CONF_OPTS = \
-	-Dcpp-httplib_test=false
-
-# 0001-merge-commit-from-fork.patch
-CPP_HTTPLIB_IGNORE_CVES += CVE-2025-46728
+	-Dtest=false
 
 ifeq ($(BR2_PACKAGE_CPP_HTTPLIB_COMPILE),y)
-CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_compile=true
+CPP_HTTPLIB_CONF_OPTS += -Dcompile=true
 CPP_HTTPLIB_DEPENDENCIES += host-python3
 else
 # Header only library
@@ -25,24 +22,24 @@ CPP_HTTPLIB_INSTALL_TARGET = NO
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_openssl=enabled
+CPP_HTTPLIB_CONF_OPTS += -Dopenssl=enabled
 CPP_HTTPLIB_DEPENDENCIES += openssl
 else
-CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_openssl=disabled
+CPP_HTTPLIB_CONF_OPTS += -Dopenssl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_zlib=enabled
+CPP_HTTPLIB_CONF_OPTS += -Dzlib=enabled
 CPP_HTTPLIB_DEPENDENCIES += zlib
 else
-CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_zlib=disabled
+CPP_HTTPLIB_CONF_OPTS += -Dzlib=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_BROTLI),y)
-CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_brotli=enabled
+CPP_HTTPLIB_CONF_OPTS += -Dbrotli=enabled
 CPP_HTTPLIB_DEPENDENCIES += brotli
 else
-CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_brotli=disabled
+CPP_HTTPLIB_CONF_OPTS += -Dbrotli=disabled
 endif
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
