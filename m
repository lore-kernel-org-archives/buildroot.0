Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03C9606A31E
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oMWsuUPK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=GVw3zU5A
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73213815DC;
	Fri, 23 Oct 2026 21:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ww-Q8OXi6_S0; Fri, 23 Oct 2026 21:16:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 437F68165B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792790218;
	b=qyrZlduRQ+JESHnZQcBA+T3lBlm5AZ/WaeQclu2cbMxC79qp28jbh3gZEVG5HqC1eQ1D
	 nUpjLJWW0w0D01YQscF5iHSMeILx/zMuzSzcrU0jZjDrKTpBcBG1AmUuhqYHjCPuuPgGV
	 +wp4gRCkN0LisJgs8eHoJ7aCZcr6RaL+UkPyXcbRpEuaFHzZMyW1WWAaEzrk8qzltHQox
	 w0n2EnLL8zvooDTknUrPgmM+BWg8Lk7PKBJZoP1nVnlEBrk6y6C+Zbz3K8NRhbMN9vGCd
	 zwkwkcpq6tE7SjbaEc0MwdiTfXWGAoQTkbEDTd0epp8b8wPHSQr2BAajf9G/FPVYl8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792790218;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WaOUR6LMW5w0AQMCQglDj5wluMN3tIWfeY/30+iVTus=;
	b=myRAI5MLcwu0QJs8IKdHOVBigKbG0MYTsAOra23BGQDZmpaD2VDKWBCS4ljpNoD++5YN
	 eDT++rhymlulGA3rW9aSIV4wnSN7QXN6Q10SYdbsOqivC2N1U1L+I24cCRuFu3fbfbOe0
	 viCRj6Z0dvhFyVehZCn990RfNnHCQjbjgWeOkG9kWl9XboFihjCCrE0Z/P8++nXVS6rUT
	 RSZgdHedjqdTwOfWusPGqWfSyR+L5ZVdHbz45WJJ8vGXxYCHXTfp7kWIbYeQ+n3y3y5ef
	 eYB5ha76RG3NChgDnT4n7yMF5j6kAI4WyrrxP+zWbFTM3pIM/uQajtBrEb57pQ7AkZg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=GVw3zU5A;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792790218;
	bh=WaOUR6LMW5w0AQMCQglDj5wluMN3tIWfeY/30+iVTus=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oMWsuUPK5TWh1fDXwCF+HEOModKzeSv2tbVdobCpKRwI+jZCtn+BiWyoF4eLN4b6o
	 16FyT4xSjPtD96s7qNb17NQ/kblvFwoiIRS9+mzWtDw4GlNz+kfEmEqWbWoKJk/ob9
	 oRQpt6BNmzmg39DlolgzD0mP2OmZulqhD2aOC2g8RCPiH+946Mrdbw8+z89eAfkcEh
	 sFFVKfXyWMcY/dih0zAT57MO3PFmnIuqkZKNK+QbM0Xdtclc2vsK5cXHwcxOfwmQpt
	 gNnDozMGfV5G+e/8DchZiSyoHn2+2yo0MIHnLCOhF15Z50lX7+4XozYaAEbHktXPAM
	 SrLTWIKJBnRsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 437F68165B;
	Fri, 23 Oct 2026 21:16:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 010A43C4
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB5BD8165B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lem9VuDTaDqA for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:16:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7BC33815DC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792790215;
 b=lYITBJikJxxAgN7vZUOcN6KwNLx+JBenby07rQ9DQWxaL75w7ePghyRfA05FFmfcqukt
 ahV0v1ZK1tkXrvMT4a33EThoKWeYj0qWK2TqOZyj8mFSUzFHVAHRF7x6gV8cUxRW+YRKb
 pPwDmGze7IZ4jBT4NwBX5Ol6vClvgqZ99210V4hlgmgffW9E9XV/QCpctlrihLOdByEXn
 7QObkiB5DHSwhQWApLytooPaHLbnYn14t6VIY+wwYODn2jyKsAALYnUsAww/csIh2Kx5G
 ZI63CFLbY7acI/GNEm4zG/tXYdBX1H8b86kxpSvTH4t2rhXOj0Ywv9UoCPy9T6hQV1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792790215;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=6DlcsNG+DKddRnJDvxCXrGwJGcYl2uCRdkViOzauOwE=;
 b=WRdAy8zyo289RIBoppfkmiljayfVCIyYSFRFgupAKAYf2AuMDSkoOoKbN82vsEhtbmmQ
 4VOyyV+HUuDMkVcqBqa9txd0vE0GL+evCfy+EI+azOkI6N5vCUnWNCUzsBpDycZH9fn5u
 5pgzUUxz2LOK4CetXu+YNhUM3ZjLWQXH9+pdTZYq9L/NzUYXFTsUgUR6XIgOx6re6cDRG
 vcCqp6h8VQvkOEQNavzrBBKh+Nt4Bf8zX3Yc34raO2G7USw7hQp1pLznrEpkMT9t7Iuet
 1x+S0kUMqoDsacMr/Fpwf3uTNVb/8nlKcntfMb7nPj0saOkGYXkW7AwqGuiIJ1xawNQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=GVw3zU5A; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=GVw3zU5A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BC33815DC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792790183;
 bh=6DlcsNG+DKddRnJDvxCXrGwJGcYl2uCRdkViOzauOwE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GVw3zU5AAvf2ZLlJoygrVnTPer2TEHEkulDC9AUlNz2m3eu3l0rvw4M/E/0viGLO1
 5q3TekkT+YwVVDM2J1p1puKD0mFDmR+Sce+p5x+/tUJnc/M5jaR2UkdQDq3FdsXE8w
 Z3Y8xmTQHn0dNGfLkeSqQpdayTKLLfZFA81I6wS6JJuPAD/RpFwGdA0DMNSsH1BRqy
 ewo7ZoJnMTKlPlkiEAcVQk62Rt5gFt0SHd0e2nD/Bo5cFfb1meCn1SMnL6BFXZROMx
 n4w8UQ9h1V7Q3/p8pu9pq26Xm8Eb3zrjyyLKiUZgXqS6F0Weya39u76dIRwU1XpjV3
 Wpe6Z/VGiW7QA==
