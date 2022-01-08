Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACE1C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 20:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D57DE81442;
	Sat,  8 Jan 2022 20:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8o-S7Yi65xUB; Sat,  8 Jan 2022 20:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E19981445;
	Sat,  8 Jan 2022 20:40:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 614411BF847
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 20:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4897A6076C
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 20:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7l58jpLRNfm for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 20:40:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5667B60745
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 20:40:42 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso6937116wmj.2
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 12:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=H5JD46Rk9UjKL3G2/NFuhd/KYJNZv+PkEhrfPb7fKwI=;
 b=MR1gDGLld8OpP8C22CS+WVbCiJ1/16+wXa3X+Dq65XNgM684RR+fL+fzoJqAivHDf1
 103M0OYe5hivkn6ROsClaYOHaywcoZDvig0XPrpH6Axvxz0natU5Uw7orLdri7iHKEre
 2zUa9PJFdFq/lsA/LSla4qReHPzB4Ou3kcy5WWU/IdQQppY0H2gilg9lB3GmAAHzET6n
 C+0CwxazhmAxk86dlVPP+ZYpVkWWe6pfNviVoA6u91ytY/LNXzUN6K5LknxHcoKD3lcr
 nPo6WQh+aOxH3b1u8iFbhgXVTvj9ExfIXVNJk3FLaP/kKGUXATNDqgu8HbNj2zp0jmEo
 5BIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=H5JD46Rk9UjKL3G2/NFuhd/KYJNZv+PkEhrfPb7fKwI=;
 b=knS/yWXUMwQUm+5FyrUMtEh2nVdESMHF5I3Uh8jh2Dkwbwtdon5Y9EUJxD6hD2G/p6
 OKvPNdj8bHsy5JmQltsCp+u+kyHCtCnqvj+CB8p9fkgT91Q4nefLBi0Vb2qjMFMp4IQ+
 eEEwYvONRYv1wPlV+iBx73l78cDXGucw7Uz4S9iZ1EN07O25TgrUor/Juu6CrKtNs83l
 GrQeZN5PdwAFtds0RQKLcaWbZ+wZdxpqWEsWjSXLWVWeEu7lQdp8nc8q9NZj572CcKdW
 n5KOSZgoHY4Z1aISywH7uK+qF7ZU4SO9R2ZXUjPTlWGxuHdUdvGwZM3yMj4SXRLrfwDz
 wjjw==
X-Gm-Message-State: AOAM533d+xofcual9c4CTRBIlNvuu0YipSNP52/VxwTz8Opn8zT4iTol
 VNtFePnQKw6yhOQStCE1DTqEtQ==
X-Google-Smtp-Source: ABdhPJx0Yg8NyqJYZMW8S8NCkytTJ8GYkA7QQntzutikJomGbXNeOd4aOCBaGWHrkjI4OKYAkNzpfA==
X-Received: by 2002:a7b:c8c2:: with SMTP id f2mr904385wml.31.1641674440971;
 Sat, 08 Jan 2022 12:40:40 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id a3sm2744402wri.89.2022.01.08.12.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 12:40:40 -0800 (PST)
Message-ID: <0570b1f3-5229-5c0e-796a-53f8747b540a@mind.be>
Date: Sat, 8 Jan 2022 21:40:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
References: <20200825000246.4035-1-joseph.kogut@gmail.com>
 <8bcace28-352f-1da3-51c6-0de868fa429f@mind.be>
