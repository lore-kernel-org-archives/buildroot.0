Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D375DC02198
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 22:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92D6B8115A;
	Mon, 10 Feb 2025 22:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2kSJLKQlkXH; Mon, 10 Feb 2025 22:15:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C17E81133
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C17E81133;
	Mon, 10 Feb 2025 22:15:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68FE0C2
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 22:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D6FB810E4
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 22:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OyRDaugFsA8M for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 22:15:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BAE9F810AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAE9F810AA
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BAE9F810AA
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 22:15:48 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38dcae0d6dcso2031989f8f.1
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 14:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225746; x=1739830546;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XeoFhePhhvBL87PnTdd1XJSKuDbRnytj/aflTOYlgEE=;
 b=Enwrop4iOaGb786ciDRFIfYwVLxedq4PpbCYV5ooPc7b7+StT8JM4YUMHHcegtgWky
 uUsXtH/++w4WNCbE9BvI005Xco9Ca8TrR1OkY8yeLBopfLXGUaWhflLaU3GCZNyy+GCj
 aGlgYkblR3Q7jZL6dl7jEturwNMhYMNVvpsW9oLXFkK77N9af0PeOxeLU1szF99tefXJ
 co7TPG+ciH7D1jkAjxZiAcreCXPv3OF6GHl1W27znZNqFp9gvAYWDlYrUGynGVdCee42
 TITq+QXrJicoT9z75/ZuwD5R0SbyGrzvm1OnFZfb1VK6qRfoBXDB38s9K8aDyDepnfcE
 BG+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvWThvj7LNgwkOc0PRVgOBpRUNNrQDrJ0v4Zg8td1OXFN7j3rmXaGNIQYd9pbdghY4TtAW+qoxqP4=@buildroot.org
X-Gm-Message-State: AOJu0YxivkGGTv8CH98Qsraxmah5ZIJDnTi4/y8W205ISWUEGww8riYE
 xDiXU46mDY8a3FRANenPtWb2xLLRfymSmZ7AkOV5OMHDy0sbzvrhczgb6Y0xvzWeLAl4cDPYDlx
 7
X-Gm-Gg: ASbGncuHmH1Ud+IFCLjxuDT817UuzPGCCpgwctp8e14AyhhEL917Zrwgdm2JdOc1LCq
 3J82ob/fSJQGpCIaXZ2+GQbhCm9TYKnE1jny1b4WFlLNYdLe40zAmdWd9chCDVLCYkSHz/wxto0
 V2ac2eSb/fB0lV0Wii/qb93ti7lLeouxz7ZrAYj7CORoAy3gsBT0XmPsT/fJ0CReDvdvgck0SCz
 wt3eX5jpMvm/HG0XHAveGjeYf/NomEfE4TFAerzP4Sv56qAoCtCBpa9l6uduMUHf2mu5EBkL/GX
 dF+rF+1t+kw8sWywVYz5Lr00WwzpBBUfJ/v6lBMLb6H7YeDja5XW7mkCXLZLuiQb4lkxDOfjNkz
 v6r4yReL5gel3uzMoMSFDszoDvGN+Gtb+xV29+c5J1o1rbByfymY=
X-Google-Smtp-Source: AGHT+IFoUUnJui9K4293Uzczt/K1SHfG8UnLfSyqKZmhOM2LHzj30yRiJ9c+flYdbuwmzOpQEC9HEQ==
X-Received: by 2002:a05:6000:1789:b0:38d:df83:7142 with SMTP id
 ffacd0b85a97d-38ddf8372d1mr4417246f8f.22.1739225746545; 
 Mon, 10 Feb 2025 14:15:46 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439447ee508sm43328105e9.6.2025.02.10.14.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:15:45 -0800 (PST)
Message-ID: <bf8691f7-1775-478e-8ca3-6b3b67c9821e@smile.fr>
Date: Mon, 10 Feb 2025 23:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
References: <20250210191802.426552-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20250210191802.426552-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739225746; x=1739830546; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XeoFhePhhvBL87PnTdd1XJSKuDbRnytj/aflTOYlgEE=;
 b=zAtnfHwLYeBpRJrzxti2Aiv4N0Um5m6kJzcpq6HUr6giyJkDJsDbKeLA2Jx4ZxvyRr
 gpB20MRz1x5C72L3yf3jNkn0/DULQs2/ZUaKpw33ITky9Ax60FR7dy65g5fNhr6192m6
 3Fx/Y2YBJA42VQOtFSj04MeZAGLAr1r7PPnRQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=zAtnfHwL
