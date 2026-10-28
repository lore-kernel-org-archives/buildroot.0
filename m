Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE97606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 10:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kOXCh9fN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KzET28gR
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BC72605EA;
	Wed, 28 Oct 2026 10:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHiamiWOh1Pj; Wed, 28 Oct 2026 10:33:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4C3986061D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793183581;
	b=D2iB1vu+RrYXw53+tdgqK3Xr0f8Hw3TUDUCdrN8tifT8GEbE24MIVtXb9Z0Ir93ixgal
	 EOYPYSjbJwArhvPwGIG0dtTmTi8FFtVZkzEK/nWznyqPmfKjFg8MWuaazIfPlIy8JUKQ6
	 PNlQSUq3f74Bd+d5fcyCw5IQnBUJAn6rdXk3rCKrVqUVUpuqkp51Q54gstzInLcQBdQf4
	 OGuTMI24BJW0j6BqAbeS6sWQvPY3Ce0F9Q1hIf6xeRuvIYWnXbc3Ai0Nwvq5hYE40JLsJ
	 oWTReu8zDE5Hna0zO6MuTTQn08DSpWp9+b9WTNsx08b/dQ6oAbOVEMcSuI4b0Yh9jXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793183581;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Organization:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5hoStFExGS6YNMycPjqZTNgDzHzkTzUJHO1ajzfrN+w=;
	b=nnD7qq2LjQx2c7RFEviNR2irin2j6VAuh6f2uYJH5ZB8aiBzOK8pUki8GwKV7PRjd9OH
	 RLaSqBfbQmQWvd5eMkDWvWNZpxbkA+sFM8ljLap0hnXPpY4O9GmFdDeX19Wm+uvIt9RTD
	 6ub83wpitp2htqeycsH76R9HzjyaCG5moihjncp3H8r2EPJ7hY8HG0y4lrPKwojG1WRPY
	 kj89tmUmQZxlsCBF3UXvKsmauTjlwDitWWQylIWarKQHU2VfidWACt7t53B8qA7s6f663
	 wXgjAMhylAMQLDVFmjO1+CX1pODSwj2wyAgkcBt0GF9nEiYqEVUgKqEh9xPULEK7I+A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793183581;
	bh=5hoStFExGS6YNMycPjqZTNgDzHzkTzUJHO1ajzfrN+w=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kOXCh9fNwE9L+Pr38dPJt9auaQIuYwoJzfdGelmx5vaLaSnCpNgwCF7REF2v0zux5
	 T9Ggx10wPN2Rkt98S6tW2XH4WZp7fi7g8kmR5f3d/O47ut7UIWGjjRn24UtJol7h0E
	 fW12R7nNar6TAfRpHCpE3RQYe956FpkbQDYBXKxyezqTW2wlpCUWA5fSIxOmEGa5XH
	 Zy1Wxo0lBhd48SPRPVNINLeBKII24eMPtL59/GTGoIjdO0VnTzygXMWsKOj6u4Okzh
	 A0yNRuWlPPirbkCMiU/NR+qvG5Owpa8aVL62lyGOAWaW0k7qrKJgLIfFvCSchMyN2S
	 luw+AxaLS0L4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C3986061D;
	Wed, 28 Oct 2026 10:33:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33A4D356
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 10:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19E4040567
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 10:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SGjdoRW-XHCt for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 10:32:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 014EE40565
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793183577;
 b=o+1Ox3zwAVw5IsUNcEfiFJnO5Q5YHk/7nn00pkz8hMPvdIfHfCekb2rs/kmKP1i64PgC
 Yp8dVY1ljHSXxizGKfej6bbRB2MEJ7sXFDa9otmNGb51by7yyo/FQgK8T1iVrReT46qnS
 wwMsK+vJZwQ4ApBUr5IBlYY2onIgLI5zYdT8xtAwW3UJu1THfaE6jMYA4bAEHVI/tjWTA
 GKkZYq3vmz3rMPB3GZkGc7sWCg6Gzf7aTbQJFNQCEhN33fH9e+62hXriTsJu90IZPCbcd
 Hv5LrcoErAhncI+otd0hBwy8j9/FS23Uu9hmm3Is+EdqKAaaPhn5XykbZhe+wR4vrqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793183577;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Organization:Content-Transfer-Encoding;
 bh=XrC0UJbJymqj/jLRAnEOEZWpb4s2Px7ampx8TcxdIJo=;
 b=GDEgjS2a4JMbEX+JxsEZw8xisyPcSgZjLOMOsRrvmmNysTRjwsH4yob9+T9EUU0o07bH
 IRc11z56e+Vt4clbhMTvwyxW7nPe8IpXm+OoqREtklA6e+PC7pDAWkkZJf865FkJExg/D
 +VGj2SdOWWqZJnovSISx1QaONT3BXlTECcnVamoNbH1p87Itk0LvxHHNbmh2QhFVvLZDG
 nhesxvrYuXzdAUhzjgWmWRhgh9Y7DV9yfKj6xVkfherkDihzSV8sg1vLFm2VpvrXhOBcH
 zfrSTqjaFTX6Yl+/4+4Jw94ddH/cNGIvDngEcNlPx+yYsVoHVQH5I995avZ3PTXTf2w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=KzET28gR; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=KzET28gR
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 014EE40565
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 10:32:56 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c43fbcb4393so117673766b.0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 03:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793183574; x=1793788374; darn=buildroot.org;
 h=content-transfer-encoding:organization:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=XrC0UJbJymqj/jLRAnEOEZWpb4s2Px7ampx8TcxdIJo=;
 b=KzET28gRh8UU8fN2nWcRDi1CAKeCBDB9Y2eEff/QZL39zWfK/3Fi39qeZkV8zROl0P
 FKVCfTygW+LiL1jhm3V/oIDQUtPazryPieOMwO9zquJl9cqcSCrGnIrLnmSGmneGVt0f
 cdfQ4LE6MmqIIWb0ccf/rf7QlXOBsRZcBRH9LtPPOL/eFjN26Kq2bFu7VxM8Q/8qYnEn
 Mxx3xcu6QGYuGYUIoufU24wXjhVAwc7HjcY6grTFs7lHEd95KeFkH7rVfyAQNAETH1GK
 TXKKGZn7ab7V1yMAQBLtdGow86CMBBM/RNUPnW3y38ZC6qNq7huG6UHlENFVhTWBvARL
 bb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793183574; x=1793788374;
 h=content-transfer-encoding:organization:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XrC0UJbJymqj/jLRAnEOEZWpb4s2Px7ampx8TcxdIJo=;
 b=Zw7vXhZ4YzmWuY7YHIWaSWv3LPsRJRdQJnwNxjqtEdB3DqK6EFAt1GZbfnbPAVTBpO
 UU08LWeIiOgA9HD0swCXt6qEyygGHT1FyH8B36EnW+bnHMdoJFe242xjybaLuztOiJGw
 tNuoceKhqhyp0hYUq1lS4ayFwTqZ1y5kbK9Mr2FkH08JIDPxVQve0Smsx/2EOUrYM9Xn
 pomvwMVaoRw4iAmNhqRHty0F/64PMCDpmduOe94Wmg3uku5XuRO8RGCpTgqxDBaEvpfi
 IUNERBsUTnYtePbIr8bCsSoip2CB8mNN2zMpcZPtcKGk34Xv9bDKgnqUB1Fuhbji9Ryx
 PNsg==
