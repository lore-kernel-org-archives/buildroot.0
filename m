Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEE4C61DD3
	for <buildroot@archiver.kernel.org>; Thu,  3 Sep 2026 06:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95D5C40A98;
	Thu,  3 Sep 2026 06:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRaR4ViKJe0N; Thu,  3 Sep 2026 06:39:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7D4D640A6A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788417561;
	b=koXPao3F3SJosZkParmIM3udPKFPhVuquvWypNz4wlJDc04K0Q5PkobA/0DEH59a4Oie
	 U1++Dxu2a+XLWTxTIwKwB3KwnzVTKPI9Dx0GVtT8fV30RVbhv4riQZjETp3YpRGivPPs9
	 WjyOhAU26sgADM5L5/ilaa8ZZGKnqa1LCmukGMY48nj7UHwVz3r/yX1BTIJopGJ6TKZp/
	 fkl++aiodNrcy8peCUBnTbIluX8CkSq3EcZwqu77MqRWjboyMQegt4drxjABuUXG8jSFA
	 abqTCy1AtW81nCLiZvztrPvEx5di/MOA/04dnm3e98fZUtcl+ubpMFmNzPnRBwog+BA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788417561;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+zLffNUPtvDOorv7dSSgZDOm7M9VwgAcvFKHH3h2teM=;
	b=GXk0CTXDuacgrwlgahmNxlQpVv4LD2+4HFv/34G2sfGjWN1ExmrmtbvavORYvXfeD9M2
	 dXbqw/tQotdeE/gAVX8Xxb7m+VFe1dhK0dTnZIwAWgkDSUtG1/IBYJkSeBPrEN0qOUD+W
	 Aj4wFMqhtjdJ95cjrFow3X4oVP/kLdsHcHtVMuDdg/HhywKgd+D5m0/s2C7CFIfyNvmcL
	 VkhyMJnpct/nQ6TrZkQhCGGa8/7ExNyGi9qUypM/IZNhHicYVw6Cz8lKLVQloOLIooICV
	 gtXXee2c+1GXhi3LpvXRXs6maB7J85wO4uvmZt9GJCizbWeJki0nlWs0rpHlAseOBoQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788417561;
	bh=+zLffNUPtvDOorv7dSSgZDOm7M9VwgAcvFKHH3h2teM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DONH/dnGzON5F6ZVkIfTVGsFwKuGO5woTSV1qtlap9BJBYcdOq7AlYjGx6ghZj8wt
	 khQYmtV/djjpn0l0MbzaDqlfYQCE1VGPJEYBS7BSqNlZQSExr0Z0A+/1I90ACbTl+t
	 mqCORQf27OmUE0FhT3BCA4Zqq6BMkXGY/uI1ndNCaLtvYK4vcm5on4W10BFjjxMcKl
	 Rjw54PaRvQA13Uvgyooo6bW998cHwjj31Bd6MTEuAmBAM23/R+XD3DTTiQqEzXRp7A
	 UlbMMWeUyV07yjN6JIEz+YLMIodzf0jfa29k+ykLr8sIn0JicFN0DH8AY6EvfKJa//
	 kS7192WLibMrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D4D640A6A;
	Thu,  3 Sep 2026 06:39:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82D9A498
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 06:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 750DF4011D
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 06:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJjGKrcADKYX for <buildroot@buildroot.org>;
 Thu,  3 Sep 2026 06:39:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A1FE94002B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788417559;
 b=Lg+3gm5h/QEMF22aNznbDeCXtljxxB788DTYVkzcd+oF0UFPwZU7ANO6fqF9spUYr5fW
 ZSUYjdv0EmxDb1Qn7kL7ZFxx6fMNM9gdBbFK3P08V9P9lBqnba4Q4tK4tredYUgCEFA1b
 v//MX9nGDPGC8tpAMT4EkCdsFbU/Yt2kKH0kAjzvqIlbK3i/jQhwn3OwmIug2qdSokF2z
 uqvKIKg980cTj2x/Cb466gBB0UUaw0ti7EnBPv+5V0lyEebWMg0SgmmXjZ9SVnw9QH5Vm
 bLmC23R/ou/7HY6bcol75mXrDWlQ9aXV5v4ugF9lZ1Tmly9N7rpmpfMhLW/Molt4Pjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788417559;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=WpDS5fj6ez7SKw2nDmZfJvoK1w/Kh86FpqAvmko5Gts=;
 b=H6Dn0P0vTwLHEetG7q2upYqg1MDSFzhpFAVKfqNwOW7huT7QClQuMqYVcnh1zbvvSOm2
 o5lwR6Yq83+P2wlvkbxwhQ9FPCyyJfmJHYD16IsPzonExkAA9dZ3TD/CpOE9wRrFCF86q
 LXMPrUFgqLQVSU5MfSxV7VMWOAs47rfND8uJDxudjjj6Q8EtUackvMOU19WyFmHZN1A8J
 vWCJuLMV4rABoTX2WkfWxlpS3Jk4/VRcUdWD4IUJCfuzuqPJTXmrnYl+VuVnaSwD5WHyj
 qRvbYBOTy46DXUnJ8evTZUb+CL88yhVf0Nt49EVcZjqjGtsKIwvj6mI6eQaagx/9fuQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rS5UfqRY; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rS5UfqRY
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1FE94002B
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 06:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788417554;
 bh=WpDS5fj6ez7SKw2nDmZfJvoK1w/Kh86FpqAvmko5Gts=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rS5UfqRYF3ec79OgeYzPPZRbqHL/DlPgSNcyEvNU7LJEc0iFh5Fy8igFa8jPuUyGO
 Qb0ovO1cVkx+wsq/2SlLJDwATzNWhhEGWvkqAkGBDE5aRTu4ONo1uH9Hogtwti8Tz4
 IreIcay4Tlr3ZZX+Lwewi04t8/V5CJayr+XO1gMMYlywX24IDsSu6QmF/mgyCM/lCv
 FYbY22zPzowns1RDmIRfTXGQ1CPQM5EkDSAKn/8aYldnYyPARJsOWv5lQ6KFlZSIpk
 N5jW2KxX1PLrcmkz2cYpYjefIpDXVlJrFwNa60d/ikhYmHtWo9zS6tw9ccZ46QZ1ZM
 Q3NI3O3AwmCqw==
