Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E879CC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 14:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A27F60E1D;
	Sun,  3 Apr 2022 14:07:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oLXd4gU3Qm5d; Sun,  3 Apr 2022 14:07:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 618D460E02;
	Sun,  3 Apr 2022 14:07:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90DD01BF387
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 14:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CE5883486
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 14:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iiV341Kb9aqF for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 14:07:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 553718345D
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 14:07:20 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id dr20so14936050ejc.6
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 07:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=4L1lN7pPR8WwxHKFKTEqnXyn86bDZBfcjH4zWP9jXc0=;
 b=UQKK7n4+cUwvLu3TUcm3ga4Ln3Yuf/oQzuv+QlK2Y3tQNlUCbh1vbHgqaxYXCDwH0p
 JYF/Z+hjGa1nGGAJ8jfE1z9PU9IkeUfEAJfnWkvcLJ5Nx/dkdn7iZtqzzizIObYoIu78
 /z7YDgaZATqlEh8ivJu/RvJEVKrulgjFlIGSUcD4irPqfofnYKVWNr181IoMxAoXxrzs
 DYuIo46MoFgU7GQx78zi1/LwH32EUeUoFac3x+WGQjksAspesJ3xmRdFlbtK7rHrvmh1
 5RGzCzH5yWtAl3rM/I+Ocuc86o1hoeO6B9Gkojhvj6KQAFlBcXC8mEYFmGa21DAraTDz
 aZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=4L1lN7pPR8WwxHKFKTEqnXyn86bDZBfcjH4zWP9jXc0=;
 b=DKXMe7pXTm8XUOGNy/udXFZHWipmwh5JdwSqfYgF9IJDS82UYoyn4HfNLoAOiDqp6C
 8khfrDY6pdmeZBd/XkI3hgPPimfNRd81xCv4qKhPnXcV1rBKOyTu+dvF2wzlnX06m9ED
 B9L5R8UDAsq5PZMj02VSbgtnjMWxmuE5jkbXzTC5Pp2IUif7aNM6BQG+/cyX/q7ee4ro
 rT2DVU1+Sh6B/WXSgTd7dEnNzIUO6pGreO+GWWbBx2UdJKYgk8hDDsuTzTeOPXLcPTbl
 UXCxL9UZ77s4BPv5ZOWdJCTo4+SVnNIAa8H0l3ok8OyCG9qmfGNPVbU6T41qx/VHCADi
 IUhw==
X-Gm-Message-State: AOAM533UVG0DMPs+FxkjHMIrIY/t+X16HADO3Wuoe8rJ+jp4gHHrrkei
 hP7FNNP5T925PSBlx5D2q8iDrA==
