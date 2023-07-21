Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B95EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 22:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B528580E62;
	Fri, 21 Jul 2023 22:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B528580E62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWV_VLhVXnhh; Fri, 21 Jul 2023 22:16:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9FDA83ABB;
	Fri, 21 Jul 2023 22:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9FDA83ABB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 20EB61BF30D
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 22:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0766A83ABB
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 22:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0766A83ABB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MfEORBiVY3rF for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 22:16:27 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4DF783AB2
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 22:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4DF783AB2
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbc0609cd6so20455965e9.1
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 15:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689977785; x=1690582585;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=toum4HmTvecycLB7cBnaamrCQ/83eXdprU6lsTkp5g4=;
 b=NPXqoU8BrSo5gOQBUud6MK+O1ROgydii7urpPv4r2GcLueEgbgeTdPFWIKUmMaBxHE
 A7ZM0JZCTmlWYYOb01dQXEeF1lNpRF/qgwGFbQ84JqIjXzvB+G6fcQIIK13rr0mGrOHr
 +VxtugtRXjMViQWj0UWVcNdLwWhUx3fYCPqyOLv6zL3LGevuUABqEVW3X0MdKsckRxSi
 JKFT7jWcHxiFC9zm+yWlq3THzPTB/rsNTVt0q6yyhmkQI+oeHDTYdCdHLcgPOd+/ML0Z
 1RI23wbkqMHyJa77urn2I8Gx1BuCLeq9qczO+dqWcztIXGXBP8jIIbT4NijNbmx1GCAn
 V1Xg==
X-Gm-Message-State: ABy/qLa79Sn8HQi7xy1RmqM7N6BrAl6QYqMGar6BDNMoxCKQYrv7Nqx1
 3EaSxWL+qkIVArGo8z2fj04=
X-Google-Smtp-Source: APBJJlFTWlARxwfbhZu33PYalxhGz1VoRk8CUaYDwTF9efvihfCFFnaRgBr9mrK0Yc9niKOhvk31Cg==
X-Received: by 2002:a1c:7708:0:b0:3fb:b299:6eba with SMTP id
 t8-20020a1c7708000000b003fbb2996ebamr2309472wmi.4.1689977784645; 
 Fri, 21 Jul 2023 15:16:24 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:20e:c6ff:fec6:8e56?
 (2a01cb05945b7e00020ec6fffec68e56.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:20e:c6ff:fec6:8e56])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a7bcb56000000b003fbb5506e54sm4078636wmj.29.2023.07.21.15.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jul 2023 15:16:24 -0700 (PDT)
Message-ID: <0417e6b6-af18-b246-3968-efcc87d8a41b@gmail.com>
Date: Sat, 22 Jul 2023 00:16:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20230721202757.15824-1-ju.o@free.fr>
Content-Language: en-US
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20230721202757.15824-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689977785; x=1690582585;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=toum4HmTvecycLB7cBnaamrCQ/83eXdprU6lsTkp5g4=;
 b=d5n4MviUi9TlW5Z2chPxA0BQQAbWOZ82QWEbWSjEMmW+gZ+WTmvHS2mkQG2GLZznR5
 52KSyAeEjX2yDyRl//mDx5Ib+XM4ejLbvlgRSyzmUfv83hhsTKZbNw94dxZGxou6iVtz
 JWodUo9Rfzq2DPbwnbcxUog28UUK/NVN7h9aAfeus0SxDTMkiG9yzZZGzN4uDgCKQIuv
 +MJouZUXx6wSEWF8ZAHkg10MAjLC68UhQkNon1QJpDSVVU0UhA90dg1GthajhpPU0Gek
 bWiS96OTeHqzmy3XZw2lkXFW85o6qo6gmO3v1qS8R2ywOyKj9BzwZqGxMtrTNLFZWWp0
 Pf0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=d5n4MviU
