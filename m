Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3ED606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 20:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P3NopafI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=U4lqP0dX
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10583406CF;
	Sat, 24 Oct 2026 20:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLXB5Koup254; Sat, 24 Oct 2026 20:07:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2F6DA406E1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792872453;
	b=JSMZpFix/Jd4JHTLW1MgKoq2TkzqHYZneCxj6ABTub05mbUr36X1JXpPtA+2Yy3HCJL2
	 W1/UdzrUrUf/4PBkPpuD9qtKAdx3gBz5jUQR2wfBBLHRqtucJM4CfktoqN97VjggFgxWs
	 fpS7ygDtHlM5NKp/dHzYa/UQL6bBTBdfryuIDeXisOiFmYoyzJhdSG/5M4mmEX4S5TMOT
	 jdwUzkqzHCiYwD1HFxwFu/gWRgWa7gvavekZCc4o1yX2IN9dCssDqdyK7pBX3p2HKo80t
	 4g1VKEAHZxUTFfpzaQD/L4kGOKMsTCcUR/e1+86WnyCvZ21fqeo17n/xqVVKntkw9eg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792872453;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oyBonOydGDvoamSXG2gXYLN8DR1a/msZbrasIYpPwZg=;
	b=O2C41D+uO5SUEidEDk1qt/XTMooE4863N3uLbBFyOdentKpdyDoHKBiKSVx+zN8D8fOk
	 2+IhmDPekS/IKWJ76El3ytzjd3vPcKMWS1wvaZDGaLFYggDFWUyBDgcsxzHPMal/620cn
	 yKj4cPcQ7yuR9xUcuxQarGIExAzG5HvizFBOEnXlo9v41erizQpi3yxtU3tuAXf61BKKM
	 eaLrlIvczzf9d7pwKnIJvUHYDi+uC+Z33nyQn745R/s+np/cErKBH+vQNp0VSM2WK2qb3
	 U/shV390//yzplLy7vsllS7PeEuWFtjXGfbGzQSFG9U0raDqKmLGRaD+52KiH6LXALA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=U4lqP0dX;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792872453;
	bh=oyBonOydGDvoamSXG2gXYLN8DR1a/msZbrasIYpPwZg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P3NopafIot600eZiGiuvBdldFlitQ/w2E1wKMMTmLnOqvhX9smRmkEl2SjpBNu3bv
	 15ALxjASlBHyH/yj64OfSOzf3dEXMbeFhMftEr4jNon43je2BrimzzV96znWLEyKFM
	 L4w3QUvoL29gTMeff6uyAmB9Ip0l+0XixQdmLWF24pS9mEX9XvVz2R3pFqifR40lGw
	 0k0g7o2fXg7PzKXAp7jTyD7rZrWaQod371IDlPzMSFi9NswjNxJAqooN2zHE0JfsvH
	 YTE2WVU9QpmZlsFHFj/cInyOkdes5agCqZ//1qfdAb4/Bj+Qea9Nhi0KDUMv59Gyy6
	 1PZqcYV8uG+Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F6DA406E1;
	Sat, 24 Oct 2026 20:07:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C0642F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6612D406E1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_8nfE0ARZS6 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 20:07:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 58BB0406CF
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792872451;
 b=IGLmDRNGMcKCWQlgoaHCzxiJApj/uD3R+VOiBYQf7JbJAJSB/SYatHDGYyCYb1IwO1BU
 0v7OlPpCdjhDEICMYJw/hnePwjXaMBOIZ77j1RrDis2cW/qqfyV/2ORoFx/zrpQyI9cA+
 1HVz5aEBNol4BPXD/Obcj8PKK+pyATr0RQGkEDPsCEZJ5g8ezvUd7fAyDyPcczOuXrsCD
 BdTuP8/de32/k9mWkUdczh5h5RnuVyRM9o3aXbbnhLScMZXicSj31sgM3a+SQcM3hSUQ0
 G66AUxObeyfJeeB/Eh4Fp2nHGoVeQgagm7jiabWkGovkTUMR5qHPNLOvwyTBgr7kNtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792872451;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=COcw2UCUWr7FrlW3KkSiiVfN8eibfdzFfOGsMqChmE0=;
 b=V6wuW0DKpSLORtJVIqgYhQ7WwSXalyMKWxUBcP2KEPuVCeTxZKjYuEVsnNaYkJvCrB75
 NWgY3tWMU8zolLYDUdKtRXpuk/Ekj/zHfZU3rVnUn97MrzJILoRMyYFVsqJGYmrtL1JTh
 85GxcKmrmSESLlaK7KbQgWoD5kcpFbXM/F8xtsW4YvMP6guhlxZWRlz23H9g80O0FEyFy
 yZz0DoiApxfLN7bta97nFD7hY3dTshZcMvMEYkjLviUsVzK3DhXK8kKUzOaVTnSbf45oj
 yNFWyJp2qMBBgTzjN7+utLly+NTH/9HFK+hGGilSgy3f76L6Q/Zqf+IcsjIcFlWE05g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=U4lqP0dX; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=U4lqP0dX
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58BB0406CF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792872449;
 bh=COcw2UCUWr7FrlW3KkSiiVfN8eibfdzFfOGsMqChmE0=;
 h=From:To:Subject:Date:From;
 b=U4lqP0dXYNduHcYUnci3K2Yg1jkUoJV4q+I2e/7rSoGxeULqk1sYMlCCBH1bJ7A/g
 4MAo2SwJ31CazN2HCRCkJ5fz4vNUbKgJr3IoyM7byKTIpLfng4JnMJdwE6iQGCMvj+
 An/AMZ6L3Hv6zwHzUSrRGbHAKk+UWo23XzyKWoaEzMjl4OAjIeSBwhAgMKsxKOqGLF
 fpePZ8kqNYnxaFzdhlIlmbV9l5DhosTq/HUdt2XEOKHwankGMxaB5XiEOZtzy3w6Cz
 RzXeqasKqFticKX41MMExEckkuaS75EILJW6rGBft9pw/rD/JhlW0Ycl7njh3XuP2h
 Cm9ASuYS7bGQg==
