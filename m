Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD82606A31E
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=K3YL/QIj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=a+egJxgV
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06CED6060B;
	Sun, 22 Nov 2026 22:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GybHfs4_gMlp; Sun, 22 Nov 2026 22:10:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1EFDA6063F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795385450;
	b=m5mskJZtbSAzZ/Y2Kbpo7AMaZzfBosBbCxxhMpJzq+vHyyW1u+nDFb10FoEAER7kqNlW
	 S5g76utXY3/E+Ljl/GfFLBdNJ+9OAvasE1HiCjI1VYqhS4BmERjEWoMBQa0KcDP39QCgJ
	 U6m2+MdvI5A1mYu36y195BIbxiViomzFDa2mmSVgmmrvvip+rxY8tE4rW62kfp2OYg4dA
	 BCR/Wxb9oOPqXHSweuLARIcfk3n7ERRy5XTjojW7K1MvgswD1K1K5j8YuOvNZiLQSHXzn
	 UnBpGCHJZ4hkk+nNRv+4M+OZXRHGMGieW8ErnET0YqmKbubvKKRgFhedT17itDDHDxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795385450;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RMfKvCQ1YV6XjRcoa1vhCC5gU0rR/bklIVKDxTbSAsk=;
	b=FUjpPy2vsIZW4bSMPtO2SFR3EApVEwG90V5KYV+5/kQtLEKIX2eblZjnEw3WpQ7wrABO
	 j8tkUpDcG+waGnROd19W5TozmEWzddagAcijznV5ESNKL3wMAQeDav8/IineaiX58SwLO
	 bQeo6BHCM/H/wc7H5C1uVeZPFHjfzpssNFqJ3zw/OEWj0QC8IZvMhmvicwj+WLIJ1TyZz
	 MhcvAmI8cADlmuLZ8dSJG38ZHnPNAwnKU/q/SlqFjK8nKhbhx6Ck7VxJkIHYiZ/Zq37PX
	 4QiSV7OwbDr3hf4Y25xw0SHNpkZKIO1EVbI8ZiZBRDBxOc3lWv8t0nyviy2ImUDRKWA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795385450;
	bh=RMfKvCQ1YV6XjRcoa1vhCC5gU0rR/bklIVKDxTbSAsk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=K3YL/QIjL1c1qhWV7qwOIUqUoPjI4/PJjQJTmw3PKiYhjQLfGkchHhUi7wP1l5rSc
	 fHSir0NvMKAJ2ZUzM4yHf7ORS3pt1Tnmrt9q77od3KsxmXfrCCo3/fhPtJyyPm4TTl
	 BqFjae8THQVFT+g7kNnWceJ/VeURBjKXHgHO+PISSD1KruuX5S8t50VmWhlntx9RTV
	 Z6qWdUTEgx8OZttv3sCxzwxKi8vPuZAB8YnGFP/nQkgkH9Ut16vofJGxrIPk8XMr+8
	 +3LP7zEvOjyq8Cn/f2ybzwakEh4CoAq3qtwfQqlA4zzlF4gwz5dVY25rb5dpB0u3SU
	 cJJW6Y4+4SKqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EFDA6063F;
	Sun, 22 Nov 2026 22:10:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B1AE22B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11DA540081
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8cjOq8-9NW9 for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:10:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BFFD94006F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=a+egJxgV
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFFD94006F
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385417;
 bh=GZnuq5ioDh6aDLy4ahSzFJDRhDSuZwDv7fiztImho0g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=a+egJxgVnkNpBcM0i8scBGA1bqHevT+tcMy09Q2yQoBedGCsqRJywFqBCWRlYX6X4
 5eIrhtLZ2CstUkcSeJ8a1XmvuMrHYygj1s8DxU1vNFSL+VE1uWRSl1w8N2VlrkXoUF
 AlkUQHS2npdpLWAUckLQUZwwavqN2jBd28wPbjnBrTujDhm8i13cyuNf/vcNCtT7Mr
 Le5CHCWso6gJ+jghIFFdt6LMsaJLThwT3qYCT5VUt41Q8W+OIx/6nOig9qVMzgshlm
 z1ehzPnaaKBbNioIsz6vtejGeOgGZ83ongTlCKHkr4zCOTlHy9YHdM7s/2omiBRY54
 lWLtiKt2bg6mQ==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 OkN4Va3lIL7shdynFFygCrj+aQ22yN4jJurYni8SpPMIbtpNAac6VEMLviFGjkaP+alIT2FiEKI
 E9Xj8C1zuwVf9HZhcgrcNVP+ebgVa8BTGq1KEgYjTW1w0ZP92RyeaFvNdBf38bZjKgWiaU3FXbO
 mxjydFLoppbslrPcm2GLNZ4o+w2Sr00FAjZcejSmY/WafRXdKbmPeK9gt1qAYXnCDH6qAoJ93ZB
 LCNZTmw6BiVGHphvK8Mua78ImbdaAnPpd3IjDVTcBLCeVhhsGNA85bWSrhKzfufjs3F9TzKivp8
 54DC4cHmDlQuWmd3rlteIYfzFQpNtqw9ObUSPSRDXMa+sIJV1bo3s/YZzQeg6ie1KUOYMGw76KM
 WRIHGSu7v/Z+ij2mB7i26CXfFn0vlFmMCkwRXW4F6+AjaTPK14hwPS7s+r0x0annKSNEFL4CXd9
 2EVFfjgv8YmIS0Myjy8Ml+qGGOJcQlsDOfBsYENPZZjAIAYssbHswZffNNb7sLrSD8heNRW8fPe
 wIgKVOLsL38u40Es61Cju2shq9p6fESjrTx9ZqLjRfFs07iPitNT+lYQY2YkJa2Yl14q0Ai3Qdy
 XM+Rb1jFflPrfYoaObGpQwWg/+WvzIh7T+srPkS2SGzNzA==
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4DC32A4C4E5A;
 Sun, 22 Nov 2026 23:10:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlJ-0000000014Y-0wS4;
 Sun, 22 Nov 2026 22:10:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:09:56 +0100
