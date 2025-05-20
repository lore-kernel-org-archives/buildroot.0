Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C61C54E71
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 20:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6528860714;
	Tue, 20 May 2025 20:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wahrIAhNsFZY; Tue, 20 May 2025 20:14:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F36E607AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F36E607AE;
	Tue, 20 May 2025 20:14:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 95C38D4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 20:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92C05607C3
 for <buildroot@buildroot.org>; Tue, 20 May 2025 20:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0EmZ_0xFsqs for <buildroot@buildroot.org>;
 Tue, 20 May 2025 20:13:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B42060714
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B42060714
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B42060714
 for <buildroot@buildroot.org>; Tue, 20 May 2025 20:13:57 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso48776325e9.2
 for <buildroot@buildroot.org>; Tue, 20 May 2025 13:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747772035; x=1748376835;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=06SI61PQ/qaq7j3ivCLZ+fzgYH1wauqWRxTqackUyuY=;
 b=vtPPKU0bywqO5QTzblBK/cJnSZ5JAy1cDYnd0qo+/bNNHFZJOGHZGcVFPgnpyCR/9m
 tnmlO5I69aEsp9NPOEsiBjkypyWCFiSIEVY+sZ8xIMiJHXlCdlIhiEQZy2kwvpK7byPj
 C8bq1W5qWq+0bwPlO35c3WlgZ1AuEEaHIl5x0gKql9RWp1MJEx0U//n/53Vi2DBu2iNs
 gIX44ICYxwNwwhXIMdk4u1h91l732Ks04xHGSOpYTN+uvRgmNdrBdGt1suCVQgDevcvU
 zNMQmspViuMHC1ltRcObW2/MGl+hQvhd7x45FHghX8LzA1K4Ef1ltUeUvAq2yDD6oSk+
 QVaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/rfXtQ9nfgFPK0zOhYuKaVuY3R3OurnS5Hv6A5v4rt7VuZ4M09fBV3KZ3pOw9v+f0WpkuV6sKZqE=@buildroot.org
X-Gm-Message-State: AOJu0YxAVokEVmqdmpIcMkdJRSovlMyzxdV1RH+Fo9qZjZOewthdoNYe
 trEbUn4WE8ALAS0Jsf/WQBomfs0M1jLFk4hu8qvTmf36XM35hhAOD5yAZnArI8UtdUR/tfd94kw
 78I1K
X-Gm-Gg: ASbGnctXMbIMTrWYTYKp1effmy+mlYS3cCa8NAYLOlqMClaqS8Fh/Dqtq4lC7mYV34+
 0uEEsJZ0DFiZ760TGWLRUJwX6FbVna6BLacmf7xrI6HY91nmRnPTd+Qp/psl1U7DLkzxuLAzUx4
 srpee6GroswTMIsjvFtRhkohVynTSZByqA/THyAfdmVZ9a1AA/oyrXMJiFB05YQJJYB1xOpr5AX
 61xXQB05FK2/Ian6aO2+vekeZBbS+qISxYrdRtrZOPeJVCY+J60lF01n54OWwe20l/FblALarU+
 IdNEosj1S+FfocIjcFOLDUuIC6+AgYwwdrHLSJzs0BY0oIRXrLrp3IvD9csjOzeEWK+KKgCGpWB
 faofo+F623RRZ0SxN4hrztTtZLLovPspnrwBFDtzUlmcLHf3GM6UttWV+bSkN3Qr5ggtGWraSyf
 U58wliE9ZNt/TGBJMyymIvARRH