Received: from fli4l.lan.fli4l (p54a1b089.dip0.t-ipconnect.de [84.161.176.137])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 60D9DA4C205E;
 Thu,  3 Sep 2026 08:39:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54144)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x216P-000000005VA-3i7K;
 Thu, 03 Sep 2026 06:39:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  3 Sep 2026 08:39:13 +0200
Message-ID: <20260903063913.73831-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903063913.73831-1-bernd@kuhls.net>
References: <20260903063913.73831-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 2/2] package/libcurl: security bump to
 version 8.22.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://curl.se/ch/8.22.0.html
https://daniel.haxx.se/blog/2026/09/02/curl-8-22-0/

Fixes the following CVEs:
CVE-2026-13608: OpenLDAP SASL authentication bypass
CVE-2026-18924: HTTP/2 server push UAF
CVE-2026-19931: Negotiate ambient user conn reuse
CVE-2026-80229: OpenSSL provider use-after-free
CVE-2026-80230: OpenSSL pinning bypass
CVE-2026-80231: native CA store conn reuse
CVE-2026-80255: secure cookie attribute bypass with tab
CVE-2026-82208: wolfSSL CA-cache hit overrides callback
CVE-2026-82209: domain-scoped PSL domain cookie

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/1ee4fc21f8ea0a236ba8681a49400e915f10ff4e

 package/libcurl/libcurl.hash | 6 +++---
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index e2393bf2f4..0a7b9e0169 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,7 +1,7 @@
-# From https://github.com/curl/curl/releases/tag/curl-8_21_0
+# From https://github.com/curl/curl/releases/tag/curl-8_22_0
 # after checking pgp signature:
-# https://curl.se/download/curl-8.21.0.tar.xz.asc
+# https://curl.se/download/curl-8.22.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  aa1b66a70eace83dc624508745646c08ae561de512ab403adffb93ac87fc72e6  curl-8.21.0.tar.xz
+sha256  f7ef3ae8a22e521f289803fe93543eb64c329b58aa73a9e224dfd915a2a5f4f7  curl-8.22.0.tar.xz
 # Locally computed
 sha256  82f2f4427d6545ee5aaac4f0b80428da6cc8ba41c2cf5da3a03680ec327b9681  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 219ce9f712..c3590a8a9e 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.21.0
+LIBCURL_VERSION = 8.22.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
