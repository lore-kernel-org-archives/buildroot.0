Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD594606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pALSGqeY
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4A536062D;
	Thu, 22 Oct 2026 15:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nhe522K8FBk5; Thu, 22 Oct 2026 15:31:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AB8136069C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792683069;
	b=BdIuk0bYZwjfY12PEZjQ8uyEvq+RmQUVWd0IzojnHw3k0OcenxZYCB1sN4o77Mqb1zI2
	 /E1rrMky93QV1BhAOFi8Ex6z2pZbtu6hyit2grMf3KWnN9DAdbfxilqGv0WWZYZ4AvMWq
	 RiXYvWhCj80Y2gUQckPwAFEsq5nwaB4lZW9L4+HFN2SV0/Mf2+V/r7c5tFYxCiM9OD5Qc
	 ilDb99SY86KhNLI9wrC64qnar8Bmw/6FhuhezVzTJy7+VHtE3sMefxw0pRX2W35GfQQiu
	 OgAA6fTWt+PN9ugXp3uH445IHT5B/7JS1JImWdazrnDFCopuxA0aKZRCDfdG0rJKksg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792683069;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bVjmTfEEjtPl2dgky55JAenWVK98m6iVnVbGc5dUKw8=;
	b=n6rqRTfo9QF08oUjfeKW7XlWXBjP+VkbP5b9eGEwu/0wJ1nhMMT214R8DDMUU95vaXU0
	 XOyiLD6rcPKBUIcihxoBYi0CG264irl7qaKFCBvaw25EdyGdCJJSa6Bvuj+yxAOLcqjin
	 zPp8CB8DX54qNxkjJ0tEcEDEzAVvkSIU+rZ8Lxht8nUi7Z+p/hvrspvj28jWrEBM+y98l
	 FSw6Wylk430vVb7sgl+MPps4pfqmgmpB0JfgZKcrsl4qq/Yo0vkl0iYxsXKVJODZxiA0z
	 OUgdVpzsGeyytXBQI4YDOsrA6Z7AaDkPXFdwwCfMLbojaZcL2Pb5VV5zb148jKGlPRg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792683069;
	bh=bVjmTfEEjtPl2dgky55JAenWVK98m6iVnVbGc5dUKw8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=pALSGqeYoKeyn7ioC9ilEFjqmNALdOPRPbU5pfBc2odzybsIvdK6mUXLqlsDpv9b7
	 8W0a6VfGW/frVqnLbTlO1nDfaHnmqb6G1AaI2UMktrCbutkKJVWRIhCbR03LRJ2Nge
	 lvHegsfx45LE/TANANct3sWNuKX2FAYg/UJzv3KvlUvbJD1olk4LjvrF6JMYEJ8FPz
	 tOIcOC4KPjwCwcmyRT4nLKoWn5KcRLLPOAOFQ4E12jgeFYwAV1ycJPRvenlH8L21be
	 v/tEfYaoFuY5Se+2YxVp8su0mF86zp6e6IF5bH9ExqOM6tdsx5rydE/gqUHrkxqfzH
	 Rjj1+7pf2th1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB8136069C;
	Thu, 22 Oct 2026 15:31:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15B133C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13870811F3
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2TCiLIhnsYZe for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:31:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 18265811E3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792683067;
 b=q45sHVB28U3z3IO7QkSNPidhfLvoTV2vmyqADYZbX81l3/ZWHGkbFiB4PgnpZLA/j8k2
 q8fXiSUynN5xY64Ji5GzjDs3S+AEzUE1PMWDn4w0r+SSXgUowtS/k585teIaWiSG8ZZS7
 9NNIDU9o0RxRCGQpGjDOWYcLr7krrFO+Xlaq7Z8fbiJC8ELeRDF3ChNW+IbHBeQ+1NSwN
 XUKL8Ud1ZsQg0Spz5aFokLQjMCFsymbJy8AAMswtmSwk5qf8UPL+Ef1CfIi/O8RgxxYco
 uZfYW6ctbAU0bWdZgVmACUkjqrb3cP90gFFqQZ2DrluvSQHsUKJtHcJY3ilcUmJPIsg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792683067;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=X8YVGFfKZd+8xPlujx0RaYan0youG98N7t3N07/xhU4=;
 b=aw6RqtHyipVJLRzgz4g++J49/Havhj5UPaAevbBW1UgaJ2JPEbrogIF6xssxePCnTZuF
 S1vEOiF8i0AwKn2SRscoLkTqvJwL5gJtHofaktIKqwLR7sUReGtSm9xvCpzuIWJx+Oz5w
 IWJYC0+HT5XRSB7RoX2pkynpT7yXK1YK40Pz0PvKmQb967b8wE6UaN8qOUzZrIZW6vkFH
 8h2zGA3Gs6Nu3wcqoCqxP/5vKtpWEM/i+7BSZTNnXjI9/p5IE0VGRHt/Q2QSKW/x5rLnR
 MhstycDKAGxfTTPFPKg67gkMyARsXi6xwXhcmaouwMwK2VIx6+NxQIvCAOAfQI5yvxQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=gp7emfwi; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18265811E3
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:31:05 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a16aaf2067so23356065e9.0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792683063; x=1793287863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=X8YVGFfKZd+8xPlujx0RaYan0youG98N7t3N07/xhU4=;
 b=y2sN0rW1Al35tNglFo+V+JM14tiEsjDZ0oPjrDlCzNXZtJJyGWGH5NVlEq8Z6mbX6d
 SHRFG7x71z7750z4Kw7TH0atLsWR8N+CEpRWBUA4QZPCLNO3tTSZpUUJoITuMCHF1jBG
 nJ58TO57kqzYeUP3EUJa1EtS4RTRXbxtBCwRlQlmm4EvyetO8TTBRSt9M2A/H8jMEbuH
 EnJjGaIm2mveajbtcOJuIOJPFgWvPt7I14dW62lOtonGpdxWMDApBZigyvfF2XMfj+fm
 /rrtLjRxg1k/KElja5UDf5MotipEIyBKVvq6WGFV9rPiwUCEByqwjc6tuDG+8EVhOQCX
 2BHA==