X-Gm-Message-State: AFq9FYJ3qCPoPrk1IljjpA8sHP8FcFWYXr4bYpkEUaaEPC8ML7bNLvsd
 H3DA/RndSvI4bZu5dLGPhqL6jJdKhNJ/Rkx7mZUc0hddDRXPpaaSqR+QoSpwdA==
X-Gm-Gg: AYBFou1LQpStBaS5GSSczRklkHnLTCj2VcNrvdm+EiHibb7NFKQVULZurzdlTwSAulA
 KZaKbyGDIczI93GPF0auBzh5fE0rCFcuThINJsjOZgYoLc5uJBU3v+ggUY99O/MHY6JvExpRGEY
 KTouQ7AvFbcucPSH60fuv4BmRGKtxBDMiaTITGEn/RtCHhho9nGtUIyF9s5FMQwYOFPTnoOISLy
 aBTVn988m8bge1VxAnfgWHGWvH9CZ4la/YaHi/uo2zEiyVQmponX7Sw/Dw53Tc3bt5xH4+s9hGD
 s8rSDdfAu+A1bQypHMo6rv3gcm0s95073m0un2ORHJ2eig16oRP0GyB4cDQ496P267oC/bRP52q
 VuZROhDOojO4Y0yyvdPKGxfQpxjMohjulXDagMlPb8nVa7RHwzfR0P72UaLTXrIYVf3mbt51tsd
 uYzHymH/7kstathKf3UTtlx67Uctne6Ylf+0NI1YeBMGN7FIxpLO4Y98T3/fks+YKCHS1Qt6+YJ
 EVkT2vewJTP0yhTOIS212WV/8RvE2dtigk1yLv8Uvb8Qj6gNJDwvHlGd79tQAc1PFf9td7/XmD/
 A9+dZiv8hUomqfBEhpj1xyYiEC0h741IjrHNMg7V/B6a7vIYJ2czKTUe0bWKdmnRpDibUen6/NM
 6nPP8yyVOP5XF0AwCvQY=
