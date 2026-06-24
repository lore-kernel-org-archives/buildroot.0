Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E299CDB479
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 21:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90319822AD;
	Wed, 24 Jun 2026 21:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7hZB-kPiKfGe; Wed, 24 Jun 2026 21:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFCAD82289
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782337260;
	bh=vEtn28rMRn9k5Wlkx4GCirSPvlK7P6kCGOUrZVYmqcA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Dm8pWfZ9tJwqGX8obmcleLsFw3b0mseCQM5ctJwswRFXQsQyHSyukp/7+kL0NTJ+h
	 lHYFZuuB9dav4t0IcCnsLCDK+RpRiR4eUP+pac7Gd015DFTWOF0emELS3O7P5mg7Sy
	 CAiyNMqgPv0cSh4P6ho2kMJ5e4HhRUy2ew728uCWDTxbDXg4/VP0xDQetYqML9y3Ri
	 w0oRQ9CeNFY8/IU4yaPxIiRHoPxpHwdhQDzFzSjEdIFjYhSe9A3w304XOa1uMgZYcM
	 dyTm0zMbZ/xcRf1aKiUwV/9GjZZm/jiw5XklFjdCDTb4d1DuIrRkEI1DAEDNTCDHh8
	 ZeiaFPNWWhTbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFCAD82289;
	Wed, 24 Jun 2026 21:40:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E0B90265
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 21:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D283660E03
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 21:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qCsEaoHJA7B for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 21:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 342AC60D5B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 342AC60D5B
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 21:40:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE21A848C0; Wed, 24 Jun 2026 21:40:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 23:30:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a0164ac812d2c3ffe720115ae6c1cfd87d7c87b
X-Git-Newrev: be2789d08432da951c0ebfb23b034072601bc8fe
X-Patchwork-Hint: ignore
Message-Id: <20260624214030.EE21A848C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: security bump to version
 8.21.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/be2789d08432da951c0ebfb23b034072601bc8fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://curl.se/ch/8.21.0.html
https://daniel.haxx.se/blog/2026/06/24/curl-8-21-0/

Fixes the following CVEs:

Severity Medium
    CVE-2026-8925: SASL double-free
    CVE-2026-8927: env-set cross-proxy Digest auth state leak
    CVE-2026-9079: stale proxy password leak
    CVE-2026-11856: cross-origin Digest auth state leak

Severity Low
    CVE-2026-8286: wrong STARTTLS connection reuse
    CVE-2026-8458: wrong reuse for different services
    CVE-2026-8924: trailing dot domain super cookie
    CVE-2026-8926: password leak with netrc and user in URL
    CVE-2026-8932: incomplete mTLS config matching in conn reuse
    CVE-2026-9080: UAF after pause in socket callback
    CVE-2026-9545: exposing HTTP/3 early data
    CVE-2026-9546: sending old referer
    CVE-2026-9547: SSH improper host validation
    CVE-2026-10536: HTTP/2 stream-dependency tree UAF
    CVE-2026-11352: QUIC zero-length UDP datagrams busy-loop
    CVE-2026-11564: Native CA trust persist
    CVE-2026-11586: WS Auto-PONG memory exhaustion
    CVE-2026-12064: proto-default skips SSH verification

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/libcurl/libcurl.hash | 6 +++---
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 549527b1af..e2393bf2f4 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,7 +1,7 @@
-# From https://github.com/curl/curl/releases/tag/curl-8_20_0
+# From https://github.com/curl/curl/releases/tag/curl-8_21_0
 # after checking pgp signature:
-# https://curl.se/download/curl-8.20.0.tar.xz.asc
+# https://curl.se/download/curl-8.21.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  63fe2dc148ba0ceae89922ef838f7e5c946272c2e78b7c59fab4b79d3ce2b896  curl-8.20.0.tar.xz
+sha256  aa1b66a70eace83dc624508745646c08ae561de512ab403adffb93ac87fc72e6  curl-8.21.0.tar.xz
 # Locally computed
 sha256  82f2f4427d6545ee5aaac4f0b80428da6cc8ba41c2cf5da3a03680ec327b9681  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 94d7ec677c..219ce9f712 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.20.0
+LIBCURL_VERSION = 8.21.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
