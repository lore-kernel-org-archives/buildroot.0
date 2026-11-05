Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BD0606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fWxxI9uM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11881812AF;
	Fri,  6 Nov 2026 16:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7SdUkcy7JUf; Fri,  6 Nov 2026 16:08:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 01BC5814B5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981319;
	b=ex19Hw5cI3mEMF5TgHoQWxrhv4ecjVdFsNt/wlL/tiQB37nXXQwtiFKIlVySA5MsSxfN
	 e8ZMf34dSc6HcS9iSQbhqOE7aitMbPrWVhIsPiLyuiVUVjNpeEw+9wRY/476EPOQbHpFU
	 TjkFIoyBqLf27XOmYSQQL5R4OQFPrTASX/j1Te5YUmDqbG7G5ICabSJ+w5ag9cABWCWFr
	 2CODenq8SPPWT/CTS5saJYus/Kr9Y/gQPC2OtljUvh8uSsdeFoAWDxxUzKW7nXROoLI6Q
	 XndzM02L6P6+AfGj1xzl6cp5ONDZ/Ozs4nFUy4ZlGPqiv0THll8ogCcrJHEIpQBjE+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981319;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=HlPoaW9edRmg0trixCgVHQfxxvd/AYyrjz1cDKrrKLQ=;
	b=PoFMA/YI4vmHsGTKKnFsk0lUcxGe+A6tEWUmaLlzrX/5iVQa9ycbrAQWRghXiDct6Skk
	 suoQRBBDlWWlFULYxqrZgudBj1IAzFad0XOIdUnKuoKZsCdzhrkx/PTAky5Dp/FDICe/S
	 Wwj+cU65x2CMExg1s2aS7W35zuVhbD+REYGkfiLIbAtiRQHErUOeFzcp/hY+eVhwWUBBT
	 +s5k1XvsUFdD/P+2TkKYiALNhTNczEsx4xUy0vHorEwyyuO5aBJggvfsHSY3WeXqA7u9B
	 EFyJoSS3/y3+xcP6p1t/uU0DR53eQ92qoQBuypYUTyqYM07ht/wx50i0w0lPODrGOcQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981319;
	bh=HlPoaW9edRmg0trixCgVHQfxxvd/AYyrjz1cDKrrKLQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fWxxI9uMTRQU3uHHPjaExMFAppMtGCRAcAxFOfTXRuQAOaYgG5dzrWrVbNcNxv3vq
	 XCva08ZsRGCPMnhN6j27esMzoqllVczGijmkLSL1SAXKVUgtnXYN+l+lyaaerX0Z6n
	 SCMBilgMeE8mvdk2em4cyslhQsNcflNoKrHiKlprPo42AYvOFEOwS9/e0XazYIqYPz
	 PIeTcX0q2IOuKHlwTECdtOnq6fAR8onaugWDgKFH7f5t2hvwoWutnl5ER9a23VL6qH
	 gZM6OKHhlhCV/Zq/NmO0Di4XfHGIgtYtJD7R5b3ISENk8G3WmYwQou0AN6uB3hSF8p
	 /WV/osX0NF1Eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01BC5814B5;
	Fri,  6 Nov 2026 16:08:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F8E34B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 157DB40917
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2iZQOAxnMF7 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 44B144090B
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44B144090B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FBBD9E09B; Fri,  6 Nov 2026 16:06:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:57 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 884806c1361a226abae131ad208f69beecfd2ceb
X-Git-Newrev: ec7d86289529c6b9add8352b4e72f6dd8700a481
X-Patchwork-Hint: ignore
Message-Id: <20261106160653.6FBBD9E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/boost: fix
 asio.hpp compile errors with gcc >= 15
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
Content-Type: multipart/mixed; boundary="===============2755404876606097047=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2755404876606097047==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ec7d86289529c6b9add8352b4e72f6dd8700a481
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

This commit unintentionally fixed a compile error when programs
include the asio.hpp header with gcc versions >= 15.

```
In function ‘void* memcpy(void*, const void*, size_t)’,

inlined from ‘static boost::asio::ip::basic_resolver_results<InternetProtocol>
    boost::asio::ip::basic_resolver_results<InternetProtocol>::create(boost::asio::detail::addrinfo_type*,
    const std::string&, const std::string&) [with InternetProtocol = boost::asio::ip::tcp]’
    at /usr/include/boost/asio/ip/basic_resolver_results.hpp:147:15:

/usr/include/bits/string_fortified.h:29:33:
    error: ‘void* __builtin___memcpy_chk(void*, const void*, unsigned int, unsigned int)’
    forming offset [28, 128] is out of the bounds [0, 28] of object ‘endpoint’ with type
    ‘boost::asio::ip::tcp::endpoint’ {aka ‘boost::asio::ip::basic_endpoint<boost::asio::ip::tcp>’}
    [-Werror=array-bounds=]
```

