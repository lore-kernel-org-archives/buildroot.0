Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E52606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A/Fy2U8k
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F5AD608E2;
	Fri,  6 Nov 2026 16:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-0cvu1Zx21k; Fri,  6 Nov 2026 16:08:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 84367608ED
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981317;
	b=TPrsd5Ki/SlandvjdPMb1tAfP5vdo7XQA2T43vn334LjB1omQzBs/IffBpLVs+BYJTbL
	 NOtIuyvO5pjmPrZNKNaoMexFK5AppYjQ6bHqhZHNTpVSvwlNlOliK8BTJ8v6su6dHmRh7
	 xIp/He3tplE+BBfZo9CJf4Qf4Qz4RaimZYdxdv7KnF5yFn9zacvQay2IHFvDNLfL1zli1
	 VFBNtwceDUjKcJJkjv0YjsPib8UDNSmwxe53NugjldxLgGfHq5TukyUlQPWemOjCM+BZS
	 Rog5lwRhfxtmuDXrSqMIv9/8H9in53F6o6dphAqqdh8bqo9B8XoqXdIJqxnC48NeO+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981317;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=hfCqPRmBkEm1IThOYY+kzzFVSKSrs/cdsovyw68Q3iI=;
	b=bhqsQek+Ku7cYkKvc1cYnfgacI9pFjnhzqDT2dllPXIG6o2TAp9YvPCDNmUAUMQNBrbP
	 cF0B0WylWpIg5iNcXZDoQ/6DlRvgWHzjwHoHyz18Lk7+UAURh8dvfXCUeLdAw99ric+dQ
	 NRnu2DjaQFZRBI3YaBq3tsYZi+ytcyNbPpKo7MHc81xBm7C9viW3j2npQ23n8Zu7z+azv
	 9+wJTsI/LtLP2+ihRltNw3az53Az94IwDWULalUyWEGiIyfrQNmhFksc3QaQ+xRDMGRmv
	 6AmjUV2aqmRcDs7ab9NWp9BZZF8+a39ICKOdezarvzPlJJKFJn1S+9CgK/xetnVWMtg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981317;
	bh=hfCqPRmBkEm1IThOYY+kzzFVSKSrs/cdsovyw68Q3iI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A/Fy2U8kOKaqZkpLfn7C+DYfL2LkU/3zmy0kuSzTyoNPbs7kIFTTTe/ILMJitSRZl
	 uGHUnVADgN8Jxrubpslwvz6ECVetfx48bRAi/Yk12I9Qz4aLM4Q3lG2APhtsKM7gz8
	 yKciFltduAeFdyKdbZBrmusWv7gBSk9ggZbmGLIuObOAwzs0oN67/U6fekWgxgQtpY
	 6lrg/1VApeW+9KvyyUv96Cj8XNeIIGXAWN3RUvApS2h80dJ0dxZMufpWvw9/ZRxKTW
	 1BML4hm2o2zV1o0Fvr1hJrOQSZB0W2yO5JjvpVSGosn1DCbE5vNLj1nlDqjy4P/+Jf
	 jvtP6nBGmYDDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84367608ED;
	Fri,  6 Nov 2026 16:08:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E55924B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D76B840911
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_koW7ep6eGS for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A89664090B
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A89664090B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC9749E09B; Fri,  6 Nov 2026 16:06:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:57 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 16fa93eced18c890bd8840bc4752d2646d493a6b
X-Git-Newrev: 884806c1361a226abae131ad208f69beecfd2ceb
X-Patchwork-Hint: ignore
Message-Id: <20261106160650.DC9749E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/drogon: fix
 CVE-2023-26137 and CVE-2023-26138
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9142117668883342220=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============9142117668883342220==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/884806c1361a226abae131ad208f69beecfd2ceb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

All drogon releases, including 1.9.14, are affected by two CRLF
injection vulnerabilities, which upstream has fixed but not released
yet.

- CVE-2023-26137: HTTP response splitting when untrusted input is used
  to build header values in addHeader() and addCookie().
  https://www.cve.org/CVERecord?id=CVE-2023-26137
- CVE-2023-26138: CRLF injection when untrusted input is used to set
  request headers in addHeader().
  https://www.cve.org/CVERecord?id=CVE-2023-26138

