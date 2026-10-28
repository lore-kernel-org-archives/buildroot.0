Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A27606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 10:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OXm6x+Kh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LjTcYnyr
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D45080F0C;
	Wed, 28 Oct 2026 10:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OoXUDfJvZQFf; Wed, 28 Oct 2026 10:33:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9D33780F76
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793183582;
	b=TjOewcxiXIjA5kNWmxvFMJpSCANrVzk/cVB1Js+cSgYCt7fB3Ye2TnYGm2FcTD2LjXOw
	 wVBEvIL2MQxRFN0qVWdvl3FvYxtl+0j/1eY13fhplwhdTReeQyo39YY2DyC/NJYDiQKXd
	 cd7M7c3y3xtp2wmwYclRWeZ4tVPQ+8ddO4POrDRLemTkpouSiFgUraYUCcuOnesr/TkeA
	 xbw7XJsqB1d4EODaNVx1DsAKHYzumNvMGkakMjxeJ5+YoI0ZpBYvpHqttCsWIeaWvbCKG
	 EzdoXxKt17HX/WTBRp2qYf2Vu8eJSflCmPI497FTmQHff0v/SReXpRltZhH+19iqlnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793183582;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Organization:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=n/DbKV7PyuDjvZthd8/jUTPC61vybUj9r5eQmFJM0lk=;
	b=Ycxzld1kX5UjJOv/+mnglRfvrUu7ZpY8aBNcK1EGHEr65Z/h7Gz2uuCMze4jWne7cJsb
	 l6/svqJoH+HgZO7MqDY9mQKJwT6wDK6VJJS0Ir6Wh9DWrOs1hQZbg1/Ro8HPwxI8CAXmt
	 0Wxbdhnx48iPHo+rhaIat3xB9q1rTzAMTJXGuks6S30x1cMhvtGe18ssQuJkMstIDHxOh
	 qFAuBQtVUk5lD/xA+H2bXqtJTomntjhl4uw2gCNqL+ZOsr2ZfiPoEn98gFKUR7+XvPdv8
	 l9gDJ2KsYkzSY7l78P4nXvcOPniGXziWSSP79dmjKsrf+qaZTcWODpn51af9r9QQDfg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LjTcYnyr;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793183582;
	bh=n/DbKV7PyuDjvZthd8/jUTPC61vybUj9r5eQmFJM0lk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OXm6x+KhxS6kxWph6ule2Mp/jcCLQm3GPzMmdBXYrDlzQtYntHRdQclg/Shv9cbMy
	 jSNuEQESo2RISVpeITSn1zKH5YBP8QQrax+89V4psllXEYVddYbTv5Pbp2EEMAF8tw
	 IroNvrYW6JVy96XS9K+FK+0DLKKAPZfmJwtDborDWFV40hfPe3L5V6eHFZmeoJ/7pa
	 LlDSMCfP9g4kRkWxYzivMpqmH99eVwKlifun9kh98slusRxXSOPHSSMRfOzI4lFOuC
	 CG5AcaM2Ndyr3ASJWPYktOT1sGoB4/iZvt91gorOfI0IhwUovBjjhLcuuF8UdE7Uk3
	 /wdXIkSXv7rpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D33780F76;
	Wed, 28 Oct 2026 10:33:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D1C31DE
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 10:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E73580E14
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 10:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Cdr5sPYVSwD for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 10:32:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9173680E33
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::633"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793183579;
 b=XIs7hE9RxP7Gb1BSSNuPJXZCpgFqsRv+3hbrvcnIoceXwShz0P2B9evll42PWGlode3J
 rlSktAk57pVLv1ZR+WXYlKb14jYzSapBv9Cp4+uvInlfLMvdhbrzkgC12Nf7U2zg6qA9s
 vtFb9wABG496OKMeKO6R08x9NU6gae7+8lhZ/ROR/7Ct3wCWlDzpW/pCDmBw9Bo7aw009
 MNHDH6H6Nb7csHowG5g1Z2b0NYBk3uIKekuoJ7H7bVwm43xXU15JKQBlAQFgh4y1uV6DJ
 14gV25YWvYeyiFOuvxnjKD3Z1knS7tvmeBnH3A/ijSzLXC5Q6AwqZPzigamtEx0X0Ag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793183579;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Organization:Content-Transfer-Encoding;
 bh=/uo9ORKi/19tgGCmBXtH1f3oEcAAKGHy89MIkKlZbnw=;
 b=sjwizT6VXS0mZp7yV8JxuQXV+WiBEoMfYxbdqJ8Xf0ZDqTVstiwjHskmnVI084tq2Wpy
 RGE2Neud2yhE0oW75rBt3wKe0S4krW79rq/tPkq4zyEtIDxd9t90VXJSpTvP1ypejacAQ
 v1cAHAmr3pXMvrVwFe2I3CRbwDaMqfOjTNG59v0hDRSzSndYUd8Z8zWZmhairRpyqX4oH
 Hfq9m4KQkrGDKrZs66KnLMJhNdqBmvufL3KbDUJeJMTdN2IYBFQVoCozviVqEyPzVJl0i
 8bpBXmM8Edrgg2wZn5Pxw56kmjq1w7ZmHunsZ3je1iiDSRCjrUdvU2Wreoe5SwB29yw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=LjTcYnyr; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::633"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=LjTcYnyr
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9173680E33
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 10:32:58 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c46822eefb6so94358266b.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 03:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793183576; x=1793788376; darn=buildroot.org;
 h=content-transfer-encoding:organization:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=/uo9ORKi/19tgGCmBXtH1f3oEcAAKGHy89MIkKlZbnw=;
 b=LjTcYnyr5g+WGMK2fAYdb+cB9w36tCkDxD22YyVXqfwXkHEV4FiCYVsntodsfdecR/
 KG8IsqxJJY1lAanbqeZG6hKFmmNOIkouWOHtsmXRfxKle1KFh7P9p3MFcyGLx9N50xnm
 iTKY5W7O2N9TkdLX+J+Jirht1DX2WFKSzM3ri//V7EfS4o3yDK765PlQpq30WYKSk8u6
 VklsYipw1n1KwM+gP+0giNkvSZHuTL/z5z2qgG/+5y+4SywbDaMf0gH9DUTIMcrQQpQ7
 w412XyJeiFjn3KTZjB+zTEFJsY4CsqBWAbJ1jN/oq0z1LJ0wPagewJ6a6UHXVLW1805N
 TUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793183576; x=1793788376;
 h=content-transfer-encoding:organization:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/uo9ORKi/19tgGCmBXtH1f3oEcAAKGHy89MIkKlZbnw=;
 b=iUHGvP3aZ7bTqduSOL7SwpaNG3Y+pSedXsCBVvzux7xfQIRx3suxM0PJAU06SVIlGa
 Oq6kA8UuJjHdLA/0ORO5rcrwqk3s2KAoJr/IZoPguLzcFrgsm3qJDvsxGaZGL6mhjE17
 Y7mLe6Glsq+5gySkFVQlYaw6yzQqzcO43BoXUVVAbPyNE3Auiz4Jvttrf2NRjUIC/y3V
 O5B8eoVs0bGKxurFNn7J8wozcN3u9d0enqn2ZE4+622gqhTNCXsh9eyio6wBpgxkSSg3
 fodmvLWysDKmIASTZ22WHwYnD3xkC16lBY/1p+32nn3JLnp7F472Gz7sK68XqS2zBVVV
 hG5Q==
