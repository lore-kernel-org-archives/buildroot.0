Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C447F9D0DB
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18FD242C05;
	Tue, 14 Apr 2026 15:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYlj_zNijyKE; Tue, 14 Apr 2026 15:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8EC942BF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181775;
	bh=Nm08qHIW75jqRCtJwveO/TPqAW1DEQuhnOs2UQVQNv4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N/B651L2hotSLUicI8LV/vvc5gT6IL0g8ubCNSi0eedgvWVbKhcUhdY6ctScDMWaZ
	 jnV5N/YH476RWN/k3Ig4FH3anbNSsaaXI8QmNyBSQIM6Qin0rVUF3Wld2hcjX7pi1E
	 DHCpd/a4CuFlpWWG93YuyYht2DJbK76D9sNTqxerlYwETl/F5bsB+Z3cjIV/tx3GbP
	 lwiVkSyNRklBldVI2pMDEXyztWb0kYOVr0p/4NKFARMXjKS2fxHtWN1wNN57BUET3q
	 kHwjzsAlQztDY2Tlj/caOuUTzqoQ9B8LsgjcInSv1fiy8yiiZrM0oojpXswaTAN3JU
	 Keh7gg1fEZYew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8EC942BF4;
	Tue, 14 Apr 2026 15:49:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD233237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D615E84D46
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9MJ1TEuGX7H for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF0B184D41
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF0B184D41
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6323D81514; Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 12:17:03 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 1f3dbbaabb101d8113cc29254ba49608657dc1d3
X-Git-Newrev: 1316869959f2a36414f9d78bad31bf6262cee9f2
X-Patchwork-Hint: ignore
Message-Id: <20260414154926.6323D81514@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/cpp-httplib:
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
Content-Type: multipart/mixed; boundary="===============2157393871756361749=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2157393871756361749==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1316869959f2a36414f9d78bad31bf6262cee9f2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
 package/cpp-httplib/cpp-httplib.hash | 2 +-
 package/cpp-httplib/cpp-httplib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
index 904bca6d02..076b30cfa1 100644
--- a/package/cpp-httplib/cpp-httplib.hash
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  cc57615af359efda816122dcfca37bcbb9f1591396f50a1fd1ad70bbe6050581  cpp-httplib-0.27.0.tar.gz
+sha256  909766cd7697153c9e588b0f96defe1868b7bb11d94b8d4f0c83bb4875bc9066  cpp-httplib-0.37.2.tar.gz
 sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index ed5c33d2a5..56e8c27fc4 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPP_HTTPLIB_VERSION = 0.27.0
+CPP_HTTPLIB_VERSION = 0.37.2
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE

--===============2157393871756361749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2157393871756361749==--