Backport the upstream fix, which rejects CR and LF characters in header
and cookie values, both in responses and in requests sent by
HttpClient.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 89fcc7132a9b4f94d082fb9936b4335d28d91b43)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .../0001-Fix-CVE-2023-26137-CVE-2023-26138.patch   | 357 +++++++++++++++++++++
 package/drogon/drogon.mk                           |   3 +
 2 files changed, 360 insertions(+)

diff --git a/package/drogon/0001-Fix-CVE-2023-26137-CVE-2023-26138.patch b/package/drogon/0001-Fix-CVE-2023-26137-CVE-2023-26138.patch
new file mode 100644
index 0000000000..0b8e93df87
--- /dev/null
+++ b/package/drogon/0001-Fix-CVE-2023-26137-CVE-2023-26138.patch
@@ -0,0 +1,357 @@
+From 3c068bd888c332b9a155ba45a102d5faba643211 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <45538935+passgat@users.noreply.github.com>
+Date: Tue, 27 Oct 2026 07:49:45 +0100
+Subject: [PATCH] Fix CVE 2023 26137 CVE 2023 26138 (#2630)
+
+CVE: CVE-2023-26137
+CVE: CVE-2023-26138
+Upstream: https://github.com/drogonframework/drogon/commit/3c068bd888c332b9a155ba45a102d5faba643211
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+---
+ lib/inc/drogon/HttpRequest.h          |  5 +++-
+ lib/inc/drogon/HttpResponse.h         |  8 +++--
+ lib/src/HttpRequestImpl.h             |  6 ++++
+ lib/src/HttpResponseImpl.h            | 10 +++++++
+ lib/src/HttpUtils.cc                  | 41 +++++++++++++++++++++++++
+ lib/src/HttpUtils.h                   | 15 ++++++++++
+ lib/tests/CMakeLists.txt              |  1 +
+ lib/tests/unittests/HttpHeaderTest.cc | 43 +++++++++++++++++++++++++++
+ lib/tests/unittests/HttpUtilsTest.cc  | 41 +++++++++++++++++++++++++
+ 9 files changed, 167 insertions(+), 3 deletions(-)
+ create mode 100644 lib/tests/unittests/HttpUtilsTest.cc
+
+diff --git a/lib/inc/drogon/HttpRequest.h b/lib/inc/drogon/HttpRequest.h
+index 2ffd4fc4b9b1..e27a0023a22f 100644
+--- a/lib/inc/drogon/HttpRequest.h
++++ b/lib/inc/drogon/HttpRequest.h
+@@ -148,6 +148,8 @@ class DROGON_EXPORT HttpRequest
+      * @param field The field parameter is transformed to lower case before
+      * storing.
+      * @param value The value of the header.
++     * @note The header is ignored if the field or the value contains CR or LF
++     * characters, to prevent CRLF injection.
+      */
+     virtual void addHeader(std::string field, const std::string &value) = 0;
+     virtual void addHeader(std::string field, std::string &&value) = 0;
+@@ -468,7 +470,8 @@ class DROGON_EXPORT HttpRequest
+     /// For example, "content-type: text/plain\r\n"
+     virtual void setCustomContentTypeString(const std::string &type) = 0;
+ 
+-    /// Add a cookie
++    /// Add a cookie. The cookie is ignored if its key or value contains CR or
++    /// LF characters.
+     virtual void addCookie(std::string key, std::string value) = 0;
+ 
+     /**
+diff --git a/lib/inc/drogon/HttpResponse.h b/lib/inc/drogon/HttpResponse.h
+index f949bd0b033f..e0b1c1678b52 100644
+--- a/lib/inc/drogon/HttpResponse.h
++++ b/lib/inc/drogon/HttpResponse.h
+@@ -264,15 +264,19 @@ class DROGON_EXPORT HttpResponse
+      * @param field The field parameter is transformed to lower case before
+      * storing.
+      * @param value The value of the header.
++     * @note The header is ignored if the field or the value contains CR or LF
++     * characters, to prevent HTTP response splitting.
+      */
+     virtual void addHeader(std::string field, const std::string &value) = 0;
+     virtual void addHeader(std::string field, std::string &&value) = 0;
+ 
+-    /// Add a cookie
++    /// Add a cookie. The cookie is ignored if its key or value contains CR or
++    /// LF characters.
+     virtual void addCookie(const std::string &key,
+                            const std::string &value) = 0;
+ 
+-    /// Add a cookie
++    /// Add a cookie. The cookie is ignored if its key, value, domain or path
++    /// contains CR or LF characters.
+     virtual void addCookie(const Cookie &cookie) = 0;
+     virtual void addCookie(Cookie &&cookie) = 0;
+ 
+diff --git a/lib/src/HttpRequestImpl.h b/lib/src/HttpRequestImpl.h
+index 1b397b7f12fc..39fb868739d4 100644
+--- a/lib/src/HttpRequestImpl.h
++++ b/lib/src/HttpRequestImpl.h
+@@ -462,6 +462,8 @@ class HttpRequestImpl : public HttpRequest
+ 
+     void addHeader(std::string field, const std::string &value) override
+     {
++        if (!isValidHeader(field, value))
++            return;
+         transform(field.begin(),
+                   field.end(),
+                   field.begin(),
+@@ -471,6 +473,8 @@ class HttpRequestImpl : public HttpRequest
+ 
+     void addHeader(std::string field, std::string &&value) override
+     {
++        if (!isValidHeader(field, value))
++            return;
+         transform(field.begin(),
+                   field.end(),
+                   field.begin(),
+@@ -480,6 +484,8 @@ class HttpRequestImpl : public HttpRequest
+ 
+     void addCookie(std::string key, std::string value) override
+     {
++        if (!isValidCookie(key, value))
++            return;
+         cookies_[std::move(key)] = std::move(value);
+     }
+ 
+diff --git a/lib/src/HttpResponseImpl.h b/lib/src/HttpResponseImpl.h
+index beebe7fa8db2..f28d43b338b9 100644
+--- a/lib/src/HttpResponseImpl.h
++++ b/lib/src/HttpResponseImpl.h
+@@ -193,6 +193,8 @@ class DROGON_EXPORT HttpResponseImpl : public HttpResponse
+ 
+     void addHeader(std::string field, const std::string &value) override
+     {
++        if (!isValidHeader(field, value))
++            return;
+         fullHeaderString_.reset();
+         transform(field.begin(),
+                   field.end(),
+@@ -203,6 +205,8 @@ class DROGON_EXPORT HttpResponseImpl : public HttpResponse
+ 
+     void addHeader(std::string field, std::string &&value) override
+     {
++        if (!isValidHeader(field, value))
++            return;
+         fullHeaderString_.reset();
+         transform(field.begin(),
+                   field.end(),
+@@ -215,16 +219,22 @@ class DROGON_EXPORT HttpResponseImpl : public HttpResponse
+ 
+     void addCookie(const std::string &key, const std::string &value) override
+     {
++        if (!isValidCookie(key, value))
++            return;
+         cookies_[key] = Cookie(key, value);
+     }
+ 
+     void addCookie(const Cookie &cookie) override
+     {
++        if (!isValidCookie(cookie))
++            return;
+         cookies_[cookie.key()] = cookie;
+     }
+ 
+     void addCookie(Cookie &&cookie) override
+     {
++        if (!isValidCookie(cookie))
++            return;
+         cookies_[cookie.key()] = std::move(cookie);
+     }
+ 
+diff --git a/lib/src/HttpUtils.cc b/lib/src/HttpUtils.cc
+index 5cfcbb7d2566..cd33975c1df1 100644
+--- a/lib/src/HttpUtils.cc
++++ b/lib/src/HttpUtils.cc
+@@ -14,6 +14,7 @@
+ 
+ #include "HttpUtils.h"
+ #include <drogon/utils/Utilities.h>
++#include <drogon/Cookie.h>
+ #include <trantor/utils/Logger.h>
+ #include <map>
+ #include <unordered_map>
+@@ -740,4 +741,44 @@ const std::vector<std::string_view> &getFileExtensions(ContentType contentType)
+     return it->second;
+ }
+ 
++static bool containsCRLF(std::string_view str)
++{
++    return str.find_first_of("\r\n") != std::string_view::npos;
++}
++
++bool isValidHeader(std::string_view field, std::string_view value)
++{
++    if (containsCRLF(field) || containsCRLF(value))
++    {
++        LOG_ERROR << "Header '" << field
++                  << "' contains CR or LF characters, ignored";
++        return false;
++    }
++    return true;
++}
++
++bool isValidCookie(std::string_view key, std::string_view value)
++{
++    if (containsCRLF(key) || containsCRLF(value))
++    {
++        LOG_ERROR << "Cookie '" << key
++                  << "' contains CR or LF characters, ignored";
++        return false;
++    }
++    return true;
++}
++
++bool isValidCookie(const Cookie &cookie)
++{
++    if (!isValidCookie(cookie.key(), cookie.value()))
++        return false;
++    if (containsCRLF(cookie.domain()) || containsCRLF(cookie.path()))
++    {
++        LOG_ERROR << "Cookie '" << cookie.key()
++                  << "' contains CR or LF characters, ignored";
++        return false;
++    }
++    return true;
++}
++
+ }  // namespace drogon
+diff --git a/lib/src/HttpUtils.h b/lib/src/HttpUtils.h
+index 16a6c21732d2..53f2c13cff53 100644
+--- a/lib/src/HttpUtils.h
++++ b/lib/src/HttpUtils.h
+@@ -21,6 +21,8 @@
+ 
+ namespace drogon
+ {
++class Cookie;
++
+ const std::string_view &contentTypeToMime(ContentType contentType);
+ const std::string_view &statusCodeToString(int code);
+ ContentType getContentType(const std::string &fileName);
+@@ -43,6 +45,19 @@ inline std::string_view getFileExtension(const std::string &fileName)
+ 
+ const std::vector<std::string_view> &getFileExtensions(ContentType contentType);
+ 
++/// Return false (and log an error) if the header field or value contains a CR
++/// or LF character, which are not allowed in HTTP field names and values
++/// (RFC 9110, section 5.5).
++bool isValidHeader(std::string_view field, std::string_view value);
++
++/// Return false (and log an error) if the cookie key or value contains a CR or
++/// LF character.
++bool isValidCookie(std::string_view key, std::string_view value);
++
++/// Return false (and log an error) if the cookie key, value, domain or path
++/// contains a CR or LF character.
++bool isValidCookie(const Cookie &cookie);
++
+ inline const std::vector<std::string_view> &getFileExtensions(
+     const std::string_view &contentType)
+ {
+diff --git a/lib/tests/CMakeLists.txt b/lib/tests/CMakeLists.txt
+index 10f42ede1693..514e8692e74e 100644
+--- a/lib/tests/CMakeLists.txt
++++ b/lib/tests/CMakeLists.txt
+@@ -13,6 +13,7 @@ set(UNITTEST_SOURCES
+     unittests/ClassNameTest.cc
+     unittests/HttpDateTest.cc
+     unittests/HttpHeaderTest.cc
++    unittests/HttpUtilsTest.cc
+     unittests/HttpResponseSwapTest.cc
+     unittests/HttpClientTimeoutTest.cc
+     unittests/MD5Test.cc
+diff --git a/lib/tests/unittests/HttpHeaderTest.cc b/lib/tests/unittests/HttpHeaderTest.cc
+index d10c8887e5f1..940622989b07 100644
+--- a/lib/tests/unittests/HttpHeaderTest.cc
++++ b/lib/tests/unittests/HttpHeaderTest.cc
+@@ -16,6 +16,21 @@ DROGON_TEST(HttpHeaderRequest)
+     CHECK(req->getHeader("abc") == "");
+ }
+ 
++DROGON_TEST(HttpHeaderRequestCRLFInjection)
++{
++    auto req = HttpRequest::newHttpRequest();
++    req->addHeader("X-Test", "abc\r\nX-Injected: 1");
++    req->addHeader("X-Test\r\nX-Injected", "abc");
++    req->addHeader("X-Lf", std::string("abc\nX-Injected: 1"));
++    CHECK(req->getHeader("X-Test") == "");
++    CHECK(req->getHeader("X-Lf") == "");
++    CHECK(req->headers().empty());
++
++    req->addCookie("key", "value\r\nX-Injected: 1");
++    req->addCookie("key\nX-Injected: 1", "value");
++    CHECK(req->cookies().empty());
++}
++
+ DROGON_TEST(HttpHeaderResponse)
+ {
+     auto resp = std::dynamic_pointer_cast<HttpResponseImpl>(
+@@ -37,6 +52,34 @@ DROGON_TEST(HttpHeaderResponse)
+     CHECK(resp->getHeader("abc") == "");
+ }
+ 
++DROGON_TEST(HttpHeaderResponseCRLFInjection)
++{
++    auto resp = std::dynamic_pointer_cast<HttpResponseImpl>(
++        HttpResponse::newHttpResponse());
++    REQUIRE(resp != nullptr);
++    resp->addHeader("X-Test", "abc\r\nSet-Cookie: injected=1");
++    resp->addHeader("X-Test\r\nX-Injected", "abc");
++    resp->addHeader("X-Lf", std::string("abc\nX-Injected: 1"));
++    CHECK(resp->getHeader("X-Test") == "");
++    CHECK(resp->getHeader("X-Lf") == "");
++    CHECK(resp->headers().empty());
++
++    resp->addCookie("key", "value\r\nX-Injected: 1");
++    Cookie cookie("key", "value");
++    cookie.setPath("/\r\nX-Injected: 1");
++    resp->addCookie(cookie);
++    cookie.setPath("/");
++    cookie.setDomain("example.com\nX-Injected: 1");
++    resp->addCookie(std::move(cookie));
++    CHECK(resp->cookies().empty());
++
++    resp->makeHeaderString();
++    auto buffer = resp->renderToBuffer();
++    auto str = std::string{buffer->peek(), buffer->readableBytes()};
++    CHECK(str.find("injected") == std::string::npos);
++    CHECK(str.find("X-Injected") == std::string::npos);
++}
++
+ DROGON_TEST(ResponseSetCustomContentTypeString)
+ {
+     auto resp = HttpResponse::newHttpResponse();
+diff --git a/lib/tests/unittests/HttpUtilsTest.cc b/lib/tests/unittests/HttpUtilsTest.cc
+new file mode 100644
+index 000000000000..182b10000d61
+--- /dev/null
++++ b/lib/tests/unittests/HttpUtilsTest.cc
+@@ -0,0 +1,41 @@
++#include "../lib/src/HttpUtils.h"
++#include <drogon/Cookie.h>
++#include <drogon/drogon_test.h>
++using namespace drogon;
++
++DROGON_TEST(IsValidHeader)
++{
++    CHECK(isValidHeader("X-Test", "abc"));
++    CHECK(isValidHeader("X-Test", ""));
++    CHECK(isValidHeader("X-Test", "a: b; c=d"));
++    CHECK(!isValidHeader("X-Test", "abc\r\nX-Injected: 1"));
++    CHECK(!isValidHeader("X-Test", "abc\r"));
++    CHECK(!isValidHeader("X-Test", "abc\nX-Injected: 1"));
++    CHECK(!isValidHeader("X-Test\r\nX-Injected", "abc"));
++    CHECK(!isValidHeader("X-Test\n", "abc"));
++}
++
++DROGON_TEST(IsValidCookie)
++{
++    CHECK(isValidCookie("key", "value"));
++    CHECK(isValidCookie("key", ""));
++    CHECK(!isValidCookie("key", "value\r\nX-Injected: 1"));
++    CHECK(!isValidCookie("key", "value\n"));
++    CHECK(!isValidCookie("key\r", "value"));
++
++    Cookie cookie("key", "value");
++    cookie.setDomain("example.com");
++    cookie.setPath("/");
++    CHECK(isValidCookie(cookie));
++
++    cookie.setValue("value\r\nX-Injected: 1");
++    CHECK(!isValidCookie(cookie));
++
++    cookie.setValue("value");
++    cookie.setDomain("example.com\r\nX-Injected: 1");
++    CHECK(!isValidCookie(cookie));
++
++    cookie.setDomain("example.com");
++    cookie.setPath("/\nX-Injected: 1");
++    CHECK(!isValidCookie(cookie));
++}
diff --git a/package/drogon/drogon.mk b/package/drogon/drogon.mk
index 42ae64d4cf..e675ace98f 100644
--- a/package/drogon/drogon.mk
+++ b/package/drogon/drogon.mk
@@ -12,6 +12,9 @@ DROGON_LICENSE = MIT
 DROGON_LICENSE_FILES = LICENSE
 DROGON_INSTALL_STAGING = YES
 
+# 0001-Fix-CVE-2023-26137-CVE-2023-26138.patch
+DROGON_IGNORE_CVES += CVE-2023-26137 CVE-2023-26138
+
 DROGON_DEPENDENCIES = jsoncpp util-linux zlib
 HOST_DROGON_DEPENDENCIES = host-jsoncpp host-util-linux host-zlib
 

--===============9142117668883342220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9142117668883342220==--