X-Gm-Message-State: AFq9FYL42y7PF4uPCYeDcqtsA9KjC5tdRa1ihL+vd3icXD5zloeITbYu
 lQhv9vHlmt19ZPVFkaccMU4q+2kFezWhlbnyug86Dul+cp7mYb8bknMrkFIkHg==
X-Gm-Gg: AYBFou0TQ7jKlSH4Cfbj2D8Med1W+ZyilyjDNO5BaegLQicko3NagKe0rtI1pyhRYKf
 zzaWCCNLLG71TOYdAej9sup8GX5ngftSKDCszxseJZHwST2WlSeGSmbnibh0n0dek/Wii8AtU5Z
 i/R2FasZTrop7F25E/YW8GAnmmO8RJf4BnjZMQ4JHRdhvOIWzPfLVsPAUDIqHKwO2s/94BsF0we
 WfhySs4aqhY/UC6KK28iP+PYM7QbkRiRaTdaTzMwdE6pa6jMJYBGa5MgMEj0XJ7ROyRtcKF3kYR
 pr48c9L8wTTdGMF/qZHpZj1hx1HI3JWhC9I5OHnoJ95RAFYSL5OkH3eFcLanwQmQR1nAsj1Kq3i
 Kl4YtU3+VLBNMCzOOOVYpdL/MifbktBora064Ksyjnn8HIIt4TRikW/6CdOrrbgBrI6vkGW0RtH
 H+rP05EhZlRkc/QoAIwOxXAjQYGXat88WU40MIFpMNgM8oeon6un6NTYw33QyLrIw7MkQ1Sd7xE
 ipKSt2o8hjrRMOTxUF5aICmxPDj35uGHPgBZaEhz2jgRPB/WiRloq4S7IiT5qCcwi6SFE4IqgHc
 3LecT1muENAZRSCu5ogNldqtIar6xYZI4Wsxzfx09jjYU+HiLTCcHSESGe/wDev21TyFNKxFHA=
 =
