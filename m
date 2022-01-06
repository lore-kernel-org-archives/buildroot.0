Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89699C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 19:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 243A942946;
	Thu,  6 Jan 2022 19:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6mH9_N8HncYE; Thu,  6 Jan 2022 19:22:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A59042858;
	Thu,  6 Jan 2022 19:22:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35DC81BF409
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 19:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C1884019A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 19:22:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FkvhoJutj8qn for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 19:22:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 994A6400E5
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 19:22:38 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id e5so2532854wmq.1
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 11:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1Vu/i8kwJ6wVjw9zlRVRivtLTEIZNVfnzxyJ36dx7VA=;
 b=YLW702seSmtOKWky05QdNiz+qNTTy9+cl7s33FQhx0odJpq5wO8NOiEK0U3bZrSWWM
 nDvnsfvaQEDdGU2nMtBmPWbeDX2+4d9d4OXXivg4B3bomTznlOGaLyD/EIh0GqPuPTic
 t/6YHsTZsoMlNUTkUH25FAn087poJFkgJSkAvXoO8sbKDxu79jigIZmUVG7+ELmELbNy
 Gb23/sek7AG05XQlqkqzwMeBCAEA/HXZ62hoMzlBsQ+zHJQsRueXm8jtUqm5hXj46vFd
 NGxG+WFUB7xi3kft0VbAIGz4qDrVH+Ze9w5mXXmvdNCtF4rEwNInm8eUlwPBmQLrqYGZ
 eq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1Vu/i8kwJ6wVjw9zlRVRivtLTEIZNVfnzxyJ36dx7VA=;
 b=dTHQ1IUBLEMkLxWWU84jdyn4bhxPbYZcFrLi99+ncqM92u4KC1uOILJjqh8eBY3dQZ
 TPYRq5wPRTp6a+yD/2qLiU+b2uF6TA2fBgjBLoBVeQPdcEpvYfVSscjg8FzI/qwSW55J
 bG2BTA4zqc2BYOhR7bokV34pccqgFoE4pJLMNRN3afN2F42caX08FM8C59xyfK9HYBBI
 e7e6RGck6TFAiaSDFbwS5BlzmPHPFXAMp4A2bgRf2K4lU7do59CcxwXxSYXYmUEmDB8c
 vqwLh2Q+XTjFQWlRruV3jewR1Qb4yZoDKG7Rpy/Enu5f1OJenQT6cK9EZ+cEUZI/fjly
 gSOQ==
X-Gm-Message-State: AOAM533jlHs32nkIteJvEYNmIC8jx7I59vSi2vqB667Y9aqIAMtwsQyo
 kxS1QWn3OXt6C2FdExUUqAJ+0w==
X-Google-Smtp-Source: ABdhPJyUn/1uITRwCBazl9QfrUEgfUixYqmsZDGRD0xvr/odLDXTOt/AHvcYJ4teBskoGBaBzxDt5A==
X-Received: by 2002:a05:600c:219a:: with SMTP id
 e26mr8495560wme.136.1641496956776; 
 Thu, 06 Jan 2022 11:22:36 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id bd21sm433500wmb.8.2022.01.06.11.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 11:22:36 -0800 (PST)
Message-ID: <424a55f7-27ea-e369-a753-1453214ef408@smile.fr>
Date: Thu, 6 Jan 2022 20:22:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: fr
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
References: <20200901143731.2916-1-jugurtha.belkalem@smile.fr>
 <20200901143731.2916-4-jugurtha.belkalem@smile.fr>
 <20200905232559.53e7b9a9@windsurf.home>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20200905232559.53e7b9a9@windsurf.home>
