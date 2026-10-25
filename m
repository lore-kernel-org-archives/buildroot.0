Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D30606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Qa0hsxRc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=kNwn9Lc3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BDD180D3F;
	Sun, 25 Oct 2026 22:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z2L9RUFgHCf8; Sun, 25 Oct 2026 22:11:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 940D180D07
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966289;
	b=JE+/q36KZMlP7ner6nkJqv4XnY3zicofFeKSnESPnLtokTSqk0bmBMNrSLQFDrMirqcZ
	 jQQ0wl0ROAKxPz6MvRbWdLqpz+GLWXw1KG02G1DhY23uLpUmvIltRhtioEABvjsyGzbXR
	 qCxcCxp05eX7PT89Qr8rGjBWeEDHaFUisBM081W3SbCmSXbtWwpvDT5/glJDgrkESEdgj
	 lN5uurz8yKZSQ/66oCetxx1d6re1vZgkS2bHGquXPPFigEsj0ZSWvTUTT3wL59T2zgeW5
	 3uEzLj7D92rVKAZ3RHzOlQbjcw1iYNdE85Lqp7i29bUmuT5bjDOLHrjHLPFb0BIJD3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966289;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Sl4RhZaE3dKNJwWSezYrVjlx+o8BAlooMqSgepXNy70=;
	b=fYn+z8pGxB5TL+97KPfkFXfpD0LKz9XJ3BRdeti/dHtznvvc6gpPTCXMO2HNsBcNoPPQ
	 txGlQcyE98b6zokpobuBXXSjoSXp2bq9pqyvrI3riGRCXHLhLHG4Qv3bWXRhxPhnoIJf8
	 u4v8ussh4925CCG1kwUU2Ouhoz/OMEkOj1+W2zf2b8HE9iT+8oOZjUA5Apqv/7wgVScdl
	 gPsdquYsOoxwwojonkPDP2zJ57L4aqSsOR9Z9a7ptMbLqb3vybEkjn8ZU4x6O8Bzasymw
	 EsQYudqyrrgzx2cJb5kw1pr1qUiXEMpcD5E5td2kKa1JSLTgHGF5yFZTERV5MtAq+GQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966289;
	bh=Sl4RhZaE3dKNJwWSezYrVjlx+o8BAlooMqSgepXNy70=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qa0hsxRctr8xHmDqe9BdDk2lkzZhzQRnu6EI1pyQFRNs1VHXwuJJzD3fxJCWdt3CO
	 Cdqs9o9HqLfXOcihkg4vI1XT05pxDen3iHhLTG8HlrKOSd2ZbNuZauXbJyEgc2r3CP
	 aCQy7ymmwRFBazVSjlw8zz3lKaQkvsvoGJUo3R/BYr7C+oIdUFbDqDlN2WtB4/Cw7J
	 jQBUvzdFqPY8OQ5a7YX4s8Gety+TKd88jkRokT76OGCwuellNe1t6WWTpKdQMRNV7H
	 MXRE3tgEGir7yxbGG+VvMYJtlXj4N7updwh+ClLNQb2l+J32Hi/IXx8A7stpGAqkiY
	 movVH95IOxEDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 940D180D07;
	Sun, 25 Oct 2026 22:11:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D49CE356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA4AB40497
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tIz7Q2oY6Nt for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:11:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E0F5C40450
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966287;
 b=ClPWBQI5IEzal4g1VVssXdMCX7qnpaYqNjCnXUCZoxAl1yMCL4v19pU050m8G2NxNHtc
 W9SoZPovB6do8pvSQ+rQbvk4kYKA64Tv/wuTFXXKXWgx1lnt0jTujeI9P0jCDm1O+oV4K
 uWs2Og6fdi8vJPXXtGVGwqHfl9ZQTfUtBxk+mCpMin14FpsIGE7cnny7WE9ZWZeQiLMV4
 PlFpnwQpykwyY2xdW4ztBV61g2t238cXqgSmbCijVa58s60iliEp5MO94Z+LLZjU/LkVx
 Vc1BQRXeBHYpzJ9z1CpBjGj+WkBHoIshugmsg/JqwirvlrbVDsX2Ou1DboAV21YSVvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966287;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4TzIRMAjtl6t/1zLdfdlj7IKj7Lb4Gg0VZK8jvNsd9k=;
 b=WzEOoGwS45NTK8UfqRappwfOsv+WxEMCHP1ITbZg5W0Fr+MIqFkVx8Tm/iJGIW/Zvdn2
 bJXHgBIcIpQjbni4ZA2tR20l3gUcAfFCefL/PQWm14qCyNqLOxOEq8FsjAu+221PYEmqq
 5bJxxzm7JUKT6vYEKmlnZZCw4XRe0NOZRk8/oviU52xwBUOnARtkT2UhKtSXwKo1JKycy
 uOg2iQjzHFfkNKFyzI3LohaH/JLv2GcriOl/aATV0/RgTYkHbLEMkW5S5tR877cw3sRuq
 q5Ve8ikTLMIqeT4M3vhGOeb2+FQnGxBOIhBk5oQoe7JonmkSU7SNCl8r/MdQrFTWwIw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kNwn9Lc3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=kNwn9Lc3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0F5C40450
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966085;
 bh=4TzIRMAjtl6t/1zLdfdlj7IKj7Lb4Gg0VZK8jvNsd9k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kNwn9Lc3HjVZIMWm9/dTiaeOagoliiiMGuudJMy4jMdp/4eUd2/YfTRoZvGvlGNgG
 Yc263VMwpOQORD4zSNjZAu0M6mGBomlyVc+AhQG6yKTyZowAUNjyNJLFjGcrDLicdQ
 lvfavTH1txIvM/WWK7tuFwgSPTc2JbT4Ii/7+J5M5QxYLpANfbZedivW+k0avMrHF1
 6Su6sU28WVVrP7/Xt3hquTB4IT/TRBBfnvtK7/gY5mct2xfv7w7yQZQOAxlrHEZiRb
 wIVunNVQvAYStBSiandUEy9hDwcyMktZhcVbEPBOVB2Zt3NBlChXYB3GniNwyZBBIQ
 VUlaGVooQoYzw==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 fkdAO+GGX4tuOpqePSkz93DxZpD17+65LJY3jE3aCinP8QRvnlbAfeNc1F4Jy3KZNhvEc8fq5T5
 dIC4sqCs3LrN6FH0napxfe4kqWn1Ndi8WiGShpISTMxhHqQjF5Npj+JYKG/inW+5EZQCUb1RC0X
 cryiaAhqiHCrQQfWC38ayxEV5GZIPgBW4W6uuOgcBSSlYNhA+fN95KlNPdxx8B3VQ9HHfE1zDwJ
 vG5sC1FK5DLV7iatQgNEzWkqnJ45WTVym3AAw+cyf45m4FHxQ0+lAtwUe0VBaFR5wWMo38dWdP4
 uoFl8kJVih0IKrbBE89iEqwxjo0udDAth2ZN5wBCSYcjfM83bXEyj+DT/a4seEYbYOjHebm6Np5
 muYU2CXH+3Cn1/I2c+0X0AB7MgF177cH9tDIyUECYt95Pj/JzYf0JDSYIkN4fzTwUCumWRZtKcB
 9ldgqRHJ2rDWju4rY6lads3IYU30cT/FgpeDjm2Ryv4pxq9kuC1c3NbzhizTpUXs6kEQLrrQLNp
 V6/8bA3Tja7P4l6EsldTFm0oI0qwGIlpCvUPZwwFyKe6fWoQjxEENYIyscgdOYz/I913HQgYa5A
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 24876A4C6A94;
 Sun, 25 Oct 2026 23:08:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NE-000000001fP-0hQt;
 Sun, 25 Oct 2026 22:07:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:07:08 +0100
