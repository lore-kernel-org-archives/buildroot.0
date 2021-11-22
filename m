Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D79C433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 22:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 854A980D9E;
	Mon, 22 Nov 2021 22:41:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O8h_i_dqvQax; Mon, 22 Nov 2021 22:41:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEEBF80DA1;
	Mon, 22 Nov 2021 22:41:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F25B41BF951
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E154780DA1
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vFOdqTpXmZfz for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 22:41:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F20D80D9E
 for <buildroot@busybox.net>; Mon, 22 Nov 2021 22:41:03 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id x15so83133725edv.1
 for <buildroot@busybox.net>; Mon, 22 Nov 2021 14:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=u6dBTKOIZIKfkIt11WcUUvohe5UO5jG80LObwJjuRg4=;
 b=iQobw9xx3tRMZWA3Suvh+wL6N7QSTRg3rPnTpc+p5eDieVREI2UocmNmFYKq8s0s7G
 H8m8KAaJ5EMj/BPv81BoOKYAqe0cq1d+Iws/KAqEsuvCGIALnvk+RWWHq21OxZhT8g+a
 4EtzZYIP4xKzDIkV+Q0oQ5fw+CeiGQ3oMZJESEa/BGdVVkaiVwntAwwOuVqJsKP+PDjE
 F5ALSzl3011z/3GMqRCJE+445336QuUwx3ccUeGdc/hYY2xPt0tuIREJpvrCw1d+3epz
 NRpxIrrQduQilzYmScQO9f7bRegaG3CbVpc37+fDUO7A3yXFaIen1ddmNjGdOaW1G7Z4
 il1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=u6dBTKOIZIKfkIt11WcUUvohe5UO5jG80LObwJjuRg4=;
 b=7Eq/ZxvBdoDfr+qWNRUeLYKthobZythBDP2Cf4nt8CzeP6NOzCJdJo0xEiToLJAfAX
 nZ9J5vKrM8+U4L5M8LZE8lKRupokjvYLb9nqLRl33Rr9V5pMNGXz3Oj+DU83c7BGVLdD
 n5qO6UHTZP8uL5pREys8ANM2b2jGTMbhfK8SVmi37+UI8R2+idQm+hFv06Bp5foFaJjF
 /QIhPWwL3dugGL+tM4y55PdekuQNHcB97wyaIGussbQsPl2AszvggMuGD5xUAl1Fm1hX
 986DfBARj1IVcvZXDLHVL61Dk+l5ZSU7m5A9tce5brtQMDPS2dq3cMwtA/HJOzPpZUAb
 56lA==
X-Gm-Message-State: AOAM531WRD0reBvMBsDtx6r+NVjAGkpLxYJWI9romHAC1Vaw1eeHYJ5W
 gzq7hLXYpXUma/a0tvd2iWTWFfw2Hx+RJA==
X-Google-Smtp-Source: ABdhPJzEs9T94yu7AFbYD8VB59HfdRBVJLxIAEOW0AP/hpWPIb9xCzHaRwHaZAmRcG6SraNnirzrSw==
X-Received: by 2002:a17:906:5343:: with SMTP id
 j3mr1105627ejo.538.1637620861506; 
 Mon, 22 Nov 2021 14:41:01 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y15sm5037639eda.13.2021.11.22.14.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 14:41:01 -0800 (PST)
Message-ID: <d5028a4a-6c47-d8c2-f4d4-155dff638d2d@mind.be>
Date: Mon, 22 Nov 2021 23:40:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "buildroot@busybox.net" <buildroot@busybox.net>
References: <PH0PR12MB54010CCFB1F1B2A7C1090802A1999@PH0PR12MB5401.namprd12.prod.outlook.com>
 <2d4b5386-ceee-43cd-774f-bc707d26a203@mind.be>
