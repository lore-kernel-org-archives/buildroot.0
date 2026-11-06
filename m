Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35430606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=S9Wibcb4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1459F81C6F;
	Fri,  6 Nov 2026 16:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dwv6_j9h8rM8; Fri,  6 Nov 2026 16:10:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 304A781D67
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981412;
	b=A6BNLqUbF9J9zdSd0/H4Gvp9gJLgjvQ15AHX54qAZ2rIZT3VPZ7DDE0Q6rguYI9BEvgh
	 5EvE75Ne3VOWOZ+oIb1iVtcWDD37QEV6d0GKM688LAiltOuhz6PfXGvjtr27hV9XlLv4R
	 2ChQpzQ/G+sPajNA9YDW94eh2DMI/Dvs6CGlZC/JLpM30I6pqIKnLqy9mbMjjOUz/1UQO
	 vaJayAbVCk5cSRGzT4qIbc2lBGWZZhSvnMBlvkDdZPguwO2U1Xy2Kinee9SD4+/EX+O9T
	 PQiZuwk+GZOfD3gdJuQ7/NuSYQQO7Y0vk3FT8fpY0nnA3roeemHaF2vg9znrMC6gg5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981412;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nDuhkYoSBUy8OFU6t+AEc/druBkEZvgZ6I938q/d33s=;
	b=SdETlnk3qB9QIrFX6+I2ibHZnLbBJE4AYW22kHFsat1N8VZEtZzGIhimg5WsnbviTwIZ
	 WbUliGVFg8Zr28lyOFRhVmX3YwdCxDvcVs33tdG+KBC5WFBMhI77dwWegtsFV1CXwzVFK
	 mGk2TE6Bh6YbiE6jTK20hFCWYyIVqJ00QdDkxLMlrm0QKUQJkOPK6/PqJoa2XxbCLcG5a
	 Ui2LhSYNfmTl1O4qE7cwZA0S/u8MGdsUhvGRAJwIKTZ5uI5yjdzkTU1SXskQlnKWahtGq
	 9kindiB8C9KGnGMqBY+VkxRaupe3uDmk/q3rbPCCs4vDKARb+0g4R8vsjLISMOUjB1Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981412;
	bh=nDuhkYoSBUy8OFU6t+AEc/druBkEZvgZ6I938q/d33s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S9Wibcb4WcNmCF/nXEEY60OdutOR3ldDsUghQjxSOcs/lryhw9yrr15yiWk7xTQCE
	 V6IjRx0nTd89/6sSskYSfBAtqhwNPUcl/7Jk1S2igR1pLCjB2PYCUo2kij1gyO98wY
	 JPO2/ZgJdiE8RI9zcUa769uiSd9Y5A4J1513oETN7CCh5yn8norvyz26RXNsG6qT+a
	 JZrRpNLqqautKGfDMfbO0SScWD/DDsbz1kyBbKwgaQIbUTYLOHS5vTDGwSjMUk/7fq
	 AlsqRFeE15SJUJ6LsQJJ6/ZmKhKb5eXMPrxhCbcMrSo6/zfYIdb4eFvOl1goy0Uf5V
	 aZLp1+Nd8nByQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 304A781D67;
	Fri,  6 Nov 2026 16:10:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A97A2E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20C5581C26
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DThlj-ufB-BK for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:10:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9CCB181D18
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CCB181D18
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:07 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4910b863b84so1334232f8f.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:10:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981405; x=1794586205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9+4/5y6yiUgVqGLgjzaDnOebsYEc+5UYiq+Vstvv1zs=;
 b=yAZpmgRYJUHZY8GBANj9JBBtU4scsugKkgK/noF9ena/ldf6c44aariAls2XKdt6+t
 VkzyR/L1NkFYwYFj397JHhemdBdtewtx+4e9r0LU1cVNPX5VPoNL/BSqjggCBAg9lTJG
 3frzvA+whzDgK3uDIKK8Nvu+mqLPjyCxBQXd0VLrkRv01HgVGPbTlcW2a0WofuFEFJiL
 vG93+9PUiN2fc9ToMi4tDiiNLetwB1//d3xRICn1rBhHp54ghrSqhvxo1S3Hwo83oS8H
 Dh4hEw+v+ZFdwcFO29+TIaYXCQKq0xj7h29doOizQpXbEN8aUDzPkhITUWi551WBHcC/
 hygA==
