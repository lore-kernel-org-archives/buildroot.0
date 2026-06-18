Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B42CD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 18:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E1136151B;
	Thu, 18 Jun 2026 18:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tpUDmwn6_seS; Thu, 18 Jun 2026 18:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62B066150F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781808037;
	bh=M6wtEwW3QTo9P1XFZAG/3DvWJyXnNadDSrOZbeZz3Do=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ESVIuEPeXFfCwYahlWUrELvjAvACw/9V4fNEOddo1ZkEhGaCpThPMPSfrp95FZ8PF
	 bPyVFOJfSqrIlMzwtF89ug6OoUtcATL9uOxlmN9sz0ZmvywGPPeYBFzuKhbYDss4oV
	 Zb3UHVOaE/v7iQABz/QbfTAntbD0N1xbytdM5LTOftnvfHBrj5W54rw0GOHB6D8iIl
	 EFC64uRQo1EuIzuP5v/7IR7uJAQdPPQ6TNrYRZPRLg75pw8hBwMhCf5IqkqcRvyHKw
	 66QBhMpLPcefo9+D6Yei68EgCOCAzzhadkiDyI3uwN9oUtZReAp1K02oJTGd+rtNL8
	 B6JbAC6AwK0aQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62B066150F;
	Thu, 18 Jun 2026 18:40:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AE31131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 18:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4530941A6F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 18:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0TNjsyrWUqy for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 18:40:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=54.252.183.203;
 helo=embla.dev.snart.me; envelope-from=dxdt@dev.snart.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37A2241A6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37A2241A6D
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37A2241A6D
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 18:40:32 +0000 (UTC)
Received: from embla.dev.snart.me (localhost [IPv6:::1])
 by embla.dev.snart.me (Postfix) with ESMTP id 1E03B1D484;
 Thu, 18 Jun 2026 18:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 1E03B1D484
Received: from [192.168.1.18] ([182.226.25.243])
 by embla.dev.snart.me with ESMTPSA id AmXFL5s7NGqtnwYA8KYfjw
 (envelope-from <dxdt@dev.snart.me>); Thu, 18 Jun 2026 18:40:27 +0000
Message-ID: <cc6906b2-2594-4c33-b9fe-6794090f069f@dev.snart.me>
Date: Fri, 19 Jun 2026 03:40:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20260616154947.315883-1-dxdt@dev.snart.me>
 <d782d17c-3e56-4ddf-8c10-92ae7dd01334@bubu1.eu>
Content-Language: en-US, ko
Autocrypt: addr=dxdt@dev.snart.me; keydata=
 xjMEYmJg1hYJKwYBBAHaRw8BAQdAf5E+ri1XLtjqYbZdHOyc8oS+1/XJ5bSlbx5WHXmVBZzN
 IERhdmlkIFRpbWJlciA8ZHhkdEBkZXYuc25hcnQubWU+wpQEExYKADwWIQQn/Jn96EMUaIoF
 X+T/ldyyrZpWaAUCYmJg1gIbAwULCQgHAgMiAgEGFQoJCAsCBBYCAwECHgcCF4AACgkQ/5Xc
 sq2aVmjJZwD8COjPlUwccrlRvbNQ6f87DWchtYO0o8W2DNRM3RLps0EA/jEhIbRV6AsyC8jr
 30Ut3aJ3/mO/6G4sLj7OvkEEBH0MzjgEYmJg1hIKKwYBBAGXVQEFAQEHQFpgtIgaByv9lIEY
 EmpavMO0pYjtu7TMJynwdnGYkN9LAwEIB8J4BBgWCgAgFiEEJ/yZ/ehDFGiKBV/k/5Xcsq2a
 VmgFAmJiYNYCGwwACgkQ/5Xcsq2aVmhFCwEA0kM9VyYB4bLCM7+SuXUUH+5Ec99Nj4RXxFad
 Key9GuwA/2BZK6bNyrLSfEk2JDRoskqf7OIL0wa6JOD5SrBnMe8E