Message-ID: <20261122221014.3945599-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122221014.3945599-1-bernd@kuhls.net>
References: <20261122221014.3945599-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 03/20] package/boost: properly propagate
 architecture dependencies to Config.in comments
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

A significant number of Config.in comments in package/boost/Config.in
were missing the architecture dependencies of the option they
correspond to, which would cause these comments to be visible even if
the selected architecture doesn't actually allow enabling the option
itself.

This commit was done after reviewing all comments, and ensuring they
have all architecture dependencies needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 92a6bc4ec5..502a68ad44 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -55,6 +55,7 @@ config BR2_PACKAGE_BOOST_CONTEXT
 	  C++11 context switching library.
 
 comment "boost-context needs a toolchain w/ gcc >= 4.8"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 config BR2_PACKAGE_BOOST_CONTRACT
@@ -82,6 +83,8 @@ config BR2_PACKAGE_BOOST_COROUTINE
 	  selected.
 
 comment "boost-coroutine needs a toolchain w/ gcc >= 4.8"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "boost-coroutine needs a toolchain not affected by GCC bug 64735"
@@ -122,11 +125,15 @@ config BR2_PACKAGE_BOOST_FIBER
 
 comment "boost-fiber needs a toolchain w/ NPTL, gcc >= 4.8"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on !BR2_MIPS_CPU_MIPS32 && !BR2_MIPS_CPU_MIPS64
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "boost-fiber needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on !BR2_MIPS_CPU_MIPS32 && !BR2_MIPS_CPU_MIPS64
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_FILESYSTEM
@@ -214,6 +221,7 @@ comment "boost-log needs a toolchain w/ NPTL"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 comment "boost-log needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_MATH
@@ -323,6 +331,7 @@ config BR2_PACKAGE_BOOST_THREAD
 	  Portable C++ multi-threading. C++11, C++14.
 
 comment "boost-thread needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_TIMER
@@ -340,6 +349,7 @@ config BR2_PACKAGE_BOOST_TYPE_ERASURE
 	  Runtime polymorphism based on concepts.
 
 comment "boost-type_erasure needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_URL
@@ -371,6 +381,8 @@ config BR2_PACKAGE_BOOST_WAVE
 	  iterator interface.
 
 comment "boost-wave needs a toolchain not affected by GCC bug 64735"
+	depends on !BR2_m68k_cf
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
