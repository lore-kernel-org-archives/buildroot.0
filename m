Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8097C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 23:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B5504174A;
	Tue,  6 Feb 2024 23:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zRL_2PrbifEd; Tue,  6 Feb 2024 23:13:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7473941753
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7473941753;
	Tue,  6 Feb 2024 23:13:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B390A1BF3D9
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 23:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAAB74032A
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 23:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ymEofYIrnQPD for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 23:13:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D180F4031D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D180F4031D
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D180F4031D
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 23:13:41 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-558f523c072so5811a12.2
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 15:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707261220; x=1707866020;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ITO5PL0wkqFWRoJT7obHHCZFqr0k6J/QAMKBwiYtjM0=;
 b=XJkzzOwgsnev/uoA9li8xs+pDxaLbMsL3UR37YnnLduk8XY4dzgkmXF5hHjw96Mikx
 bvDfRdQRr/UuXDZdpOr0oWsQdrM+aIZlW9WruibR3H9O42Q/Mpa9PQ5la30D2HvWdQBY
 nNgkORbwcbqcm+l9wczHL+q1/N0DdzQmTTKHKrp6xwLcJ+38klKGq0hfzqMRKxgGnJQA
 +yC+L37SgCGeZA9G4CNU1lUjfGQsyR3d01nfunYM2tcvSMT3qjnPPADLOzU2tFGCV3Aa
 kFZc1H0gAKAc/KcnaqJQYiBcQ1gOqxUfI2gqtORMiCVehjYu4quU5k1aZgFwLtp225nJ
 /0zA==
X-Gm-Message-State: AOJu0Yyt2NsotASJy0QxzgGBzt3rk66hT7RLEVLc4o7XTvMn/r8/3OuT
 Qh3goN4LsL9t+7DD6FOYIVdrO3kQBgNJLeJ/ByPgfUB3lzpjyGioAHJhUCc+3Fw=
X-Google-Smtp-Source: AGHT+IGpb96xI75Hux9ZPH9c7jZe1Gmedvqh88gDqezKih/myw1xj9yGkwZclbhV0cnaCkKAVCPDjg==
X-Received: by 2002:a17:906:7c50:b0:a37:17f9:42ad with SMTP id
 g16-20020a1709067c5000b00a3717f942admr2806348ejp.5.1707261219881; 
 Tue, 06 Feb 2024 15:13:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUB7BNyE3a9phhPQegwU7NiWnOzBIj2byHd0fxsy6IBw/E974Al1j9kzs/xYUrhoSbdencYsS2DZkbkc37jekDKHBF5PtrDxw==
Received: from [192.168.101.106]
 (i19-lef01-t2-89-85-255-235.ft.lns.abo.bbox.fr. [89.85.255.235])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709065f9500b00a385832f8d8sm59452eju.128.2024.02.06.15.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 15:13:39 -0800 (PST)
Message-ID: <3d9bb061-0dd0-4400-891e-9e9612e3906c@smile.fr>
Date: Wed, 7 Feb 2024 00:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20240206155140.2351424-1-romain.naour@smile.fr>
 <20240206155140.2351424-2-romain.naour@smile.fr>
 <d56a02ae-30d4-4a92-9a2d-953f75b36422@bubu1.eu>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <d56a02ae-30d4-4a92-9a2d-953f75b36422@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707261220; x=1707866020;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ITO5PL0wkqFWRoJT7obHHCZFqr0k6J/QAMKBwiYtjM0=;
 b=O46mm++Shwk7VwkhkX27jJqXVEDKSEwbb5Dr+rKYN7/PchTeObhAFpqE6gjizl7QOd
 DhURVY+cHjHeQrjan9pnb3QYAmMmbhqjJX5xeF3/6DRQ4teXx9StWq29w2ksl0W+Tqb+
 DwRGSpVFJEZUKTIc7FvRI4IAnG8kuCsRuJPeMg51Q9KNP1MgEmJT5cpCpKL0bsmdMIeS
 nSbsVnwER5esubSNO8tMNWl4uEPG7QIeLbGmyerGfwDACcQ2ZAZ74dCWzAzAW5xeWB6v
 puZqUzLYxDQjxmPrCGzeo4K8xsWYfwMSL/hPEJ6Ze1bsl17VIfuBPnoBjlulr6i9/bep
 bQxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=O46mm++S
