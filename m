Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4BAC44500
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C468F41129;
	Fri,  3 Jul 2026 14:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oj5UP_m5sFlg; Fri,  3 Jul 2026 14:27:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF93A4119C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088831;
	bh=I/MA9LZfcP+0coQLpxPCuaXnDxliAo9jwqC0aGHl6DI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Bm5OvSgC+X66PjpicmZqbx5eososjKrA2ce9fnRhKiMkoh7bl97QaHEohtOZ0lqSd
	 LSKHgtz3y7TesSouWdlAKa6n7rjyYayFpPkXP/vhxrGdnDCid9UfzXohdOD2r6mwUK
	 BNid58VTDfwRuJR4GLHcNHpqeah0jypwsIn+gVdW43n/w25AJsKLzHeWPCPtlHtxY3
	 aQfj8iHJACrjujoLaliMtBczM96flh997GxNKL1kSuNVWZX3UgqL0V/dPCIk4rUD7x
	 FTh0kvfxslzPQ9jbEz5vccgp2IdakkieHxMWvP1tF6rV9hBe0VpABiGr0DxgYFoVss
	 gUlCt8tJVnILQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF93A4119C;
	Fri,  3 Jul 2026 14:27:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E9E1E47E
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB00A80A75
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzOCfA5-oxVC for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D243809F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D243809F8
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FECE883A3; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:30:07 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 30b10fd08fca6e4b8311386570d683cb28cea4b7
X-Git-Newrev: 04f1d0f1b9f50bb8b213da521c77cb129472501f
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.0FECE883A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcurl: security
 bump to version 8.21.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/04f1d0f1b9f50bb8b213da521c77cb129472501f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit be2789d08432da951c0ebfb23b034072601bc8fe)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
index ac233fd939..300ac81bc1 100644
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