Organization: Essensium/Mind
In-Reply-To: <8bcace28-352f-1da3-51c6-0de868fa429f@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] systemd: ensure tmpfiles.d/legacy.conf
 is installed
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Adam Duskett <aduskett@gmail.com>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDA4LzAxLzIwMjIgMjA6MTIsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAyNS8wOC8yMDIwIDAyOjAyLCBKb3NlcGggS29ndXQgd3JvdGU6Cj4+IFN5c3RlbWQgZG9lc24n
dCBpbnN0YWxsIHRtcGZpbGVzLmQvbGVnYWN5LmNvbmYgd2hlbiBzeXN2IGNvbXBhdGlibGl0eQo+
PiBpc24ndCBlbmFibGVkLiBUaGlzIGNvbmZpZyBzZXRzIHVwIC92YXIvbG9jaywgd2hpY2ggbWFu
eSBwcm9ncmFtcyBzdWNoCj4+IGFzIHVib290J3MgZndfcHJpbnRlbnYvc2V0ZW52IHN0aWxsIGRl
cGVuZCBvbiBieSBkZWZhdWx0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKb3NlcGggS29ndXQgPGpv
c2VwaC5rb2d1dEBnbWFpbC5jb20+Cj4KPiDCoEFmdGVyIGFsbCB0aGUgZGlzY3Vzc2lvbiwgSSBk
aWQgZmluYWxseSBhcHBseSB0byBtYXN0ZXIsIHRoYW5rcy4KCiDCoEFuZCBJIGVuZGVkIHVwIHJl
dmVydGluZyBpdCBhZ2FpbiAtIGxlZ2FjeS5jb25mIGlzIG5vdyBsZWdhY3kuY29uZi5pbiBhbmQg
aXQgCm5lZWRzIHRvIGJlIHByZXByb2Nlc3NlZCwgYnV0IHRoYXQgaXMgb25seSBkb25lIGlmIHN5
c3YtY29tcGF0IGlzIGVuYWJsZWQuCgogwqBTbyBpZiB3ZSB3YW50IHRoaXMsIG91ciBvbmx5IG9w
dGlvbiBpcyB0byBlbmFibGUgc3lzdi1jb21wYXQgKHdoaWNoIGlzIApwcm9iYWJseSBzb21ldGhp
bmcgd2Ugc2hvdWxkIGRvIGFueXdheSkuCgoKIMKgUmVnYXJkcywKIMKgQXJub3V0CgoKPgo+IMKg
Rm9yIE5vcmJlcnQ6IHdlIHNpbXBseSBoYXZlIGxlZ2FjeSBwYWNrYWdlcyB0aGF0IHdyaXRlIHRv
IC92YXIvbG9jayBpbnN0ZWFkIAo+IG9mIC9ydW4vbG9jay4gSW4gYW4gaWRlYWwgd29ybGQsIHdl
J2QgcGF0Y2ggYWxsIG9mIHRoZW0gdG8gZG8gdGhlIHJpZ2h0IHRoaW5nLiAKPiBIb3dldmVyLCB0
aGF0J3Mgbm90IHJlYWxpc3RpYy4gU28gbGV0J3MgZW5hYmxlIHRoaXMgbGVnYWN5IHN0dWZmIHRv
IG1ha2Ugc3VyZSAKPiB0aGF0IHRob3NlIGxlZ2FjeSBwYWNrYWdlcyBkb24ndCBhY3R1YWxseSB3
cml0ZSB0byBkaXNrLgo+Cj4gwqBXZSBjb3VsZCBpbmRlZWQgaW5zdGVhZCBlbmFibGUgc3lzdiBj
b21wYXRpYmlsaXR5LCBmb3IgbWF4aW11bSBzdXBwb3J0IG9mIAo+IGxlZ2FjeSBwYWNrYWdlcy4g
V2hhdCBleGFjdGx5IHdvdWxkIGJlIHRoZSBlZmZlY3RzIG9mIHRoYXQ/Cj4KPiDCoFJlZ2FyZHMs
Cj4gwqBBcm5vdXQKPgo+Cj4+IC0tLQo+PiDCoCBwYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tayB8
IDEwICsrKysrKysrKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsg
Yi9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tawo+PiBpbmRleCBlMzU2Y2IxYWRkLi44NDU0OTkz
ODIzIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tawo+PiArKysgYi9w
YWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tawo+PiBAQCAtNTEyLDEwICs1MTIsMTggQEAgZGVmaW5l
IFNZU1RFTURfSU5TVEFMTF9NQUNISU5FSURfSE9PSwo+PiDCoMKgwqDCoMKgIHRvdWNoICQoVEFS
R0VUX0RJUikvZXRjL21hY2hpbmUtaWQKPj4gwqAgZW5kZWYKPj4gwqAgKyMgc3lzdGVtZCBkb2Vz
bid0IGluc3RhbGwgbGVnYWN5LmNvbmYgd2l0aG91dCBzeXN2LWNvbXBhdAo+PiArIyBUaGlzIGNv
bmZpZyBlbnN1cmVzIC92YXIvbG9jayBpcyBjcmVhdGVkCj4+ICtkZWZpbmUgU1lTVEVNRF9JTlNU
QUxMX0xFR0FDWV9DT05GX0hPT0sKPj4gK8KgwqDCoCAkKElOU1RBTEwpIC1EIC1tIDA2NDQgJChA
RCkvdG1wZmlsZXMuZC9sZWdhY3kuY29uZiBcCj4+ICvCoMKgwqDCoMKgwqDCoCAkKFRBUkdFVF9E
SVIpL3Vzci9saWIvdG1wZmlsZXMuZAo+PiArZW5kZWYKPj4gKwo+PiDCoCBTWVNURU1EX1BPU1Rf
SU5TVEFMTF9UQVJHRVRfSE9PS1MgKz0gXAo+PiDCoMKgwqDCoMKgIFNZU1RFTURfSU5TVEFMTF9J
TklUX0hPT0sgXAo+PiDCoMKgwqDCoMKgIFNZU1RFTURfSU5TVEFMTF9NQUNISU5FSURfSE9PSyBc
Cj4+IC3CoMKgwqAgU1lTVEVNRF9JTlNUQUxMX1JFU09MVkNPTkZfSE9PSwo+PiArwqDCoMKgIFNZ
U1RFTURfSU5TVEFMTF9SRVNPTFZDT05GX0hPT0sgXAo+PiArwqDCoMKgIFNZU1RFTURfSU5TVEFM
TF9MRUdBQ1lfQ09ORl9IT09LCj4+IMKgIMKgIGRlZmluZSBTWVNURU1EX0lOU1RBTExfSU1BR0VT
X0NNRFMKPj4gwqDCoMKgwqDCoCAkKFNZU1RFTURfSU5TVEFMTF9CT09UX0ZJTEVTKQo+PgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