X-Gm-Message-State: APuU4Z/8zxI2nOLtqdy4zt5P5mtpvzWDruUHHZuC+hLXf5tN3u+2gu+x
 0nOHqooqGRiBLP361vmpF3HMZKqffB4jxeZ4r746Ie4C7IunOYm1xCX4yN8dcFTaPIufXXPaSeE
 jkQi2DO8=
X-Gm-Gg: AYBFou2aY3/tB1k9o0kBPkr8dNIOAvWq9J0QcSynNL42uP0lDkvmV1rYbNokKdcMfz8
 0rYK6D00tPnKKeFRk09fs+GKKL1rETLm+Oa10jbJkkcJgajgSu8uzZU6DFuja/M2lc0NmcxK8RO
 7O1KsYWbiwUocwJ4gagYO2BWWjmkoqrdxouKTSakk9XQ0lr9ugiJU7q8w5LtXb/JTPYspym7QlK
 gcJCy+KueAuT6+r6zY5jMTafGdjfV4ELasHhXXRPUkdCBAZx69uMjlheWUerLJkiV4bvVcaU2V8
 KnDeIKXFjQrR/eXaUadjFDLHqGlhDWdYdmxPe6xYuTli5uny9caYHzZFCBLV0E39I4wP9EmdM/R
 JnbiYScrpKDsNRtjYT8cU0kn1FAUD4UXE9P0ljnAwwYBmuApABV7qkEVUKHD+wkBDbyMoWgqr8X
 qShA2pVhIV4SMtq+wTYA5fizAHDHDnNSlmOsPGJZURAKwMUD2uR+NFi/0IzVRLa0+atmnp8jLqM
 4McLZzF/EjMBNaa86eX2JSdOgIeGqsVGyq0ccEJyeFq6hfGy9Au/AwKh6Pwrp2FMZV8le0Eqn0g
 Y8CFJtttGyUhIWszX0XOvEz5nLjCABE9NcIIr9iyBd6oZ+AECc/97Q==
X-Received: by 2002:a05:600c:a013:b0:4a0:20b4:ba93 with SMTP id
 5b1f17b1804b1-4b6e091ed5amr47312865e9.16.1793981405300; 
 Fri, 06 Nov 2026 08:10:05 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6e240141esm64812515e9.14.2026.11.06.08.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:10:04 -0800 (PST)
To: buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:10:02 +0100
Message-ID: <20261106161003.607460-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027151809.1110228-1-dario.binacchi@amarulasolutions.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/drogon: fix CVE-2023-26137 and
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> All drogon releases, including 1.9.14, are affected by two CRLF
> injection vulnerabilities, which upstream has fixed but not released
> yet.
> 
> - CVE-2023-26137: HTTP response splitting when untrusted input is used
>   to build header values in addHeader() and addCookie().
>   https://www.cve.org/CVERecord?id=CVE-2023-26137
> - CVE-2023-26138: CRLF injection when untrusted input is used to set
>   request headers in addHeader().
>   https://www.cve.org/CVERecord?id=CVE-2023-26138
> 
> Backport the upstream fix, which rejects CR and LF characters in header
> and cookie values, both in responses and in requests sent by
> HttpClient.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2026.08.x. Thanks

