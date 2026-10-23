Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53229606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lkIkfbHN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=m5JiLUQa
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2983D81669;
	Fri, 23 Oct 2026 18:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1bKMLVJ3EEY; Fri, 23 Oct 2026 18:28:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D76798164B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792780095;
	b=mhW73zuCKXAZBNOqRJNjYlT/jhSlO24B+f8bBDcq/N60xzttHB+JhS0QGKLr0fgh4VC3
	 TSCtsFuyXD44Mz7fKmbrU62LUGS8VdYFqj+rBpHXohJ7sLz2ubCTyAln/btDdY372AVFJ
	 ka3O9P0ILDezsyGSvHWdEIPGsHzcb0x2LqQp9PVvEDSSvYV0FtQgzqcAQclF78uOSNtrw
	 ySOb/bfs8GPih8oFmzYy1hoNLB04/4U2pGtAwpqw8ExiRD2xt31Ej3TGGi0/2a/iRyf/t
	 T7rtSyvGemQhFaP3MDg0MUE+f5Iahs/KZ3gpQ9qTkbdE+sNT/mi78oLhGW33YERhI9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792780095;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2sV/UU1EDm/3SZol/zdW958zLdWtuP8aiNTMh+j4d9Y=;
	b=ecdm+7woIQEGfDeH1qb9Y380CZZjfaOuFNb4UA2H5aNv99y+QblRYRgv69QXBsUUXxOj
	 t82gB5kicQw/K2Q6f5/6QHqYqmiB/KVPFPgTLibhXfE6gYtovidwdNn17nWzRo5bC4Be0
	 wzgZicoYT3CTdwaPcThg6G6N2uC8EVvw/vzSsOQgZwAEN1OyHOWW54l9MnhQIdcjJABb8
	 /37xs57b5ohisqgqA4Qf7a1xY+ETyjqGK192dv1hSHp5SFHOCF7CnrCS4Nvk/LB1WaS0s
	 wtaTCS8Qzedu8Z+wmuuG3LCK9F9nRUwmSukSunYCaToeMpnc/P/hGVjD85QxVdeTOfQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792780094;
	bh=2sV/UU1EDm/3SZol/zdW958zLdWtuP8aiNTMh+j4d9Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lkIkfbHNW+0HB8qv3f/B+bpTV6xfoWv/w87h8PEs2185XQr3gCt51ubvSZL6yOZjM
	 0GQi4fK+5WtBW8tgiGboA96k+JCoSzG2WtsFHFBG9sSY0IxPPSIEQZ0CZ2Dy4/Uh9U
	 eUH7B4mikNJ+ZvbL5guGkDFHFWTisyoXk74dGm9z3kECdnIHoT95WS5qUjSkQ3sF9p
	 z9PZVWffHFfWaY/03Iy2v2cQ33Akh843fo7NywjmzgoJScIzegRCIrOi+rzMch1yPt
	 Z3sEEx5UfvLIttcJYcwPe9I9INvQD349zRwmsohHgwwTbzqlMTNx+VAJG/1y1p+7dY
	 Vz4PtzFSY7oVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D76798164B;
	Fri, 23 Oct 2026 18:28:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2036512C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11ACB409AD
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYb0TlVp82KS for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:28:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8E93D40978
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792780091;
 b=OZzavTj0gW6iCfCHysbyCwu68WL5pImfLxDiKNYhJbL3me/Qme/irwHberii6BtbYds1
 nn8y2DZVxVa1mc4+UKlaozCnAuOuEzf59iIe4hJu/cE7i3SMDEuGTPr7JgOg5mAING337
 pEDN18J4AO33J9Xxh2ZM+txcX0tfezeD8lXHM0hln0r2I1ry5yHOvUKmQ0HnkE9Kctn1P
 9Dk/28A3GeJ1bVhfN+5SNI/PVcZb+9hjV+BBu3UPKUt5oAJP0laD9n2O3zSZ7ZMvLRr+k
 aDxwADCzO9JrjkTAsTx9yggBkhX1LIVkFq+WeCfywCUUPaUJX8unRPENij+qpaVWXKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792780091;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=r5FgwQ1q//RqH6R9Z9BizWg7RlQeJ1ZeQmifSJC+r5k=;
 b=mCqAAP6h+WsL/sFaDSgQK4IqA+suLhLsGh6suirIrj+tqr0+2TD6za/EjvoxQrQX+1rn
 L/3VH3mnUu1MRigw4+EMK6VNpcUkvgJh+X4mrE2nx5RY9wDBWmxK0kVgh77wvmKPC7S0o
 f/cDrI2B/MmRHOnoi39h2QYqBTh0a2KBTG7hLtaWdkX9ES5gV2Ulot2U0wO9f2pZs2CHy
 AJ2h1r9z5wD+nXGHKV5ZrDKbP1h4sS7GIX79YCcdIW3RhuM6FN1NFJXtniqTuGl/zsHKn
 7d4mxZX1/GexAYOjia7712lSCWFC+RxMPAzhbHtewcyGVIdYVgnYPNvhtRlov+oUwcQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=m5JiLUQa; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=m5JiLUQa
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E93D40978
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792780086;
 bh=r5FgwQ1q//RqH6R9Z9BizWg7RlQeJ1ZeQmifSJC+r5k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=m5JiLUQa8wuhkb6TBnzErqQib4UzfgciFZrOElQMUSeK1IlJRb04DP/E11bJYJOsB
 tnzufQDkIcoY+FwLLbzoiLWnwMYX8QA/E1R7vmucBYzHSBYTSLZBniJhFjuosn4oZg
 2AT73NLYvd8AEOVqEgATImJ3uH5o19dJNa2YpXNlSUS6PMrecaLhLDfJydf/43FNha
 wE/ufkkLdzHPmxo3U+hR2jZzG76rRuwOEX1HKup60B01M/6SIZRlEGFoi+Bs71C5Wo
 mhq+GZNq+dP2nG8eLN/TtjeQ1iKSA89ZcT5FnPHZ+haxShO5/U8FwBGJ8wEnocYT/Y
 GJXuILWjwjNHQ==