Subject: Re: [Buildroot] [PATCH 1/1] boot/edk2: introduce a new
 _OVMF_DEBUG_ON_SERIAL option
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKTGUgMjEvMDcvMjAyMyDDoCAyMjoyNywgSnVsaWVuIE9saXZhaW4gYSDDqWNy
aXTCoDoKPiBXaGVuIEVESzIgT1ZNRiBpcyBidWlsdCB3aXRoIGRlYnVnLCBtZXNzYWdlcyBhcmUg
cHJpbnRlZCB0bwo+IElPIHBvcnQgMHg0MDIuIFRob3NlIG1lc3NhZ2VzIGFyZSBub3Qgc2hvd24g
aW4gdGhlIG5vcm1hbAo+IFFlbXUgZW11bGF0ZWQgc2VyaWFsIHBvcnQuIEVuYWJsaW5nIHRoaXMg
b3B0aW9uIHdpbGwgcHJpbnQKPiBkZWJ1ZyBtZXNzYWdlcyBvbiB0aGUgZW11bGF0ZWQgc2VyaWFs
IHBvcnQsIHBvdGVudGlhbGx5Cj4gbWl4aW5nIG1lc3NhZ2VzIHdpdGggVUVGSSBzZXJpYWwgY29u
c29sZSBvdXRwdXQuCj4gCj4gU2VlIE9WTUYgUkVBRE1FOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS90
aWFub2NvcmUvZWRrMi9ibG9iL21hc3Rlci9Pdm1mUGtnL1JFQURNRQo+IAo+IFRoaXMgb3B0aW9u
IGhhcyBiZWVuIHVzZWZ1bCB0byBkZWJ1ZyBwcm9ibGVtcyBzdWNoIGFzIFsxXSwgaW4gd2hpY2gg
dGhlCj4gZW11bGF0b3Igd2FzIGhhbmdpbmcgYXQgc3RhcnR1cCB3aXRob3V0IGFueSBsb2cuIEVu
YWJsaW5nIHRoaXMgb3B0aW9uCj4gc2hvdyB0aGUgZGVidWcgbWVzc2FnZSBvbiB0aGUgY29uc29s
ZSwgYmVmb3JlIGhhbmdpbmc6Cj4gCj4gICAgIC4uLgo+ICAgICBQbGF0Zm9ybUNwdUNvdW50QnVn
Q2hlY2s6IFByZXNlbnQ9MCBQb3NzaWJsZT0xCj4gICAgIFBsYXRmb3JtQ3B1Q291bnRCdWdDaGVj
azogQnJva2VuIENQVSBob3RwbHVnIHJlZ2lzdGVyIGJsb2NrIGZvdW5kLiBVcGRhdGUgUUVNVSB0
byB2ZXJzaW9uIDgrLCBvcgo+ICAgICBQbGF0Zm9ybUNwdUNvdW50QnVnQ2hlY2s6IHRvIGEgc3Rh
YmxlIHJlbGVhc2Ugd2l0aCBjb21taXQgZGFiMzBmYmVmMzg5IGJhY2twb3J0ZWQuIFJlZmVyIHRv
Cj4gICAgIFBsYXRmb3JtQ3B1Q291bnRCdWdDaGVjazogPGh0dHBzOi8vYnVnemlsbGEudGlhbm9j
b3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9NDI1MD4uCj4gICAgIC4uLgo+IAo+IFsxXSBodHRwOi8v
bGlzdHMuYnVzeWJveC5uZXQvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDIzLUp1bHkvNjcwODA3Lmh0
bWwKClRlc3RlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgoKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+IC0tLQo+ICBi
b290L2VkazIvQ29uZmlnLmluIHwgMTUgKysrKysrKysrKysrKysrCj4gIGJvb3QvZWRrMi9lZGsy
Lm1rICAgfCAgNiArKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL2Jvb3QvZWRrMi9Db25maWcuaW4gYi9ib290L2VkazIvQ29uZmlnLmlu
Cj4gaW5kZXggODU1YTYyZjcwYi4uYmVkNTAzYjE2OCAxMDA2NDQKPiAtLS0gYS9ib290L2VkazIv
Q29uZmlnLmluCj4gKysrIGIvYm9vdC9lZGsyL0NvbmZpZy5pbgo+IEBAIC0xMDgsNiArMTA4LDIx
IEBAIGNvbW1lbnQgIlFFTVUgU0JTQSBkZXBlbmRzIG9uIEFURiBub3QgdXNpbmcgRURLMiBhcyBC
TDMzIgo+ICAKPiAgZW5kY2hvaWNlCj4gIAo+ICtjb25maWcgQlIyX1RBUkdFVF9FREsyX09WTUZf
REVCVUdfT05fU0VSSUFMCj4gKwlib29sICJPVk1GIERlYnVnIG9uIFNlcmlhbCIKPiArCWRlcGVu
ZHMgb24gQlIyX0VOQUJMRV9ERUJVRwo+ICsJZGVwZW5kcyBvbiBCUjJfVEFSR0VUX0VESzJfUExB
VEZPUk1fT1ZNRl9JMzg2IHx8IFwKPiArCQlCUjJfVEFSR0VUX0VESzJfUExBVEZPUk1fT1ZNRl9Y
NjQKPiArCWhlbHAKPiArCSAgV2hlbiBFREsyIE9WTUYgaXMgYnVpbHQgd2l0aCBkZWJ1ZywgbWVz
c2FnZXMgYXJlIHByaW50ZWQgdG8KPiArCSAgSU8gcG9ydCAweDQwMi4gVGhvc2UgbWVzc2FnZXMg
YXJlIG5vdCBzaG93biBpbiB0aGUgbm9ybWFsCj4gKwkgIFFlbXUgZW11bGF0ZWQgc2VyaWFsIHBv
cnQuIEVuYWJsaW5nIHRoaXMgb3B0aW9uIHdpbGwgcHJpbnQKPiArCSAgZGVidWcgbWVzc2FnZXMg
b24gdGhlIGVtdWxhdGVkIHNlcmlhbCBwb3J0LCBwb3RlbnRpYWxseQo+ICsJICBtaXhpbmcgbWVz
c2FnZXMgd2l0aCBVRUZJIHNlcmlhbCBjb25zb2xlIG91dHB1dC4KPiArCj4gKwkgIFNlZSBPVk1G
IFJFQURNRToKPiArCSAgaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyL2Jsb2IvbWFz
dGVyL092bWZQa2cvUkVBRE1FPiArCj4gIGNvbmZpZyBCUjJfVEFSR0VUX0VESzJfRkRfTkFNRQo+
ICAJc3RyaW5nCj4gIAlkZWZhdWx0ICJPVk1GIiBpZiBCUjJfVEFSR0VUX0VESzJfUExBVEZPUk1f
T1ZNRl9JMzg2Cj4gZGlmZiAtLWdpdCBhL2Jvb3QvZWRrMi9lZGsyLm1rIGIvYm9vdC9lZGsyL2Vk
azIubWsKPiBpbmRleCAzOTliZDM0NmVmLi4xZWQyMmQ4N2RhIDEwMDY0NAo+IC0tLSBhL2Jvb3Qv
ZWRrMi9lZGsyLm1rCj4gKysrIGIvYm9vdC9lZGsyL2VkazIubWsKPiBAQCAtNTUsNiArNTUsOSBA
QCBFREsyX0RFUEVOREVOQ0lFUyArPSBob3N0LW5hc20KPiAgRURLMl9QQUNLQUdFX05BTUUgPSBP
dm1mUGtnCj4gIEVESzJfUExBVEZPUk1fTkFNRSA9IE92bWZQa2dJYTMyCj4gIEVESzJfQlVJTERf
RElSID0gT3ZtZklhMzIKPiAraWZlcSAoJChCUjJfVEFSR0VUX0VESzJfT1ZNRl9ERUJVR19PTl9T
RVJJQUwpLHkpCj4gK0VESzJfQlVJTERfT1BUUyArPSAtRERFQlVHX09OX1NFUklBTF9QT1JUPVRS
VUUKPiArZW5kaWYKCkluZGVlZCwgREVCVUdfT05fU0VSSUFMX1BPUlQgb25seSB3b3JrcyB3aGVu
IGVkazIgaXMgYnVpbHQgaW4gZGVidWcgbW9kZSwgc28KQlIyX0VOQUJMRV9ERUJVRyBpcyByZWFs
bHkgbmVlZGVkLgoKUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWls
LmNvbT4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAgCj4gIGVsc2UgaWZlcSAoJChCUjJfVEFS
R0VUX0VESzJfUExBVEZPUk1fT1ZNRl9YNjQpLHkpCj4gIEVESzJfQVJDSCA9IFg2NAo+IEBAIC02
Miw2ICs2NSw5IEBAIEVESzJfREVQRU5ERU5DSUVTICs9IGhvc3QtbmFzbQo+ICBFREsyX1BBQ0tB
R0VfTkFNRSA9IE92bWZQa2cKPiAgRURLMl9QTEFURk9STV9OQU1FID0gT3ZtZlBrZ1g2NAo+ICBF
REsyX0JVSUxEX0RJUiA9IE92bWZYNjQKPiAraWZlcSAoJChCUjJfVEFSR0VUX0VESzJfT1ZNRl9E
RUJVR19PTl9TRVJJQUwpLHkpCj4gK0VESzJfQlVJTERfT1BUUyArPSAtRERFQlVHX09OX1NFUklB
TF9QT1JUPVRSVUUKPiArZW5kaWYKPiAgCj4gIGVsc2UgaWZlcSAoJChCUjJfVEFSR0VUX0VESzJf
UExBVEZPUk1fQVJNX1ZJUlRfUUVNVSkseSkKPiAgRURLMl9BUkNIID0gQUFSQ0g2NAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
