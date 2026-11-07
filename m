Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938A3606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 05:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=M4Nl/qt/;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=YasAl7VT
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55C7480F5D;
	Sat,  7 Nov 2026 05:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKgXcKp4T0B4; Sat,  7 Nov 2026 05:32:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8E80180E42
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794029540;
	b=tX0CILg54NlVrviSWWwxkgoaRg1QfwaqJ01cf09uH3WPEa0pzGeBbE1LGK5/nAJHz2jx
	 WVFjvvqC2fWoMqRExC50ViYSqwvDetscFOIOpuZ6s4+NeFh5YtPuo3flKB5WIA2LeuQk4
	 b55nGY7v6UdEd1SYHTVN5VH70OnRxHF2ZSOervJxNgCcmMkbs/ItnAmUdS8kheTh84A/c
	 dEqlZc+PpdTnSjOeCdOSK9OHXX/bzLoHLHWQWLmOVHiYpS1kbzT1XsdoSp3XvqoAgKtIn
	 glmH2WiSdoWOCBBjlRd0Mis1f8yJ0HS5DZ+yow6olLFx5Y6i0gqJsFWy/38PYKnKVPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794029540;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NbvtDYDktoMLRnfk1gUGyPSfzQ9FRKhj8zjlkjmCk0Y=;
	b=r5M7iKw+tRcCdSVDphfauxaH8C/61iWdvfOBKiysggXtNtTbvVLKa6ml4cauf7I/A+OL
	 5YHpc0Vlg9/zeHHU2EfvrdY1MpVDXKJqVFDEWhWpjquJM9Fm0c1fn4CqrK5fy3O+nkHyb
	 UEmTWYGmqSkJ0uXXxFh4eTcVDfJrgAm4sFw1UVBgmEQjtXE6HC+2iWYcpK3RrrxqtJiDm
	 h1tKer1p3YdGFyuiJIylB9Up/mGBYFUT4r3j7VoIDysPVW3mdk57zlKp7hSqst6Sxkify
	 7ls+VvKF/FVQyuM84tJEEM3s58uRed6yvVif3BefzHhzyRyzQ8ym5gG8LMo9keErcIQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794029540;
	bh=NbvtDYDktoMLRnfk1gUGyPSfzQ9FRKhj8zjlkjmCk0Y=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M4Nl/qt/XEMOQXf0a1blX4L3v2+0II0ftqCDlPB+WVgUXrohLvK3JGsTu75ZRhjKH
	 vrJU5nsIljRhx9zh0OtiJI/vkfKdp4E5oZEXjefnc36HRfjSEC06ygVQYAfPz0mBAb
	 lEHDZLgYRH24w/eemisoc/bPiKxHvEJdYVJyCLCTga9T8jscWuuZKy5ddTIl8gMVnO
	 Ztb6h8rnPCG6wDYh7gwvi1z25u6m/TccoY9tIuqoToYJaDoPD6DhxPd+45Kt2NAKht
	 6mHx3KY7ZWUAAobPhuOCQ0lVlwdcW20ZjMkXKkwCBv/bPNyIpOiLlvbmqBIbxgZZjT
	 n15IEU/3TyMFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E80180E42;
	Sat,  7 Nov 2026 05:32:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B0CA362
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 05:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C76A409B3
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 05:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F52SOqdMIzML for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 05:32:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6348E409A3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6348E409A3
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 05:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1794029535; bh=nd+daJfPk8qIuPGFTHvZBc3YMbukDd7yNxXsjL9PH4c=;
 h=Date:From:To:Subject:From;
 b=YasAl7VTTxlSREk3tThU8CBuaPdi5gpIPKbIxwCtGJT92YS4lzZcNWw1VpelFKe8j
 p4x8yAJDiW8J2BvZcPZyyg6orCQ16xPlD7WSCIPZkOVfgv10NaMx2s6SsbYgwaplWn
 K0gJaqE+22/r1jjJlu+kSKluZLhqDaZjwBwm4FpHMDYvpv3YA996i/VCV/P8+vTHRy
 vGFEpEkQj8flhxDxF67yf9Hs/VEyan5S0Fx7D2cWeZzQJAd9C40WZ41kclPnKMnS/4
 eFKmaVcafH8PZqEFgZ+gQF1Y1gq6zMyFPI6QmAEsmWdRbn3H11S7AtC82b///k40Rw
 iHsMs6C1mY+HA==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0FF4C31E0744; Sat, 07 Nov 2026 06:32:14 +0100 (CET)
Date: Sat, 7 Nov 2026 06:32:14 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <au633l1ukAk4oeRs@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.113+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/chawan: disable for MIPS64 n32 ABI
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Disable unsupported MIPS64 ABI.

Build error:
/home/autobuild/autobuild/instance-1/output-1/host/lib/nimbase.h:274:35:
error: static assertion failed: "Pointer size mismatch between Nim and
C/C++ backend. You probably need to setup the backend compiler for
target CPU."

Fixes:
 - https://autobuild.buildroot.org/results/357225ea23bba6d969d6e82795150ffa92be2065

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/chawan/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/chawan/Config.in b/package/chawan/Config.in
index 7a7e982b47..1e25a5fab4 100644
--- a/package/chawan/Config.in
+++ b/package/chawan/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CHAWAN_ARCH_SUPPORTS
 	default y
 	depends on BR2_USE_MMU
 	depends on !BR2_or1k
+	depends on !BR2_MIPS_NABI32
 
 config BR2_PACKAGE_CHAWAN
 	bool "chawan"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
