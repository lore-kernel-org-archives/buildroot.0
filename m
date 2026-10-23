Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A0E606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 14:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OIkWWS3o
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3DB44099A;
	Fri, 23 Oct 2026 14:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id miboh8okD8ay; Fri, 23 Oct 2026 14:36:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E923E4089A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792766212;
	b=HQydZ0qXAXBBocZYa34LyZua2iDwaBkv44BFxeqNCVxPvwza4Ao8j7mqTjkJjD7MmOMG
	 GdmbR3HcjtI4FQDBRkSgdvEhF1COO9JeCKbGAOjxcLhmCmU9c9hoIg+ZZPe/B957K0hvf
	 t1QSMf/XM5+rByM2nl3K9Q/otAZT1lRC5f/9IEBTOz6ZT4M2TUyS/1eANcGlua8sd5dCg
	 7sBZlJUGhbBrvMPhtZukebbvvLJcvYLMbdZMFswlIfpijgTyz0sGdiM66SI42iW3b1gs7
	 rFhWOojWpnSNkD70HlWB902PhwuKAENKdn3gQx6aDnPTmkK6/s1Fl0UOivquxZS/8xQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792766212;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SjWRFsFtltcHVG/AsRXIljbi6+XRk154LmxLR2dIvmc=;
	b=f9Rc0R6PjrP/sQFxWdYGZ3l8KaBIj18LRw4TXPO4dI1LR06v+Om+LcVr2z3nc6r1asH0
	 k5es310yrZrwjQKJeV7GfwCWqAfjcrQkHCkFa3Kll+Y8MJPwaF+cPSnfA1wsjGFe8n7te
	 ywRhGsd8Ask9Hi/BWd/lgtWOTQFPcZ8dvDFvNU2/0dshTFbFsIMEagI1645Ujzd19dc3S
	 kQTAVkyH8Ht/XOSdabLS7pR9y/z+WuDDtxHjBnhNu0C+JL+EyrHLAV73D2UhqBCvqmRib
	 mhN6zBlbIDkM8H8ynW4k3Id5xw6pRGczC+AkQesY96ocKRd/3x69dIvMNs5f+unbypA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792766212;
	bh=SjWRFsFtltcHVG/AsRXIljbi6+XRk154LmxLR2dIvmc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=OIkWWS3oYM+DFuesuSfL7K+rvs/XfkI2VjvvjO+zTZaE71trThmTnY34QtQ8HrP7+
	 nq3D7NpV8ELgGltMwPkU3ITEqyQcf5IIRxHBUg2LqekOK+9vd1wn7/JVBjZxPLqnyb
	 xiKT6jMj/mPtwGWi1sbTdMwTSK2o2OiIr8z1xRHibDJd7GseCm4tGSJf9ACGm7N0Er
	 zEwQ4jYT1TlIfVGRsApUAxa3HaTwlDCL9D3xr38a3PHbY11s0StJJi9Y8sIwuUvkrB
	 TgP9RqtBANtZ18eJyrhlXJuBjtLjvUup72iWq7+pGiQ0ZFFz5X2aRiwMoSSyD555eG
	 3krd2CA4C3BDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E923E4089A;
	Fri, 23 Oct 2026 14:36:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 379473C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D7664089A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSM30VTMzAFL for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 14:36:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E86904085C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792766209;
 b=BcLC/nhBlX5HtevNfR24Wrh3NA5Zd5+h6zK9toAlmU0SGycBnkZOlT9hD/fl77BdCiAq
 skTy+qKJ+2gocpSp3k5l/7uKXQp8uFKTdxhj9tFuG6U5APeZluGfyIA2cWIAEQviJHeVZ
 kYzu/Rfhf7qBeJi99Mjb2yL/euqDoUCch7WhekrqSBXBnGa9DMeEL657D+VE2CUKBv425
 aZREhSUf/kZWLqpnMjcIPHYPl4PYL/uOehHogLL992RSoNOJJwt3O3udWt3VWRvrp63zj
 0Na2imUSqUP8WT8G18pSWdZUz03h8QMl4a6JNTbMKSb5crl4qGtxbb2Ub7vIyUm9iVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792766209;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=bw0urD6fJnYN9OkCULIthswPHutXYHZBg4jxmfX93vQ=;
 b=Qqsq3EoHOKnRenkanNqmR/5AUyw3+RUYHyelEHY5xMQbvma9PjDePtIf3x7Azqpexx5n
 YQYEw+XOMoBxa5kTGPl9Lrx7EdJHtnjKf7ylS+UlQ9ARqS6k9YxiPoDAhYw1tMdDV/urF
 qasoSZ3LueEyMUuzIUVVKMye8VttcM+zl4sklU8gXtx7ds1+zgS7ugVEzFgqfQQhzadTy
 IBKLEhSZi3oZu1rj/5COMtoYRaYp4rjMKI2oaW1aCx7Bm23e4CT3mkaJv5GKa/ITctmy6
 KBvaT9C4ZwffD/YYxzqw8SY0AnFNAwpuufBjX6Yj+g7Q9o3jDYKNXK8bNfaE6QwlZsw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EXc2Mgkk; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E86904085C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:36:47 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso9250865e9.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792766205; x=1793371005;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=bw0urD6fJnYN9OkCULIthswPHutXYHZBg4jxmfX93vQ=;
 b=l4njL2nxQ44LEy63RZV6PH1m0S2DxWt3z0cjMyHj+e5Q9n/fChNt6StEKTBLZaNGy/
 aLPs/n5nWxN4PhpQP+OaWj4YGdYK84bu5tTWD/YQI2dIobFaopz4MU2Kyj6MPYIbGnVm
 MkH/nWuogpCupkROMU0749et24YysQgWBpJXhzt3RACu+3HSAc5oo8PdufjwgbAgTXJ/
 9AbOZm3JD9wtfIeKlXS5cZRjwRPLM5XIH41skAd5f/629yTZQlDoQwFE2CCnn+fxoqjk
 kG5owY1QB7a5ypk9MrBmzKSm7KE7MjjeU0wbAl+v1uKvcHgOEv3uBNC2AtN/V5bK5Ycs
 7t+Q==
