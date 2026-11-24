Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC82606A31E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 10:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=R06zV69B;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=funkworks-be.20260707.gappssmtp.com header.i=@funkworks-be.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=asyrBvlC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EFCA80F41;
	Tue, 24 Nov 2026 10:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WruJq3ljtrZR; Tue, 24 Nov 2026 10:36:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BA00180F52
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795516580;
	b=s+iZsWtK2UX8s4LOY1p6P9G+xIGb+nJo7l2RkROrirbapC0M0hWMP+YvfcX39SPEVXMY
	 jnp5ADHVkDShnj67o/YBPBRzLMUu3gHZnWjz7skiKce5QxWVVqr7xjaDrLnWSt0272lKp
	 jn9Fnrx914vdJv2LJWTCCE8BN/m2zoE+w8R/OIHXemovEQjK2a+xToSCYGjm8NNvCGeFl
	 aQNV/48KGOcx0uGoQk2YG+NCViS3RdkWpNmKdfaq8ZLGvfVO1Zr35Rak9QT0uV21ILEy9
	 w0H2FMzdtnPdIqbQYJdbH4zi3HAZhuy+byv554HdU3reswtcqpYMRxVAkzdhAs5Ty+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795516580;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=U1cKAmSmMoEGpnvVcSuA9lmwVtFfnRVLMs9SJkmdkxc=;
	b=FYRENCMKLK04N7hhu9PH6PPft+LBShYqnaG5iuOXWC4uiOp7VY/KZkiBtFWohJY/wcgU
	 gBp7sWMKP+uxz/HP+xs2s5H0ifIbrY0ksYLthEQbwU+Q77/fOJp2zbtmD/Y91cwgXGPTB
	 LshrcaE9FPW39mItrrY0bHu9oNeteToVEed+BHVfltMipw/K+tFvetto0Hv97vzPxfDTY
	 R7HNuTSB7x9qa2kPqmjYtqguuwWfDgSr5qcHIyDtxIqs62LRtAwXMrNzXB1qaltpPRlSO
	 9K7kVjzMPPDsllWDPIWRlfWcRwNMQj5LMYnecyJiyK9LTMSxsAngP89wTMHcojv6s1g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=none header.from=funkworks.be;
	dkim=pass header.d=funkworks-be.20260707.gappssmtp.com header.i=@funkworks-be.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=asyrBvlC;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795516580;
	bh=U1cKAmSmMoEGpnvVcSuA9lmwVtFfnRVLMs9SJkmdkxc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R06zV69Bgba4DhiOkN+MWuzNoDtvVUt0zwmo1X4KcULUECAcLEER7bEwSXfPAijuZ
	 JMSRfvbIdFtuuLiWqjHjnfIEdEdVJgTEAx9afTYawxvQqdSYaUuu+Bh5Ut+KAyMObM
	 g9IZilF/Bj+cYpNr3wZ0FmgeiFVxMyVu7dlw0PiPl2WhSlB0urPuj8XQ7IDz2xPyyw
	 rMLC3pCwQxzz7gCYl2rqGug77VPXIKjGUcWacjvTFaS71/LxJs2RUPwGdM7TEUlPNE
	 QCdZN7GPTCmS1wezxpegJb2ekAtYRTrzF4r6CNIGgTFWDw23VcEVqz/EJxooV4KCQv
	 IYRKoDXeA1S0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA00180F52;
	Tue, 24 Nov 2026 10:36:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7AAED43
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 10:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A993080F52
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 10:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LpqJTcnE0hsX for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 10:36:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AF6B980F41
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::532"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=fvb@funkworks.be; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=funkworks.be
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=funkworks-be.20260707.gappssmtp.com
 header.i=@funkworks-be.20260707.gappssmtp.com header.a=rsa-sha256
 header.s=20260707 header.b=asyrBvlC
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF6B980F41
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 10:36:16 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6b87a1a2babso9754850a12.0
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 02:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=funkworks-be.20260707.gappssmtp.com; s=20260707; t=1795516574; x=1796121374;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7RP+fuOpuYHZFvP8AytkrgtsUvRyK9B4Bpkt0/bz44M=;
 b=asyrBvlCZfYVIInvYfchtexcpHkNFa4Gd0crkOvuEs4psxNM6IKnmkvF/wi/upraR4
 /dF2AW31huSskYsnTQxsy7wTFfQr3zxHkYaV8ZK1g2qaSsNP7kyxXh10RDr/aYUtu4mT
 xASLhOyC4Tv+LPUfayq05Hmxxp3ey7Km+GZKD4qxME9405sGkQKjjaQrxXl18bHkR88d
 0VpdL7VZAi4mIUWbbw3BK0ZR9puI5V6W+H6oH6WlNEabLUH6eiZrfGCCf28Cueu1QMBq
 2YJQfPnZkr7MwF1u/6U6G89jJm2GW897C0yFyqX096wr6U0/kqAqhi6dJ2qn0kb3829A
 NWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795516574; x=1796121374;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7RP+fuOpuYHZFvP8AytkrgtsUvRyK9B4Bpkt0/bz44M=;
 b=oEmzAZzl1e7d/9Dtuy20xYQOV9PJV+n14gDKMgRyhK3iu2JMp2RmaQKp0ByFT59bRv
 Os5Lbv6ZY2hHpJYhZATcg0lqjD5iEBHFPQRvquAybIbPuAsCfmbMQasXLjMLE3wNi5tE
 nvRPvMKHFfkyAqhzOtmBfFIrRIUV+m+it+kepNbwWoL1HY0O1jvcsX2ZNLFpASTOOQLU
 Isw9SShLHQE70YPFE0SW9sQphct9FqsMwHM2fQuIAU9YZzHEwd68OT2TEFrsxSWgBagY
 Xp6KGvrJQP1vMVIx8u66yLNZigMlYLRYSfQWMoahB8T9rUsbDmz014Y04eTWeWoHEOGN
 B4Kg==
