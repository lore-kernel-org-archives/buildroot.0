Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0401C606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P5H9MmZ1
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0C2080DD6;
	Tue, 27 Oct 2026 19:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aj9_La7RrBWL; Tue, 27 Oct 2026 19:06:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 80BDE80D7C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793127972;
	b=VHiyV00lYv+S/dav97fgL8A3Pwg5XXg7Mj+S+uX7g5hYdNVGbo5atVMkxhFCEOk1AbBW
	 q5GqNogVcJlJnk5xKDzUGOwdyCgbaGNMvoaVkc8KcidNxdK48rEYKqUq3vjEFzYYqOyNO
	 gqpqatN6w14tIF/OsMEZDwILh+D9wye+OHoUxm55q24FId7gtfSknIL8bzpM5KlIe0+at
	 y/+L1nnh6HdjluMOVNqhuvuN6fotwpBcgSCH7vTMYjcJ6acLjf8cYJvG+m0hspuoScDFI
	 M4c4cHYuoIz871usEhY56TweXc0jqCqeaYFmQoXigx8O88iGwhYr/m19F3+LSueiRZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793127972;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=EnOmQyBCYdFWoSzZEOXEm6zYQp+Guu3MmUR4XawPcAk=;
	b=GcNYGfc9A/Zs7pFWu6KbPnmkaoQ0yTBfgWsFCutaDjJVcRGNgLfHgMXkMLY1bcdeQryQ
	 lnFZs+cXgtBBda50Ex/1qTZAmVbOwAq7jWAPcuHNN8vpai5oHaerrDJXhzoj9gFKiNv32
	 KG8XSrmENjRkYgFEPVNO+Xs50PijBrb1ejd02FekXOUQaFNjEPpgemRSDp6iRUpTK85VZ
	 6lIQ3gyaikGlgngMBv1jke4807wTaEOsy5UFV56tgF11Swb71H8yDxEKKbb2/ylf0mSVb
	 O1y/ZDVbxMvGtTxzU5nFdX39TVIHSaGKXtXoHH5wv4LOr+XTzN1FZ05w2pdNhKPqiuA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793127972;
	bh=EnOmQyBCYdFWoSzZEOXEm6zYQp+Guu3MmUR4XawPcAk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P5H9MmZ1x9J7Zr3NZJEh3dAkokS9u963purb3d8HKU5+xQVE0UDcJGtObioqJyf4L
	 yJlOc814RSParDPZa5La9LZLmIFcYFivcNjcmHFbyQSV1I1r/zRM1WXsGU41D3g0sz
	 W9oWGklua0AamafNPQozv6AhRs6kDAyOjhGc3B9Q0vFiXygDRHexUCsSJTsknz++7Z
	 VTLQx8Pumllb3OZAIiFFitzQmyRuLpwTAcTW4Haf/LVG/VOQAprNDaYXOcfVII26Eb
	 x/OlzISHZ62XAl1+soT9j1KcqZj1zGJIZM4cs5WcH79NmwEsOeZHa2nQJTAl30ylEM
	 yO5rw6aeej61A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80BDE80D7C;
	Tue, 27 Oct 2026 19:06:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64281473
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61B044016B
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYd_oCX70JBx for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:06:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 87DDB4006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793127969;
 b=SKjEU471oKxIf4Vs/tcR9afxihAGbJmXL1KO6LY8PqEQbhH9wovvY1DyHljq0EuHxDJZ
 OcxgXq8aJEJ4xzPuJ13REFW17iOdNCdelUYpRcJ0sM4ZPZcIoaSbZzT+Gddv4LKWcyI9E
 ZrBR3qZHUrncBGRJF4biN6qElN1lf+fgSfNRAuCm9Uv5YcoPpynQA05k5VGz1t4fP3P1I
 S0AxQH/qvja7hVWlN3YThHMDshZsRXRjMV2KrCTjb3KVbXkCZcv/8I90YBU2K127DEyf6
 bRK8lQ4lKkWwHG2SZc3+wGZxQhYPmusquPnxyzX00RhaYVM2z0mwhUW207zFQzJkXHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793127969;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Qp1Mf4dvPJGFy8WJwnCrACAkvHbysh8b/dWJKgJD7VY=;
 b=pP6Ac58HB2PLDHGzvECodtlAoDm64mMry4SvepMOMlMf4Cvbc9r393Tmcy6F2tO32dpJ
 65Nd8vdi74Lz4eXaFHs62XD/L4GOmI+e+evpes4TTN31vbBHyUfpeh1bQczcKdxZaEROB
 70OISMZmnL3YrkOcDOtZUJ2G94BRcmOuRrMHRk6qg87ssEley2DVfSOZEVGm0pDKp6Yd7
 wShIeV13PLnjwWY0A6HFgIe/pr5r28mlMwWG1rNNKceHEeuYUOKTwN5LIN0M8gAW8k4zQ
 zZzrC7a5utVXSOJtKV1zClpLjWlN6bc38xK8NW/5p3abXv9aHsko0v+5oFvOumXg8WA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87DDB4006F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:06:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECDF59D129; Tue, 27 Oct 2026 19:04:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 18:32:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89fcc7132a9b4f94d082fb9936b4335d28d91b43
X-Git-Newrev: 13dd3037f4bc92cae6b816b34bed28b3090118a0
X-Patchwork-Hint: ignore
Message-Id: <20261027190442.ECDF59D129@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: fix asio.hpp compile errors
 with gcc >= 15
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
Content-Type: multipart/mixed; boundary="===============3598093455961788206=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3598093455961788206==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/13dd3037f4bc92cae6b816b34bed28b3090118a0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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

--===============3598093455961788206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3598093455961788206==--