X-Gm-Message-State: AFq9FYLUe+htu4ehBOxLYLFqYUpt82CcP1cwLOILPbTd+ghrDTupopuW
 TCPRz44ZmZTI7fNrKbseeANA1bYsPkBZr/VsGoW8zfMx5PGTOMcgR16M0lLygNSVeS9cZtdab/o
 KyurW
X-Gm-Gg: AYBFou11gnAFBPF0LJsYZPtXNm7DmcJGPkZXeCBxZhhPkDmI3lTHSMo+uMW+BAC4cR6
 XHBEwWCK9bmTrYx/e87itAtlzFJolo6aZLDZfcHgSC85c7wU82nV2xWA/D79tdcNUJCmGxy0jbF
 +gSZ7qcQGdQCRsjVE1avKLsE9zxmuFEwwhZdGlJ1MxjHDETSYr0J8huQnxf8qM+VnVQJnFZg2ww
 etOBYeg51VcP9Xc2fVcCs5lsPyRSIvV4+bpd+UM/4+QMbQQgFZ8sVYp9+LZOGzYN1cNpWagdH8i
 /5IkGKHt1rpLSC2aAcl0ildenrcDqssh0pmcOeG+IEDcruSU+lm3yVtWgkooROrUFRMag3rYl97
 rr0Ci1o4PtJmcDK6RyK8hBs+jvSmz8iX+GsxJSQEts7ANN1RZ48Sb1S0/6zR0fqZlwekVUAhp1m
 rXzpdKVdfR+qh3MXKlE3jQDF8c02FcQLomqhaawvtmPJ+4suWqxmLjmL3uv6AucIvWiBb9MhPWG
 l/awGf2UG0wkmgjjXAS8ASQ7La2mQz2ERXIaTK0jOy49lbX