> ---
>  ...01-Fix-CVE-2023-26137-CVE-2023-26138.patch | 357 ++++++++++++++++++
>  package/drogon/drogon.mk                      |   3 +
>  2 files changed, 360 insertions(+)
>  create mode 100644 package/drogon/0001-Fix-CVE-2023-26137-CVE-2023-26138.patch
> 
> diff --git a/package/drogon/0001-Fix-CVE-2023-26137-CVE-2023-26138.patch b/package/drogon/0001-Fix-CVE-2023-26137-CVE-2023-26138.patch
> new file mode 100644
> index 000000000000..0b8e93df8731
> --- /dev/null
> +++ b/package/drogon/0001-Fix-CVE-2023-26137-CVE-2023-26138.patch
> @@ -0,0 +1,357 @@
> +From 3c068bd888c332b9a155ba45a102d5faba643211 Mon Sep 17 00:00:00 2001
> +From: Dario Binacchi <45538935+passgat@users.noreply.github.com>
> +Date: Tue, 27 Oct 2026 07:49:45 +0100
> +Subject: [PATCH] Fix CVE 2023 26137 CVE 2023 26138 (#2630)
> +
> +CVE: CVE-2023-26137
> +CVE: CVE-2023-26138
> +Upstream: https://github.com/drogonframework/drogon/commit/3c068bd888c332b9a155ba45a102d5faba643211
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +---
> + lib/inc/drogon/HttpRequest.h          |  5 +++-
> + lib/inc/drogon/HttpResponse.h         |  8 +++--
> + lib/src/HttpRequestImpl.h             |  6 ++++
> + lib/src/HttpResponseImpl.h            | 10 +++++++
> + lib/src/HttpUtils.cc                  | 41 +++++++++++++++++++++++++
> + lib/src/HttpUtils.h                   | 15 ++++++++++
> + lib/tests/CMakeLists.txt              |  1 +
> + lib/tests/unittests/HttpHeaderTest.cc | 43 +++++++++++++++++++++++++++
> + lib/tests/unittests/HttpUtilsTest.cc  | 41 +++++++++++++++++++++++++
> + 9 files changed, 167 insertions(+), 3 deletions(-)
> + create mode 100644 lib/tests/unittests/HttpUtilsTest.cc
> +
> +diff --git a/lib/inc/drogon/HttpRequest.h b/lib/inc/drogon/HttpRequest.h
> +index 2ffd4fc4b9b1..e27a0023a22f 100644
> +--- a/lib/inc/drogon/HttpRequest.h
> ++++ b/lib/inc/drogon/HttpRequest.h
> +@@ -148,6 +148,8 @@ class DROGON_EXPORT HttpRequest
> +      * @param field The field parameter is transformed to lower case before
> +      * storing.
> +      * @param value The value of the header.
> ++     * @note The header is ignored if the field or the value contains CR or LF
> ++     * characters, to prevent CRLF injection.
> +      */
> +     virtual void addHeader(std::string field, const std::string &value) = 0;
> +     virtual void addHeader(std::string field, std::string &&value) = 0;
> +@@ -468,7 +470,8 @@ class DROGON_EXPORT HttpRequest
> +     /// For example, "content-type: text/plain\r\n"
> +     virtual void setCustomContentTypeString(const std::string &type) = 0;
> + 
> +-    /// Add a cookie
> ++    /// Add a cookie. The cookie is ignored if its key or value contains CR or
> ++    /// LF characters.
> +     virtual void addCookie(std::string key, std::string value) = 0;
> + 
> +     /**
> +diff --git a/lib/inc/drogon/HttpResponse.h b/lib/inc/drogon/HttpResponse.h
> +index f949bd0b033f..e0b1c1678b52 100644
> +--- a/lib/inc/drogon/HttpResponse.h
> ++++ b/lib/inc/drogon/HttpResponse.h
> +@@ -264,15 +264,19 @@ class DROGON_EXPORT HttpResponse
> +      * @param field The field parameter is transformed to lower case before
> +      * storing.
> +      * @param value The value of the header.
> ++     * @note The header is ignored if the field or the value contains CR or LF
> ++     * characters, to prevent HTTP response splitting.
> +      */
> +     virtual void addHeader(std::string field, const std::string &value) = 0;
> +     virtual void addHeader(std::string field, std::string &&value) = 0;
> + 
> +-    /// Add a cookie
> ++    /// Add a cookie. The cookie is ignored if its key or value contains CR or
> ++    /// LF characters.
> +     virtual void addCookie(const std::string &key,
> +                            const std::string &value) = 0;
> + 
> +-    /// Add a cookie
> ++    /// Add a cookie. The cookie is ignored if its key, value, domain or path
> ++    /// contains CR or LF characters.
> +     virtual void addCookie(const Cookie &cookie) = 0;
> +     virtual void addCookie(Cookie &&cookie) = 0;
> + 
> +diff --git a/lib/src/HttpRequestImpl.h b/lib/src/HttpRequestImpl.h
> +index 1b397b7f12fc..39fb868739d4 100644
> +--- a/lib/src/HttpRequestImpl.h
> ++++ b/lib/src/HttpRequestImpl.h
> +@@ -462,6 +462,8 @@ class HttpRequestImpl : public HttpRequest
> + 
> +     void addHeader(std::string field, const std::string &value) override
> +     {
> ++        if (!isValidHeader(field, value))
> ++            return;
> +         transform(field.begin(),
> +                   field.end(),
> +                   field.begin(),
> +@@ -471,6 +473,8 @@ class HttpRequestImpl : public HttpRequest
> + 
> +     void addHeader(std::string field, std::string &&value) override
> +     {
> ++        if (!isValidHeader(field, value))
> ++            return;
> +         transform(field.begin(),
> +                   field.end(),
> +                   field.begin(),
> +@@ -480,6 +484,8 @@ class HttpRequestImpl : public HttpRequest
> + 
> +     void addCookie(std::string key, std::string value) override
> +     {
> ++        if (!isValidCookie(key, value))
> ++            return;
> +         cookies_[std::move(key)] = std::move(value);
> +     }
> + 
> +diff --git a/lib/src/HttpResponseImpl.h b/lib/src/HttpResponseImpl.h
> +index beebe7fa8db2..f28d43b338b9 100644
> +--- a/lib/src/HttpResponseImpl.h
> ++++ b/lib/src/HttpResponseImpl.h
> +@@ -193,6 +193,8 @@ class DROGON_EXPORT HttpResponseImpl : public HttpResponse
> + 
> +     void addHeader(std::string field, const std::string &value) override
> +     {
> ++        if (!isValidHeader(field, value))
> ++            return;
> +         fullHeaderString_.reset();
> +         transform(field.begin(),
> +                   field.end(),
> +@@ -203,6 +205,8 @@ class DROGON_EXPORT HttpResponseImpl : public HttpResponse
> + 
> +     void addHeader(std::string field, std::string &&value) override
> +     {
> ++        if (!isValidHeader(field, value))
> ++            return;
> +         fullHeaderString_.reset();
> +         transform(field.begin(),
> +                   field.end(),
> +@@ -215,16 +219,22 @@ class DROGON_EXPORT HttpResponseImpl : public HttpResponse
> + 
> +     void addCookie(const std::string &key, const std::string &value) override
> +     {
> ++        if (!isValidCookie(key, value))
> ++            return;
> +         cookies_[key] = Cookie(key, value);
> +     }
> + 
> +     void addCookie(const Cookie &cookie) override
> +     {
> ++        if (!isValidCookie(cookie))
> ++            return;
> +         cookies_[cookie.key()] = cookie;
> +     }
> + 
> +     void addCookie(Cookie &&cookie) override
> +     {
> ++        if (!isValidCookie(cookie))
> ++            return;
> +         cookies_[cookie.key()] = std::move(cookie);
> +     }
> + 
> +diff --git a/lib/src/HttpUtils.cc b/lib/src/HttpUtils.cc
> +index 5cfcbb7d2566..cd33975c1df1 100644
> +--- a/lib/src/HttpUtils.cc
> ++++ b/lib/src/HttpUtils.cc
> +@@ -14,6 +14,7 @@
> + 
> + #include "HttpUtils.h"
> + #include <drogon/utils/Utilities.h>
> ++#include <drogon/Cookie.h>
> + #include <trantor/utils/Logger.h>
> + #include <map>
> + #include <unordered_map>
> +@@ -740,4 +741,44 @@ const std::vector<std::string_view> &getFileExtensions(ContentType contentType)
> +     return it->second;
> + }
> + 
> ++static bool containsCRLF(std::string_view str)
> ++{
> ++    return str.find_first_of("\r\n") != std::string_view::npos;
> ++}
> ++
> ++bool isValidHeader(std::string_view field, std::string_view value)
> ++{
> ++    if (containsCRLF(field) || containsCRLF(value))
> ++    {
> ++        LOG_ERROR << "Header '" << field
> ++                  << "' contains CR or LF characters, ignored";
> ++        return false;
> ++    }
> ++    return true;
> ++}
> ++
> ++bool isValidCookie(std::string_view key, std::string_view value)
> ++{
> ++    if (containsCRLF(key) || containsCRLF(value))
> ++    {
> ++        LOG_ERROR << "Cookie '" << key
> ++                  << "' contains CR or LF characters, ignored";
> ++        return false;
> ++    }
> ++    return true;
> ++}
> ++
> ++bool isValidCookie(const Cookie &cookie)
> ++{
> ++    if (!isValidCookie(cookie.key(), cookie.value()))
> ++        return false;
> ++    if (containsCRLF(cookie.domain()) || containsCRLF(cookie.path()))
> ++    {
> ++        LOG_ERROR << "Cookie '" << cookie.key()
> ++                  << "' contains CR or LF characters, ignored";
> ++        return false;
> ++    }
> ++    return true;
> ++}
> ++
> + }  // namespace drogon
> +diff --git a/lib/src/HttpUtils.h b/lib/src/HttpUtils.h
> +index 16a6c21732d2..53f2c13cff53 100644
> +--- a/lib/src/HttpUtils.h
> ++++ b/lib/src/HttpUtils.h
> +@@ -21,6 +21,8 @@
> + 
> + namespace drogon
> + {
> ++class Cookie;
> ++
> + const std::string_view &contentTypeToMime(ContentType contentType);
> + const std::string_view &statusCodeToString(int code);
> + ContentType getContentType(const std::string &fileName);
> +@@ -43,6 +45,19 @@ inline std::string_view getFileExtension(const std::string &fileName)
> + 
> + const std::vector<std::string_view> &getFileExtensions(ContentType contentType);
> + 
> ++/// Return false (and log an error) if the header field or value contains a CR
> ++/// or LF character, which are not allowed in HTTP field names and values
> ++/// (RFC 9110, section 5.5).
> ++bool isValidHeader(std::string_view field, std::string_view value);
> ++
> ++/// Return false (and log an error) if the cookie key or value contains a CR or
> ++/// LF character.
> ++bool isValidCookie(std::string_view key, std::string_view value);
> ++
> ++/// Return false (and log an error) if the cookie key, value, domain or path
> ++/// contains a CR or LF character.
> ++bool isValidCookie(const Cookie &cookie);
> ++
> + inline const std::vector<std::string_view> &getFileExtensions(
> +     const std::string_view &contentType)
> + {
> +diff --git a/lib/tests/CMakeLists.txt b/lib/tests/CMakeLists.txt
> +index 10f42ede1693..514e8692e74e 100644
> +--- a/lib/tests/CMakeLists.txt
> ++++ b/lib/tests/CMakeLists.txt
> +@@ -13,6 +13,7 @@ set(UNITTEST_SOURCES
> +     unittests/ClassNameTest.cc
> +     unittests/HttpDateTest.cc
> +     unittests/HttpHeaderTest.cc
> ++    unittests/HttpUtilsTest.cc
> +     unittests/HttpResponseSwapTest.cc
> +     unittests/HttpClientTimeoutTest.cc
> +     unittests/MD5Test.cc
> +diff --git a/lib/tests/unittests/HttpHeaderTest.cc b/lib/tests/unittests/HttpHeaderTest.cc
> +index d10c8887e5f1..940622989b07 100644
> +--- a/lib/tests/unittests/HttpHeaderTest.cc
> ++++ b/lib/tests/unittests/HttpHeaderTest.cc
> +@@ -16,6 +16,21 @@ DROGON_TEST(HttpHeaderRequest)
> +     CHECK(req->getHeader("abc") == "");
> + }
> + 
> ++DROGON_TEST(HttpHeaderRequestCRLFInjection)
> ++{
> ++    auto req = HttpRequest::newHttpRequest();
> ++    req->addHeader("X-Test", "abc\r\nX-Injected: 1");
> ++    req->addHeader("X-Test\r\nX-Injected", "abc");
> ++    req->addHeader("X-Lf", std::string("abc\nX-Injected: 1"));
> ++    CHECK(req->getHeader("X-Test") == "");
> ++    CHECK(req->getHeader("X-Lf") == "");
> ++    CHECK(req->headers().empty());
> ++
> ++    req->addCookie("key", "value\r\nX-Injected: 1");
> ++    req->addCookie("key\nX-Injected: 1", "value");
> ++    CHECK(req->cookies().empty());
> ++}
> ++
> + DROGON_TEST(HttpHeaderResponse)
> + {
> +     auto resp = std::dynamic_pointer_cast<HttpResponseImpl>(
> +@@ -37,6 +52,34 @@ DROGON_TEST(HttpHeaderResponse)
> +     CHECK(resp->getHeader("abc") == "");
> + }
> + 
> ++DROGON_TEST(HttpHeaderResponseCRLFInjection)
> ++{
> ++    auto resp = std::dynamic_pointer_cast<HttpResponseImpl>(
> ++        HttpResponse::newHttpResponse());
> ++    REQUIRE(resp != nullptr);
> ++    resp->addHeader("X-Test", "abc\r\nSet-Cookie: injected=1");
> ++    resp->addHeader("X-Test\r\nX-Injected", "abc");
> ++    resp->addHeader("X-Lf", std::string("abc\nX-Injected: 1"));
> ++    CHECK(resp->getHeader("X-Test") == "");
> ++    CHECK(resp->getHeader("X-Lf") == "");
> ++    CHECK(resp->headers().empty());
> ++
> ++    resp->addCookie("key", "value\r\nX-Injected: 1");
> ++    Cookie cookie("key", "value");
> ++    cookie.setPath("/\r\nX-Injected: 1");
> ++    resp->addCookie(cookie);
> ++    cookie.setPath("/");
> ++    cookie.setDomain("example.com\nX-Injected: 1");
> ++    resp->addCookie(std::move(cookie));
> ++    CHECK(resp->cookies().empty());
> ++
> ++    resp->makeHeaderString();
> ++    auto buffer = resp->renderToBuffer();
> ++    auto str = std::string{buffer->peek(), buffer->readableBytes()};
> ++    CHECK(str.find("injected") == std::string::npos);
> ++    CHECK(str.find("X-Injected") == std::string::npos);
> ++}
> ++
> + DROGON_TEST(ResponseSetCustomContentTypeString)
> + {
> +     auto resp = HttpResponse::newHttpResponse();
> +diff --git a/lib/tests/unittests/HttpUtilsTest.cc b/lib/tests/unittests/HttpUtilsTest.cc
> +new file mode 100644
> +index 000000000000..182b10000d61
> +--- /dev/null
> ++++ b/lib/tests/unittests/HttpUtilsTest.cc
> +@@ -0,0 +1,41 @@
> ++#include "../lib/src/HttpUtils.h"
> ++#include <drogon/Cookie.h>
> ++#include <drogon/drogon_test.h>
> ++using namespace drogon;
> ++
> ++DROGON_TEST(IsValidHeader)
> ++{
> ++    CHECK(isValidHeader("X-Test", "abc"));
> ++    CHECK(isValidHeader("X-Test", ""));
> ++    CHECK(isValidHeader("X-Test", "a: b; c=d"));
> ++    CHECK(!isValidHeader("X-Test", "abc\r\nX-Injected: 1"));
> ++    CHECK(!isValidHeader("X-Test", "abc\r"));
> ++    CHECK(!isValidHeader("X-Test", "abc\nX-Injected: 1"));
> ++    CHECK(!isValidHeader("X-Test\r\nX-Injected", "abc"));
> ++    CHECK(!isValidHeader("X-Test\n", "abc"));
> ++}
> ++
> ++DROGON_TEST(IsValidCookie)
> ++{
> ++    CHECK(isValidCookie("key", "value"));
> ++    CHECK(isValidCookie("key", ""));
> ++    CHECK(!isValidCookie("key", "value\r\nX-Injected: 1"));
> ++    CHECK(!isValidCookie("key", "value\n"));
> ++    CHECK(!isValidCookie("key\r", "value"));
> ++
> ++    Cookie cookie("key", "value");
> ++    cookie.setDomain("example.com");
> ++    cookie.setPath("/");
> ++    CHECK(isValidCookie(cookie));
> ++
> ++    cookie.setValue("value\r\nX-Injected: 1");
> ++    CHECK(!isValidCookie(cookie));
> ++
> ++    cookie.setValue("value");
> ++    cookie.setDomain("example.com\r\nX-Injected: 1");
> ++    CHECK(!isValidCookie(cookie));
> ++
> ++    cookie.setDomain("example.com");
> ++    cookie.setPath("/\nX-Injected: 1");
> ++    CHECK(!isValidCookie(cookie));
> ++}
> diff --git a/package/drogon/drogon.mk b/package/drogon/drogon.mk
> index 03cba45ceb34..7850d754dc6e 100644
> --- a/package/drogon/drogon.mk
> +++ b/package/drogon/drogon.mk
> @@ -12,6 +12,9 @@ DROGON_LICENSE = MIT
>  DROGON_LICENSE_FILES = LICENSE
>  DROGON_INSTALL_STAGING = YES
>  
> +# 0001-Fix-CVE-2023-26137-CVE-2023-26138.patch
> +DROGON_IGNORE_CVES += CVE-2023-26137 CVE-2023-26138
> +
>  DROGON_DEPENDENCIES = jsoncpp util-linux zlib
>  HOST_DROGON_DEPENDENCIES = host-jsoncpp host-util-linux host-zlib
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