X-Received: by 2002:a17:907:9490:b0:c3e:f39b:2298 with SMTP id
 a640c23a62f3a-c49bdf271bamr157409166b.16.1793183575834; 
 Wed, 28 Oct 2026 03:32:55 -0700 (PDT)
Received: from tollan.addiva.ad (h-212-116-93-252.A259.priv.bahnhof.se.
 [212.116.93.252]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd6573dfsm578711666b.52.2026.10.28.03.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 03:32:55 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Wed, 28 Oct 2026 11:32:47 +0100
Message-ID: <20261028103248.1317597-3-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028103248.1317597-1-lazzer@gmail.com>
References: <20261028103248.1317597-1-lazzer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH 2/3] utils/generate-cyclonedx: add vendored
 dependencies as nested components
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

QSBmb3JrIHN3YXBwZWQgaW4gYnkgYSByZXBsYWNlIGRpcmVjdGl2ZSBsaXN0cyB0aGUgb3JpZ2lu
YWwgbW9kdWxlIGFzCml0cyBhbmNlc3Rvciwgc28gc2Nhbm5lcnMgY2FuIHN0aWxsIG1hdGNoIGFk
dmlzb3JpZXMgZm9yIGl0LgoKU2lnbmVkLW9mZi1ieTogTWF0dGlhcyBXYWxzdHLDtm0gPGxhenpl
ckBnbWFpbC5jb20+Ci0tLQogLi4uL3Rlc3RzL3V0aWxzL3Rlc3RfZ2VuZXJhdGVfY3ljbG9uZWR4
LnB5ICAgIHwgNzYgKysrKysrKysrKysrKysrKysrKwogdXRpbHMvZ2VuZXJhdGUtY3ljbG9uZWR4
ICAgICAgICAgICAgICAgICAgICAgIHwgNTMgKysrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2Vk
LCAxMjcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvdXRpbHMvdGVzdF9nZW5lcmF0ZV9jeWNsb25lZHgucHkgYi9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvdXRpbHMvdGVzdF9nZW5lcmF0ZV9jeWNsb25lZHgucHkKaW5kZXggOTZi
NjhiZWI0MC4uMzdhMmMxYzY3MyAxMDA2NDQKLS0tIGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3V0
aWxzL3Rlc3RfZ2VuZXJhdGVfY3ljbG9uZWR4LnB5CisrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0
cy91dGlscy90ZXN0X2dlbmVyYXRlX2N5Y2xvbmVkeC5weQpAQCAtMTUwLDYgKzE1MCw4MiBAQCBj
bGFzcyBUZXN0R2VuZXJhdGVDeWNsb25lRFgodW5pdHRlc3QuVGVzdENhc2UpOgogICAgICAgICBm
b29fZGVwcyA9IG5leHQoZCBmb3IgZCBpbiByZXN1bHRbImRlcGVuZGVuY2llcyJdIGlmIGRbInJl
ZiJdID09ICJwYWNrYWdlLWZvbyIpCiAgICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwoZm9vX2RlcHNb
ImRlcGVuZHNPbiJdLCBbInBhY2thZ2UtYmFyIiwgInNrZWxldG9uLWJheiJdKQogCisgICAgZGVm
IHRlc3RfdmVuZG9yZWRfZGVwZW5kZW5jaWVzKHNlbGYpOgorICAgICAgICBpbmZvID0gc2VsZi5f
bWFrZV9zaG93X2luZm8oKQorICAgICAgICBpbmZvWyJwYWNrYWdlLWZvbyJdWyJ2ZW5kb3JlZF9k
ZXBlbmRlbmNpZXMiXSA9IFsKKyAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICAibmFtZSI6
ICJleGFtcGxlLm9yZy9saWIiLAorICAgICAgICAgICAgICAgICJ2ZXJzaW9uIjogInYxLjAuMCIs
CisgICAgICAgICAgICAgICAgInB1cmwiOiAicGtnOmdvbGFuZy9leGFtcGxlLm9yZy9saWJAdjEu
MC4wIiwKKyAgICAgICAgICAgIH0sCisgICAgICAgICAgICB7CisgICAgICAgICAgICAgICAgIm5h
bWUiOiAiZXhhbXBsZS5vcmcvZm9yayIsCisgICAgICAgICAgICAgICAgInZlcnNpb24iOiAidjEu
MS4wIiwKKyAgICAgICAgICAgICAgICAicHVybCI6ICJwa2c6Z29sYW5nL2V4YW1wbGUub3JnL2Zv
cmtAdjEuMS4wIiwKKyAgICAgICAgICAgICAgICAicmVwbGFjZXMiOiB7CisgICAgICAgICAgICAg
ICAgICAgICJuYW1lIjogImV4YW1wbGUub3JnL3Vwc3RyZWFtIiwKKyAgICAgICAgICAgICAgICAg
ICAgInZlcnNpb24iOiAidjEuMC4wIiwKKyAgICAgICAgICAgICAgICAgICAgInB1cmwiOiAicGtn
OmdvbGFuZy9leGFtcGxlLm9yZy91cHN0cmVhbUB2MS4wLjAiLAorICAgICAgICAgICAgICAgIH0s
CisgICAgICAgICAgICB9LAorICAgICAgICBdCisgICAgICAgIGluZm9bInBhY2thZ2UtYmFyIl1b
InZlbmRvcmVkX2RlcGVuZGVuY2llcyJdID0gWworICAgICAgICAgICAgeworICAgICAgICAgICAg
ICAgICJuYW1lIjogImV4YW1wbGUub3JnL2xpYiIsCisgICAgICAgICAgICAgICAgInZlcnNpb24i
OiAidjEuMC4wIiwKKyAgICAgICAgICAgICAgICAicHVybCI6ICJwa2c6Z29sYW5nL2V4YW1wbGUu
b3JnL2xpYkB2MS4wLjAiLAorICAgICAgICAgICAgfSwKKyAgICAgICAgXQorCisgICAgICAgIHJl
c3VsdCA9IHNlbGYuX3J1bl9zY3JpcHQoc2hvd19pbmZvPWluZm8pCisKKyAgICAgICAgZm9vID0g
c2VsZi5fZmluZF9jb21wb25lbnQocmVzdWx0LCAicGFja2FnZS1mb28iKQorICAgICAgICBzZWxm
LmFzc2VydEVxdWFsKAorICAgICAgICAgICAgZm9vWyJjb21wb25lbnRzIl0sCisgICAgICAgICAg
ICBbCisgICAgICAgICAgICAgICAgeworICAgICAgICAgICAgICAgICAgICAiYm9tLXJlZiI6ICJw
YWNrYWdlLWZvbzpwa2c6Z29sYW5nL2V4YW1wbGUub3JnL2xpYkB2MS4wLjAiLAorICAgICAgICAg
ICAgICAgICAgICAidHlwZSI6ICJsaWJyYXJ5IiwKKyAgICAgICAgICAgICAgICAgICAgIm5hbWUi
OiAiZXhhbXBsZS5vcmcvbGliIiwKKyAgICAgICAgICAgICAgICAgICAgInZlcnNpb24iOiAidjEu
MC4wIiwKKyAgICAgICAgICAgICAgICAgICAgInB1cmwiOiAicGtnOmdvbGFuZy9leGFtcGxlLm9y
Zy9saWJAdjEuMC4wIiwKKyAgICAgICAgICAgICAgICB9LAorICAgICAgICAgICAgICAgIHsKKyAg
ICAgICAgICAgICAgICAgICAgImJvbS1yZWYiOiAicGFja2FnZS1mb286cGtnOmdvbGFuZy9leGFt
cGxlLm9yZy9mb3JrQHYxLjEuMCIsCisgICAgICAgICAgICAgICAgICAgICJ0eXBlIjogImxpYnJh
cnkiLAorICAgICAgICAgICAgICAgICAgICAibmFtZSI6ICJleGFtcGxlLm9yZy9mb3JrIiwKKyAg
ICAgICAgICAgICAgICAgICAgInZlcnNpb24iOiAidjEuMS4wIiwKKyAgICAgICAgICAgICAgICAg
ICAgInB1cmwiOiAicGtnOmdvbGFuZy9leGFtcGxlLm9yZy9mb3JrQHYxLjEuMCIsCisgICAgICAg
ICAgICAgICAgICAgICJwZWRpZ3JlZSI6IHsKKyAgICAgICAgICAgICAgICAgICAgICAgICJhbmNl
c3RvcnMiOiBbCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgeworICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAidHlwZSI6ICJsaWJyYXJ5IiwKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIm5hbWUiOiAiZXhhbXBsZS5vcmcvdXBzdHJlYW0iLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAidmVyc2lvbiI6ICJ2MS4wLjAiLAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAicHVybCI6ICJwa2c6Z29sYW5nL2V4YW1wbGUub3JnL3Vwc3RyZWFt
QHYxLjAuMCIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgfSwKKyAgICAgICAgICAgICAg
ICAgICAgICAgIF0sCisgICAgICAgICAgICAgICAgICAgIH0sCisgICAgICAgICAgICAgICAgfSwK
KyAgICAgICAgICAgIF0sCisgICAgICAgICkKKworICAgICAgICBiYXIgPSBzZWxmLl9maW5kX2Nv
bXBvbmVudChyZXN1bHQsICJwYWNrYWdlLWJhciIpCisgICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwo
YmFyWyJjb21wb25lbnRzIl1bMF1bImJvbS1yZWYiXSwgInBhY2thZ2UtYmFyOnBrZzpnb2xhbmcv
ZXhhbXBsZS5vcmcvbGliQHYxLjAuMCIpCisKKyAgICAgICAgZm9vX2RlcHMgPSBuZXh0KGQgZm9y
IGQgaW4gcmVzdWx0WyJkZXBlbmRlbmNpZXMiXSBpZiBkWyJyZWYiXSA9PSAicGFja2FnZS1mb28i
KQorICAgICAgICBzZWxmLmFzc2VydEVxdWFsKAorICAgICAgICAgICAgZm9vX2RlcHNbImRlcGVu
ZHNPbiJdLAorICAgICAgICAgICAgWworICAgICAgICAgICAgICAgICJwYWNrYWdlLWJhciIsCisg
ICAgICAgICAgICAgICAgInBhY2thZ2UtZm9vOnBrZzpnb2xhbmcvZXhhbXBsZS5vcmcvZm9ya0B2
MS4xLjAiLAorICAgICAgICAgICAgICAgICJwYWNrYWdlLWZvbzpwa2c6Z29sYW5nL2V4YW1wbGUu
b3JnL2xpYkB2MS4wLjAiLAorICAgICAgICAgICAgICAgICJza2VsZXRvbi1iYXoiLAorICAgICAg
ICAgICAgXSwKKyAgICAgICAgKQorCisgICAgICAgIHNlbGYuYXNzZXJ0Tm90SW4oImNvbXBvbmVu
dHMiLCBzZWxmLl9maW5kX2NvbXBvbmVudChyZXN1bHQsICJza2VsZXRvbi1iYXoiKSkKKwogICAg
IGRlZiB0ZXN0X2V4dGVybmFsX3JlZmVyZW5jZXMoc2VsZik6CiAgICAgICAgIGluZm8gPSBzZWxm
Ll9tYWtlX3Nob3dfaW5mbygpCiAgICAgICAgIGluZm9bInBhY2thZ2UtZm9vIl1bImRvd25sb2Fk
cyJdID0gWwpkaWZmIC0tZ2l0IGEvdXRpbHMvZ2VuZXJhdGUtY3ljbG9uZWR4IGIvdXRpbHMvZ2Vu
ZXJhdGUtY3ljbG9uZWR4CmluZGV4IGE3OWNhNDFmZTEuLmQ4NWFlYzU5NzMgMTAwNzU1Ci0tLSBh
L3V0aWxzL2dlbmVyYXRlLWN5Y2xvbmVkeAorKysgYi91dGlscy9nZW5lcmF0ZS1jeWNsb25lZHgK
QEAgLTQwNSw2ICs0MDUsNyBAQCBkZWYgY3ljbG9uZWR4X2NvbXBvbmVudChuYW1lLCBjb21wKToK
ICAgICAgICAgfSBpZiAiY3BlLWlkIiBpbiBjb21wIGVsc2Uge30pLAogICAgICAgICAqKmN5Y2xv
bmVkeF9leHRlcm5hbF9yZWZzKGNvbXApLAogICAgICAgICAqKihjeWNsb25lZHhfcGF0Y2hlcyhu
YW1lLCBjb21wWyJwYXRjaGVzIl0pIGlmIGNvbXAuZ2V0KCJwYXRjaGVzIikgZWxzZSB7fSksCisg
ICAgICAgICoqKGN5Y2xvbmVkeF92ZW5kb3JlZChuYW1lLCBjb21wWyJ2ZW5kb3JlZF9kZXBlbmRl
bmNpZXMiXSkgaWYgY29tcC5nZXQoInZlbmRvcmVkX2RlcGVuZGVuY2llcyIpIGVsc2Uge30pLAog
ICAgICAgICAicHJvcGVydGllcyI6IFt7CiAgICAgICAgICAgICAibmFtZSI6ICJCUl9UWVBFIiwK
ICAgICAgICAgICAgICJ2YWx1ZSI6IGNvbXBbInR5cGUiXSwKQEAgLTQxMiw2ICs0MTMsNTMgQEAg
ZGVmIGN5Y2xvbmVkeF9jb21wb25lbnQobmFtZSwgY29tcCk6CiAgICAgfQogCiAKK2RlZiB2ZW5k
b3JlZF9yZWYobmFtZSwgZGVwKToKKyAgICAiIiJSZXR1cm4gdGhlIGJvbS1yZWYgb2YgYSBkZXBl
bmRlbmN5IHZlbmRvcmVkIGludG8gYSBwYWNrYWdlLgorCisgICAgQXJnczoKKyAgICAgICAgbmFt
ZSAoc3RyKTogS2V5IHVzZWQgZm9yIHRoZSBwYWNrYWdlIGluIHRoZSBzaG93LWluZm8gb3V0cHV0
LgorICAgICAgICBkZXAgKGRpY3QpOiBWZW5kb3JlZCBkZXBlbmRlbmN5IGZyb20gdGhlIHNob3ct
aW5mbyBvdXRwdXQuCisKKyAgICBSZXR1cm5zOgorICAgICAgICBzdHI6IGJvbS1yZWYsIHVuaXF1
ZSBldmVuIHdoZW4gc2V2ZXJhbCBwYWNrYWdlcyB2ZW5kb3IgdGhlIHNhbWUgZGVwZW5kZW5jeS4K
KyAgICAiIiIKKyAgICByZXR1cm4gZiJ7bmFtZX06e2RlcFsncHVybCddfSIKKworCitkZWYgY3lj
bG9uZWR4X3ZlbmRvcmVkKG5hbWUsIGRlcHMpOgorICAgICIiIlRyYW5zbGF0ZSB0aGUgdmVuZG9y
ZWQgZGVwZW5kZW5jaWVzIG9mIGEgcGFja2FnZSB0byBuZXN0ZWQgQ3ljbG9uZURYIGNvbXBvbmVu
dHMuCisKKyAgICBBIGRlcGVuZGVuY3kgc3dhcHBlZCBpbiBmb3IgYW5vdGhlciBvbmUsIGUuZy4g
YSBmb3JrIHRocm91Z2ggYSBHbworICAgIHJlcGxhY2UgZGlyZWN0aXZlLCBsaXN0cyB0aGUgb3Jp
Z2luYWwgYXMgaXRzIGFuY2VzdG9yLgorCisgICAgQXJnczoKKyAgICAgICAgbmFtZSAoc3RyKTog
S2V5IHVzZWQgZm9yIHRoZSBwYWNrYWdlIGluIHRoZSBzaG93LWluZm8gb3V0cHV0LgorICAgICAg
ICBkZXBzIChsaXN0KTogVmVuZG9yZWQgZGVwZW5kZW5jaWVzIGZyb20gdGhlIHNob3ctaW5mbyBv
dXRwdXQuCisKKyAgICBSZXR1cm5zOgorICAgICAgICBkaWN0OiBOZXN0ZWQgY29tcG9uZW50cyBp
biBDeWNsb25lRFggZm9ybWF0LgorICAgICIiIgorICAgIGRlZiBjb21wb25lbnQoZGVwKToKKyAg
ICAgICAgcmV0dXJuIHsKKyAgICAgICAgICAgICJ0eXBlIjogImxpYnJhcnkiLAorICAgICAgICAg
ICAgIm5hbWUiOiBkZXBbIm5hbWUiXSwKKyAgICAgICAgICAgICJ2ZXJzaW9uIjogZGVwWyJ2ZXJz
aW9uIl0sCisgICAgICAgICAgICAicHVybCI6IGRlcFsicHVybCJdLAorICAgICAgICB9CisKKyAg
ICByZXR1cm4geworICAgICAgICAiY29tcG9uZW50cyI6IFt7CisgICAgICAgICAgICAiYm9tLXJl
ZiI6IHZlbmRvcmVkX3JlZihuYW1lLCBkZXApLAorICAgICAgICAgICAgKipjb21wb25lbnQoZGVw
KSwKKyAgICAgICAgICAgICoqKHsKKyAgICAgICAgICAgICAgICAicGVkaWdyZWUiOiB7CisgICAg
ICAgICAgICAgICAgICAgICJhbmNlc3RvcnMiOiBbY29tcG9uZW50KGRlcFsicmVwbGFjZXMiXSld
LAorICAgICAgICAgICAgICAgIH0sCisgICAgICAgICAgICB9IGlmICJyZXBsYWNlcyIgaW4gZGVw
IGVsc2Uge30pLAorICAgICAgICB9IGZvciBkZXAgaW4gZGVwc10sCisgICAgfQorCisKIGRlZiBj
eWNsb25lZHhfZGVwZW5kZW5jeShyZWYsIGRlcGVuZHMpOgogICAgICIiIkNyZWF0ZSBKU09OIGZv
ciBkZXBlbmRlbmN5IHJlbGF0aW9uc2hpcHMgYmV0d2VlbiBjb21wb25lbnRzLgogCkBAIC02MDAs
OCArNjQ4LDkgQEAgZGVmIG1haW4oKToKICAgICAgICAgXSwKICAgICAgICAgImRlcGVuZGVuY2ll
cyI6IFsKICAgICAgICAgICAgIGN5Y2xvbmVkeF9kZXBlbmRlbmN5KGFyZ3MucHJvamVjdF9uYW1l
LCBicjJfcm9vdF9kZXBzKGZpbHRlcmVkX3Nob3dfaW5mb19kaWN0LCBhcmdzLnZpcnR1YWwpKSwK
LSAgICAgICAgICAgICpbY3ljbG9uZWR4X2RlcGVuZGVuY3kocmVmLCBicjJfcGFyc2VfZGVwcyhy
ZWYsIHNob3dfaW5mb19kaWN0LCBhcmdzLnZpcnR1YWwpKQotICAgICAgICAgICAgICBmb3IgcmVm
IGluIGZpbHRlcmVkX3Nob3dfaW5mb19kaWN0XSwKKyAgICAgICAgICAgICpbY3ljbG9uZWR4X2Rl
cGVuZGVuY3kocmVmLCBicjJfcGFyc2VfZGVwcyhyZWYsIHNob3dfaW5mb19kaWN0LCBhcmdzLnZp
cnR1YWwpICsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW3ZlbmRvcmVkX3Jl
ZihyZWYsIGRlcCkgZm9yIGRlcCBpbiBjb21wLmdldCgidmVuZG9yZWRfZGVwZW5kZW5jaWVzIiwg
W10pXSkKKyAgICAgICAgICAgICAgZm9yIHJlZiwgY29tcCBpbiBmaWx0ZXJlZF9zaG93X2luZm9f
ZGljdC5pdGVtcygpXSwKICAgICAgICAgXSwKICAgICAgICAgInZ1bG5lcmFiaWxpdGllcyI6IGN5
Y2xvbmVkeF92dWxuZXJhYmlsaXRpZXMoc2hvd19pbmZvX2RpY3QpLAogICAgIH0KLS0gCjIuNDMu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