X-Received: by 2002:a05:600c:3b01:b0:4a1:d767:ba33 with SMTP id
 5b1f17b1804b1-4a1fdafd1e4mr109818305e9.12.1792683063309; 
 Thu, 22 Oct 2026 08:31:03 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a2101cd7cesm4690165e9.0.2026.10.22.08.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 08:31:02 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Oct 2026 17:31:02 +0200
Message-ID: <20261022153102.242860-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nodejs: security bump to v22.23.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is a security release with multiple fixes, notably updated
certificate following the eMudhra intermediate CA compromise, brotli
remote code execution. For more information see:

- https://nodejs.org/en/blog/vulnerability/october-2026-security-releases

See the release logs:
 - https://github.com/nodejs/node/releases/tag/v22.23.4
 - https://github.com/nodejs/node/releases/tag/v22.23.3

This fixes the following vulnerabilities:

- CVE-2026-105481: http: ensure agent data guard works without I/O
- CVE-2026-105482: dns: validate resolve inputs for null bytes
- CVE-2026-106069: tls: reject non-canonical IP addresses
- CVE-2026-106073: permission: check permission model in realpathSync
- CVE-2026-106074: crypto: reset random caches across snapshots
- CVE-2026-111497: src: expose BROTLI_DECODER_ERROR_FORMAT_BLOCK_SWITCH
- CVE-2026-111497: deps: brotli: cherry-pick 0ed4268a4401abcb44720963

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/nodejs/nodejs.hash | 12 ++++++------
 package/nodejs/nodejs.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index bf7a8358ba..5a9240d4e8 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,9 +1,9 @@
-# From https://nodejs.org/dist/v22.23.2/SHASUMS256.txt.asc
-sha256  fff4078c5def658577f92c88db7db3bc0072924bfb93fe52c1e744a54e94abb8  node-v22.23.2-linux-arm64.tar.xz
-sha256  ef8f26a3de19acd8c23548e6c3cfc2052610b0e67abb5fd64dbd92c8b1c1245b  node-v22.23.2-linux-armv7l.tar.xz
-sha256  e2ba10110ad34096c051fe47134fcd12175ecc48e7e879d7d4c78b70cf66442c  node-v22.23.2-linux-ppc64le.tar.xz
-sha256  d60acfe00a2932254bb0ad20e01b0d74397a0875595de719654b214f4b03f307  node-v22.23.2-linux-x64.tar.xz
-sha256  bbe768df8d5815d7fa76124052985332452e0a4742d39f32027550d1aab8f6fb  node-v22.23.2.tar.xz
+# From https://nodejs.org/dist/v22.23.4/SHASUMS256.txt.asc
+sha256  6287aa46b6c375d816e63ae66d024fbbfd70404825aabdfdf898a970871d2f4b  node-v22.23.4-linux-arm64.tar.xz
+sha256  c9057c6a3b8fbb9651ed115c1e96d4a7281b7b9c9ca89fa05865c98ed7ffd437  node-v22.23.4-linux-armv7l.tar.xz
+sha256  e4732f45e0cad787d6ba70c4eb6db45dbdb3f286f67dee429dbc6b4ff36eac43  node-v22.23.4-linux-ppc64le.tar.xz
+sha256  1805bcd35e6815559bd2eb97db438d3fdb0eb3a5e6a977b7c1badca76337e9ce  node-v22.23.4-linux-x64.tar.xz
+sha256  7b9adc82d612d0a2a863d96c46de2292552e250cee51956ebbe0146c42aacae9  node-v22.23.4.tar.xz
 
 # Locally calculated
 sha256  c738ae413cf561f174e34f6961f8ca458aae2369a73640dda6234c629b98bcc4  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 1147245504..d8ec70af43 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 22.23.2
+NODEJS_COMMON_VERSION = 22.23.4
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
 NODEJS_COMMON_SITE = https://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