Subject: Re: [Buildroot] [PATCH 3/3] package/python-stegano : new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVndXJ0aGEsIFRob21hcywKCkxlIDA1LzA5LzIwMjAgw6AgMjM6MjUsIFRob21hcyBQ
ZXRhenpvbmkgYSDDqWNyaXTCoDoKPiBIZWxsbyBKdWd1cnRoYSwKPiAKPiBPbiBUdWUsICAxIFNl
cCAyMDIwIDE2OjM3OjMxICswMjAwCj4gSnVndXJ0aGEgQkVMS0FMRU0gPGp1Z3VydGhhLmJlbGth
bGVtQHNtaWxlLmZyPiB3cm90ZToKPiAKPj4gU3RlZ2Fub2dyYXBoeSBpcyB0aGUgYXJ0IGFuZCBz
Y2llbmNlIG9mIHdyaXRpbmcgaGlkZGVuCj4+IG1lc3NhZ2VzIGluIHN1Y2ggYSB3YXkgdGhhdCBu
byBvbmUgLCBhcGFydCBmcm9tIHRoZSBzZW5kZXIKPj4gYW5kIGludGVuZGVkIHJlY2lwaWVudCAs
IHN1c3BlY3RzIHRoZSBleGlzdGVuY2Ugb2YgdGhlIG1lc3NhZ2UsCj4+IGEgZm9ybSBvZiBzZWN1
cml0eSB0aHJvdWdoIG9ic2N1cml0eS4KPj4gU3RlZ2Fub2dyYXBoeSBpcyBvZnRlbiB1c2VkIHdp
dGggY3J5cHRvZ3JhcGh5Lgo+Pgo+PiBNb3JlIGFib3V0IHB5dGhvbi1zdGVnYW5vIGlzIGF2YWls
YWJsZSBhdCA6Cj4+IGh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9zdGVnYW5vLy4KPj4KPj4gU3Rl
Z2FubyBjYW4gYmUgdGVzdGVkIDoKPj4gJCBweXRob24zCj4+Pj4+IGZyb20gc3RlZ2FubyBpbXBv
cnQgbHNiCj4+Pj4+IHNlY3JldCA9IGxzYi5oaWRlKCIuL2ltYWdlLnBuZyIsICJIZWxsbyBXb3Js
ZCIpCj4+Pj4+IHNlY3JldC5zYXZlKCIuL2ltYWdlLXdpdGgtc3RlZ2Fub2dyYXBoeS5wbmciKSAg
Cj4+IFRvIGdldCBiYWNrIHRleHQgOgo+Pj4+PiBjbGVhcl9tZXNzYWdlID0gbHNiLnJldmVhbCgi
Li9pbWFnZS13aXRoLXN0ZWdhbm9ncmFwaHkiKSAgCj4gCj4gTm90IGEgc3RyaWN0IHJlcXVpcmVt
ZW50LCBidXQgc2luY2UgeW91IGhhdmUgYSBzaW1wbGUgdGVzdCBjYXNlLCB3aGF0Cj4gYWJvdXQg
YWRkaW5nIGEgcnVudGltZSB0ZXN0IGluIHN1cHBvcnQvdGVzdGluZy8gPwo+IAo+PiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9weXRob24tc3RlZ2Fuby9Db25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1z
dGVnYW5vL0NvbmZpZy5pbgo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAw
MDAwLi5iMGIyMDljNWY4Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvcGFja2FnZS9weXRob24t
c3RlZ2Fuby9Db25maWcuaW4KPj4gQEAgLTAsMCArMSwxNCBAQAo+PiArY29uZmlnIEJSMl9QQUNL
QUdFX1BZVEhPTl9TVEVHQU5PCj4+ICsJYm9vbCAicHl0aG9uLXN0ZWdhbm8iCj4+ICsJZGVwZW5k
cyBvbiBCUjJfUEFDS0FHRV9QWVRIT04zCj4+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0pQRUcgI3J1
bnRpbWUKPj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCWE1MMiAjcnVudGltZQo+PiArCXNlbGVj
dCBCUjJfUEFDS0FHRV9PUEVOSlBFRyAjcnVudGltZQo+IAo+IENvdWxkIHlvdSBnaXZlIG1vcmUg
ZGV0YWlscyBhYm91dCB0aGUgZGVwZW5kZW5jeSBvbiB0aG9zZSAzIGxpYnJhcmllcz8KPiBJcyBp
dCBiZWNhdXNlIHB5dGhvbi1waWxsb3cgbXVzdCBiZSBidWlsdCB3aXRoIG9wZW5qcGVnIHN1cHBv
cnQgYW5kCj4ganBlZyBzdXBwb3J0PyBPciBpcyBpdCBqdXN0IGJlY2F1c2UgaW4geW91ciBzaXR1
YXRpb24sIHlvdSB3ZXJlIHVzaW5nCj4ganBnIHBpY3R1cmVzPwo+IAo+IFdoYXQgYWJvdXQgdGhl
IGxpYnhtbDIgZGVwZW5kZW5jeT8KCk5vIHJlcGx5IHNpbmNlIFNlcHRlbWJlciAyMDIwLCBJIGhh
dmUgbWFya2VkIHRoaXMgcGF0Y2ggYXMgIkNoYW5nZXMgUmVxdWVzdGVkIi4KCkJlc3QgcmVnYXJk
cywKUm9tYWluCgo+IAo+IEJlc3QgcmVnYXJkcywKPiAKPiBUaG9tYXMKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