Subject: Re: [Buildroot] [PATCH 1/1] package/go/go-bin: re-introduce go-src
 hash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMTAvMDIvMjAyNSDDoCAyMDoxOCwgVGhvbWFzIFBlcmFsZSB2aWEg
YnVpbGRyb290IGEgw6ljcml0wqA6Cj4gVGhlIGNvbW1pdCBiNDAwNjI4N2Y4ICJwYWNrYWdlL2dv
OiBzZWN1cml0eSBidW1wIHRvIHZlcnNpb24gMS4yMy42Igo+IHJlbW92ZWQgdGhlIGdvIHNvdXJj
ZSBmcm9tIHRoZSBnby1iaW4gcGFja2FnZSBgLmhhc2hgIGZpbGUuCj4gU2luY2UgdGhhdCBjb21t
aXQsIGEgbnVtYmVyIG9mIGF1dG9idWlsZCBlcnJvcnMgZm9yIHRoZSBob3N0LWdvLWJpbgo+IHBh
Y2thZ2Ugc3RhcnRlZCBzcGF3bmluZyBkdXJpbmcgdGhlICdsZWdhbC1pbmZvJyBzdGVwLgo+IEJl
Y2F1c2UgdGhlIHBhY2thZ2UgJ2dvLWJpbicgZGVmaW5lcyB0aGUgJ19BQ1RVQUxfU09VUkNFX1RB
UkJBTEwnCj4gdmFyaWFibGUgdGhlIHNvdXJjZSBoYXNoIGlzIHN0aWxsIHJlcXVpcmVkIGZvciB0
aGUgbGVnYWwtaW5mby4KPiAKPiBTaW1pbGFybHkgdG8gdGhlICdub2RlanMnIHBhY2thZ2UsIHRo
ZSBoYXNoIGZpbGVzIGZvciBib3RoIHRoZSBgZ28tYmluYAo+IGFuZCBgZ28tc3JjYCBwYWNrYWdl
IGFyZSBzaGFyZWQgaW4gdGhlIGBwYWNrYWdlL2dvYCBkaXJlY3Rvcnkgd2l0aCB0aGUKPiBoZWxw
IG9mIGEgc3ltYm9saWMgbGluayB1c2VkIHRvIG1ha2UgdGhlIHN1YmRpcmVjdG9yaWVzIHBvaW50
IHRvIHRoYXQKPiBjb21tb24gYC5oYXNoYCBmaWxlLgoKTmljZSBjb21taXQgbG9nIQoKPiAKPiBG
aXhlczoKPiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMzM3LzMzNzYz
NDQxYTA2NWRkYjA3ZTk0NGUyNmFkOGYxZjZkNDNiNjg1OTIKPiAKPiBTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+CgpBcHBsaWVkIHRvIG1hc3Rlciwg
dGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+ICBwYWNrYWdlL2dvL2dvLWJp
bi9nby1iaW4uaGFzaCB8IDkgKy0tLS0tLS0tCj4gIHBhY2thZ2UvZ28vZ28tc3JjL2dvLXNyYy5o
YXNoIHwgNCArLS0tCj4gIHBhY2thZ2UvZ28vZ28uaGFzaCAgICAgICAgICAgIHwgOSArKysrKysr
KysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkK
PiAgbW9kZSBjaGFuZ2UgMTAwNjQ0ID0+IDEyMDAwMCBwYWNrYWdlL2dvL2dvLWJpbi9nby1iaW4u
aGFzaAo+ICBtb2RlIGNoYW5nZSAxMDA2NDQgPT4gMTIwMDAwIHBhY2thZ2UvZ28vZ28tc3JjL2dv
LXNyYy5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2dvL2dvLmhhc2gKPiAKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9nby9nby1iaW4vZ28tYmluLmhhc2ggYi9wYWNrYWdlL2dvL2dv
LWJpbi9nby1iaW4uaGFzaAo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDUwZDJi
ZTIzOWYuLjAwMDAwMDAwMDAKPiAtLS0gYS9wYWNrYWdlL2dvL2dvLWJpbi9nby1iaW4uaGFzaAo+
ICsrKyAvZGV2L251bGwKPiBAQCAtMSw4ICswLDAgQEAKPiAtIyBzaGEyNTYgY2hlY2tzdW0gZnJv
bSBodHRwczovL2dvLmRldi9kbC8KPiAtc2hhMjU2ICBlNjFmODc2OTMxNjljMGJiY2M0MzM2MzEy
OGYxZTkyOWI5ZGZmMGI3ZjQ0ODU3M2YxYmRkNGU0YTBiOTY4N2JhICBnbzEuMjMuNi5saW51eC0z
ODYudGFyLmd6Cj4gLXNoYTI1NiAgOTM3OTQ0MWVhMzEwZGUwMDBmMzNhNGRjNzY3YmQ5NjZlNzJh
YjI4MjYyNzBlMDM4ZTc4YjJjNTNjMmU3ODAyZCAgZ28xLjIzLjYubGludXgtYW1kNjQudGFyLmd6
Cj4gLXNoYTI1NiAgNTYxYzc4MGU4ZjRhODk1NWQzMmJmNzJlNDZhZjBiNWVlNWUwZGViZTFlNDYz
M2RmOWEwMzc4MTg3ODIxOTIwMiAgZ28xLjIzLjYubGludXgtYXJtNjQudGFyLmd6Cj4gLXNoYTI1
NiAgMjdhNDYxMTAxMGMxNmI4YzRmMzdhZGUzYWFkYTU1YmQ1NzgxOTk4ZjAyZjM0OGIxNjQzMDJm
ZDVlZWE0ZWI3NCAgZ28xLjIzLjYubGludXgtYXJtdjZsLnRhci5nego+IC1zaGEyNTYgIDBmODE3
MjAxZTgzZDc4ZGRiZmEyN2Y1Zjc4ZDliNzI0NTBiOTJjYzIxZDVlMDQ1MTQ1ZWZhY2QwZDMyNDRh
OTkgIGdvMS4yMy42LmxpbnV4LXBwYzY0bGUudGFyLmd6Cj4gLXNoYTI1NiAgMzIxZTdlZDBkNTQx
NmY3MzE0NzljNTJmYTc2MTBiNTJiODA3OWE4MDYxOTY3YmQ0OGNlYzZkNjZmNjcxYTYwZSAgZ28x
LjIzLjYubGludXgtczM5MHgudGFyLmd6Cj4gLXNoYTI1NiAgMmQzNjU5N2Y3MTE3YzM4YjAwNjgz
NWFlN2Y1Mzc0ODcyMDdkOGVjNDA3YWE5ZDk5ODA3OTRiMjAzMGNiYzA2NyAgTElDRU5TRQo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2dvL2dvLWJpbi9nby1iaW4uaGFzaCBiL3BhY2thZ2UvZ28vZ28t
YmluL2dvLWJpbi5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMjAwMDAKPiBpbmRleCAwMDAwMDAwMDAw
Li4wNTMxYTMyYzVjCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvZ28vZ28tYmluL2dv
LWJpbi5oYXNoCj4gQEAgLTAsMCArMSBAQAo+ICsuLi9nby5oYXNoCj4gXCBObyBuZXdsaW5lIGF0
IGVuZCBvZiBmaWxlCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ28vZ28tc3JjL2dvLXNyYy5oYXNo
IGIvcGFja2FnZS9nby9nby1zcmMvZ28tc3JjLmhhc2gKPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCBiNjA5OTVmZWRjLi4wMDAwMDAwMDAwCj4gLS0tIGEvcGFja2FnZS9nby9nby1z
cmMvZ28tc3JjLmhhc2gKPiArKysgL2Rldi9udWxsCj4gQEAgLTEsMyArMCwwIEBACj4gLSMgRnJv
bSBodHRwczovL2dvLmRldi9kbAo+IC1zaGEyNTYgIDAzOWM1YjA0ZTY1Mjc5ZGFjZWVlOGE2Zjcx
ZTcwYmQwNWNmNWI4MDE3ODJiNmY3N2M2ZTE5ZTJlZDA1MTEyMjIgIGdvMS4yMy42LnNyYy50YXIu
Z3oKPiAtc2hhMjU2ICAyZDM2NTk3ZjcxMTdjMzhiMDA2ODM1YWU3ZjUzNzQ4NzIwN2Q4ZWM0MDdh
YTlkOTk4MDc5NGIyMDMwY2JjMDY3ICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ28v
Z28tc3JjL2dvLXNyYy5oYXNoIGIvcGFja2FnZS9nby9nby1zcmMvZ28tc3JjLmhhc2gKPiBuZXcg
ZmlsZSBtb2RlIDEyMDAwMAo+IGluZGV4IDAwMDAwMDAwMDAuLjA1MzFhMzJjNWMKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvcGFja2FnZS9nby9nby1zcmMvZ28tc3JjLmhhc2gKPiBAQCAtMCwwICsx
IEBACj4gKy4uL2dvLmhhc2gKPiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9nby9nby5oYXNoIGIvcGFja2FnZS9nby9nby5oYXNoCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5mZDJjZDcxYzU5Cj4gLS0tIC9kZXYvbnVs
bAo+ICsrKyBiL3BhY2thZ2UvZ28vZ28uaGFzaAo+IEBAIC0wLDAgKzEsOSBAQAo+ICsjIHNoYTI1
NiBjaGVja3N1bSBmcm9tIGh0dHBzOi8vZ28uZGV2L2RsLwo+ICtzaGEyNTYgIDAzOWM1YjA0ZTY1
Mjc5ZGFjZWVlOGE2ZjcxZTcwYmQwNWNmNWI4MDE3ODJiNmY3N2M2ZTE5ZTJlZDA1MTEyMjIgIGdv
MS4yMy42LnNyYy50YXIuZ3oKPiArc2hhMjU2ICBlNjFmODc2OTMxNjljMGJiY2M0MzM2MzEyOGYx
ZTkyOWI5ZGZmMGI3ZjQ0ODU3M2YxYmRkNGU0YTBiOTY4N2JhICBnbzEuMjMuNi5saW51eC0zODYu
dGFyLmd6Cj4gK3NoYTI1NiAgOTM3OTQ0MWVhMzEwZGUwMDBmMzNhNGRjNzY3YmQ5NjZlNzJhYjI4
MjYyNzBlMDM4ZTc4YjJjNTNjMmU3ODAyZCAgZ28xLjIzLjYubGludXgtYW1kNjQudGFyLmd6Cj4g
K3NoYTI1NiAgNTYxYzc4MGU4ZjRhODk1NWQzMmJmNzJlNDZhZjBiNWVlNWUwZGViZTFlNDYzM2Rm
OWEwMzc4MTg3ODIxOTIwMiAgZ28xLjIzLjYubGludXgtYXJtNjQudGFyLmd6Cj4gK3NoYTI1NiAg
MjdhNDYxMTAxMGMxNmI4YzRmMzdhZGUzYWFkYTU1YmQ1NzgxOTk4ZjAyZjM0OGIxNjQzMDJmZDVl
ZWE0ZWI3NCAgZ28xLjIzLjYubGludXgtYXJtdjZsLnRhci5nego+ICtzaGEyNTYgIDBmODE3MjAx
ZTgzZDc4ZGRiZmEyN2Y1Zjc4ZDliNzI0NTBiOTJjYzIxZDVlMDQ1MTQ1ZWZhY2QwZDMyNDRhOTkg
IGdvMS4yMy42LmxpbnV4LXBwYzY0bGUudGFyLmd6Cj4gK3NoYTI1NiAgMzIxZTdlZDBkNTQxNmY3
MzE0NzljNTJmYTc2MTBiNTJiODA3OWE4MDYxOTY3YmQ0OGNlYzZkNjZmNjcxYTYwZSAgZ28xLjIz
LjYubGludXgtczM5MHgudGFyLmd6Cj4gK3NoYTI1NiAgMmQzNjU5N2Y3MTE3YzM4YjAwNjgzNWFl
N2Y1Mzc0ODcyMDdkOGVjNDA3YWE5ZDk5ODA3OTRiMjAzMGNiYzA2NyAgTElDRU5TRQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