X-Gm-Message-State: AFq9FYLHuX6NTFZ8pBKmYtCkyo272u925sQ3ZpiAolPxsPw2eCKuws1A
 B+IdvmOXxSmf9/YWdBMEUnCHT1/DpriANFWnSedfsnqLYCScPNuLl/gbr0H++vkt0k52EKUMT5j
 s34TCA2w=
X-Gm-Gg: AYBFou2KIiEUkusxhRwQbqihLs9ccdGCKUcMWga/E1UpxnUXgAqyUOMYRXJscYWFTjt
 JKbmEcEBgNFdtwzP2OTLECVCTpYIcgNVL+/u2Gi94L/Y7mOpnY7EKijIquJeugdW3FbRA26p4VX
 WaBo3veo/8weHWQsNjY4c8ujwZSPXhx5FVp74eBZpu6BbayCmdQC5u6liZYIXyISe9ffDqTLWFR
 QDKc7Y0eFXX21yD3hNt0JJJN79Ndg24y2V+mhi3pAjqIg3vediGBOSVfUFs3Fj+kGewQotqtC2n
 I2vb6f6optSkC2wSKpKBvYAmbO+/lj/g4OA9mg13AtK43v+mBXeG0JxmwKK5x4MwpPHi4P8aKQ1
 zTCcvBDiIci6fWZoPzSXlorGDPvTErSWv2gc9OeXaCBunyjH/pnyEBadJutd7wB5gVsxMqaVIbl
 5i5PGAwjXpPKFto7rh5xZ9Wm49rODnvUqWgqhn4Z/swbPthpFrfsW+w/4S5K4nCzBPZNMPOaen1
 jtIsD8z/Y/M8CMtgUVbKI1WdbXuFxIqpV6S45z8vFm3ssMCKGWglMtI0A==
X-Received: by 2002:a05:600c:3145:b0:4a2:fd2:9855 with SMTP id
 5b1f17b1804b1-4a211caf0femr39606125e9.13.1792766205572; 
 Fri, 23 Oct 2026 07:36:45 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a29cdbd2f2sm8933385e9.11.2026.10.23.07.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 07:36:45 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 16:36:37 +0200