X-Google-Smtp-Source: ABdhPJyVQQBj8VZhEgd0v3HB+/Emm1lB11dboqzif21Qi2vK9m7qPDVu7bOWsVitjz5XcDEOjg+CmQ==
X-Received: by 2002:a17:906:c14b:b0:6da:b30d:76a0 with SMTP id
 dp11-20020a170906c14b00b006dab30d76a0mr7046679ejc.279.1648994838495; 
 Sun, 03 Apr 2022 07:07:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425?
 (ptr-9fplejof7ird5pjql2d.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a17090651d100b006dfa26428bcsm3258582ejk.108.2022.04.03.07.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Apr 2022 07:07:18 -0700 (PDT)
Message-ID: <f5f21f8c-0fea-e227-7102-68ec04a4ee15@mind.be>
Date: Sun, 3 Apr 2022 16:07:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220402010559.410834-1-james.hilliard1@gmail.com>
 <34c73050-b148-7887-63ec-56f1e90c854e@mind.be>
 <CADvTj4oJnqUCN2MuTh+vUh8mPcpR7xa2OWX-RBJTA0Xb9CJcDA@mail.gmail.com>
 <7fa02b77-d609-4cd4-5b93-b8f58c50b45f@mind.be>
Organization: Essensium/Mind
In-Reply-To: <7fa02b77-d609-4cd4-5b93-b8f58c50b45f@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add randconfig
 based --no-toolchains-csv option
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDAzLzA0LzIwMjIgMTU6NTgsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAwMi8wNC8yMDIyIDIwOjU4LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPj4gT24gU2F0LCBBcHIg
MiwgMjAyMiBhdCAxMDoyOSBBTSBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+
IHdyb3RlOgo+Pj4KPj4+IMKgwqAgSGkgSmFtZXMsCj4+Pgo+Pj4gT24gMDIvMDQvMjAyMiAwMzow
NSwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gW3NuaXBdCj4+Pj4gK8KgwqDCoCBpZiAnQlIyX1JP
T1RGU19TS0VMRVRPTl9DVVNUT009eVxuJyBpbiBjb25maWdsaW5lcyBhbmQgXAo+Pj4+ICvCoMKg
wqDCoMKgwqAgJ0JSMl9ST09URlNfU0tFTEVUT05fQ1VTVE9NX1BBVEg9IiJcbicgaW4gY29uZmln
bGluZXM6Cj4+Pj4gKyBjb25maWdsaW5lcy5yZW1vdmUoJ0JSMl9ST09URlNfU0tFTEVUT05fQ1VT
VE9NPXlcbicpCj4+Pgo+Pj4gwqDCoCBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IGZvciB0aGlzIHBh
cnRpY3VsYXIgb25lIHlvdSByZW1vdmUgaXQgZXhwbGljaXRseSwgCj4+PiB3aGlsZQo+Pj4gZm9y
IG90aGVyIGNhc2VzIHlvdSByZWx5IChJIGd1ZXNzKSBvbiB0aGUgZGVwZW5kZW5jeSBjaGVjayB0
byBtYWtlIHN1cmUgd2UgCj4+PiBnZXQgYQo+Pj4gdmFsaWQgY29uZmlnIChldmVudHVhbGx5KS4K
Pj4KPj4gT3RoZXJzIHdlcmUgbWlzc2luZyB0aGUgZW1wdHkgc3RyaW5nIGNvbmZpZyBmb3IgbWF0
Y2hpbmcgYWdhaW5zdCBzbwo+PiB0aGlzIGFwcHJvYWNoCj4+IGRpZG4ndCBzZWVtIHRvIHdvcmsg
dGhlcmUuCj4KPiDCoEkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZC4uLiBJZiBJIGhhdmUgdGhlIHRp
bWUsIEknbGwgdHJ5IHRvIGNvb2sgdXAgYSBwYXRjaCAKPiB0aGF0IGRvZXMgdGhlIGNoZWNrIHRo
ZSBzYW1lIHdheSBhcyBhbGwgdGhlIG90aGVyIGNoZWNrcyBhcmUgZG9uZSwgYW5kIHlvdSBhbiAK
PiB0ZWxsIG1lIGlmIHlvdSdyZSBoYXBweSB3aXRoIHRoYXQuCgogwqBMb29rcyBsaWtlIHRoZSBj
aGVjayBpcyBhbHJlYWR5IHRoZXJlIGluIHNrZWxldG9uLWN1c3RvbS5tazoKCmlmZXEgKCQoQlIy
X1BBQ0tBR0VfU0tFTEVUT05fQ1VTVE9NKSQoQlJfQlVJTERJTkcpLHl5KQppZmVxICgkKFNLRUxF
VE9OX0NVU1RPTV9QQVRIKSwpCiQoZXJyb3IgTm8gcGF0aCBzcGVjaWZpZWQgZm9yIHRoZSBjdXN0
b20gc2tlbGV0b24pCmVuZGlmCmVuZGlmCgpTbyBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHRoaXMg
Zml4dXAgaXMgbmVlZGVkLi4uCgoKIMKgUmVnYXJkcywKIMKgQXJub3V0CgoKPgo+IFtzbmlwXQo+
Pj4gwqDCoCBJIGFncmVlIHRob3VnaCB0aGF0IGl0J3MgbW9yZSB3b3JrIHRvIGRvIHRoYXQgdGhh
biB0aGUgY3VycmVudCBwYXRjaCwgc28KPj4+IHBlcmhhcHMgdGhpcyBpcyBhIGdvb2QgZmlyc3Qg
c3RlcC4KPj4KPj4gWWVhaCwgYmVzdCB0byBkbyB0aGlzIGluY3JlbWVudGFsbHkgSU1PLCBzaW5j
ZSB0aGlzIGlzIHJldmVhbGluZyBpc3N1ZXMgYWxyZWFkeQo+PiBpbiB0aGUgYXV0b2J1aWxkZXIg
cmVsYXRpbmcgdG8gY29uZmlnIHZhbGlkYXRpb24gSSdtIHJ1bm5pbmcgdGhpcyBvbjoKPj4gaHR0
cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0Lz9zdWJtaXR0ZXI9SmFtZXMrSGlsbGlhcmQrJTI4
YXNhaGktbWluaSUyOQo+Cj4gwqBTbyB0aGlzIGlzIHJ1bm5pbmcgYSBtb2RpZmllZCBidWlsZHJv
b3QtdGVzdCB0aGF0IHBhc3NlcyB0aGUgCj4gLS1uby10b29sY2hhaW5zLWNzdiBvcHRpb24/Cj4K
Pj4gTm90ZSB0aGF0IHRoaXMgYXV0b2J1aWxkZXIgaXMgYW4gYWFyY2g2NChydW5uaW5nCj4+IGh0
dHBzOi8vYXNhaGlsaW51eC5vcmcvKSBob3N0IHNvCj4+IGl0IGRvZXNuJ3QgdXNlIHRoZSBwcmVi
dWlsdCB0b29sY2hhaW5zLgo+Cj4gW3NuaXBdCj4+Pj4gLcKgwqDCoCBzdWJwcm9jZXNzLmNoZWNr
X2NhbGwoWyJtYWtlIiwgIk89JXMiICUgYXJncy5vdXRwdXRkaXIsICItQyIsIAo+Pj4+IGFyZ3Mu
YnVpbGRyb290ZGlyLAo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICJzYXZlZGVmY29uZmlnIl0pCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgc3VicHJvY2Vzcy5jaGVja19jYWxsKFsibWFrZSIsICJPPSVzIiAlIGFyZ3Mub3V0
cHV0ZGlyLCAKPj4+PiAiLUMiLCBhcmdzLmJ1aWxkcm9vdGRpciwKPj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgInNhdmVkZWZjb25maWciXSk6Cj4+Pgo+Pj4gwqDCoCBUaGlzIG9uZSBzaG91bGQgc2lt
cGx5IG5ldmVyIGZhaWwsIHNvIGl0IHNob3VsZCBtb3ZlIG91dHNpZGUgb2YgdGhlIGxvb3AsCj4+
PiBhZnRlciBjaGVja2luZyBkZXBlbmRlbmNpZXMuCj4+Cj4+IEkganVzdCB0ZXN0ZWQgdGhhdCB0
aGlzIGNhbiBmYWlsIHNvIEkndmUga2VwdCBpdCBpbiB0aGUgbG9vcCBmb3Igbm93Lgo+Cj4gwqBP
a2F5LCBsZXQgbWUgcmVwaHJhc2U6IGlmICdtYWtlIGRlcGVuZGVuY2llcycgcGFzc2VzLCB0aGVu
ICdtYWtlIAo+IHNhdmVkZWZjb25maWcnIHNob3VsZCBuZXZlciBmYWlsLiBJZiB5b3UgaGFkIGEg
c2l0dWF0aW9uIHdoZXJlIG1ha2UgCj4gc2F2ZWRlZmNvbmZpZyBmYWlscywgSSdkIGJlIGludGVy
ZXN0ZWQgdG8ga25vdyBhYm91dCBpdCBhbmQgZGVidWcgaXQuCj4KPgo+IMKgUmVnYXJkcywKPiDC
oEFybm91dAo+Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZQo+
Pj4+Cj4+Pj4gLcKgwqDCoCByZXR1cm4gc3VicHJvY2Vzcy5jYWxsKFsibWFrZSIsICJPPSVzIiAl
IGFyZ3Mub3V0cHV0ZGlyLCAiLUMiLCAKPj4+PiBhcmdzLmJ1aWxkcm9vdGRpciwKPj4+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJkZXBl
bmRlbmNpZXMiXSkKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBzdWJwcm9jZXNzLmNh
bGwoWyJtYWtlIiwgIk89JXMiICUgYXJncy5vdXRwdXRkaXIsICItQyIsIAo+Pj4+IGFyZ3MuYnVp
bGRyb290ZGlyLAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiZGVwZW5kZW5jaWVzIl0pOgo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWUKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBicmVhawo+Pj4+ICvCoMKgwqAgcmV0dXJuIDAKPj4+Pgo+Pj4+Cj4+Pj4gwqDCoCBpZiBfX25h
bWVfXyA9PSAnX19tYWluX18nOgo+Pj4+IEBAIC00MzMsMTAgKzQ0MywxOCBAQCBpZiBfX25hbWVf
XyA9PSAnX19tYWluX18nOgo+Pj4+IMKgwqDCoMKgwqDCoCBwYXJzZXIuYWRkX2FyZ3VtZW50KCIt
LWJ1aWxkcm9vdGRpciIsICItYiIsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoZWxwPSJCdWlsZHJvb3QgZGlyZWN0b3J5IChyZWxhdGl2
ZSB0byBjdXJyZW50IAo+Pj4+IGRpcmVjdG9yeSkiLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHlwZT1zdHIsIGRlZmF1bHQ9Jy4nKQo+
Pj4+IC3CoMKgwqAgcGFyc2VyLmFkZF9hcmd1bWVudCgiLS10b29sY2hhaW5zLWNzdiIsCj4+Pj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGVscD0iUGF0
aCBvZiB0aGUgdG9vbGNoYWluIGNvbmZpZ3VyYXRpb24gZmlsZSIsCj4+Pj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHlwZT1zdHIsCj4+Pj4gLSBkZWZh
dWx0PSJzdXBwb3J0L2NvbmZpZy1mcmFnbWVudHMvYXV0b2J1aWxkL3Rvb2xjaGFpbi1jb25maWdz
LmNzdiIpCj4+Pj4gKwo+Pj4+ICvCoMKgwqAgdG9vbGNoYWluc19jc3YgPSBwYXJzZXIuYWRkX211
dHVhbGx5X2V4Y2x1c2l2ZV9ncm91cChyZXF1aXJlZD1GYWxzZSkKPj4+PiArwqDCoMKgIHRvb2xj
aGFpbnNfY3N2LmFkZF9hcmd1bWVudCgiLS10b29sY2hhaW5zLWNzdiIsCj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRl
c3Q9InRvb2xjaGFpbnNfY3N2IiwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGVscD0iUGF0aCBvZiB0aGUgdG9vbGNo
YWluIGNvbmZpZ3VyYXRpb24gCj4+Pj4gZmlsZSIsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHR5cGU9c3RyKQo+Pj4+
ICvCoMKgwqAgdG9vbGNoYWluc19jc3YuYWRkX2FyZ3VtZW50KCItLW5vLXRvb2xjaGFpbnMtY3N2
IiwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZGVzdD0idG9vbGNoYWluc19jc3YiLAo+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoZWxwPSJH
ZW5lcmF0ZSByYW5kb20gdG9vbGNoYWluIAo+Pj4+IGNvbmZpZ3VyYXRpb24iLAo+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBhY3Rpb249J3N0b3JlX2ZhbHNlJykKPj4+PiArIAo+Pj4+IHBhcnNlci5zZXRfZGVmYXVsdHMo
dG9vbGNoYWluc19jc3Y9InN1cHBvcnQvY29uZmlnLWZyYWdtZW50cy9hdXRvYnVpbGQvdG9vbGNo
YWluLWNvbmZpZ3MuY3N2IikKPj4+PiArCj4+Pj4gwqDCoMKgwqDCoMKgIGFyZ3MgPSBwYXJzZXIu
cGFyc2VfYXJncygpCj4+Pj4KPj4+PiDCoMKgwqDCoMKgwqAgIyBXZSBuZWVkIHRoZSBhYnNvbHV0
ZSBwYXRoIHRvIHVzZSB3aXRoIE89LCBiZWNhdXNlIHRoZSByZWxhdGl2ZQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