X-KAS-Sym: v3:f51bdf72230551df:ItQOhoHdKTvWg0goPmYKXvJL9H6W56pV95e92f2XrMW5g
 7lgLaIeeEvfug8jGdfX1vOXBy+1EpV7jb7Rwxiw22ChBXv5ivne6wJmKZGWwpxubOizKiqb8P4x
 IQ9nbvN+NuS0QVgJ+cW6OJomD29RibcRx9OGAm6mbqqBYfsyE0j7EWGS5tN2+h5cQOAS9EWGq+C
 AhP1VY4d3i8ndF/x6jhli96WYDDyU5w6u2Efrzxt37PPo9HSkOZTjjnDjOsmDnylXWwhjr9PGkP
 AvGG8I92pPSHKWcqGWy+56V+3uF9SA92P+/xaoOkcykntohMjwMepiaqmUe8YMld/CAl7aLQ==:
 mvAZoQkWoNDYRkMNQr5mAvJaH3bqgBCC2IqK9s8+BK4ixCwH+tO0xQwX1Yv2z5ZkAkRNF8pdewq
 u7g71CG0MEcNXKpQQrnwMBfiKZ6XB626nigM9/gEsdDFLqTOfW/MaIjzaM9r9Umb6GBozAumrzB
 YkLWODQ15Jr38GeCOVhqVNEKdotckcNRQ3WjlRDJPE5ElsIeJiYvO498oOAio6qUYHpnEsladdk
 0WTUUMlGYeYRi3aLkRgD6R6Sq5y4m7tiZBwtiYN90AvsFHPNfK3qk+4hxlXPHGz3bdLdDCIdXKO
 SdQfLWR5ojwj8xJGuQE+B2FhIvG5nhc2S0r2Yp6mbuND7ZAJ0QD3Dt0abOJ/cKuRtqKfuAjKIj7
 cPr3oZ2HUI3WFHlIZAz50TtKZm2IkB0rfFP+Wm+R7VeSRdHW3CAlwWuRCCUH1twWu08yEGGJMY6
 asA7FhsspiDlLbHRP5gD0ZG2KsGUMhbdc7XdxdOIODWScjMlCbiMu7oP8t7AbhFXU9mGIAuYfgb
 rt4ZkupRYr2YjwSmNCnEoU1UI61Lqne2hcsQ3okPMvjsHbygMDpQscjl6hPH0ZRxwJ1Sp+pGmRl
 pKxe
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0B906A4C697D
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 22:07:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40390)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKi1Y-000000004eR-40vM
 for buildroot@buildroot.org; Sat, 24 Oct 2026 20:07:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 22:07:27 +0200
Message-ID: <20261024200728.3386039-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 26.4.1
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/intel/media-driver/releases/tag/intel-media-26.4.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index cf228a2062..ee6e694b42 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ff70ecafe7f5efe02009b723d640a05dcce5016eaf0a6df60c2276df0deff101  intel-media-26.4.0.tar.gz
+sha256  9ff79e04075fa52ad9d5bc66154f508892241a61f85192d0846de9f55b9f2ef2  intel-media-26.4.1.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 1367d3a59b..ede12e9270 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.4.0
+INTEL_MEDIADRIVER_VERSION = 26.4.1
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