X-KAS-Sym: v3:f51bdf72230551df:YQnrCVOyQTYqHcX7/s5yotzTnrVz65+Dzp6MAZJ+SVYAZ
 FfXy6c8x4QD3oOA/6VMQJlxhP+bhQ6ku5NDC2l/n9r11qYAKdcXLuotMdBF85g3NTWv2f+tNs3Z
 +ScI2dQYrWUxgEnjKZpNXqu9rp4TuG1CgE+CGfSmRzU0CB4w4X6f1vObzjTrX0gZ9twAGRuIYWE
 pP3EUkO4N1q0JVwHe6KVzeYwyIUF9JsZJ5P+kVciIGvKs9ETulcxrjtgfZaatakimoOKpkbqCfw
 sWNp6hwY6fyz1Udjb4VJK9FcXAMv/mS8QbDtTBhSdADn3xBP3Pt0ssbLdetdlSR1h/soPpAQ==:
 /X+KzUqIe+NP7dX7fMjjAL84XW9YRUjuRoXLfbi9A9TT94DuNsWorCXWFzHxRPA014zpEPpSyNi
 ybcChrIda3KEMo3x2KDIhzY787wpRAKB2s0m1i586pr+gGFwsB0ic/xDg8SOCKnCYCUuCMM5q3y
 ghTOGphPiSIchqd+XiUZKsND2RyT87IG9HoQhBo5HBeiLeSPsNEnTyimE4AIfwpKegSA+EM/pQ0
 cTwdUyj75W5PLAAdLk28EBZGlvbRhtcqaMI/Xbwr138BhpqFZWUZygksIJ/JK2sYhkU1y3N54Ez
 4Ae3LTqDN53MO1ztQrUbMGJwjUxQTuYh+CX5KFLvMlhTYJ86FO82XVj9QeTrk9wT+buTTdcTdaO
 30+vXi8qQERqVv9j5Kv1gp/CbcYAtSdJc1TF0BxpDVkxWEJtQKkvlhn8BbsVPn1a61a9RRN2Skx
 ZkGU5fsXXh17x8AaoDEVPFa917eZaUEYUTFz7xJsN/+MRq2UZBCt8GRbyx4vjN2ubmiAKm/a9Ah
 pOS6HSk2xTo8TyJ10xnNH3C10nP+ROKkoa5CnWwbJztDwLW1+xjliOIy7Q5VQRVs90VZYBeYPQR
 AL2HaCVqLMQNvXNSl3Z7LnC181DGiYeciwSPnZm7i3A/12QWXd7+sjc5Uej31E3vnrD4ta7hr1I
 fzz9mTpS08FGP/MoVYw==
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F09FAA4C6936;
 Fri, 23 Oct 2026 23:16:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50400)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKMcg-0000000069z-0s7m;
 Fri, 23 Oct 2026 21:16:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Fri, 23 Oct 2026 23:16:20 +0200
Message-ID: <20261023211622.2096562-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023211622.2096562-1-bernd@kuhls.net>
References: <20261023211622.2096562-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 3/5] package/mesa3d: crocus Gallium driver
 needs precomp-compiler
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit 59ed1137e9bb8c0157be3dc91a1cc462211dd3c7 bumped the
package to 26.0.0 which added upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/b72d347d1c3b9e829971fbdabf993b68776083c1
requiring the precomp-compiler for the crocus driver.

Add the necessary dependencies to fix a configure error:

../output-1/build/mesa3d-26.1.8/meson.build:945:3: ERROR:
 Feature llvm cannot be disabled: CLC requires LLVM

caused by
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L945

which checks the value in the variable with_clc.

When the precomp-compiler is not provided by host-mesa3d the meson
configure option mesa-clc does not contain 'system' causing
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L939
the variable with_clc to be filled, among others, with the content of with_driver_using_cl:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L939

which contains 'true' when the crocus driver is enabled:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L925

So we need to provide the precomp-compiler also for the crocus driver.

Fixes:
https://autobuild.buildroot.org/results/baa718e140264a9aa64c3a8f4114ca1b05f740e3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: no changes
v2: no changes

 package/mesa3d/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index feed6b68fe..e18d25eb8e 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -110,10 +110,18 @@ comment "Gallium drivers"
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS
 	bool "Gallium crocus driver"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
+	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
 	  Mesa driver for gen4-7 Intel GPUs.
 
+comment "crocus driver needs host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_7
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	bool "Gallium Etnaviv driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
