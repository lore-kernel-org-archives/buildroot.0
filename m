Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57282F9D0D5
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E28CF42B1E;
	Tue, 14 Apr 2026 15:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQ1crOzxGR9B; Tue, 14 Apr 2026 15:42:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 332D142B1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181368;
	bh=J8fcj2POv1dHXOWxjesx9puF8iBjlgDKpaoHA9TFofk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o+gsQMe3VojVJ09TizKnl0WAe3Y/sOxfyCSzMKbLpOt3A0tfzc4+x6tkBo2cBA0w/
	 XExEF/KjaQiamqb8MH6b3O39VoDmBNJl/7YGrMerq5FwjtOmjvJYaL6NOa99MQZREo
	 tBUeXnWcNGJd3TzBHs0ZZv2f9HxSXbOly2Yk5KbmuIshc3JIKX1mmXppuAoHJPk/k6
	 0XKUy61q2GSX7uC14QyJcxxZen59x14TwwO0x1h81bYeOJInXUfBky57VJ+uyLkw/G
	 qf+DjqWUcu+qszyZKTrsGbVJmllgJ7Zr58FWvanDQDV6PANzEuQaRGg1Z5/YA8TsiE
	 9rAUx7Jg4xcRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 332D142B1F;
	Tue, 14 Apr 2026 15:42:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C811237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E90742AF2
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0yN9VeFDpzp for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D61142AF1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D61142AF1
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21B3C814AA; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 12:16:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 90cd80f30ff4c4c3e591133b4358acd410c73506
X-Git-Newrev: 54a4ff977b034e1527cf2e0e6fcdf59f3f10019c
X-Patchwork-Hint: ignore
Message-Id: <20260414154237.21B3C814AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cpp-httplib:
 security bump to v0.37.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1532902040245021138=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1532902040245021138==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/54a4ff977b034e1527cf2e0e6fcdf59f3f10019c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release notes of intermediate versions:
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.28.0
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.29.0
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.30.0
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.30.1
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.30.2
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.31.0
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.32.0
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.33.0
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.33.1
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.34.0
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.35.0
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.36.0
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.37.0
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.37.1
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.37.2

This fixes numerous vulnerabilities:

- CVE-2026-21428:
    cpp-httplib is a C++11 single-file header-only cross platform
    HTTP/HTTPS library. Prior to version 0.30.0, the ``write_headers``
    function does not check for CR & LF characters in user supplied
    headers, allowing untrusted header value to escape header lines. This
    vulnerability allows attackers to add extra headers, modify request
    body unexpectedly & trigger an SSRF attack. When combined with a
    server that supports http1.1 pipelining (springboot, python twisted
    etc), this can be used for server side request forgery (SSRF). Version
    0.30.0 fixes this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-21428

- CVE-2026-22776:
    cpp-httplib is a C++11 single-file header-only cross platform
    HTTP/HTTPS library. Prior to version 0.30.1, a Denial of Service (DoS)
    vulnerability exists in cpp-httplib due to the unsafe handling of
    compressed HTTP request bodies (Content-Encoding: gzip, br, etc.). The
    library validates the payload_max_length against the compressed data
    size received from the network, but does not limit the size of the
    decompressed data stored in memory.
    https://www.cve.org/CVERecord?id=CVE-2026-22776

- CVE-2026-28434:
    cpp-httplib is a C++11 single-file header-only cross platform
    HTTP/HTTPS library. Prior to 0.35.0, when a request handler throws a
    C++ exception and the application has not registered a custom
    exception handler via set_exception_handler(), the library catches the
    exception and writes its message directly into the HTTP response as a
    header named EXCEPTION_WHAT. This header is sent to whoever made the
    request, with no authentication check and no special configuration
    required to trigger it. The behavior is on by default. A developer who
    does not know to opt in to set_exception_handler() will ship a server
    that leaks internal exception messages to any client. This
    vulnerability is fixed in 0.35.0.
    https://www.cve.org/CVERecord?id=CVE-2026-28434

- CVE-2026-28435:
    cpp-httplib is a C++11 single-file header-only cross platform
    HTTP/HTTPS library. Prior to 0.35.0, cpp-httplib (httplib.h) does not
    enforce Server::set_payload_max_length() on the decompressed request
    body when using HandlerWithContentReader (streaming ContentReader)
    with Content-Encoding: gzip (or other supported encodings). A small
    compressed payload can expand beyond the configured payload limit and
    be processed by the application, enabling a payload size limit bypass
    and potential denial of service (CPU/memory exhaustion). This
    vulnerability is fixed in 0.35.0.
    https://www.cve.org/CVERecord?id=CVE-2026-28435

