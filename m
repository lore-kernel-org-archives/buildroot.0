Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5683CCD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20C4B60F61;
	Fri, 12 Jun 2026 11:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBMH2UmTaHbP; Fri, 12 Jun 2026 11:22:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31CDF60F23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263361;
	bh=t0nBYlqOEMOoJWXWdnKRL4Gx6QOlElieMyJUkuVdF0s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TNWCpvB91iqH0ACPa/785ww9Tp56reGhEiCSFtSuy7zF5hjyymoztn0WYmr8BVWew
	 ge21T6oWOURPrXSc1BCwEhvYEw9MnGciEpdhfQpD1JVR2X0YWt1U4yZLosXZXMt0PO
	 gXbQQlOKdfbYnr4BWav4sPfp+zbu8vn99u9tkxj8vIncaY/iEGGoC4huwzNX5VWjFm
	 MBxrsd16m3DVXBpJxBQWGNXdtIphfWxqyFpUb5RhEVj7Sttg5/2AcSdrnIuw0nF9tv
	 x/1v+ozPuphGl0R2y+Oit1w9trj3BAotCZBAGbS0E+xZH0CVWDMkulbub32qB40GQW
	 rMMn3hByl+mPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31CDF60F23;
	Fri, 12 Jun 2026 11:22:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 100D4321
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 086C7832C9
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASwKrjIGPby6 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DABAC832C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DABAC832C6
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B302C880D5; Fri, 12 Jun 2026 11:22:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:33:26 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 894b2214f80204151e61338d94dbb323c28f2cc7
X-Git-Newrev: 477c5c0510cf78412935da47b6e7e761822831b5
X-Patchwork-Hint: ignore
Message-Id: <20260612112206.B302C880D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/capnproto: add
 upstream security patch for CVE-2026-322{39, 40}
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/477c5c0510cf78412935da47b6e7e761822831b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2026-32239:
    Cap'n Proto is a data interchange format and capability-based RPC
    system. Prior to 1.4.0, a negative Content-Length value was converted
    to unsigned, treating it as an impossibly large length instead. In
    theory, this bug could enable HTTP request/response smuggling. This
    vulnerability is fixed in 1.4.0.

For more information, see:
 - https://github.com/capnproto/capnproto/security/advisories/GHSA-qjx3-pp3m-9jpm
 - https://www.cve.org/CVERecord?id=CVE-2026-32239

- CVE-2026-32240:
    Cap'n Proto is a data interchange format and capability-based RPC
    system. Prior to 1.4.0, when using Transfer-Encoding: chunked, if a
    chunk's size parsed to a value of 2^64 or larger, it would be
    truncated to a 64-bit integer. In theory, this bug could enable HTTP
    request/response smuggling. This vulnerability is fixed in 1.4.0.

For more information, see:
 - https://github.com/capnproto/capnproto/security/advisories/GHSA-vpcq-mx5v-32wm
 - https://www.cve.org/CVERecord?id=CVE-2026-32240

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7f0749ce735646f29cddf1140b3b5ec137a64235)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-fix-http-body-size-integer-overflow-bugs.patch | 161 +++++++++++++++++++++
 package/capnproto/capnproto.mk                     |   4 +
 2 files changed, 165 insertions(+)