X-Google-Smtp-Source: AGHT+IHwXbbYdAtpIAv09xDU6D7Q7+A2NQfovuLLVUyFOuoS86QXh/7uO46wtx0ON7Qb8vb5kfFd/A==
X-Received: by 2002:a05:600c:1e1c:b0:43d:9d5:474d with SMTP id
 5b1f17b1804b1-442fef3e822mr191008375e9.0.1747772035326; 
 Tue, 20 May 2025 13:13:55 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f?
 (2a01cb05949d580083fd25921c9c7a4f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442ffaa75cfsm104299035e9.1.2025.05.20.13.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 13:13:55 -0700 (PDT)
Message-ID: <4bdf3efd-6949-4118-b0a7-375d12a2e9d0@smile.fr>
Date: Tue, 20 May 2025 22:13:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Olivier Benjamin <olivier.benjamin@bootlin.com>
References: <20250204173456.201056-1-gael.portay+rtone@gmail.com>
 <20250204173456.201056-2-gael.portay+rtone@gmail.com>
 <27cfddc7-d417-49e3-8344-1be16b5e2f9e@smile.fr>
 <DA161SA1RS4I.3QMPR1V62YQ2V@gmail.com>
Content-Language: fr, en-US
In-Reply-To: <DA161SA1RS4I.3QMPR1V62YQ2V@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1747772035; x=1748376835; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=06SI61PQ/qaq7j3ivCLZ+fzgYH1wauqWRxTqackUyuY=;
 b=p+DWrKfFfJCH4oACv/n1gaeK8hdHdLjjWALsn3PtUE0Z9IXOL1A4b6rj6Jk6+bzVVu
 QGj8F9AQqT/9vYswjygaJ0JvjHmU/gyV4eiHVD6TdOgRoeTKVMbngXx6rVxVkMBRarRH
 yzw7Sno/qde2+YaQ58YbwHPPQ8WQnwY8IoAW4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=p+DWrKfF
Subject: Re: [Buildroot] [PATCH v4 1/2] package/rpi-utils: new package
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

SGVsbG8gR2HDq2wsIEFsbCwKCkxlIDIwLzA1LzIwMjUgw6AgMTk6MzIsIEdhw6tsIFBPUlRBWSBh
IMOpY3JpdMKgOgo+IEhlbGxvIFJvbWFpbiwKPiAKPiBPbiBXZWQgRmViIDUsIDIwMjUgYXQgOTo0
NCBBTSBDRVQsIFJvbWFpbiBOYW91ciB3cm90ZToKPj4gSGVsbG8gR2HDq2wsIEFsbCwKPj4KPj4g
TGUgMDQvMDIvMjAyNSDDoCAxODozNCwgR2HDq2wgUE9SVEFZIGEgw6ljcml0wqA6Cj4+PiBUaGUg
cGFja2FnZSBycGktdXNlcmxhbmQgaGFzIGJlZW4gbWFya2VkIGFzIGFuY2llbnQgYW5kIGRlcHJl
Y2F0ZWRbMV0uCj4+Pgo+Pj4gVGhlIHVzZWZ1bCB0b29scyAoZHRvdmVybGF5LCBkdG1lcmdlLCB2
Y21haWxib3gsIHZjZ2VuY21kKSB3ZXJlIG1vdmVkIHRvCj4+PiB0aGUgcmVwb3NpdG9yeSBycGkt
dXRpbHMgc2luY2UgdGhlbi4KPj4+Cj4+PiBUaGlzIGFkZHMgdGhlIG5ldyBwYWNrYWdlIHJwaS11
dGlscyBhdCBsYXRlc3QgY29tbWl0IGFzIHRoZXJlIGlzIG5vCj4+PiB0YWdnZWQgY29tbWl0Lgo+
Pgo+PiBCUjJfUEFDS0FHRV9SUElfVVNFUkxBTkQgaXMgdXNlZCBpbiBzZXZlcmFsIHBhY2thZ2Vz
LiBTaW5jZSBycGktdXRpbHMgc2hvdWxkCj4+IHJlcGxhY2UgcnBpLXVzZXJsYW5kIG1heWJlIGl0
J3MgdGltZSB0byBhbHNvIHVwZGF0ZSB0aGVzZXMgcGFja2FnZXM/Cj4+Cj4gCj4gVGhhdCBpcyBh
IGdvb2QgY2F0Y2guIEJ1dCB3ZSBjYW5ub3QgYXMgcnBpLXV0aWxzIGRvZXMgbm90IHByb3ZpZGVz
IGFsbAo+IHRoZSBwaWVjZXMgdGhhdCBycGktdXNlcmxhbmQgcHJvdmlkZXMuCj4gPj4gRGlkIHlv
dSBjb25zaWRlciBub3Qgb25seSBkZXByZWNhdGluZyBycGktdXNlcmxhbmQgYnV0IGEgY29tcGxl
dGUgcmVwbGFjZW1lbnQ/Cj4+Cj4gCj4gQW5kIHRodXMsIHRoZSBycGktdXRpbHMgY2Fubm90IHJl
cGxhY2UgZW50aXJlbGx5IHJwaS11c2VybGFuZC4KCldoYXQgYXJlIHRoZSB0b29scyB0aGF0IGhh
dmUgbm8gcmVwbGFjZW1lbnQ/IGlzIHJlYWxseSBhbiBpc3N1ZT8KClVwc3RyZWFtIGlzIGRvaW5n
IGEgYnJlYWtpbmcgY2hhbmdlLCB3ZSBzaG91bGQgbm90IHByb3ZpZGUgZGVwcmVjYXRlZCBzdHVm
ZiBmb3JldmVyLgoKPiAKPiBTbyBJIGd1ZXNzLCB3ZSBzaG91bGQgcmVtb3ZlcyB0aGUgYmluYXJp
ZXMgdXRpbGl0aWVzIHByb3ZpZGVkIGJ5IHRoZSBuZXcKPiBwYWNrYWdlIHJwaS11dGlscyAoZHRv
dmVybGF5LCBkdG1lcmdlLCB2Y21haWxib3gsIHZjZ2VuY21kKSBmcm9tIHRoZSBvbGQKPiBwYWNr
YWdlIHJwaS11c2VybGFuZC4gQW5kIHRodXMsIGJvdGggcGFja2FnZXMgY2FuIGJlIGluc3RhbGxl
ZCBhdCB0aGUKPiBzYW1lIHRpbWUuCj4gCj4gV2hhdCBkbyB5b3UgdGhpbms/CgpIYXZpbmcgYm90
aCBwYWNrYWdlIHJwaS11dGlscyBhbmQgcnBpLXVzZXJsYW5kIGNvdWxkIGJlIGNvbmZ1c2luZyBi
dXQgaWYgdGhlcmUKaXMgbm8gb3RoZXIgY2hvaWNlIHRoZW4gaXQgY291bGQgYmUgYSBjb21wcm9t
aXNlLgoKPiAKPj4+Cj4+PiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS91c2Vy
bGFuZC9jb21taXQvOTZhNzMzNGFlOWQ1ZmM5ZGI3YWM5MmU1OTg1MjM3N2RmNjNmMTg0OAo+Pj4K
Pj4+IFRlc3RlZC1ieTogT2xpdmllciBCZW5qYW1pbiA8b2xpdmllci5iZW5qYW1pbkBib290bGlu
LmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXkrcnRvbmVA
Z21haWwuY29tPgo+Pj4gLS0tCj4+Cj4+IFdoYXQgaGFwcGVuZWQgc2luY2UgdjM/Cj4+Cj4gCj4g
Tm8gYmlnIGNoYW5nZXMsIGl0IHdhcyBpbiB0aGUgY292ZXJsZXR0ZXI6Cj4gCj4gQ2hhbmdlcyBz
aW5jZSB2MzoKPiAgLSBVcGRhdGUgbXkgZS1tYWlsCj4gIC0gUmViYXNlIG9uIG1hc3Rlcgo+ICAt
IEFkZCBUZXN0ZWQtYnk6IE9saXZpZXIgQmVuamFtaW4gPG9saXZpZXIuYmVuamFtaW5AYm9vdGxp
bi5jb20+CgpJIG1pc3NlZCB0aGUgY292ZXJsZXR0ZXIsIGZyb20gdGhlIHBhdGNod29yayBpbnRl
cmZhY2UgeW91IGhhdmUgdG8gY2xpY2sgb24KImV4cGFuZCIgdG8gZ2V0IHRoZSBsaW5rIHRvIHRo
ZSBjb3ZlciBsZXR0ZXI6CgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVp
bGRyb290L3BhdGNoLzIwMjUwMjA0MTczNDU2LjIwMTA1Ni0yLWdhZWwucG9ydGF5K3J0b25lQGdt
YWlsLmNvbS8KCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3Qv
Y292ZXIvMjAyNTAyMDQxNzM0NTYuMjAxMDU2LTEtZ2FlbC5wb3J0YXkrcnRvbmVAZ21haWwuY29t
LwoKSSBsZWFybmVkIHRoaXMgdGlwIGZyb20gQXJub3V0IGR1cmluZyB0aGUgbGFzdCBtZWV0aW5n
LCBzbyBpdCdzIHN0aWxsIG5ldyBmb3IgbWUgOikKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAK
Pj4+ICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPj4+ICBwYWNrYWdl
L0NvbmZpZy5pbiAgICAgICAgICAgICAgICB8ICAxICsKPj4+ICBwYWNrYWdlL3JwaS11dGlscy9D
b25maWcuaW4gICAgICB8IDEyICsrKysrKysrKysrKwo+Pj4gIHBhY2thZ2UvcnBpLXV0aWxzL3Jw
aS11dGlscy5oYXNoIHwgIDMgKysrCj4+PiAgcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLm1r
ICAgfCAxOCArKysrKysrKysrKysrKysrKysKPj4+ICA1IGZpbGVzIGNoYW5nZWQsIDM1IGluc2Vy
dGlvbnMoKykKPj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ycGktdXRpbHMvQ29uZmln
LmluCj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcnBpLXV0aWxzL3JwaS11dGlscy5o
YXNoCj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcnBpLXV0aWxzL3JwaS11dGlscy5t
awo+Pj4KPj4+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+Pj4gaW5kZXgg
MmRhNWQxNzhiMi4uZmMxYmEyYWIyNyAxMDA2NDQKPj4+IC0tLSBhL0RFVkVMT1BFUlMKPj4+ICsr
KyBiL0RFVkVMT1BFUlMKPj4+IEBAIC0xMjAzLDYgKzEyMDMsNyBAQCBGOglwYWNrYWdlL25naW54
LW1vZHNlY3VyaXR5Lwo+Pj4gIE46CUdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXkrcnRvbmVAZ21h
aWwuY29tPgo+Pj4gIEY6CWJvYXJkL3Jhc3BiZXJyeXBpLwo+Pj4gIEY6CWNvbmZpZ3MvcmFzcGJl
cnJ5cGkqCj4+PiArRjoJcGFja2FnZS9ycGktdXRpbHMvCj4+PiAgCj4+PiAgTjoJR2FvIFhpYW5n
IDxoc2lhbmdrYW9AYW9sLmNvbT4KPj4+ICBGOglwYWNrYWdlL2Vyb2ZzLXV0aWxzLwo+Pj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KPj4+IGluZGV4
IGU5Yzc4OWNmZjIuLmYwMmZlNTJmMzUgMTAwNjQ0Cj4+PiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5p
bgo+Pj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPj4+IEBAIC00NTQsNiArNDU0LDcgQEAgbWVu
dSAiRmlybXdhcmUiCj4+PiAgCXNvdXJjZSAicGFja2FnZS9xb3JpcS1mbS11Y29kZS9Db25maWcu
aW4iCj4+PiAgCXNvdXJjZSAicGFja2FnZS9yY3ctc21hcmMtc2FsMjgvQ29uZmlnLmluIgo+Pj4g
IAlzb3VyY2UgInBhY2thZ2UvcnBpLWZpcm13YXJlL0NvbmZpZy5pbiIKPj4+ICsJc291cmNlICJw
YWNrYWdlL3JwaS11dGlscy9Db25maWcuaW4iCj4+PiAgCXNvdXJjZSAicGFja2FnZS9zdW54aS1i
b2FyZHMvQ29uZmlnLmluIgo+Pj4gIAlzb3VyY2UgInBhY2thZ2UvdHM0OTAwLWZwZ2EvQ29uZmln
LmluIgo+Pj4gIAlzb3VyY2UgInBhY2thZ2UvdXg1MDAtZmlybXdhcmUvQ29uZmlnLmluIgo+Pj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnBpLXV0aWxzL0NvbmZpZy5pbiBiL3BhY2thZ2UvcnBpLXV0
aWxzL0NvbmZpZy5pbgo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAw
MDAuLmEyNzI5MTY3YWEKPj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL3BhY2thZ2UvcnBpLXV0
aWxzL0NvbmZpZy5pbgo+Pj4gQEAgLTAsMCArMSwxMiBAQAo+Pj4gK2NvbmZpZyBCUjJfUEFDS0FH
RV9SUElfVVRJTFMKPj4+ICsJYm9vbCAicnBpLXV0aWxzIgo+Pgo+PiBTaW5jZSBpdCdzIG9ubHkg
dXNlZnVsbCBmb3IgcnBpIHRhcmdldHMsIHlvdSBzaG91bGQga2VlcCB0aGUgYXJjaGl0ZWN0dXJl
Cj4+IGRlcGVuZGVuY2llcyAoYXQgbGVhc3QpOgo+Pgo+PiAJZGVwZW5kcyBvbiBCUjJfYXJtIHx8
IEJSMl9hYXJjaDY0Cj4+Cj4+IE90aGVyd2lzZSwgaXQgbG9va3Mgb2suCj4+Cj4gCj4gTWFrZXMg
c2Vuc2UuCj4gCj4+IEJlc3QgcmVnYXJkcywKPj4gUm9tYWluCj4+Cj4gCj4gUmVnYXJkcywKPiBH
YcOrbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
