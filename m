Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CA8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AF8240941;
	Mon, 20 Dec 2021 22:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HUWLzxOB6S7x; Mon, 20 Dec 2021 22:02:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D33740934;
	Mon, 20 Dec 2021 22:02:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02C7D1BF2A2
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1F6B40938
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Y9tadAFirfL for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:02:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A054340129
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:02:49 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id y13so43968297edd.13
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 14:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ACgzBmv0T281mXBmAQhjLjGfzzI+m2NgSH4gW90LleI=;
 b=IS2uiFyoh50LyprxrMTVNP50X4YEqo0u1gnuhr8eLJktGFkbvqQBToLfm7Zvk4dDUi
 CRBqv5A1pHczGCjz4PJvvjFr5vVsb/U9r44OmsPJRhOnLe82EqJ/hyKRsx8PdhXANerT
 PeC1zeyOjx6I5LOml7sBqrZKVqCFLvPqPmJETtpg6dxEyR6a5w9kw2z98SBBRdJ5jCq3
 E9ABguCeHUXKVMjSUPhZ5GCTSaEBdhfJ0pstsjeuGe1NRTBtAKNrjxWAMi8Yx1659dZP
 zX/IfWd5kor/cHCVfxu3zphav1meclwio5V2XnUApeeA5dOF8seOLDGocCrc2/2UM9sz
 YfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ACgzBmv0T281mXBmAQhjLjGfzzI+m2NgSH4gW90LleI=;
 b=eg3crY/SmyONQFTBt/oDDPYMUClDBo1ef+wmebn/79+Jmeyxm6SFXslNjd2MwP1+X+
 qxBjSmpvMSGjgxHQj6m8d2sb/WgVXKzGCmzF8mHU8qUBLlJX+Zk8FdkjifD6yIfMUs8q
 g6LRJHGBEeqaKAwQxIegyqUCzuPYSKk42vu/ns+zCDXJ5sBYAZmCj9rlZ/OQfFPUrMKD
 ta5cctR2xRYJQfyMoIu4JkUo+FFqf++YsxOShJrYh8Ymcp6XHrlQyapAVCJcOmS3Sfep
 Z1B7dVL9namC7yJznJjbLCdQiLc5Z8Gp0sYSmvEeT9Op9w6ATBuqxIoWFTV0I+f/c2xD
 Qi2w==
X-Gm-Message-State: AOAM532bM4kSbyywfsUUHT00dUMO343dYaRDxDwqMg3tiq6gwhINi+aw
 aqyhyfOK8WJWekX8E0ZB+vE4qhRMGx/Nkw==
X-Google-Smtp-Source: ABdhPJwdPVFilk96TF8iw0gD1wGHpqllKsQaTJ+ZPqyHDjQs/AFb14Pj3ar3atZ+Ua3czPLaETq5wQ==
X-Received: by 2002:aa7:da0c:: with SMTP id r12mr145300eds.392.1640037767899; 
 Mon, 20 Dec 2021 14:02:47 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u16sm587778edr.43.2021.12.20.14.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:02:47 -0800 (PST)
Message-ID: <3216f6d8-0388-0291-839c-bade251a1e20@mind.be>
Date: Mon, 20 Dec 2021 23:02:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thierry Bultel <thierry.bultel@linatsea.fr>
References: <20211215180021.274991-1-thierry.bultel@linatsea.fr>
 <20211215180021.274991-3-thierry.bultel@linatsea.fr>
 <966fe55d-c5d7-7f5a-63ec-f68be64a38c6@mind.be>
 <f5028ffa-5461-ae87-ad4c-227605361ddf@linatsea.fr>
 <28def8c0-8d05-015e-e9b2-a25b31d9237b@mind.be>
 <7aa7dc74-284a-3c33-defa-aef4d6e11799@linatsea.fr>
 <20211219082325.GB2603@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211219082325.GB2603@scaer>