Backport URL: https://github.com/boostorg/asio/commit/b2478a9ba9ed76d7c858419e3f677cc454591d45

Fixes: None reported
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 13dd3037f4bc92cae6b816b34bed28b3090118a0)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .../0002-remove-FORTIFY_SOURCE-workaround.patch    | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/package/boost/0002-remove-FORTIFY_SOURCE-workaround.patch b/package/boost/0002-remove-FORTIFY_SOURCE-workaround.patch
new file mode 100644
index 0000000000..3461f0914d
--- /dev/null
+++ b/package/boost/0002-remove-FORTIFY_SOURCE-workaround.patch
@@ -0,0 +1,74 @@
+From b3d87da5f87e2907ed004edf1c72ad3942ff1165 Mon Sep 17 00:00:00 2001
+From: Christopher Kohlhoff <chris@kohlhoff.com>
+Date: Wed, 5 Aug 2026 16:07:19 +0200
+Subject: [PATCH] Remove _FORTIFY_SOURCE workaround.
+
+This commit unintentionally fixed a compile error when programs
+include the asio.hpp header with gcc versions >= 15.
+
+```
+In function ‘void* memcpy(void*, const void*, size_t)’,
+
+inlined from ‘static boost::asio::ip::basic_resolver_results<InternetProtocol>
+    boost::asio::ip::basic_resolver_results<InternetProtocol>::create(boost::asio::detail::addrinfo_type*,
+    const std::string&, const std::string&) [with InternetProtocol = boost::asio::ip::tcp]’
+    at /usr/include/boost/asio/ip/basic_resolver_results.hpp:147:15:
+
+/usr/include/bits/string_fortified.h:29:33:
+    error: ‘void* __builtin___memcpy_chk(void*, const void*, unsigned int, unsigned int)’
+    forming offset [28, 128] is out of the bounds [0, 28] of object ‘endpoint’ with type
+    ‘boost::asio::ip::tcp::endpoint’ {aka ‘boost::asio::ip::basic_endpoint<boost::asio::ip::tcp>’}
+    [-Werror=array-bounds=]
+```
+
+
+Original patch commit message:
+```
+The previous workaround for _FORTIFY_SOURCE warnings increased the size
+of all IP endpoint objects. Instead, try fixing the warning at the point
+where it occurs, by limiting the length memcpy-ed while processing the
+addrinfo results from getaddrinfo.
+```
+
+Upstream: https://github.com/boostorg/asio/commit/b2478a9ba9ed76d7c858419e3f677cc454591d45
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ boost/asio/ip/basic_resolver_results.hpp | 22 ++++++++++++++--------
+ 1 file changed, 14 insertions(+), 8 deletions(-)
+
+diff --git a/boost/asio/ip/basic_resolver_results.hpp b/boost/asio/ip/basic_resolver_results.hpp
+index 0127473e2..87fa3fadf 100644
+--- a/boost/asio/ip/basic_resolver_results.hpp
++++ b/boost/asio/ip/basic_resolver_results.hpp
+@@ -141,14 +141,20 @@ public:
+       if (address_info->ai_family == BOOST_ASIO_OS_DEF(AF_INET)
+           || address_info->ai_family == BOOST_ASIO_OS_DEF(AF_INET6))
+       {
+-        using namespace std; // For memcpy.
+-        typename InternetProtocol::endpoint endpoint;
+-        endpoint.resize(static_cast<std::size_t>(address_info->ai_addrlen));
+-        memcpy(endpoint.data(), address_info->ai_addr,
+-            address_info->ai_addrlen);
+-        results.values_->push_back(
+-            basic_resolver_entry<InternetProtocol>(endpoint,
+-              actual_host_name, service_name));
++        const std::size_t expected_size =
++          address_info->ai_family == BOOST_ASIO_OS_DEF(AF_INET)
++            ? sizeof(boost::asio::detail::sockaddr_in4_type)
++            : sizeof(boost::asio::detail::sockaddr_in6_type);
++        if (address_info->ai_addrlen >= expected_size)
++        {
++          using namespace std; // For memcpy.
++          typename InternetProtocol::endpoint endpoint;
++          endpoint.resize(expected_size);
++          memcpy(endpoint.data(), address_info->ai_addr, expected_size);
++          results.values_->push_back(
++              basic_resolver_entry<InternetProtocol>(endpoint,
++                actual_host_name, service_name));
++        }
+       }
+       address_info = address_info->ai_next;
+     }
+-- 
+2.55.0
+

--===============2755404876606097047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2755404876606097047==--
