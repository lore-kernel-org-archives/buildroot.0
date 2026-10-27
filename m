Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA1B606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 17:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WiqjvFJz
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18A2F60699;
	Tue, 27 Oct 2026 17:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKqxrq9PR178; Tue, 27 Oct 2026 17:22:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6D42F6073B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793121749;
	b=TVCMY/jSyRP3iFRvGmVJU7vqN2k2x6f7ioINrXhybt1Z8/nhxvHWZacd2s+BE3mLM7qE
	 q9PSXICx/Y86SUGTUXMz86zbZAc5mVyKJUrD3Q2+qTO6CS/IZ3/0IM1oG2GzkgpbKyne3
	 ajjRnyUTdLrVNAoeogIHVvH2gLCsio55VTO1SeaMhXYuFnD/d9YXOGbud//Htc2ymqKmP
	 guC5V4OOyBHGDmN7CmZK1UhVfZJ+lBkrcfpmH6ZSzFogrVZqmoW35KLDs/nE29Gb0lx1Z
	 Nkyk6mU4EK3pJMZbHMzr8stNNaVeEjU77Scu2TgV/A5XIXgZzHABkbsHvaqCwtbfP0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793121749;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vkjtLuRQtRy/hRogw3tVtLso4z+HQOlNtg+u2tCr7gg=;
	b=ZehqkuDzLakM6adPq5TPXxM7k3xAb7pY68DbcI60XiO1xTI9yA4cvYbdpoqcTKBPBpnp
	 AzENBIdLf76NXVbd9TI4ATawKiqEAdoxPAcplnAkMBN3RqOcKjE0Pg6xNLzZB5wF9UgWP
	 WgPh92HhlltMQ0hYXLxzb6YcvmzAJ7OGRzVL8n3KGpV5Z1rxDY/To+7HljTkgMNBo+RlX
	 zC/Fr0Zmi+K7SyNuDNb44XNnZWzd1rw+CAkj6R49BJNRdgpiBs8HTBjJ78+etNMMiUp6w
	 leh5IcMUyNoefxf1lyHr9Yiit+SQnAessnjij5/RvtYNmfgdk8+TTo0wITKsOqtbHsg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793121749;
	bh=vkjtLuRQtRy/hRogw3tVtLso4z+HQOlNtg+u2tCr7gg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WiqjvFJzkLOvQkNL63yv2+U+u9rF6GBJXe5gcJz4ATHwT1LkMJHWI8tVX0AB4SFre
	 jwdFaKDjGcgi9qDKcFS62ttc6UAt3QFJogZ4YLar+uu1nLkJk9KrqcFDLurCgSw0VN
	 OMNMggJY4ANEsiQ7OvJ+kZbYpDg8UMV+cSfry+cfRH/z2IXEsCeXVWP3GSdwzsWXH3
	 Ig0EfiSlRvyn/lg4KA10xrM3oUiNlA3JXyuNC7xNnU5IUJQfuE0dMsJ9/+kttP0g//
	 EHky6blkLQKiZVqSTgiIRFu3ekbu6O7p2s4QuCICs6QRrPMlOXonM+DEMGnPz5pcKe
	 6/CveVXWcTgJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D42F6073B;
	Tue, 27 Oct 2026 17:22:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD0F9473
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE79F6068F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQFDNMIWzXiE for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 17:22:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7EF476073B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793121747;
 b=QPNv1ULLpIWLnv9YLYNGMsK3EVIK/oOYMds5Cba1er2im9qAlvSdhOajORwABCsHY4On
 fhh0dUGVJW8vOgRV3tNA0BJTyV1+05iTux/FhzUawT6DN6WJdhqaARf2smhgEiDrA1Wt3
 zNiLNSH0hXDLsgez3EI4k6Qw/zIlTuftZa4M2tFFrPRauSssVTMMOr4rhQYU8KPIRrMXf
 TMA8OoBR+TSi/FT9iotzKC8lZcTXHWLBMOol9K63MKPeDe4mAdrQtFXebu1HshehQpCi6
 sB/fadm1QAbcWHL7ULvdcYJUe+Ksst02pNPHnBs8LvilMIKPoijHtyVjS7Gy2yBHRlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793121747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5kbg2k59hvdVDifCeosXn2Pqj5z0DnyJat/L1+jOpM0=;
 b=N+XDiQqIRJLaIfmD+X+0igj0S+Oia5svpIZBfz8B1urSt8uj1K60Asz1qeD19Cv7jyRB
 pDZIKqlgxQbFDCsX0RdGkKN7+U7aWaPPzb/vyEyOnMsqyIDVnxtILSkxWkIHfezRsSrSD
 zc7S/T2PjTE3+fTo91FhH1Xt+jlIuTCWeQBiUlAYs5Ff4e2TjIH1LFXNPHOgfct6anz9r
 HlrePC6u+mhhp0LYifLhIADU8BV1/QKaWQ8+ZlA2oFH7R7gvng5mP3U81dNJrVDGaxZ7G
 bDJ7Zho4ZXiqXRmMx8iDGKuW56bzh4pVXYoyhmYDB3XBiIQc2cnxrOkFsSKhU4OwWYg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EF476073B
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:22:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC2709D11F; Tue, 27 Oct 2026 17:21:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 18:06:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1cfdb4efd539ad5917bc43ac806a95687e7f4b6b
X-Git-Newrev: 89fcc7132a9b4f94d082fb9936b4335d28d91b43
X-Patchwork-Hint: ignore
Message-Id: <20261027172100.EC2709D11F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/drogon: fix CVE-2023-26137 and
 CVE-2023-26138
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/89fcc7132a9b4f94d082fb9936b4335d28d91b43
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
index 8c51d16ac0..d3b7381ad8 100644
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