Organization: Essensium/Mind
In-Reply-To: <2d4b5386-ceee-43cd-774f-bc707d26a203@mind.be>
Subject: Re: [Buildroot] utils/genrandconfig discards all pre-defined
 BR2_PACKAGE_ packages
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
Cc: ARC Buildroot mailing list <arc-buildroot@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIyLzExLzIwMjEgMjA6MTMsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAxNi8xMS8yMDIxIDE3OjMxLCBBbGV4ZXkgQnJvZGtpbiB3cm90ZToKPj4gSGVsbG8sCj4+Cj4+
IFdoaWxlIHBsYXlpbmcgd2l0aCBCdWlsZHJvb3QgYXV0b2J1aWxkZXIgIm5vZGVzIiBJIG5vdGlj
ZWQgb25lIHN0cmFuZ2UKPj4gYmVoYXZpb3I6IGlmIEkgYWRkICJCUjJfUEFDS0FHRV94eHg9eXl5
IiBpbiBteSBhcmNoaXRlY3R1cmUncyBjb25maWcgZnJhZ21lbnQKPj4gKEkgbWVhbiB0aG9zZSBp
biAic3VwcG9ydC9jb25maWctZnJhZ21lbnRzL2F1dG9idWlsZCIpIG1vc3QgbGlrZWx5IGl0IHdv
bid0Cj4+IGFwcGVhciBpbiB0aGUgcmVzdWx0aW5nICIuY29uZmlnIi4gV2VsbCwgdW5sZXNzIGl0
IGdldHMgY29uZmlndXJlZCBiYWNrIGJ5IHRoZQo+PiByYW5kb20gY29uZmlndXJhdGlvbiBzZWxl
Y3Rvci4gV2hpY2ggdG8gbWUgbG9va3MgYSBiaXQgaW5jb3JyZWN0Lgo+Pgo+PiBGaXJzdCwgd2h5
IHdhcyBJIGRvaW5nIHRoYXQ6IEkgd2FudGVkIHRvIGZpeCBhIGhlYWRlcnMgdmVyc2lvbiB3aXRo
Cj4+ICJCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NX3hfeT15Ii4gQW5kIHRv
IG1lIGl0IHdhcwo+PiBub3QgYSBwYWNrYWdlLCBidXQgYSBwcm9wZXJ0eSBvZiB0aGUgdG9vbGNo
YWluLCBzbyBjb3VsZCBiZSBraW5kYSBsZWdpdGltYXRlCj4+IHVzZSBvZiB0aGUgZnJhZ21lbnQg
KHRob3VnaCB5b3UgbWF5IGFyZ3VlIGZvciBzdXJlKS4KPj4KPj4gVGhlbiB0aGVyZSdzIGFub3Ro
ZXIgb2JzZXJ2YXRpb24gdG8gbWFrZSB0aGF0IGNhc2UgYSBiaXQgc3Ryb25nZXIgaWYgeW91IHdp
bGwgOykKPj4gV2UgZG8gYXBwZW5kICJzdXBwb3J0L2NvbmZpZy1mcmFnbWVudHMvbWluaW1hbC5j
b25maWciIHRvIGFueSBnaXZlbiBmcmFnbWVudAo+PiB3aXRoIHJhdGlvbmFsZSBvZiAiZGlzYWJs
aW5nIEJ1aWxkcm9vdCBvcHRpb25zIHRoYXQgYXJlIHR1cm5lZCBvbiBieSBkZWZhdWx0LAo+PiBp
biBvcmRlciB0byBhcnJpdmUgYXQgbWluaW1hbCBidWlsZCB0aW1lIi4gQW5kIHNvbWUgb2YgaXRz
IGVudHJpZXMgYXJlIAo+PiBCUjJfUEFDS0FHRV94eDoKPj4gwqAgLSAjIEJSMl9QQUNLQUdFX0JV
U1lCT1ggaXMgbm90IHNldAo+PiDCoCAtIEJSMl9QQUNLQUdFX0JVU1lCT1hfU0hPV19PVEhFUlM9
eQo+Pgo+PiBBbmQgdGhvc2UgMiB3aWxsIGRpc2FwcGVhciBpbiB0aGUgZW5kIGFzIHdlbGwsIHdo
aWxlIEkgZ3Vlc3Mgd2UnZCBsaWtlIHRoZW0gCj4+IHRvIGJlIGFwcGxpZWQuCj4KPiDCoEkgY29t
cGxldGVseSBhZ3JlZSB0aGF0IHdlIHdhbnQgdGhlbSB0byBiZSBhcHBsaWVkIQo+Cj4KPj4gwqBG
cm9tIHdoYXQgSSBtYXkgc2VlIGl0IGhhcHBlbnMgYmVjYXVzZSBvZiB0aGlzIHBhcnQgaW4gdGhl
IHJvb3QgTWFrZWZpbGU6Cj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0+OC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+PiByYW5kcGFja2FnZWNvbmZpZyAuLi4gOiAkKEJVSUxEX0RJUikv
YnVpbGRyb290LWNvbmZpZy9jb25mIG91dHB1dG1ha2VmaWxlCj4+IMKgwqDCoMKgQGdyZXAgLXYg
QlIyX1BBQ0tBR0VfICQoQlIyX0NPTkZJRykgPiAkKENPTkZJR19ESVIpLy5jb25maWcubm9wa2cK
Pj4gwqAgInV0aWxzL2dlbnJhbmRjb25maWciCj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0+OC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiBhbmQgIm1ha2UgcmFuZHBhY2thZ2Vjb25m
aWciIGlzIGJlaW5nIGNhbGxlZCBmcm9tICJ1dGlscy9nZW5yYW5kY29uZmlnIi4KPj4KPj4gVGhl
IGZpcnN0IHRoaW5nIEkgdGhvdWdoIG9mIHdhcyByZW1vdmFsIG9mIHRoYXQgZmlsdGVyaW5nIHRv
Z2V0aGVyIHdpdGgKPj4gdGhlIGZpcnN0ICIuY29uZmlnIiBleHBhbnNpb24gaW4gdGhlICJ1dGls
cy9nZW5yYW5kY29uZmlnIiB3aXRoICJtYWtlIAo+PiBvbGRkZWZjb25maWciCj4KPiDCoFdlbGws
IHRoYXQga2luZCBvZiBkZWZlYXRzIHRoZSBwdXJwb3NlIG9mIHJhbmRwYWNrYWdlY29uZmlnIChh
bmQgZXNwZWNpYWxseSAKPiBhbGxub3BhY2thZ2Vjb25maWcpLiBUaGUgaWRlYSBvZiB0aG9zZSB0
YXJnZXRzIGlzIHRvIHRha2UgYW4gZXhpc3RpbmcgY29uZmlnIAo+IGFuZCBkbyB0aGUgcmFuZC9h
bGxuby9hbGx5ZXMgb24gb25seSB0aGUgcGFja2FnZSBwYXJ0Lgo+Cj4gwqBBIGJldHRlciBzb2x1
dGlvbiBpcyB0byBjaGFuZ2UgZ2VucmFuZGNvbmZpZyBpdHNlbGYuCj4gLSBDcmVhdGUgdGhlIHBh
cnRpYWwgY29uZmlnIGluIGEgZGlmZmVyZW50IGZpbGUsIGUuZy4gLmNvbmZpZy5pbi4KPiAtIFJ1
biByYW5kY29uZmlnIGluc3RlYWQgb2YgcmFuZHBhY2thZ2Vjb25maWcuCj4gLSBTZXQgS0NPTkZJ
R19BTExDT05GSUc9e2J1aWxkZGlyfS5jb25maWcuaW4gaW4gdGhlIGVudmlyb25tZW50Lgo+Cj4g
wqBJIHRoaW5rIHRoZSBLQ09ORklHX0FMTENPTkZJRyBpcyB0aGUgb25seSByZWFsIGRpZmZlcmVu
Y2UgYmV0d2VlbiByYW5kY29uZmlnIAo+IGFuZCByYW5kcGFja2FnZWNvbmZpZy4KCiDCoFNjcmF0
Y2ggdGhhdCwgdGhlcmUncyBhbiBpbXBvcnRhbnQgYWRkaXRpb25hbCBkaWZmZXJlbmNlOiByYW5k
cGFja2FnZWNvbmZpZyAKYWxzbyBmaXhlcyBhbGwgdGhlIG90aGVyIG5vbi1wYWNrYWdlIG9wdGlv
bnMuIEluIHBhcnRpY3VsYXIsIHRoZSBkaWZmZXJlbnQgCmNob2ljZXMgaW4gYXJjaCwgdG9vbGNo
YWluIGFuZCBidWlsZCBvcHRpb25zIG1lbnUgd2lsbCBiZSBmdWxseSByYW5kb21pemVkIAp1bmxl
c3MgdGhleSdyZSBzcGVjaWZpZWQgZXhwbGljaXRseSBpbiB0aGUgY29uZmlnIGZyYWdtZW50LiBU
aGlzIGlzIG9mdGVuIG5vdCAKdGhlIGNhc2UsIGUuZy4gZm9yIHRoZSBmbG9hdGluZyBwb2ludCBv
cHRpb25zIGZvciBBUk0sIGJ1dCBhbHNvIGUuZy4gIlRvb2xjaGFpbiAKb3JpZ2luIiBmb3IgdGhl
IGV4dGVybmFsIHRvb2xjaGFpbnMuIFRoZXJlZm9yZSwgdGhlIGNvbmZpZyBmcmFnbWVudHMgYWxz
byBoYXZlIAp0byBiZSB1cGRhdGVkIHdpdGggZXhwbGljaXQgY2hvaWNlcyBmb3IgYWxsIHRoZSBv
cHRpb25zIChleGNlcHQgc29tZSB0aGF0IHdlIAptYXliZSAqZG8qIHdhbnQgdG8gYmUgcmFuZG9t
aXplZCwgbGlrZSBzb21lIG9mIHRoZSBidWlsZCBvcHRpb25zKS4KCgo+Cj4KPj4gbGlrZSB0aGF0
IGFzc3VtaW5nIHRoYXQgIm9sZGRlZmNvbmZpZyIgaXMgYmVpbmcgY2FsbGVkIGluICJyYW5kcGFj
a2FnZWNvbmZpZyIKPj4gdGFyZ2V0IGFueXdheToKPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLT44LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBi
L01ha2VmaWxlCj4+IGluZGV4IGY5Y2YwZjRjYjMuLjFhYzMzZDlkYTMgMTAwNjQ0Cj4+IC0tLSBh
L01ha2VmaWxlCj4+ICsrKyBiL01ha2VmaWxlCj4+IEBAIC0xMDA0LDcgKzEwMDQsNyBAQCByYW5k
Y29uZmlnIGFsbHllc2NvbmZpZyBhbGxkZWZjb25maWcgYWxsbm9jb25maWc6IAo+PiAkKEJVSUxE
X0RJUikvYnVpbGRyb290LWNvbmZpZy8KPj4gwqDCoMKgwqDCoMKgwqDCoCBAJChDT01NT05fQ09O
RklHX0VOVikgJDwgLS1vbGRkZWZjb25maWcgJChDT05GSUdfQ09ORklHX0lOKSA+L2Rldi9udWxs
Cj4+Cj4+IMKgIHJhbmRwYWNrYWdlY29uZmlnIGFsbHllc3BhY2thZ2Vjb25maWcgYWxsbm9wYWNr
YWdlY29uZmlnOiAKPj4gJChCVUlMRF9ESVIpL2J1aWxkcm9vdC1jb25maWcvY29uZiBvdXRwdXRt
YWtlZmlsZQo+PiAtwqDCoMKgwqDCoMKgIEBncmVwIC12IEJSMl9QQUNLQUdFXyAkKEJSMl9DT05G
SUcpID4gJChDT05GSUdfRElSKS8uY29uZmlnLm5vcGtnCj4+ICvCoMKgwqDCoMKgwqAgQGNhdCAk
KEJSMl9DT05GSUcpID4gJChDT05GSUdfRElSKS8uY29uZmlnLm5vcGtnCj4+IMKgwqDCoMKgwqDC
oMKgwqAgQCQoQ09NTU9OX0NPTkZJR19FTlYpIFNLSVBfTEVHQUNZPXkgXAo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBLQ09ORklHX0FMTENPTkZJRz0kKENPTkZJR19ESVIpLy5j
b25maWcubm9wa2cgXAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAkPCAtLSQo
c3Vic3QgcGFja2FnZSwsJEApICQoQ09ORklHX0NPTkZJR19JTikKPj4gZGlmZiAtLWdpdCBhL3V0
aWxzL2dlbnJhbmRjb25maWcgYi91dGlscy9nZW5yYW5kY29uZmlnCj4+IGluZGV4IDYyMmNmZDQ4
OTEuLjUyMzRhMDcyNmYgMTAwNzU1Cj4+IC0tLSBhL3V0aWxzL2dlbnJhbmRjb25maWcKPj4gKysr
IGIvdXRpbHMvZ2VucmFuZGNvbmZpZwo+PiBAQCAtMzkyLDkgKzM5Miw2IEBAIGRlZiBnZW5fY29u
ZmlnKGFyZ3MpOgo+PiDCoMKgwqDCoMKgIHdpdGggb3Blbihjb25maWdmaWxlLCAidysiKSBhcyBj
b25maWdmOgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY29uZmlnZi53cml0ZWxpbmVzKGNvbmZpZ2xp
bmVzKQo+Pgo+PiAtwqDCoMKgIHN1YnByb2Nlc3MuY2hlY2tfY2FsbChbIm1ha2UiLCAiTz0lcyIg
JSBhcmdzLm91dHB1dGRpciwgIi1DIiwgCj4+IGFyZ3MuYnVpbGRyb290ZGlyLAo+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAib2xkZGVmY29u
ZmlnIl0pCj4KPiDCoFRoaXMgY2hhbmdlIGNhbiBiZSBkb25lIGluZGVwZW5kZW50bHksIHJpZ2h0
PwoKIMKgQW5kIEkgc2VlIG5vdyB0aGF0IHRoaXMgaXMgbm90IHNvbWV0aGluZyB0aGF0IGNhbiBi
ZSByZW1vdmVkOiBpdCdzIGV4YWN0bHkgCnRoaXMgY29tbWFuZCB0aGF0IG1ha2VzIHN1cmUgdGhl
IGNvbmZpZyBmcmFnbWVudHMgYXJlIGV4dGVuZGVkIHRvIHRoZWlyIGZ1bGwgCihkZWZhdWx0KSB2
YWx1ZXMgYmVmb3JlIHBhc3NpbmcgaXQgaW50byBLQ09ORklHX0FMTENPTkZJRy4KCgogwqBSZWdh
cmRzLAogwqBBcm5vdXQKCgo+Cj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4KPj4gLQo+PiDCoMKg
wqDCoMKgIGlmIG5vdCBpc190b29sY2hhaW5fdXNhYmxlKGNvbmZpZ2ZpbGUsIHRvb2xjaGFpbmNv
bmZpZyk6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMgo+PiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tPjgtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4KPj4gQnV0IEknbSBub3Qg
c3VyZSBpZiB0aGF0IGFwcHJvYWNoIGlzIGNvcnJlY3QgaW4gc29sdmluZyBvYnNlcnZlZCBwcm9i
bGVtLgo+Pgo+PiBBbnkgdGhvdWdodHMgb24gdGhpcyBvbmU/Cj4+Cj4+IC1BbGV4ZXkKPj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
