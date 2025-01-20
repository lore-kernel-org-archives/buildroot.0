Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01A4C02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 19:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6477A40680;
	Mon, 20 Jan 2025 19:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SlH2287ASNtI; Mon, 20 Jan 2025 19:36:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 222504068E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 222504068E;
	Mon, 20 Jan 2025 19:36:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 713C369
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 19:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 511D883BE3
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 19:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjYHIqpQcVrl for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 19:36:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C320F83B8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C320F83B8A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C320F83B8A
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 19:36:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.112.125]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5fMe-1tbdbY2ftq-00BASM; Mon, 20
 Jan 2025 20:36:38 +0100
Message-ID: <8e55a83c-6fcb-43a8-9eb9-1fee6df8a366@gmx.de>
Date: Mon, 20 Jan 2025 20:36:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
References: <20250114113212.1791033-1-fiona.klute@gmx.de>
 <20250114113212.1791033-2-fiona.klute@gmx.de>
 <456ee4aa-9ca2-41f5-b535-eef3e9350b5c@bubu1.eu>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <456ee4aa-9ca2-41f5-b535-eef3e9350b5c@bubu1.eu>
X-Provags-ID: V03:K1:JVeGKztoZn2X4WlSN8oupMXB+G/lpDL0SGYrdi296tj2/ZIobs1
 NB4j3KgGddv89SSUoAfc3/G3fT8nx5qbaSVNrP20bWXkDKugGPa4+X5HxrMWqBObFWZEAte
 w8pst4HUEEeQf1dK8g6S93Tu8HeECMqzJ9ePZi9jtDBOt5CADpPLkZj9VlyddHavPPwuo2z
 B0E8xdlpwRCPaIOaYIuLQ==
UI-OutboundReport: notjunk:1;M01:P0:WYP2wDAYgto=;mdKjfLk7wIA+D7M3rzwqvEzwHGu
 zVm37kANaC1S/4U5lK3hX0tXrnDT23ED3wcaRza2k80sRBMqs8eyBEHSg9PUGtekP5saLBS5L
 s9u9cx5ZiAIt9L+h7mJ/TJZVRR0+gUqzl0aMZu36tGwuw7UYu1VQRybW/TjZLe1arVl7jpEeW
 umKpPGPk+ZKS/l2jAZ/lSL5G+08ddIkKH66ELskApiOoEbnRzy6lz9KN7NdBFaMX553De1627
 kxXBadOyoFx0Xoj6yQSEzofsYTvGsaw2pLhbOlkgpMTPJMcNuDzH4tTeVNoU6I/zTZSSTJjmf
 NdDCIyk9AsilpDi4RN3SL/ypJd5Z8v0KYhXI3yM8ybFPbvcH3tEAzoIuTH6oIVRchwC0J+Pzt
 1zjMY3U8Sq7wWjLKXhibPKRBJ4rJNjoA79tfcz5ZYv6OHTPpLniOHc8s42sDZddyWjijnEcl5
 RnvgGcSTYlz24Z1Mj0w2LCZJu6xv105T0jk4OIhf/M647ha09LVavoq/4s0C/0Y1m4N8WlzQe
 fpvGp4sTBADKcE5U0blNryZUb98EIy8STBNyxGXEnzbTxRQbPzC/7NenPTPW8yMQ8ZINsOTnr
 mWMj98Tt+stWtJSWyOieYSPpkAM6pLo6VwfCwQWNGhNXo1xzKhLM2ah1uBqq26tpvvGdiGZBs
 r3kedd8zqbU/EKYwDMQCq5cPlOPh2RgwOjDYpeIdVzSxjEO9NtgukF40KMb+D+riz55YBFPQf
 faesuf+bvaQUmCR0uabyCoz28wyN+ZE/Gta30s8gDE3PuO+Gi+h+zmQ0h1XHP1s1H6g88sgac
 ftLQwQXbhHq9coNevN195QA5aHkSQbkbJ/MK38R/BXhp7ZHNwcYd4vv8I2AEALtvQ25LXPjMU
 ZWRDFK8X2rb4jr+1gai3gA8kklziF7PmESz82/8j7ZX95ikZ/Yvi2n+ww9U63Pg4aMjwmqgmZ
 XcJjgcwIy14fCx2BYM+F1bSEgOn2nVKyVvpp06GKAZ38KcmfcxG1spq5eV05TX00hYgiSSkby
 Q7FrXg2xkftof7MFuOUVienx0wjTmzcFIq1Lv2v3pjUd6nb5+6b0zglD1Q1hXZtA9SqjKnlpH
 gvkjPzyPU9+sOGWx3Fsk9xfcHuc2GnYwILc23SiNVildC/Hv3lNYtpr9jPdKOwuZtAOrEezLw
 5jUUiDrgv85Nx+rsDqUWznvqNEsTJbeoB3GI1qPeZAw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1737401798; x=1738006598; i=fiona.klute@gmx.de;
 bh=mF+MN+npCDBz9hsMhUUh+/OAW47ji7lHJZYvwuiIjQA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=hSKkKh93C/RSpdO6ovKhNvTBwVIgSwKGVr8w4ffw2T9id+VgR6RXYXfBXYQhBQvk
 eCpGumxfx+D8OSoYVn06oqXIqkZLeocQacmxLYd4xt6aJGd6O9ZxZsyBDOAgHGxlF
 9RE9DCRfazg4O5LVORpn//xTl8ImXgGHAW3s7i7BXbUXECng/kM8dPRuYbi1Yu5Bq
 QyHaMmKa7BfqxijbQaIHpc7P6/8fRO5YmJxC05aHNrD9Eq3YKsYmBnaG+zqe18cD8
 5nlDlGA6GP1QtQLEqQEfuFYfiQUoGLu/07ZnF5qhwBi3dSdri+Wclf3SYBEcPPjH/
 k4kvH/Tw540dtatHbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=hSKkKh93