Message-ID: <20261023143640.1742726-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: security bump to
 version 1.43.118
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Q29tbWl0IDBhNmM3YjZiM2U3OTRlODY1MTkzZGVlMjNjNjhhZGZhZGI2YjljMDQsIGF2YWlsYWJs
ZSBmcm9tCnZlcnNpb24gMS40My4xMTcgb253YXJkIChzZWUgWzFdKSwgYmxhY2tsaXN0cyB0aGUg
cm9vdHMgdGhhdCBzaWduZWQKdGhlIGNvbXByb21pc2VkIGVNdWRocmEgaW50ZXJtZWRpYXRlIENB
cyAoWzJdKS4KClsxXTogaHR0cHM6Ly9naXRodWIuY29tL2JvdG8vYm90b2NvcmUvY29tbWl0LzBh
NmM3YjZiM2U3OTRlODY1MTkzZGVlMjNjNjhhZGZhZGI2YjljMDQKWzJdOiBodHRwczovL2VtdWRo
cmEud2UtaGF2ZS1hLXByb2JsZW0uY29tLwoKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90
dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIHBhY2thZ2UvcHl0aG9uLWJvdG9jb3Jl
L3B5dGhvbi1ib3RvY29yZS5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9w
eXRob24tYm90b2NvcmUubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tYm90b2Nv
cmUvcHl0aG9uLWJvdG9jb3JlLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9weXRob24t
Ym90b2NvcmUuaGFzaAppbmRleCAyZjI5OGJjZDU0Li40MTY1ZDRjZmRlIDEwMDY0NAotLS0gYS9w
YWNrYWdlL3B5dGhvbi1ib3RvY29yZS9weXRob24tYm90b2NvcmUuaGFzaAorKysgYi9wYWNrYWdl
L3B5dGhvbi1ib3RvY29yZS9weXRob24tYm90b2NvcmUuaGFzaApAQCAtMSw2ICsxLDYgQEAKICMg
bWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvYm90b2NvcmUvanNvbgotbWQ1
ICAyZTIyM2NiYTliODYyNzA0OGE4MGRlN2VhZTc3ZDVhYSAgYm90b2NvcmUtMS40My4xMTQudGFy
Lmd6Ci1zaGEyNTYgIGYzNjZmYTRkYjUxODc3NTYzMmFkMWViMTI4Y2Q4MjAzY2E0NjM5NmNlY2Yz
NzIwOWQ5MDRmMGJiYzA0OWNlOTAgIGJvdG9jb3JlLTEuNDMuMTE0LnRhci5negorbWQ1ICAzZDQ4
ZjQzZDE2YWU2NGVjOGFmNjY5YzM1ZjkzOGIyMCAgYm90b2NvcmUtMS40My4xMTgudGFyLmd6Citz
aGEyNTYgIDdmM2Y5ZDg4Y2M5ZTg0NzU4NzY5MGY4MmE0MmUzYzNjMjkyYzMwMjZjOTJjMWU2MGQ2
OGE5MzEwMDE4ZTAwM2YgIGJvdG9jb3JlLTEuNDMuMTE4LnRhci5negogIyBMb2NhbGx5IGNvbXB1
dGVkIHNoYTI1NiBjaGVja3N1bXMKIHNoYTI1NiAgMGQ1NDJlMGM4ODA0ZTM5YWE3ZjM3ZWIwMGRh
NWE3NjIxNDlkYzY4MmQ3ODI5NDUxMjg3ZTExYjkzOGU5NDU5NCAgTElDRU5TRS50eHQKIHNoYTI1
NiAgY2ZjNzc0OWI5NmY2M2JkMzFjM2M0MmI1YzQ3MWJmNzU2ODE0MDUzZTg0N2MxMGYzZWIwMDM0
MTdiYzUyM2QzMCAgdGVzdHMvdW5pdC9hdXRoL2F3czRfdGVzdHN1aXRlL0xJQ0VOU0UKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5tayBiL3BhY2th
Z2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5tawppbmRleCBlMDI5NTMyZjljLi4z
YWVlMmQ4ZjMwIDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9weXRob24tYm90
b2NvcmUubWsKKysrIGIvcGFja2FnZS9weXRob24tYm90b2NvcmUvcHl0aG9uLWJvdG9jb3JlLm1r
CkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUFlUSE9OX0JP
VE9DT1JFX1ZFUlNJT04gPSAxLjQzLjExNAorUFlUSE9OX0JPVE9DT1JFX1ZFUlNJT04gPSAxLjQz
LjExOAogUFlUSE9OX0JPVE9DT1JFX1NPVVJDRSA9IGJvdG9jb3JlLSQoUFlUSE9OX0JPVE9DT1JF
X1ZFUlNJT04pLnRhci5negotUFlUSE9OX0JPVE9DT1JFX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5
dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvY2UvYzgvYjUwODM1OWQxZjM4NDZhOTE4YzA2ODA3YTlh
ZTI3ZWVlMDYzZjkwNDU1OTI2OWU0MmNjZGU5ZGUwOWVhCitQWVRIT05fQk9UT0NPUkVfU0lURSA9
IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9kNC9iOC8zZTU1MTU0ZGRh
ZjFhNmQxZDRkZGRhODVjMGU1OTgzMjA1YTNiNzY1N2VkYWNkOGViYmE4YzZmZDc3NGMKIFBZVEhP
Tl9CT1RPQ09SRV9TRVRVUF9UWVBFID0gc2V0dXB0b29scwogUFlUSE9OX0JPVE9DT1JFX0xJQ0VO
U0UgPSBBcGFjaGUtMi4wCiBQWVRIT05fQk9UT0NPUkVfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0Uu
dHh0IHRlc3RzL3VuaXQvYXV0aC9hd3M0X3Rlc3RzdWl0ZS9MSUNFTlNFCi0tIAoyLjU0LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