X-KAS-Sym: v3:f51bdf72230551df:kZkUq7hvg90k++6t9SDZmjK9WWYBNrm69ZcGWHMMbytNz
 WVRpibTtnkZrvwASS0GMKUK64BjTYuIJrXvSXqS8fhpX0+J4aXrPkA3he0z/ibtOL8OGqTwUi85
 fl69307keWLZRbiAptPQwMoPJz4Mx9KYqtfHtBQlna/u0X56x0sTcCCnhbh/u/DQWhaLbkaXSJw
 Gi4Ih49u/QctdUA+mJDvmMcUfCb2QtbTmKRqYCYr/AkDM7FHfnSWRJhXMgOmMj8kkNyLPu0Ok+h
 EGikXgLdqKjnEm063cfu5kryGcLtI3m+qa6B+S1UDw9uI44oB6EOeU8Jr08Za10l+UrdbuAQ==:
 XrV4xiKP3ucCAJ9iU9qONc8/0czz3F0/E5R3mUraJzjwkW9Zm9mG9Knwh4NvYK9Dj9wSweCGQXN
 vDAauWr3jXD/F7KtiLikm1zFG8U3lNPD75T0U4CclYz8X1mYvNSsH9c/9IUr8YDHCReQLfdcEWP
 W6RX0SxC3LXPszQjjQlojjRbNswimRwcdfTmcLK3RnGZ0Ju5dW6NQFYkZ/ASUEHN3SWxd463z3m
 bjjZehXKsyT22gjheE+R/nd+4LwuPkoPE+9C7vD4gmK6VkmcD4iu/nwS8FXffPhskW7kxlQtrce
 PapaVHD/jl41/h6PPWj3+p+GksLmynGt4ORj2svV3sv6vwqzQCQ41RVndaYFodl9skR5p0mx2L8
 +eiFDQaUpvHFR2isGuMATVpp0xCuMv6uIVVY/aHUXf+QnkkeZGV4WH7yNPWRzGkDWJCBMfyol4i
 JhnGaHWek1V+cSh//msfT3YmrinNJVqQxVF3yXwRfc2Gi5APGib2EF+CxYtsFc0LETA8CvYxqYK
 bECQnQEdtIOj2/K8dPtOGxruJOaSDsnd1leVkddaWJncOowDIieRW5fPIrzxQIoGQIJWSvpmZws
 SfMTKsDaSUNyBwwA2pu+/16FWrKaR+BBYW/2husfSyC6XQ==
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 240DCA4C693F;
 Fri, 23 Oct 2026 20:28:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49410)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKJzp-000000001mv-0zIo;
 Fri, 23 Oct 2026 18:28:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 20:28:04 +0200
Message-ID: <20261023182805.474759-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023182805.474759-1-bernd@kuhls.net>
References: <20261023182805.474759-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 2/2] package/exiv2: needs gcc >= 8
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

Upstream started using std::string_view with commit
https://github.com/Exiv2/exiv2/commit/476a5e23f9d9126942d2cfd8436ce08787d1c275
first released in version 0.28.0 which was added to buildroot with
commit 5e99e8a38282dbd810450c4be0156ea77e4c6e04.

Building the package with the gcc6-based defconfig
bootlin-aarch64-glibc-old is broken as detected by the Gitlab pipelines:

In file included from /builds/bkuhls/buildroot/br-test-pkg/bootlin-aarch64-glibc-old/build/exiv2-0.28.9/src/canonmn_int.cpp:17:0:
/builds/bkuhls/buildroot/br-test-pkg/bootlin-aarch64-glibc-old/build/exiv2-0.28.9/src/utils.hpp:5:23:
 fatal error: string_view: No such file or directory

The build error can be reproduced with this defconfig:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64--glibc--bleeding-edge-2017.05-toolchains-1-2.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_EXIV2=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/3db8846c533b63051cec3bc85d0d3916d6fc7609

 package/exiv2/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
index c65e484b2e..f3e32794ec 100644
--- a/package/exiv2/Config.in
+++ b/package/exiv2/Config.in
@@ -1,12 +1,14 @@
-comment "exiv2 needs a uClibc or glibc toolchain w/ C++, wchar, dynamic library, threads"
+comment "exiv2 needs a uClibc or glibc toolchain w/ C++, gcc >= 8, wchar, dynamic library, threads"
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_8 \
 		|| BR2_TOOLCHAIN_USES_MUSL
 
 config BR2_PACKAGE_EXIV2
 	bool "exiv2"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # string_view
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL # PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP
 	depends on BR2_USE_WCHAR
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