diff --git a/package/capnproto/0001-fix-http-body-size-integer-overflow-bugs.patch b/package/capnproto/0001-fix-http-body-size-integer-overflow-bugs.patch
new file mode 100644
index 0000000000..2389be01be
--- /dev/null
+++ b/package/capnproto/0001-fix-http-body-size-integer-overflow-bugs.patch
@@ -0,0 +1,161 @@
+From 6e5ee24ad92687a56a26ae596da45dc6c2f902c0 Mon Sep 17 00:00:00 2001
+From: Kenton Varda <kenton@cloudflare.com>
+Date: Tue, 10 Mar 2026 18:16:14 -0500
+Subject: [PATCH] Fix HTTP body size integer overflow bugs.
+
+The KJ-HTTP library was discovered to have two bugs related to integer overflows while handling message body sizes:
+1. A negative `Content-Length` value was converted to unsigned, treating it as an impossibly large length instead.
+2. When using `Transfer-Encoding: chunked`, if a chunk's size parsed to a value of 2^64 or larger, it would be truncated to a 64-bit integer.
+
+In theory, these bugs could enable HTTP request/response smuggling, although it would require integration with a proxy that has bugs of its own.
+
+For more details, see (in a future commit): security-advisories/2026-03-10-1-http-size-validation.md
+
+CVE: CVE-2026-32239
+CVE: CVE-2026-32240
+Upstream: https://github.com/capnproto/capnproto/commit/2744b3c012b4aa3c31cefb61ec656829fa5c0e36
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ c++/src/kj/compat/http-test.c++ | 64 +++++++++++++++++++++++++++++++++
+ c++/src/kj/compat/http.c++      | 28 +++++++++++----
+ 2 files changed, 86 insertions(+), 6 deletions(-)
+ 
+diff --git a/c++/src/kj/compat/http-test.c++ b/c++/src/kj/compat/http-test.c++
+index f10ff8d156..daf08992f0 100644
+--- a/c++/src/kj/compat/http-test.c++
++++ b/c++/src/kj/compat/http-test.c++
+@@ -2659,6 +2659,70 @@ KJ_TEST("HttpServer invalid method") {
+   KJ_EXPECT(expectedResponse == response, expectedResponse, response);
+ }
+ 
++KJ_TEST("HttpServer rejects negative Content-Length") {
++  KJ_HTTP_TEST_SETUP_IO;
++  kj::TimerImpl timer(kj::origin<kj::TimePoint>());
++  auto pipe = KJ_HTTP_TEST_CREATE_2PIPE;
++
++  HttpHeaderTable table;
++  BrokenHttpService service;
++  HttpServer server(timer, table, service, {
++    .canceledUploadGraceBytes = 1024 * 1024,
++  });
++
++  auto listenTask = server.listenHttp(kj::mv(pipe.ends[0]));
++
++  auto msg =
++      "POST / HTTP/1.1\r\n"
++      "Content-Length: -1\r\n"
++      "\r\n"
++      "foo"_kj.asBytes();
++
++  auto writePromise = pipe.ends[1]->write(msg.begin(), msg.size());
++  auto response = pipe.ends[1]->readAllText().wait(waitScope);
++
++  // The server should reject the negative Content-Length. The KJ_FAIL_REQUIRE in getEntityBody()
++  // gets caught by the server loop and turned into a 500 error.
++  KJ_EXPECT(response.startsWith("HTTP/1.1 500 Internal Server Error"), response);
++
++  KJ_EXPECT(writePromise.poll(waitScope));
++  writePromise.catch_([](kj::Exception&&) {}).wait(waitScope);
++}
++
++KJ_TEST("HttpServer rejects chunked body with overflowing chunk size") {
++  KJ_HTTP_TEST_SETUP_IO;
++  kj::TimerImpl timer(kj::origin<kj::TimePoint>());
++  auto pipe = KJ_HTTP_TEST_CREATE_2PIPE;
++
++  HttpHeaderTable table;
++  BrokenHttpService service;
++  HttpServer server(timer, table, service, {
++    .canceledUploadGraceBytes = 1024 * 1024,
++  });
++
++  auto listenTask = server.listenHttp(kj::mv(pipe.ends[0]));
++
++  // 17 hex digits: 0x10000000000000000 = 2^64, which overflows uint64_t.
++  auto msg =
++      "POST / HTTP/1.1\r\n"
++      "Transfer-Encoding: chunked\r\n"
++      "\r\n"
++      "10000000000000000\r\n"
++      "x\r\n"
++      "0\r\n"
++      "\r\n"_kj.asBytes();
++
++  auto writePromise = pipe.ends[1]->write(msg.begin(), msg.size());
++  auto response = pipe.ends[1]->readAllText().wait(waitScope);
++
++  // The chunk size overflow causes a KJ_REQUIRE failure during body reading, which the server
++  // catches and turns into a 500 error.
++  KJ_EXPECT(response.startsWith("HTTP/1.1 500 Internal Server Error"), response);
++
++  KJ_EXPECT(writePromise.poll(waitScope));
++  writePromise.catch_([](kj::Exception&&) {}).wait(waitScope);
++}
++
+ // Ensure that HttpServerSettings can continue to be constexpr.
+ KJ_UNUSED static constexpr HttpServerSettings STATIC_CONSTEXPR_SETTINGS {};
+ 
+diff --git a/c++/src/kj/compat/http.c++ b/c++/src/kj/compat/http.c++
+index 6976335e9c..6dc1e48613 100644
+--- a/c++/src/kj/compat/http.c++
++++ b/c++/src/kj/compat/http.c++
+@@ -1246,16 +1246,20 @@ public:
+ 
+       uint64_t value = 0;
+       for (char c: text) {
++        uint64_t digit;
+         if ('0' <= c && c <= '9') {
+-          value = value * 16 + (c - '0');
++          digit = c - '0';
+         } else if ('a' <= c && c <= 'f') {
+-          value = value * 16 + (c - 'a' + 10);
++          digit = c - 'a' + 10;
+         } else if ('A' <= c && c <= 'F') {
+-          value = value * 16 + (c - 'A' + 10);
++          digit = c - 'A' + 10;
+         } else {
+           KJ_FAIL_REQUIRE("invalid HTTP chunk size", text, text.asBytes()) { break; }
+           return value;
+         }
++        KJ_REQUIRE(value <= (uint64_t(kj::maxValue) >> 4),
++            "HTTP chunk size overflow", text, text.asBytes()) { break; }
++        value = value * 16 + digit;
+       }
+ 
+       return value;
+@@ -1742,7 +1746,15 @@ kj::Own<kj::AsyncInputStream> HttpInputStreamImpl::getEntityBody(
+       // Body elided.
+       kj::Maybe<uint64_t> length;
+       KJ_IF_MAYBE(cl, headers.get(HttpHeaderId::CONTENT_LENGTH)) {
+-        length = strtoull(cl->cStr(), nullptr, 10);
++        // Validate that the Content-Length is a non-negative integer. Note that strtoull() accepts
++        // leading '-' signs and silently converts negative values to large unsigned values, so we
++        // must explicitly check for a leading digit.
++        char* end;
++        uint64_t parsedValue = strtoull(cl->cStr(), &end, 10);
++        if ((*cl)[0] >= '0' && (*cl)[0] <= '9' && end > cl->begin() && *end == '\0') {
++          length = parsedValue;
++        }
++        // If invalid, we just leave `length` as nullptr, since the body is elided anyway.
+       } else if (headers.get(HttpHeaderId::TRANSFER_ENCODING) == nullptr) {
+         // HACK: Neither Content-Length nor Transfer-Encoding header in response to HEAD request.
+         //   Propagate this fact with a 0 expected body length.
+@@ -1786,12 +1798,16 @@ kj::Own<kj::AsyncInputStream> HttpInputStreamImpl::getEntityBody(
+     //   "Content-Length: 5, 5, 5". Hopefully no one actually does that...
+     char* end;
+     uint64_t length = strtoull(cl->cStr(), &end, 10);
+-    if (end > cl->begin() && *end == '\0') {
++    // Note that strtoull() accepts leading '-' signs and silently converts negative values to
++    // large unsigned values, so we must explicitly check for a leading digit.
++    if ((*cl)[0] >= '0' && (*cl)[0] <= '9' && end > cl->begin() && *end == '\0') {
+       // #5
+       return kj::heap<HttpFixedLengthEntityReader>(*this, length);
+     } else {
+       // #4 (bad content-length)
+-      KJ_FAIL_REQUIRE("invalid Content-Length header value", *cl);
++      KJ_FAIL_REQUIRE("invalid Content-Length header value", *cl) { break; }
++      // To pass the -fno-exceptions test (but KJ-HTTP is really not safe to use in that mode).
++      return kj::heap<HttpNullEntityReader>(*this, uint64_t(0));
+     }
+   }
+ 
diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
index 7424a1420f..f51e037532 100644
--- a/package/capnproto/capnproto.mk
+++ b/package/capnproto/capnproto.mk
@@ -10,6 +10,10 @@ CAPNPROTO_LICENSE = MIT
 CAPNPROTO_LICENSE_FILES = LICENSE
 CAPNPROTO_CPE_ID_VENDOR = capnproto
 CAPNPROTO_INSTALL_STAGING = YES
+
+# 0001-fix-http-body-size-integer-overflow-bugs.patch
+CAPNPROTO_IGNORE_CVES += CVE-2026-32239 CVE-2026-32240
+
 # Fetched from Github with no configure script
 CAPNPROTO_AUTORECONF = YES
 CAPNPROTO_CONF_OPTS = --with-external-capnp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