Message-ID: <20261025220723.1332924-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 19/34] package/docker-engine: bump version to
 v29.5.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKUmVsZWFzZSBub3RlczoKKiBo
dHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjk1MgoKU2ln
bmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgpTaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvZG9ja2VyLWVuZ2lu
ZS9kb2NrZXItZW5naW5lLmhhc2ggfCAyICstCiBwYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2Vy
LWVuZ2luZS5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1l
bmdpbmUuaGFzaCBiL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLmhhc2gKaW5k
ZXggMGY0OTQwZDNhNy4uNTg3ZmE4MTZjYiAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItZW5n
aW5lL2RvY2tlci1lbmdpbmUuaGFzaAorKysgYi9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2Vy
LWVuZ2luZS5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1
NiAgYTQzZDA0NGFjNGE4NjhjMTNiMGUyNDI3NzZjZTMxZDI5NGMyYzA0NWRmZTFlODEyYmJjY2Vj
YjZhNDY2NWE5NSAgZG9ja2VyLWVuZ2luZS0yOS4zLjEtZ28yLnRhci5negorc2hhMjU2ICAxMjM1
ZWQzMjVkMzI0Yzc2ZjUyZTUyYmVhYTFkYWM4NWM5MmEwNzNiZjJmOWZjYzViYjlmNjdlMzVhNjY4
MDI4ICBkb2NrZXItZW5naW5lLTI5LjUuMi1nbzIudGFyLmd6CiBzaGEyNTYgIDdjODc4NzMyOTFm
Mjg5NzEzYWM1ZGY0OGIxZjIwMTBlYjY5NjM3NTJiYmQ2YjUzMDQxNmFiOTlmYzM3OTE0YTggIExJ
Q0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLm1r
IGIvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKaW5kZXggOTE5MmJmMzQy
ZC4uMWE5N2RiY2ZjNiAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1l
bmdpbmUubWsKKysrIGIvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKQEAg
LTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1ET0NLRVJfRU5HSU5F
X1ZFUlNJT04gPSAyOS4zLjEKK0RPQ0tFUl9FTkdJTkVfVkVSU0lPTiA9IDI5LjUuMgogRE9DS0VS
X0VOR0lORV9TSVRFID0gJChjYWxsIGdpdGh1Yixtb2J5LG1vYnksZG9ja2VyLXYkKERPQ0tFUl9F
TkdJTkVfVkVSU0lPTikpCiAKIERPQ0tFUl9FTkdJTkVfTElDRU5TRSA9IEFwYWNoZS0yLjAKLS0g
CjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