Subject: Re: [Buildroot] [PATCH 2/2] package/python-bitstring: add missing
 runtime dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: james.hilliard1@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWFyY3VzLAoKTGUgMDYvMDIvMjAyNCDDoCAxODowNCwgTWFyY3VzIEhvZmZtYW5uIGEgw6lj
cml0wqA6Cj4gSGkgUm9tYWluLAo+IAo+IE9uIDA2LjAyLjI0IDE2OjUxLCBSb21haW4gTmFvdXIg
d3JvdGU6Cj4+IHB5dGhvbi1iaXRzdHJpbmcgcmVxdWlyZSBweXRob24tYml0YXJyYXkgYW5kIHB5
dGhvbi16bGliIGF0IHJ1bnRpbWUKPj4gc2luY2UgNC4wLjEgcmVsZWFzZSBbMV1bMl0uCj4gCj4g
SSBuZWVkZWQgdG8gbG9vayBhdCB0aGUgdmVyc2lvbiBudW1iZXJzIDMgdGltZXMsIGJ1dCB0aGlz
IGRlcGVuZGVuY3kgYWN0dWFsbHkKPiBnb3QgaW50cm9kdWNlZCBpbiA0LjEuMMKgIDotKS4gWzFd
CgpJbmRlZWQsIHRoZSB2ZXJzaW9uIGlzIG5vdCBldmVuIGdvb2QgaW4gbXkgZmlyc3QgbGluayAi
WzFdIiBiZWxvdy4KCj4gCj4+Cj4+IHB5dGhvbi16bGliIGlzIG5vdyBuZWVkZWQgZm9yIHRoZSAi
RXhwZXJpbWVudGFsIHN1cHBvcnQgZm9yIHR3byA4LWJpdAo+PiBmbG9hdCB0eXBlcyIuCj4gCj4g
SXMgdGhlcmUgYSByZWZlcmVuY2UgdG8gdGhhdCBzb21ld2hlcmU/IChJIGtub3csIG5vYm9keSBk
b2N1bWVudHMgdGhlaXIKPiBkZXBlbmRlbmNpZXMgb24gaW50ZXJuYWwgcHl0aG9uIG1vZHVsZXMs
IGJ1dCB3aGVyZSBpcyB0aGUgcXVvdGUgZnJvbT8pCgppdCdzIHRoZSBjb21taXQgdGl0bGUgaW50
cm9kdWNpbmcgcHl0aG9uLXpsaWIgZGVwZW5kZW5jeSAoc2Vjb25kIGxpbmsgWzJdKS4KCj4gCj4+
Cj4+IEludGVuZGVkIHRvIGZpeGVzIChmaXhlZCBsb2NhbGx5KToKPj4gaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy82MTA0MjI3MTgzCj4+IChUZXN0UHl0
aG9uUHkzQml0c3RyaW5nKQo+PiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9qb2JzLzYwOTM4NTQ4MTAKPj4gKFRlc3RQeXRob25QeTNDcm9zc2JhcikKPiAKPiBU
aGlzIHRlc3QgZmFpbGVkIGZvciBhIGRpZmZlcmVudCByZWFzb246IEl0IHJhbiB3aXRoIGJpdHN0
cmluZyB2ZXJzaW9uIDQuMS4yCj4gd2hpY2ggaW5jbHVkZWQgYSBib2d1cyBweXRob24gZmlsZSB3
aXRoIGludmFsaWQgc3ludGF4IFsyXSB3aGljaCB0aGUgcHljCj4gY29tcGlsYXRpb24gc3RlcCBz
dHVtYmxlcyBvdmVyLiBUaGUgdmVyc2lvbiBidW1wIHRvIDQuMS40IGFscmVhZHkgc29sdmVkIHRo
aXMuCgpJbmRlZWQsIEkgbWlzc2VkIHRoZSB2ZXJzaW9uIGJ1bXAgdG8gNC4xLjQgYnV0IHN0aWxs
IHRoZXJlIGlzIGEgbWlzc2luZyBydW50aW1lCmRlcGVuZGVuY3kgdGhhdCBwcmV2ZW50IHRvIHVz
ZSBweXRob24tYml0c3RyZWFtLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFsxXSBodHRw
czovL2dpdGh1Yi5jb20vc2NvdHQtZ3JpZmZpdGhzL2JpdHN0cmluZy9yZWxlYXNlcy90YWcvYml0
c3RyaW5nLTQuMS4wCj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9zY290dC1ncmlmZml0aHMvYml0
c3RyaW5nL2lzc3Vlcy8yOTMKPiAKPj4KPj4gZ2l0bGFiLWNpIHJlcG9ydHMgYW5vdGhlciBpc3N1
ZSBhdCBidWlsZCB0aW1lIG5vdCByZXByb2R1Y2VkIGxvY2FsbHk6Cj4+Cj4+IMKgwqAgKioqIEVy
cm9yIGNvbXBpbGluZwo+PiAnWy4uLl0vVGVzdFB5dGhvblB5M0JpdHN0cmluZy90YXJnZXQvdXNy
L2xpYi9weXRob24zLjExL3NpdGUtcGFja2FnZXMvYml0c3RyaW5nL3BsdWdpbl90ZXN0LnB5Jy4u
Lgo+PiDCoMKgIFNvcnJ5OiBJbmRlbnRhdGlvbkVycm9yOiBleHBlY3RlZCBhbiBpbmRlbnRlZCBi
bG9jayBhZnRlciBmdW5jdGlvbgo+PiBkZWZpbml0aW9uIG9uIGxpbmUgNiAocGx1Z2luX3Rlc3Qu
cHksIGxpbmUgOCkKPj4KPj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9zY290dC1ncmlmZml0aHMv
Yml0c3RyaW5nL3JlbGVhc2VzL3RhZy9iaXRzdHJpbmctNC4xLjEKPj4gWzJdCj4+IGh0dHBzOi8v
Z2l0aHViLmNvbS9zY290dC1ncmlmZml0aHMvYml0c3RyaW5nL2NvbW1pdC83MGM4YWY0ZDhiZWY1
NTdiYzdkOTZmODA5ZDM3ZTJjMjQxNTg3ZGQwCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+PiBDYzogSmFtZXMgSGlsbGlhcmQgPGphbWVz
LmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4+IC0tLQo+PiDCoCBwYWNrYWdlL3B5dGhvbi1iaXRzdHJp
bmcvQ29uZmlnLmluIHwgMiArKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
Cj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1iaXRzdHJpbmcvQ29uZmlnLmluCj4+
IGIvcGFja2FnZS9weXRob24tYml0c3RyaW5nL0NvbmZpZy5pbgo+PiBpbmRleCA5M2Q3NjgyNTc3
Li44MmQwYmIyOWM2IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1iaXRzdHJpbmcvQ29u
ZmlnLmluCj4+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWJpdHN0cmluZy9Db25maWcuaW4KPj4gQEAg
LTEsNSArMSw3IEBACj4+IMKgIGNvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fQklUU1RSSU5HCj4+
IMKgwqDCoMKgwqAgYm9vbCAicHl0aG9uLWJpdHN0cmluZyIKPj4gK8KgwqDCoCBzZWxlY3QgQlIy
X1BBQ0tBR0VfUFlUSE9OX0JJVEFSUkFZICMgcnVudGltZQo+PiArwqDCoMKgIHNlbGVjdCBCUjJf
UEFDS0FHRV9QWVRIT04zX1pMSUIgIyBydW50aW1lCj4+IMKgwqDCoMKgwqAgaGVscAo+PiDCoMKg
wqDCoMKgwqDCoCBTaW1wbGUgY29uc3RydWN0aW9uLCBhbmFseXNpcyBhbmQgbW9kaWZpY2F0aW9u
IG9mIGJpbmFyeSBkYXRhLgo+PiDCoCAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
