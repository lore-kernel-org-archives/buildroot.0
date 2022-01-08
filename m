Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BD1C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4082E607F2;
	Sat,  8 Jan 2022 17:28:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xg6ODLfPjfi5; Sat,  8 Jan 2022 17:28:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79FE160AF5;
	Sat,  8 Jan 2022 17:28:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64A8A1BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53925408B2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:28:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cj_kf_XAJ6J6 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:28:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7987C408B1
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:28:33 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id o30so6011768wms.4
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 09:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=q+gkz0gJBeoo8N7thBSIBWXxMDB5x1d5HPgvpybIQAk=;
 b=Vn1dkCaQh4piq9QrMDb+lG2vizNCVCXWBnvTPJlOeoanD8XXQ/gOn7TsUa+7itS1QG
 a56N+CijC5jGzYag6CKBsbYvnaRabZB68/YKI+JkBYE2Z9+UBtjfyF5aE7bnHPoSXJpe
 eVSx0xeOlrCupF798+R+vVKhvEY7KSLXGDospRIT3EZuSQarRCK2DEHK7gcEk2vM+Iy1
 UOqCAvET+B0UCEYptOq9TYS3+9irwiUVRrlXt4lGjHx564HhQn0bwB4Kay8w72AvWuSW
 /U8fWB2pCEHVgUut1BskghQ2GqvLRqitxihtPvCZrf/gDcr9urUn+3+hp3plURbidjNH
 sP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=q+gkz0gJBeoo8N7thBSIBWXxMDB5x1d5HPgvpybIQAk=;
 b=JHX58jn2Ne8I3xQ+wydsFGjNAYSmsEp+fyFIsC3ySlGtf9LP3mHpAEGuaUl6dNXOd5
 wkaTd1RV8AkCTL9F3Rhhoe7UYKxEPRvRNUmJDcholjxHdMJOK4OL24d3igilPI+vLBVU
 NEEoDgX01msYpq3XN3lrG3CQH1itcIo+KedWxga3Tuz82DYT9w5pMzyR/JFcEXHKMTCx
 Uwtb6zSu3FpADKjRAq16k9kNuhwewL0QjyWxkSXjFexQtZOcxShCG6L0Wh3wOtY490Eu
 hlsXYPgrCMdk0l6hzh+gHk17fy4RPLDC3C/a+dYuM0cB3OuP35XIVhjjzn9Ur8gGRIAl
 sc1A==
X-Gm-Message-State: AOAM532ghw9iaWTm1SK8h3I67zFp/nZoEgXOs0jRrcQbybdI5BDMXIAC
 m5dDOln6QHFdcsF3AQ2YW8XG4A==
X-Google-Smtp-Source: ABdhPJzJm9FZW+JKvERFowo57LWzwJN/x2N9J6NzFiMjq6fBfDUUWCzhHZ7CSQRCispGNgr59yF9jQ==
X-Received: by 2002:a05:600c:22da:: with SMTP id
 26mr2027041wmg.121.1641662911631; 
 Sat, 08 Jan 2022 09:28:31 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id b1sm2277508wrd.92.2022.01.08.09.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 09:28:31 -0800 (PST)