X-Received: by 2002:a17:907:9c05:b0:c29:63f2:99bb with SMTP id
 a640c23a62f3a-c49be064d35mr156569066b.47.1793183574147; 
 Wed, 28 Oct 2026 03:32:54 -0700 (PDT)
Received: from tollan.addiva.ad (h-212-116-93-252.A259.priv.bahnhof.se.
 [212.116.93.252]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd6573dfsm578711666b.52.2026.10.28.03.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 03:32:53 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Wed, 28 Oct 2026 11:32:46 +0100
Message-ID: <20261028103248.1317597-2-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028103248.1317597-1-lazzer@gmail.com>
References: <20261028103248.1317597-1-lazzer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH 1/3] package/pkg-golang: record vendored Go
 modules in show-info
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIFNCT00gb25seSBsaXN0ZWQgR28gcGFja2FnZXMgYXMgYSB3aG9sZSwgdGhlIG1vZHVsZXMg
dmVuZG9yZWQgaW50bwp0aGVtIHdlcmUgaW52aXNpYmxlIHRvIENWRSBzY2FubmVycy4gUmVhZCB0
aGVtIGZyb20gdGhlIGJ1aWxkIGluZm8gdGhlCkdvIHRvb2xjaGFpbiBlbWJlZHMgaW4gZWFjaCBi
aW5hcnksIHNvIHRoZSBsaXN0IG1hdGNoZXMgd2hhdCBzaGlwcy4KClNpZ25lZC1vZmYtYnk6IE1h
dHRpYXMgV2Fsc3Ryw7ZtIDxsYXp6ZXJAZ21haWwuY29tPgotLS0KIHBhY2thZ2UvcGtnLWdvbGFu
Zy5tayAgICAgICAgICAgfCAgOCArKysrCiBwYWNrYWdlL3BrZy11dGlscy5tayAgICAgICAgICAg
IHwgIDcgKysrKwogc3VwcG9ydC9zY3JpcHRzL2dvLW1vZHVsZXMtaW5mbyB8IDY3ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA4MiBpbnNlcnRpb25z
KCspCiBjcmVhdGUgbW9kZSAxMDA3NTUgc3VwcG9ydC9zY3JpcHRzL2dvLW1vZHVsZXMtaW5mbwoK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLWdvbGFuZy5tayBiL3BhY2thZ2UvcGtnLWdvbGFuZy5t
awppbmRleCBjZjEyZGQ1NmIwLi4wNDNlZmM5NGJkIDEwMDY0NAotLS0gYS9wYWNrYWdlL3BrZy1n
b2xhbmcubWsKKysrIGIvcGFja2FnZS9wa2ctZ29sYW5nLm1rCkBAIC0yMDYsNiArMjA2LDE0IEBA
IGRlZmluZSAkKDIpX0lOU1RBTExfQ01EUwogZW5kZWYKIGVuZGlmCiAKKyMgUmVjb3JkIHRoZSBH
byBtb2R1bGVzIGxpbmtlZCBpbnRvIHRoZSBidWlsdCBiaW5hcmllcywgZm9yIHNob3ctaW5mbwor
ZGVmaW5lICQoMilfR09fTU9EVUxFU19JTkZPCisJJCQoUSkkJChUT1BESVIpL3N1cHBvcnQvc2Ny
aXB0cy9nby1tb2R1bGVzLWluZm8gLS1nbyAkJChHT19CSU4pIFwKKwkJLW8gJCQoQEQpLyQkKFBL
R19WRU5ET1JFRF9ERVBTX0ZJTEUpIFwKKwkJJCQkJChmaW5kICQkKEBEKS9iaW4gLW1heGRlcHRo
IDEgLXR5cGUgZiAyPi9kZXYvbnVsbCkKK2VuZGVmCiskKDIpX1BPU1RfQlVJTERfSE9PS1MgKz0g
JCgyKV9HT19NT0RVTEVTX0lORk8KKwogIyBDYWxsIHRoZSBnZW5lcmljIHBhY2thZ2UgaW5mcmFz
dHJ1Y3R1cmUgdG8gZ2VuZXJhdGUgdGhlIG5lY2Vzc2FyeSBtYWtlCiAjIHRhcmdldHMKICQoY2Fs
bCBpbm5lci1nZW5lcmljLXBhY2thZ2UsJCgxKSwkKDIpLCQoMyksJCg0KSkKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvcGtnLXV0aWxzLm1rIGIvcGFja2FnZS9wa2ctdXRpbHMubWsKaW5kZXggMTdiMGFh
MTc2MC4uMjFiNDM0YzZiZCAxMDA2NDQKLS0tIGEvcGFja2FnZS9wa2ctdXRpbHMubWsKKysrIGIv
cGFja2FnZS9wa2ctdXRpbHMubWsKQEAgLTExMSw2ICsxMTEsMTAgQEAgZGVmaW5lIGpzb24taW5m
bwogCX0KIGVuZGVmCiAKKyMgRmlsZSBpbiBhIHBhY2thZ2UgYnVpbGQgZGlyZWN0b3J5IGxpc3Rp
bmcgdGhlIGRlcGVuZGVuY2llcyB2ZW5kb3JlZCBpbnRvCisjIGl0LCBhcyBhIEpTT04gbGlzdCBv
ZiB7bmFtZSwgdmVyc2lvbiwgcHVybH0sIGFkZGVkIHRvIHNob3ctaW5mbyB3aGVuIHByZXNlbnQK
K1BLR19WRU5ET1JFRF9ERVBTX0ZJTEUgPSAuYnJfdmVuZG9yZWRfZGVwZW5kZW5jaWVzLmpzb24K
KwogIyBfanNvbi1pbmZvLXBrZywgX2pzb24taW5mby1wa2ctZGV0YWlscywgX2pzb24taW5mby1m
czogcHJpdmF0ZSBoZWxwZXJzCiAjIGZvciBqc29uLWluZm8sIGFib3ZlCiBkZWZpbmUgX2pzb24t
aW5mby1wa2cKQEAgLTIxMCw2ICsyMTQsOSBAQCBkZWZpbmUgX2pzb24taW5mby1wa2ctZGV0YWls
cwogCQkJJChjYWxsIG1rLWpzb24tc3RyLCQocGF0c3Vic3QgJChDT05GSUdfRElSKS8lLCUsJChw
YXRjaCkpKSQoY29tbWEpIFwKIAkJKQogCV0sCisJJChpZiAkKHdpbGRjYXJkICQoJCgxKV9ESVIp
LyQoUEtHX1ZFTkRPUkVEX0RFUFNfRklMRSkpLCBcCisJCSJ2ZW5kb3JlZF9kZXBlbmRlbmNpZXMi
OiAkKHNoZWxsIGNhdCAkKCQoMSlfRElSKS8kKFBLR19WRU5ET1JFRF9ERVBTX0ZJTEUpKSQoY29t
bWEpIFwKKwkpCiAJJChpZiAkKCQoMSlfUFJPVklERVMpLCBcCiAJCSJwcm92aWRlcyI6IFsgXAog
CQkJJChmb3JlYWNoIHByb3ZpZGUsIFwKZGlmZiAtLWdpdCBhL3N1cHBvcnQvc2NyaXB0cy9nby1t
b2R1bGVzLWluZm8gYi9zdXBwb3J0L3NjcmlwdHMvZ28tbW9kdWxlcy1pbmZvCm5ldyBmaWxlIG1v
ZGUgMTAwNzU1CmluZGV4IDAwMDAwMDAwMDAuLjQ3NmE0ZGUzMzMKLS0tIC9kZXYvbnVsbAorKysg
Yi9zdXBwb3J0L3NjcmlwdHMvZ28tbW9kdWxlcy1pbmZvCkBAIC0wLDAgKzEsNjcgQEAKKyMhL3Vz
ci9iaW4vZW52IHB5dGhvbjMKKyIiIkxpc3QgdGhlIEdvIG1vZHVsZXMgbGlua2VkIGludG8gYSBz
ZXQgb2YgR28gYmluYXJpZXMuCisKK1JlYWRzIHRoZSBidWlsZCBpbmZvIHRoYXQgdGhlIEdvIHRv
b2xjaGFpbiBlbWJlZHMgaW4gZXZlcnkgYmluYXJ5CisoZ28gdmVyc2lvbiAtbSAtanNvbikgYW5k
IHdyaXRlcyB0aGUgdGhpcmQtcGFydHkgbW9kdWxlcywgZGVkdXBsaWNhdGVkCithY3Jvc3MgYmlu
YXJpZXMsIGFzIGEgY29tcGFjdCBKU09OIGxpc3QuIE1vZHVsZXMgcmVwbGFjZWQgYnkgYSBsb2Nh
bAorZGlyZWN0b3J5IGFyZSBwYXJ0IG9mIHRoZSBwYWNrYWdlIHNvdXJjZSBhbmQgYXJlIGxlZnQg
b3V0LgorCitFYWNoIGVudHJ5IGhhcyB0aGUgbmFtZSwgdmVyc2lvbiBhbmQgcHVybCBvZiB0aGUg
bW9kdWxlIHRoYXQgd2FzIGJ1aWx0LgorV2hlbiBhIHJlcGxhY2UgZGlyZWN0aXZlIHN3YXBwZWQg
aW4gYW5vdGhlciBtb2R1bGUsIHRoZSBvcmlnaW5hbCBpcworcmVjb3JkZWQgdW5kZXIgInJlcGxh
Y2VzIi4KKyIiIgorCitpbXBvcnQgYXJncGFyc2UKK2ltcG9ydCBqc29uCitpbXBvcnQgc3VicHJv
Y2VzcworaW1wb3J0IHN5cworaW1wb3J0IHVybGxpYi5wYXJzZQorCisKK2RlZiBwdXJsKHBhdGgs
IHZlcnNpb24pOgorICAgIHNlZ21lbnRzID0gW3VybGxpYi5wYXJzZS5xdW90ZShzLCBzYWZlPSIi
KSBmb3IgcyBpbiBwYXRoLnNwbGl0KCIvIildCisgICAgcmV0dXJuIGYicGtnOmdvbGFuZy97Jy8n
LmpvaW4oc2VnbWVudHMpfUB7dXJsbGliLnBhcnNlLnF1b3RlKHZlcnNpb24sIHNhZmU9JycpfSIK
KworCitkZWYgaXNfbG9jYWwocGF0aCk6CisgICAgcmV0dXJuIHBhdGguc3RhcnRzd2l0aCgoIi4v
IiwgIi4uLyIsICIvIikpCisKKworZGVmIG1vZHVsZShwYXRoLCB2ZXJzaW9uKToKKyAgICByZXR1
cm4geyJuYW1lIjogcGF0aCwgInZlcnNpb24iOiB2ZXJzaW9uLCAicHVybCI6IHB1cmwocGF0aCwg
dmVyc2lvbil9CisKKworZGVmIGJpbmFyeV9kZXBzKGdvLCBiaW5hcnkpOgorICAgIG91dCA9IHN1
YnByb2Nlc3MucnVuKFtnbywgInZlcnNpb24iLCAiLW0iLCAiLWpzb24iLCBiaW5hcnldLAorICAg
ICAgICAgICAgICAgICAgICAgICAgIGNoZWNrPVRydWUsIGNhcHR1cmVfb3V0cHV0PVRydWUsIHRl
eHQ9VHJ1ZSkuc3Rkb3V0CisgICAgcmV0dXJuIGpzb24ubG9hZHMob3V0KS5nZXQoIkRlcHMiKSBv
ciBbXQorCisKK2RlZiBtYWluKCk6CisgICAgcGFyc2VyID0gYXJncGFyc2UuQXJndW1lbnRQYXJz
ZXIoZGVzY3JpcHRpb249X19kb2NfXywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBmb3JtYXR0ZXJfY2xhc3M9YXJncGFyc2UuUmF3RGVzY3JpcHRpb25IZWxwRm9ybWF0dGVy
KQorICAgIHBhcnNlci5hZGRfYXJndW1lbnQoIi0tZ28iLCByZXF1aXJlZD1UcnVlLCBoZWxwPSJQ
YXRoIHRvIHRoZSBnbyB0b29sIikKKyAgICBwYXJzZXIuYWRkX2FyZ3VtZW50KCItbyIsICItLW91
dHB1dCIsIHJlcXVpcmVkPVRydWUsIGhlbHA9Ik91dHB1dCBKU09OIGZpbGUiKQorICAgIHBhcnNl
ci5hZGRfYXJndW1lbnQoImJpbmFyaWVzIiwgbmFyZ3M9IioiLCBoZWxwPSJHbyBiaW5hcmllcyB0
byBpbnNwZWN0IikKKyAgICBhcmdzID0gcGFyc2VyLnBhcnNlX2FyZ3MoKQorCisgICAgbW9kdWxl
cyA9IHt9CisgICAgZm9yIGJpbmFyeSBpbiBhcmdzLmJpbmFyaWVzOgorICAgICAgICBmb3IgZGVw
IGluIGJpbmFyeV9kZXBzKGFyZ3MuZ28sIGJpbmFyeSk6CisgICAgICAgICAgICByZXBsID0gZGVw
LmdldCgiUmVwbGFjZSIpCisgICAgICAgICAgICBpZiByZXBsOgorICAgICAgICAgICAgICAgIGlm
IGlzX2xvY2FsKHJlcGxbIlBhdGgiXSk6CisgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlCisg
ICAgICAgICAgICAgICAgZW50cnkgPSBtb2R1bGUocmVwbFsiUGF0aCJdLCByZXBsWyJWZXJzaW9u
Il0pCisgICAgICAgICAgICAgICAgZW50cnlbInJlcGxhY2VzIl0gPSBtb2R1bGUoZGVwWyJQYXRo
Il0sIGRlcFsiVmVyc2lvbiJdKQorICAgICAgICAgICAgZWxzZToKKyAgICAgICAgICAgICAgICBl
bnRyeSA9IG1vZHVsZShkZXBbIlBhdGgiXSwgZGVwWyJWZXJzaW9uIl0pCisgICAgICAgICAgICBt
b2R1bGVzW2VudHJ5WyJwdXJsIl1dID0gZW50cnkKKworICAgIHdpdGggb3BlbihhcmdzLm91dHB1
dCwgInciKSBhcyBmOgorICAgICAgICBqc29uLmR1bXAoW21vZHVsZXNba10gZm9yIGsgaW4gc29y
dGVkKG1vZHVsZXMpXSwgZiwgc2VwYXJhdG9ycz0oIiwiLCAiOiIpKQorICAgICAgICBmLndyaXRl
KCJcbiIpCisKKworaWYgX19uYW1lX18gPT0gIl9fbWFpbl9fIjoKKyAgICBzeXMuZXhpdChtYWlu
KCkpCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