- CVE-2026-29076:
    cpp-httplib is a C++11 single-file header-only cross platform
    HTTP/HTTPS library. Prior to version 0.37.0, cpp-httplib uses
    std::regex (libstdc++) to parse RFC 5987 encoded filename* values in
    multipart Content-Disposition headers. The regex engine in libstdc++
    implements backtracking via deep recursion, consuming one stack frame
    per input character. An attacker can send a single HTTP POST request
    with a crafted filename* parameter that causes uncontrolled stack
    growth, resulting in a stack overflow (SIGSEGV) that crashes the
    server process. This issue has been patched in version 0.37.0.
    https://www.cve.org/CVERecord?id=CVE-2026-29076

- CVE-2026-31870:
    cpp-httplib is a C++11 single-file header-only cross platform
    HTTP/HTTPS library. Prior to 0.37.1, when a cpp-httplib client uses
    the streaming API (httplib::stream::Get, httplib::stream::Post, etc.),
    the library calls std::stoull() directly on the Content-Length header
    value received from the server with no input validation and no
    exception handling. std::stoull throws std::invalid_argument for non-
    numeric strings and std::out_of_range for values exceeding ULLONG_MAX.
    Since nothing catches these exceptions, the C++ runtime calls
    std::terminate(), which kills the process with SIGABRT. Any server the
    client connects to — including servers reached via HTTP redirects,
    third-party APIs, or man-in-the-middle positions can crash the client
    application with a single HTTP response. No authentication is
    required. No interaction from the end user is required. The crash is
    deterministic and immediate. This vulnerability is fixed in 0.37.1.
    https://www.cve.org/CVERecord?id=CVE-2026-31870

- CVE-2026-32627:
    cpp-httplib is a C++11 single-file header-only cross platform
    HTTP/HTTPS library. Prior to 0.37.2, when a cpp-httplib client is
    configured with a proxy and set_follow_location(true), any HTTPS
    redirect it follows will have TLS certificate and hostname
    verification silently disabled on the new connection. The client will
    accept any certificate presented by the redirect target — expired,
    self-signed, or forged — without raising an error or notifying the
    application. A network attacker in a position to return a redirect
    response can fully intercept the follow-up HTTPS connection, including
    any credentials or session tokens in flight. This vulnerability is
    fixed in 0.37.2.
    https://www.cve.org/CVERecord?id=CVE-2026-32627

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8dad17ea06260ef0bd23eebc47c95a8510310bf5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../cpp-httplib/0001-merge-commit-from-fork.patch  | 103 ---------------------
 package/cpp-httplib/cpp-httplib.hash               |   2 +-
 package/cpp-httplib/cpp-httplib.mk                 |   5 +-
 3 files changed, 2 insertions(+), 108 deletions(-)

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
index 0984bd359b..076b30cfa1 100644
--- a/package/cpp-httplib/cpp-httplib.hash
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c9b9e0524666e1cd088f0874c57c1ce7c0eaa8552f9f4e15c755d5201fc8c608  cpp-httplib-0.19.0.tar.gz
+sha256  909766cd7697153c9e588b0f96defe1868b7bb11d94b8d4f0c83bb4875bc9066  cpp-httplib-0.37.2.tar.gz
 sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index 556368efa0..3b57e35aea 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPP_HTTPLIB_VERSION = 0.19.0
+CPP_HTTPLIB_VERSION = 0.37.2
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
@@ -13,9 +13,6 @@ CPP_HTTPLIB_INSTALL_STAGING = YES
 CPP_HTTPLIB_CONF_OPTS = \
 	-Dcpp-httplib_test=false
 
-# 0001-merge-commit-from-fork.patch
-CPP_HTTPLIB_IGNORE_CVES += CVE-2025-46728
-
 ifeq ($(BR2_PACKAGE_CPP_HTTPLIB_COMPILE),y)
 CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_compile=true
 CPP_HTTPLIB_DEPENDENCIES += host-python3

--===============1532902040245021138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1532902040245021138==--