X-Gm-Message-State: APuU4Z8IqbZJIdeyJKoTFqBrOyEy3qk9fZBPrcvjSp+DVhtduqEvFIY6
 XV75PO7L8ipUEXlxV6/IyYrLx1jOZQS3P5FvscxdwlQoaFb9GneHpu/eG2ayUu9YUwISCzWecft
 OREwggw==
X-Gm-Gg: AZFdTZfrVwCU5a8djeussHtBVsvVTQEF6oj/my4RBg7n15JI60uJpcqz1KmphMcAI3g
 q/4kLhid0VBZTJGmpJOsGwPCtaeH/CG+w4t0mGwtxEiaF6bl2XdGg/dePK8Mpg+hsUlQP4RAa26
 P2B52KvLipT21t+XcMthG9lZac0n9QgBSq3SDWg8khjDNRdN3iKc+qOjl6jU3TFt29GRXk6SaQ5
 39iGlcCx9pnjiA7LwWrPH0bVmY0T2nwTh7U8MeOqCXxT8R4VehgP/yRhFGEy/LC9gndp0dCBK2X
 eCCgFi8lDCy2FxuK/pySAcP41x54EkI1qLl23RaZtr+Yl1sH2mfoTcb/xfd6ty5mioiHA0Nl5ge
 IXY4qnHdUFUUo0OrEOgKLUM1T8I98OJGWv6fhIHS0NKEGKwthv2DhRwfEmInw9xbTWMY8T/01KA
 pgV9zJAg5S39oIxm4UzWvCw7+OyS/SXOvmNi939Ma4sXiyUilIyaVo30WYEllDNCRnzDgBARYI4
 eP4tulY/Il+9GpkeMt9bRd2cxkT1h+qJWJ4zmqk1vud246oKDk4b4q04QqXTLsE+NUK3YAO9BWF
 fF/lrKcNh/bNVLX48ynu40keUGx4hadQkffyL/uBq8DhEiY3X9GGIdSpL55sdtT74ExjJuLHVpU
 F
X-Received: by 2002:a17:907:a88f:b0:c51:45a:1a5a with SMTP id
 a640c23a62f3a-c513a1d1d4dmr1166841266b.0.1795516574142; 
 Tue, 24 Nov 2026 02:36:14 -0800 (PST)
Received: from LSUA0081659NC1.d400.mh.grp ([165.225.12.184])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513afc5396sm491742566b.58.2026.11.24.02.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 02:36:13 -0800 (PST)
From: Frank Vanbever <fvb@funkworks.be>
To: buildroot@buildroot.org
Cc: Frank Vanbever <fvb@funkworks.be>
Date: Tue, 24 Nov 2026 11:35:53 +0100
Message-ID: <20261124103554.696850-1-fvb@funkworks.be>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libmodsecurity: needs gcc >= 7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since version 3.0.13, libmodsecurity requires a C++17 compiler [1].
With older compilers it fails with:

  configure: error: *** A compiler with support for C++17 language features is required.

gcc 7 is the first version providing C++17 support, so a dependency
on BR2_TOOLCHAIN_GCC_AT_LEAST_7 is required.

[1] https://github.com/owasp-modsecurity/ModSecurity/pull/3079

Signed-off-by: Frank Vanbever <fvb@funkworks.be>
---
 package/libmodsecurity/Config.in    | 6 ++++--
 package/nginx-modsecurity/Config.in | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
index da14b21669..1abf088f23 100644
--- a/package/libmodsecurity/Config.in
+++ b/package/libmodsecurity/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBMODSECURITY
 	bool "libmodsecurity"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# libmodsecurity embeds several mbedtls source files, causing
 	# various issues when static linking and other dependencies of
@@ -19,6 +20,7 @@ config BR2_PACKAGE_LIBMODSECURITY
 
 	  https://github.com/owasp-modsecurity/ModSecurity
 
-comment "libmodsecurity needs a toolchain w/ C++, threads, dynamic library"
+comment "libmodsecurity needs a toolchain w/ C++, threads, dynamic library, gcc >= 7"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/nginx-modsecurity/Config.in b/package/nginx-modsecurity/Config.in
index 94f0ff0a45..130190ecbd 100644
--- a/package/nginx-modsecurity/Config.in
+++ b/package/nginx-modsecurity/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 	bool "nginx-modsecurity"
 	depends on BR2_PACKAGE_NGINX_HTTP
 	depends on BR2_INSTALL_LIBSTDCPP # libmodsecurity
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libmodsecurity
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libmodsecurity
 	depends on !BR2_STATIC_LIBS # libmodsecurity
 	select BR2_PACKAGE_LIBMODSECURITY
@@ -12,7 +13,8 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 
 	  https://github.com/owasp-modsecurity/ModSecurity-nginx
 
-comment "nginx-modsecurity needs a toolchain w/ C++, threads, dynamic library"
+comment "nginx-modsecurity needs a toolchain w/ C++, threads, dynamic library, gcc >= 7"
 	depends on BR2_PACKAGE_NGINX_HTTP
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