In-Reply-To: <d782d17c-3e56-4ddf-8c10-92ae7dd01334@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=dev.snart.me; s=00; 
 t=1781808028; bh=VY+GrBhb+1/IxTE7qiZ/OHlRZk7sdJIlw1R3usEGbYw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SK2w4hdRPYhXPyrh9uyTU8WtuESMewFKpu7HtiFGQbdZJt6pr1IrpHuxi8tGFfKf7
 xpOOJyj+OXWnFGD3ZZQZpxItR/Q/n0xcgLMNiTTnPJ1Xax3hfGjzA1fCdHKdNdEwV0
 8URtHdaeYpOmwZRtOpBLMoqH+GFCvhGv9MOLFppI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=dev.snart.me
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256
 header.s=00 header.b=SK2w4hdR
Subject: Re: [Buildroot] [PATCH] package/exfatprogs: bump to version 1.4.2
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
From: David Timber via buildroot <buildroot@buildroot.org>
Reply-To: David Timber <dxdt@dev.snart.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWFyY3VzIQoKVGhhbmtzIGZvciByZXZpZXdpbmcuCgpPbiA2LzE3LzI2IDIxOjQ2LCBNYXJj
dXMgSG9mZm1hbm4gd3JvdGU6Cj4gSGkgRGF2aWQsCj4gdGhhbmtzIGZvciB5b3VyIHN1Ym1pc3Np
b24sIEkgaGF2ZSBhIGZldyBjb21tZW50cywgc2VlIGJlbG93Lgo+Cj4gT24gNi8xNi8yNiAxNzo0
OSwgRGF2aWQgVGltYmVyIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+IFNpZ25lZC1vZmYtYnk6IERh
dmlkIFRpbWJlciA8ZHhkdEBkZXYuc25hcnQubWU+Cj4KPiBJdCB3b3VsZCBiZSBuaWNlIHRvIGhh
dmUgYSBiaXQgbW9yZSBkZXRhaWxzIGluIHlvdXIgY29tbWl0IGxvZy4gSS5lLgo+IGFkZGluZyBs
aW5rcyB0byB0aGUgY2hhbmdlbG9nLCB3aGF0IGNoYW5nZWQgd2l0aCB0aGUgdmVyc2lvbiBidW1w
IHlvdQo+IGFyZSBzdWJtaXR0aW5nLiBBbmQgdGhlbiBhbHNvIGFuIGV4cGxhbmF0aW9uIGZvciB0
aGUgbm9uIHN0cmljdGx5Cj4gbWVjaGFuaWNhbCB2ZXJzaW9uIGJ1bXAgY2hhbmdlcyB5b3UgYXJl
IGFkZGluZy4+IC0tLQpJJ2xsIGFkZCBzb21lIGltcG9ydGFudCBjaGFuZ2VzIGZyb20gY29tbWl0
cy4gVGhlcmUgd2VyZSBzb21lIHNlcmlvdXMKaXNzdWVzIG9uIDMyLWJpdCB0YXJnZXRzIGFuZCBt
a2ZzIHdhcyBtaXNzaW5nIGZvcmVpZ24gZmlsZXN5c3RlbSBjaGVja3MuCkp1c3QgdGhlc2UgdHdv
LgoKPj4gwqAgcGFja2FnZS9leGZhdHByb2dzL0NvbmZpZy5pbsKgwqDCoMKgwqDCoCB8IDQgKysr
Kwo+PiDCoCBwYWNrYWdlL2V4ZmF0cHJvZ3MvZXhmYXRwcm9ncy5oYXNoIHwgNCArKy0tCj4+IMKg
IHBhY2thZ2UvZXhmYXRwcm9ncy9leGZhdHByb2dzLm1rwqDCoCB8IDIgKy0KPj4gwqAgMyBmaWxl
cyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2V4ZmF0cHJvZ3MvQ29uZmlnLmluIGIvcGFja2FnZS9leGZhdHByb2dzL0Nv
bmZpZy5pbgo+PiBpbmRleCA0ZjUwNDI3YTY4Li4wN2I1ZjdlZDI2IDEwMDY0NAo+PiAtLS0gYS9w
YWNrYWdlL2V4ZmF0cHJvZ3MvQ29uZmlnLmluCj4+ICsrKyBiL3BhY2thZ2UvZXhmYXRwcm9ncy9D
b25maWcuaW4KPj4gQEAgLTEsNiArMSwxMCBAQAo+PiDCoCBjb25maWcgQlIyX1BBQ0tBR0VfRVhG
QVRQUk9HUwo+PiDCoMKgwqDCoMKgIGJvb2wgImV4ZmF0cHJvZ3MiCj4+IMKgwqDCoMKgwqAgZGVw
ZW5kcyBvbiBCUjJfVVNFX1dDSEFSCj4+ICvCoMKgwqAgZGVwZW5kcyBvbiBCUjJfVVNFX01NVSAj
IHV0aWwtbGludXgvbGliYmxraWQKPj4gK8KgwqDCoCBzZWxlY3QgQlIyX1BBQ0tBR0VfVVRJTF9M
SU5VWAo+PiArwqDCoMKgIHNlbGVjdCBCUjJfUEFDS0FHRV9VVElMX0xJTlVYX0xJQkJMS0lECj4+
ICvCoMKgwqAgc2VsZWN0IEJSMl9QQUNLQUdFX01VU0xfRlRTIGlmICFCUjJfVE9PTENIQUlOX1VT
RVNfR0xJQkMKPgo+IFdlIG5lZWQgYW4gZXhwbGFuYXRpb24gZm9yIHdoeSB5b3UgYXJlIHNlbGVj
dGluZyB0aGVzZSBub3csIHdoYXQKPiBjaGFuZ2VkIGluIGV4ZmF0cHJvZ3MgdGhhdCB0aGlzIGlz
IHJlcXVpcmVkIG5vdz8gSSBjb3VsZG4ndCBmaW5kCj4gYW55dGhpbmcgd2hlbiBjaGVrY2luZyB0
aGUgY2hhbmdlbG9nLgo+Cj4gTm90ZSBhbHNvIHRoYXQganVzdCBzZWxlY3RpbmcgdXRpbC1saW51
eCBpbiBDb25maWcuaW4gaXMgc3RyYW5nZSBpbgo+IGl0c2VsZiBhcyB0aGF0IGVuc3VyZXMgaXQg
aXMgYXZhaWxhYmxlIGF0IHJ1bnRpbWUsIGJ1dCBzb21ldGhpbmcgbGlrZQo+IGxpYmJsa2lkIGlz
IHVzdWFsbHkgYSBjb21waWxlIHRpbWUgZGVwZW5kZW5jeT8gQ29tcGlsZSB0aW1lCj4gZGVwZW5k
ZW5jaWVzIG5lZWQgdG8gYmUgYWRkZWQgaW50byB0aGUgLm1rIGZpbGUgaW50byB0aGUgX0RFUEVO
REVOQ0lFUwo+IHZhcmlhYmxlLsKgClNvcnJ5LiBNaXNzZWQgdGhhdC4KCj4gU28gSSBkb24ndCBy
ZWFsbHkgdW5kZXJzdGFuZCB3aGF0J3MgZ29pbmcgb24gaGVyZSB5ZXQuCj4KPiBTYW1lIHF1ZXN0
aW9uIGZvciBtdXNsLWZ0cy4gV2h5IGlzIGl0IG5lY2Vzc2FyeT8gSXMgaXQgcmVxdWlyZWQgYXQK
PiBjb21waWxlIHRpbWU/wqAKbGliZnRzIGlzIG5vdCByZWFsbHkgZW50aXJlbHkgbmVjZXNzYXJ5
LiBJdCdzIGJhc2ljYWxseSBhIGJldHRlciB2ZXJzaW9uCm9mIGRvc2F0dHIgY29tbWFuZC4gSSBj
YW4gc2VlIHRoYXQgQnVpbGRyb290IGRvZXNuJ3QgaGF2ZSBhIHVzZXJsYW5kCnRvb2wgdGhhdCBj
YW4gbWFuaXB1bGF0ZSBkb3MgYXR0cmlidXRlcy4gRG9uJ3Qga25vdyBpZiBhbnlvbmUgd2FudHMg
aXQsCnRob3VnaC4KCj4+IMKgwqDCoMKgwqAgaGVscAo+PiDCoMKgwqDCoMKgwqDCoCBleEZBVCBm
aWxlc3lzdGVtIHVzZXJzcGFjZSB1dGlsaXRpZXMuCj4+IMKgIGRpZmYgLS1naXQgYS9wYWNrYWdl
L2V4ZmF0cHJvZ3MvZXhmYXRwcm9ncy5oYXNoCj4+IGIvcGFja2FnZS9leGZhdHByb2dzL2V4ZmF0
cHJvZ3MuaGFzaAo+PiBpbmRleCBlNzNkOWQ4ODRiLi41NjUxNWNkOGY3IDEwMDY0NAo+PiAtLS0g
YS9wYWNrYWdlL2V4ZmF0cHJvZ3MvZXhmYXRwcm9ncy5oYXNoCj4+ICsrKyBiL3BhY2thZ2UvZXhm
YXRwcm9ncy9leGZhdHByb2dzLmhhc2gKPj4gQEAgLTEsNSArMSw1IEBACj4+IC0jIEZyb20KPj4g
aHR0cHM6Ly9naXRodWIuY29tL2V4ZmF0cHJvZ3MvZXhmYXRwcm9ncy9yZWxlYXNlcy9kb3dubG9h
ZC8xLjIuOS9leGZhdHByb2dzLTEuMi45LnRhci54ei5zaGEyNTYKPj4gLXNoYTI1NsKgCj4+IGQ5
YTQyMTk3YzZmZjllNmE4ZTkyMzc4OTQxMzAwOGUzMTc0MTVjZjdhNGFiODVjNDg2YzVmZmNhZjQ5
Y2ExNzXCoAo+PiBleGZhdHByb2dzLTEuMi45LnRhci54ego+PiArIyBGcm9tCj4+IGh0dHBzOi8v
Z2l0aHViLmNvbS9leGZhdHByb2dzL2V4ZmF0cHJvZ3MvcmVsZWFzZXMvZG93bmxvYWQvMS40LjIv
ZXhmYXRwcm9ncy0xLjQuMi50YXIueHoKPgo+IFBsZWFzZSBrZWVwIHRoZSAuc2gyNTYgc3VmZml4
LiBUaGlzIGxpbmUgaW5kaWNhdGVzIHRoYXQgeW91IGdvdCB0aGUKPiBzaGEyNTZzdW0gaGFzaCBm
cm9tCj4gaHR0cHM6Ly9naXRodWIuY29tL2V4ZmF0cHJvZ3MvZXhmYXRwcm9ncy9yZWxlYXNlcy9k
b3dubG9hZC8xLjQuMi9leGZhdHByb2dzLTEuNC4yLnRhci54ei5zaGEyNTYKPiAod2hpY2ggbWF0
Y2hlcyB0aGUgb25lIHlvdSBhZGRlZCBiZWxvdy7CoApJbnRlcmVzdGluZy4gSSB3b25kZXIgaG93
IGl0IG1hZGUgaXQgcGFzdCBgbWFrZSBzb3VyY2VgIGNoZWNrcyBvbiBhCmNsZWFuIHRyZWUuCgpJ
J20gc29ycnkuIEkndmUgYWx3YXlzIHVzZWQgQlIsIGJ1dCBkaWRuJ3QgYWN0dWFsbHkgaGF2ZSB0
byB3cml0ZSBhCnBhdGNoIHVudGlsIG5vdy4KCkRhdm8KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