Message-ID: <fd892948-ea66-9331-bc37-6f785ddd3ebb@mind.be>
Date: Sat, 8 Jan 2022 18:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Charlie Turner <cturner@igalia.com>, buildroot@buildroot.org
References: <20200429140729.3325-1-cturner@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200429140729.3325-1-cturner@igalia.com>
Subject: Re: [Buildroot] [PATCH 0/1] [RFC] add support for icecc
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
Cc: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBDaGFybGllLAoKICBTb3JyeSB0aGF0IHlvdSBkaWRuJ3QgZ2V0IGFueSByZWFjdGlvbiB0
byB0aGlzIGZvciBhbG1vc3QgdHdvIHllYXJzLiBDb3ZpZCB3YXMgCmJ1cm5pbmcgdGhlIG1haW50
YWluZXJzIG91dCBhIGJpdCA6LSggQW55d2F5LCBoZXJlIGFyZSBzb21lIGFuc3dlcnMgaW4gY2Fz
ZSBpdCdzIApzdGlsbCByZWxldmFudC4KCiAgQWxzbywgSWNlQ0Mgc3VwcG9ydCB3b3VsZCByZWFs
bHkgYmUgd2VsY29tZSBpbiBCdWlsZHJvb3QuIFRoZXJlIGFyZSBzb21lIHVzZXJzIAp0aGF0IG5l
ZWQgdG8gYnVpbGQgcmVhbGx5IGJpZyBjb25maWd1cmF0aW9ucyBzbyBwYXJhbGxlbCBidWlsZCBp
cyB3ZWxjb21lLiBOb3RlIApvZiBjb3Vyc2UgdGhhdCB5b3UnbGwgaGF2ZSB0byBjb21iaW5lIGl0
IHdpdGggdG9wLWxldmVsIHBhcmFsbGVsIGJ1aWxkIHRvIGJlIApmdWxseSBlZmZpY2llbnQsIG90
aGVyd2lzZSB5b3UncmUgcXVpY2tseSBnb2luZyB0byBydW4gaW50byBzZXJpYWxpc2F0aW9uLgoK
Ck9uIDI5LzA0LzIwMjAgMTY6MDcsIENoYXJsaWUgVHVybmVyIHdyb3RlOgo+ICAgIOKAoiBIb3N0
IHBhY2thZ2VzIGFyZSBzdGlsbCBjb21waWxlZCBsb2NhbGx5LCBJIHdvdWxkIGxpa2UgdGhpcyB0
bwo+ICAgICAgZXh0ZW5kIHRvIGhvc3QgYnVpbGRzIGFzIHdlbGwuIENvdWxkIGp1c3QgcHJlcGVu
ZCBpY2VjYyBpbiB0aGUKPiAgICAgICRQQVRIIG9uIHRoZSBob3N0LiBOZWVkIHRvIHRlc3QsIHBv
dGVudGlhbCBjb21wbGljYXRpb24gaXMKPiAgICAgIHN3aXRjaGluZyBpY2VjYydzIHRvb2xjaGFp
biBtaWQtYnVpbGQuIE1pZ2h0IG5vdCBiZSBhbiBpc3N1ZSwganVzdAo+ICAgICAgbm90IGdvbmUg
dGhlcmUgeWV0LgoKICBXaGF0IHdlIGRvIGZvciBjY2FjaGUgaXMgc2ltcGx5IHVzZSB0aGUgd3Jh
cHBlciBmb3IgdGFyZ2V0IGNvbXBpbGUgYW5kIGhhdmUgaXQgCmFzIHBhcnQgb2YgSE9TVENDIGZv
ciBob3N0IGJ1aWxkcy4gVGhlcmUgYXJlIHNvbWUgcGFja2FnZXMgdGhhdCBkb24ndCBzdXBwb3J0
IENDIAp3aXRoIHNwYWNlcywgc28gdGhlcmUncyBIT1NUQ0NfTk9DQ0FDSEUgZm9yIHRoYXQuIFlv
dSBjYW4gc2ltcGx5IGFkZCBpY2VjYyB0byAKSE9TVENDIChhbmQgbGVhdmUgSE9TVENDX05PQ0NB
Q0hFIHdpdGhvdXQgZWl0aGVyIGNjYWNoZSBvciBpY2VjYykuCgo+ICAgIOKAoiBHZW5lcmF0aW5n
IHRoZSBgSUNFQ0NfVkVSU0lPTicgdGFyYmFsbCBmcm9tIHRoZSBNYWtlZmlsZXMuIElkZWFsbHkK
PiAgICAgIGl0IHdvdWxkIGFsbCBiZSB0cmFuc3BhcmVudCB0byB0aGUgdXNlciBpZiwgc2F5LAo+
ICAgICAgYEJSMl9JQ0VDQz15Jy4gSXQncyBpbmNvbnZlbmllbnQgZm9yIHRoZSB1c2VyIHRvIGhh
dmUgdG8gY2FsbAo+ICAgICAgYC0tYnVpbGQtbmF0aXZlJyBhbmQgYXJyYW5nZSBmb3IgYElDRUND
X1ZFUlNJT04nIHRvIGJlIGluIHRoZQo+ICAgICAgYG1ha2UnIGVudmlyb25tZW50LiBZb3UgbmVl
ZCB0byBmaXJzdCBidWlsZCB0aGUgY3Jvc3MtdG9vbGNoYWluLAo+ICAgICAgc2V0dXAgdGhlIHRh
cmJhbGwsIGFuZCB0aGVuIHNvIGxvbmcgYXMgeW91ciB0b29sY2hhaW4gZG9lc24ndAo+ICAgICAg
Y2hhbmdlLCBzdWJzZXF1ZW50IHJlYnVpbGRzIGFyZSBkaXN0cmlidXRlZC4gVGhpcyBhbGwgbmVl
ZHMKPiAgICAgIGF1dG9tYXRpb24uCgogIFllYWgsIEkgdGhpbmsgdGhhdCB0aGF0J3MgcHJldHR5
IGVzc2VudGlhbC4KCiAgSWYgeW91IHdhbnQgdG8gYXZvaWQgdGhhdCBjb21wbGV4aXR5IGFuZCBn
ZXQgc29tZXRoaW5nIG1lcmdlZCB0byBzdGFydCB3aXRoLCAKeW91IGNvdWxkIHN0YXJ0IHdpdGgg
aGF2aW5nIGljZWNjIGRlcGVuZCBvbiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX1BSRUlOU1RBTExF
RCAKKGFuZCB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoZSB0b29sY2hhaW4gaXMgYWxyZWFkeSBpbnN0
YWxsZWQgb24gYWxsIGJ1aWxkZXJzKS4gClRoYXQgc2hvdWxkIHNpbXBsaWZ5IHRoaW5ncyBhIGJp
dCwgbm8/Cgo+ICAgIOKAoiBOdW1iZXIgb2Ygam9icyB0byBzaW11bHRhbmVvdXNseSBydW4gaGFz
IGJlIG1hbnVhbGx5IHNlbGVjdGVkLCBJCj4gICAgICBkb24ndCBrbm93IG9mIGEgbWV0aG9kIHRv
IGZpbmQgb3V0IGhvdyBtYW55IHJlbW90ZSBDUFVzIHlvdSBoYXZlCj4gICAgICBhdmFpbGFibGUg
d2l0aCBJY2VjcmVhbSBhdXRvbWF0aWNhbGx5LgoKICBOb3QgYSBiaWcgZGVhbC4gSWRlYWxseSBp
dCBzaG91bGQgYmUgcG9zc2libGUgdG8gZG8gdGhpcyBib3RoIGZyb20gdGhlIC5jb25maWcgCmJ1
dCBtYWtlIGl0IHBvc3NpYmxlIHRvIG92ZXJyaWRlIGZyb20gdGhlIGVudmlyb25tZW50LCBzaW1p
bGFyIGxpa2UgaG93IGl0J3MgCndpdGggQlIyX0RMX0RJUi4gQnV0IHRoYXQncyBhIG1pbm9yIG5p
dC4KCiAgUmVnYXJkcywKICBBcm5vdXQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