Subject: Re: [Buildroot] [PATCH 3/3] fs/dracut: new fs type
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOS8xMi8yMDIxIDA5OjIzLCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+IFRoaWVycnksIEFs
bCwKPiAKPiBPbiAyMDIxLTEyLTE5IDA3OjU1ICswMTAwLCBUaGllcnJ5IEJ1bHRlbCBzcGFrZSB0
aHVzbHk6Cj4+Pj4+ICDCoFlvdSBzaG91bGQgYWxzbyBjaGVjayB0aGVuIGlmIGl0IGdldHMgcHJv
cGVybHkgdXBkYXRlZCBieQo+Pj4+PiBzdXBwb3J0L21pc2MvcmVsb2NhdGUtc2RrLnNoIChJIHRo
aW5rIHllcykuCj4+Pj4gSSBhbSBzb3JyeSwgYnV0IEkgZG8gbm90IHNlZSB0aGUgcG9pbnQgaGVy
ZSwgd291bGQgeW91IG1pbmQgZXhwbGFpbgo+Pj4+IHBsZWFzZSA/Cj4+Pgo+Pj4gIMKgSWYgdGhl
cmUncyBzdWNoIGEgd3JhcHBlciBzY3JpcHQgdGhhdCBzZXRzIHRoZSBlbnZpcm9ubWVudCB2YXJp
YWJsZXMKPj4+IGNvcnJlY3RseSwgdGhlIGlkZWEgaXMgdG8gYmUgYWJsZSB0byB1c2UgdGhhdCBh
cyBwYXJ0IG9mIHRoZSBTREsuIFRoYXQKPj4+IGFsc28gbWVhbnMgaXQgbXVzdCBiZSBwb3NzaWJs
ZSB0byBtb3ZlIGl0IHRvIGEgZGlmZmVyZW50IHBsYWNlLiBTaW5jZSBpdAo+Pj4gY29udGFpbnMg
aGFyZGNvZGVkIHBhdGhzIHRvIEhPU1RfRElSLCB0aGVzZSBuZWVkIHRvIGJlIGNoYW5nZSB3aGVu
IHRoZSBTREsKPj4+IGlzIHJlbG9jYXRlZC4gVGhlIHJlbG9jYXRlLXNkay5zaCBzY3JpcHQgc2hv
dWxkIGRvIHRoYXQsIGJ1dCBpdCdzCj4+PiBpbXBvcnRhbnQgdG8gY2hlY2sgdGhhdCBpbmRlZWQg
aXQgZG9lcy4KPj4KPj4gSSBwcm9iYWJseSBtaXNzIHNvbWV0aGluZyBoZXJlLiBJcyBpdCBhIGJh
ZCBpZGVhIHRvIC1ub3QtIHVzZSBoYXJkY29kZWQKPj4gcGF0aHMgaW4gdGhlIHdyYXBwZXIgc2Ny
aXB0LCBidXQgZW52aXJvbm1lbnQgdmFyaWFibGVzIGluc3RlYWQgPwoKICBObywgSSBtZWFudCB0
byBnZW5lcmF0ZSBhIHdyYXBwZXIgc2NyaXB0IHRoYXQgaGFzIHRoZSBwYXRocyBoYXJkY29kZWQu
IFRoaXMgCndheSwgeW91IGNhbiBjYWxsIHRoZSBzY3JpcHQgZXh0ZXJuYWxseSB3aXRob3V0IGhh
dmluZyB0byBzZXQgdXAgYW55dGhpbmcgaW4gdGhlIAplbnZpcm9ubWVudC4gU2ltaWxhciBsaWtl
IGhvdyB5b3UgY2FuIGNhbGwgY3Jvc3MtZ2NjIHRvIGJ1aWxkIHNvbWV0aGluZyBhbmQgaXQgCkp1
c3QgV29ya3MsIHRoYW5rcyB0byBvdXIgdG9vbGNoYWluIHdyYXBwZXIuCgogIFNpbmNlIHRoZSBw
YXRocyB3b3VsZCBiZSBoYXJkY29kZWQsIGl0IG5lZWRzIHRvIGJlIHRyZWF0ZWQgYnkgcmVsb2Nh
dGUtc2RrLnNoIAp3aGVuIG1vdmluZyB0aGUgU0RLIGFyb3VuZC4KCiAgSG93ZXZlci4uLgoKPj4g
SXQgc2hvdWxkIGJlIHNvbWV0aGluZyBsaWtlOgo+Pgo+PiAtLS0tLS0tLS0tLS0tCj4+ICMhL2Jp
bi9iYXNoCj4+IHNldCAtZQo+Pgo+PiBpZiBbIC16ICIkKiIgXTsgdGhlbgo+PiAgwqDCoMKgIGVj
aG8gIk5vIGFyZ3VtZW50IHN1cHBsaWVkIgo+PiAgwqDCoMKgIGV4aXQKPj4gZmkKPj4KPj4gRFJB
Q1VUX0xERD0ke1RBUkdFVF9DUk9TU31sZGQgXAo+PiBEUkFDVVRfSU5TVEFMTD0iJHtIT1NUX0RJ
Un0vbGliL2RyYWN1dC9kcmFjdXQtaW5zdGFsbCIgXAo+PiBkcmFjdXRiYXNlZGlyPSR7SE9TVF9E
SVJ9L3Vzci9saWIvZHJhY3V0IFwKPj4gZHJhY3V0c3lzcm9vdGRpcj0ke1RBUkdFVF9ESVJ9IFwK
Pj4gJHtIT1NUX0RJUn0vYmluL2RyYWN1dCAiJEAiCj4+IC0tLS0tLS0tLS0KPiAKPiBUaGUgdGhp
bmcgaXMsIHdpdGggdGhlIFNESywgdGhvc2UgdmFyaWFibGVzIGFyZSBub3Qgc2V0Lgo+IAo+ICAg
IC0gSE9TVF9ESVIgY2FuIGJlIGVhc2lseSBkZXJpdmVkOyBpdCBpczogJChkaXJuYW1lICQoZGly
bmFtZSAiJHswfSIpKQo+ICAgICAgb3IgYSBsaXR0bGUgYmUgc2ltcGxlcjogJChkaXJuYW1lICIk
ezAlLyp9IikKPiAKPiAgICAtIFRBUkdFVF9DUk9TUyBjYW4gcHJvYmFibHkgYmUgZGVyaXZlZCBz
b21laG93LCBidXQgbm90IGV2ZW4gc3VyZS4uLgo+IAo+ICAgIC0gVEFHRVRfRElSIGhhcyB0byBi
ZSBzcGVjaWZpZWQgZXhwbGljaXRseS4KPiAKPiBTbywgSSB0aGluayBmb3Igbm93IGl0IHdvdWxk
IGJlIG92ZXItZW5naW5lZXJpbmcgdG8gdHJ5IGFuZCBjYXR0ZXIgZm9yCj4gdGhlIFNESzsgdGhp
cyBjYW4gYmUgYWN0ZWQgdXBvbiBsYXRlci4uLgoKICAuLi4gdGhpcyBpcyB2ZXJ5IHRydWUuIFNv
IGZvciB0aGUgdGltZSBiZWluZywgbGV0J3Mgbm90IHdvcnJ5IGFib3V0IHN1Y2ggYSAKd3JhcHBl
ciBzY3JpcHQsIGFuZCBpbnN0ZWFkIGZvY3VzIG9uIGZzL2RyYWN1dC4KCiAgUmVnYXJkcywKICBB
cm5vdXQKCgo+IAo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPiAKPj4gU28gdGhhdCBzaG91
bGQgbm90IGltcGFjdCB0aGUgcmVsb2NhdGlvbiAuLi4KPj4KPj4gQnkgdGhlIHdheSwgaW4gY3Bp
by5taywgSSBhbHNvIGhhZCB0bwo+Pgo+PiBleHBvcnQgVEFSR0VUX0NST1NTCj4+Cj4+Cj4+IFJl
Z2FyZHMKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
PiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