Subject: Re: [Buildroot] [PATCH v8 1/6] package/json-glib: bump to version
 1.10.6
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWFyY3VzIQoKQW0gMjAuMDEuMjUgdW0gMjA6MTEgc2NocmllYiBNYXJjdXMgSG9mZm1hbm46
Cj4gSGkgRmlvbmEsCj4KPiBPbiAxNC4wMS4yNSAxMjozMiwgRmlvbmEgS2x1dGUgdmlhIGJ1aWxk
cm9vdCB3cm90ZToKPj4gRnJvbTogIkZpb25hIEtsdXRlIChXSVdBKSIgPGZpb25hLmtsdXRlQGdt
eC5kZT4KPj4KPj4gUmVxdWlyZWQgdG8gYnVpbGQgd2l0aCBnb2JqZWN0LWludHJvc3BlY3Rpb24g
Pj0gMS44Mi4wLCB0byBiZSBidW1wZWQKPj4gaW4gYSBsYXRlciBjb21taXQuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEZpb25hIEtsdXRlIChXSVdBKSA8ZmlvbmEua2x1dGVAZ214LmRlPgo+PiAtLS0K
Pj4gQ2hhbmdlcyB2NyAtPiB2OCAoRmlvbmEpOgo+PiAqIE1vdmUganNvbi1nbGliIGJ1bXAgdG8g
c3RhcnQgb2Ygc2VyaWVzLCB0byBhdm9pZCBicm9rZW4gc3RhdGUgYWZ0ZXIKPj4gwqDCoCBHT0kg
YnVtcAo+Pgo+PiBDaGFuZ2VzIHY2IC0+IHY3IChGaW9uYSk6Cj4+ICogQnVtcCBqc29uLWdsaWIg
dG8gdmVyc2lvbiAxLjEwLjYKPj4KPj4gwqAgcGFja2FnZS9qc29uLWdsaWIvanNvbi1nbGliLmhh
c2ggfCA0ICsrLS0KPj4gwqAgcGFja2FnZS9qc29uLWdsaWIvanNvbi1nbGliLm1rwqDCoCB8IDQg
KystLQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvanNvbi1nbGliL2pzb24tZ2xpYi5oYXNoIGIv
cGFja2FnZS9qc29uLWdsaWIvCj4+IGpzb24tZ2xpYi5oYXNoCj4+IGluZGV4IGI3OGQ3MDgzOTEu
LjBjMGIyY2JiNzMgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvanNvbi1nbGliL2pzb24tZ2xpYi5o
YXNoCj4+ICsrKyBiL3BhY2thZ2UvanNvbi1nbGliL2pzb24tZ2xpYi5oYXNoCj4+IEBAIC0xLDUg
KzEsNSBAQAo+PiAtIyBGcm9tIGh0dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvanNv
bi1nbGliLzEuOC9qc29uLQo+PiBnbGliLTEuOC4wLnNoYTI1NnN1bQo+PiAtc2hhMjU2Cj4+IDk3
ZWY1ZWI5MmNhODExMDM5YWQ1MGE2NWYwNjYzM2YxYWFlNjQ3OTI3ODkzMDdiZTcxNzA3OTVkOGIz
MTk0NTQKPj4ganNvbi1nbGliLTEuOC4wLnRhci54ego+PiArIyBGcm9tIGh0dHBzOi8vZG93bmxv
YWQuZ25vbWUub3JnL3NvdXJjZXMvanNvbi1nbGliLzEuMTAvanNvbi0KPj4gZ2xpYi0xLjEwLjYu
c2hhMjU2c3VtCj4+ICtzaGEyNTYKPj4gNzdmNGJjYmY5MzM5NTI4ZjE2NmI4MDczNDU4NjkzZjBh
MjBiNzdiNzA1OWRiYzJkYjYxNzQ2YTE5MjhiMDI5Mwo+PiBqc29uLWdsaWItMS4xMC42LnRhci54
ego+PiDCoCAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZToKPj4gwqAgc2hhMjU2Cj4+IGExOTBkYzlj
ODA0Mzc1NWQ5MGY4YjBhNzVmYTY2YjllNDJkNGFmNGM5ODBiZjVkZGM2MzNmMDEyNGRiM2NlZTfC
oCBDT1BZSU5HCj4KPiBUaGUgTGljZW5zaW5nIGhhc2ggY2hhbmdlZC4gQWN0dWFsbHkgdGhlIENP
UFlJTkcgZmlsZSBpcyBub3cgYSBzeW1saW5rCj4gdG8gTElDRU5TRVMvTEdQTC0yLjEtb3ItbGF0
ZXIudHh0Lgo+Cj4gVGhpcyB3YXMgY2hhbmdlZCBoZXJlOiBodHRwczovL2dpdGxhYi5nbm9tZS5v
cmcvR05PTUUvanNvbi1nbGliLy0vCj4gY29tbWl0L2EwNmQ0M2RiMzY1NDVhZmYxMGViMzg0ZDYy
NTQ4ZDk2YTdjZjYwMjAKPgo+IFRoZSBsaWNlbnNlIG9mIHRoZSBhY3R1YWwgY29kZSBkaWRuJ3Qg
Y2hhbmdlLiAoc29tZSB0ZXN0IGZpbGVzIGFyZSBNSVQsCj4gdHJhbnNsYXRpb25zIGFyZSBDQzAt
MS4wKQoKWW91J3JlIHJpZ2h0LCBhbmQgdGhlIGNvbnRlbnQgaXNuJ3QgdGhlIHNhbWUgYmVoaW5k
IHRoZSBzeW1saW5rIGVpdGhlcgooTEdQTC0yLjEgZm9yIGJvdGgsIGJ1dCBkaWZmZXJlbnQgZm9y
bWF0dGluZykuIEknbSBjb25mdXNlZCB3aHkgdGhlCmJ1aWxkIHN5c3RlbSBkaWRuJ3QgZ2l2ZSBt
ZSBhbiBlcnJvciwgbXkgY29uZmlnIGhhcwpCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVT
PXkgc2V0LgoKQW55d2F5LCBJJ20gZ29pbmcgdG8gZml4IHRoYXQsIGRvdWJsZS1jaGVjayB0aGUg
b3RoZXIgcGFja2FnZXMsIGFuZCBzZW5kCmFuIHVwZGF0ZWQgc2VyaWVzLgoKQW5kIHRoYW5rIHlv
dSBmb3IgdGVzdGluZyEgOi0pCgpCZXN0IHJlZ2FyZHMsCkZpb25hCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
