Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B785C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 13:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B164A400CF;
	Sat,  8 Jan 2022 13:27:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OOXToY-XMK72; Sat,  8 Jan 2022 13:27:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D685B400D3;
	Sat,  8 Jan 2022 13:27:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6952E1BF301
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63C2A405AE
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:27:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nr0yUATM0Nri for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 13:27:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D81A405AA
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 13:27:17 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so6966040wmk.1
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 05:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fJZa2VT8rPuX1yYKRRdJdJD6IViEpsKVUADKLUg4yao=;
 b=WaUkvo3z64ohWUkTW/mY0oPK3XL243+PV2my52c5AbfKIYs06epzh5/Jfs2Ss7Ru81
 3uqsP41RcBWryvARPFP9SYR49Wnw1yN6r2XfRt+x3QOkCkKAF+7f7BkXSZsB5TcZm5iQ
 mbgGxdC+smU3+7K4eoz1MYI/dpg4ryvGeoEvrvLrDH9DHD8c6iGTRjBqXxV0hd98z6tE
 WBSJQ8uhCDcwQoJX0eFvRWaXxS04hNVTyr2eepUgeb6My8cUxQUpt1+zvyo9EDTym2sh
 Wancb7sqS3cG+gkQsCpJJKrPoFFh4QdFXnBqUQbNZHrNpZbQtekxI5n9E3ijvQ5JNNDR
 V1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fJZa2VT8rPuX1yYKRRdJdJD6IViEpsKVUADKLUg4yao=;
 b=VoFRP07PImrgxGBg9O9N5JlfP1fzyIE284hvK3lSbpaGaaHfDlEAEgwzG6rPPwhwX4
 a2b9DN8Laxwoh6uusZbNWG0uZarKedDBco3HRPvFG3xn9rYf2ymbqqi9cNX/uW2WahvH
 oBYAqG98LViVw1ovXJR2ofLPXnIh+auPUHDuXKJJqWSwRPtYLdjaTZFzGF8ir6CF5jOk
 zcnNKIaApJTw6HzJbnEuGQzomY5eW1QOR1PTHa0cESDUiZbo26R0pQiEEyERUNpNT8vW
 dbvvgoC7nsVvMw2OU3daWL6SuOx2VLKGSJYWjEoh3+jiyR4j9We4KUuoUyjr/8ik9+gD
 Ibzw==
X-Gm-Message-State: AOAM5339VHuANQEAvtN+cFNgrCz+OympHvFVXTK4SnJS9pHWYV0kwZu1
 GWtZd+B17hs9OM9seZ2+1iZfgg==
X-Google-Smtp-Source: ABdhPJwIP1iEburLsiE+UuF/5IlDX2Uqs5M+eiDu7bzqslUQMvAvLnz+a5xj4Y1kXhSxzWsU5zofpQ==
X-Received: by 2002:a7b:c30e:: with SMTP id k14mr14720027wmj.74.1641648435405; 
 Sat, 08 Jan 2022 05:27:15 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id g17sm1630151wrx.48.2022.01.08.05.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 05:27:15 -0800 (PST)
Message-ID: <74102482-7c2d-b08b-f97e-80cc54f03722@mind.be>
Date: Sat, 8 Jan 2022 14:27:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <2209e11a-bda9-5193-9b4d-20a5f0fa34e3@linatsea.fr>
 <20220105142924.4b11ed83@windsurf> <a8098a5d68bcf044356720ec3f7d2d9d@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <a8098a5d68bcf044356720ec3f7d2d9d@free.fr>
Subject: Re: [Buildroot] candidate packages : ros2 and wxwidgets
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
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNy8wMS8yMDIyIDIyOjM1LCBKdWxpZW4gT2xpdmFpbiB3cm90ZToKPiBGb3IgdGhlIG5l
eHQgMjAyMiBlZGl0aW9uIG9mIHRoZSBIb3ZlckdhbWVzIGNoYWxsZW5nZSwgSSB3b3VsZCBsaWtl
Cj4gdG8gc3dpdGNoIHRvIFJPUzIgaW4gQnVpbGRyb290LsKgIEknbSBjdXJyZW50bHkgZXhwbG9y
aW5nIHdheXMgdG8KPiByZWdlbmVyYXRlIFJPUzIgYnVpbGRyb290IHJlY2lwZXMgYXV0b21hdGlj
YWxseSwgdXNpbmcgdGhlIFJPUwo+IGluZnJhc3RydWN0dXJlIHBhY2thZ2VzLsKgIEkgYmVsaWV2
ZSB0aGlzIGlzIHRoZSB3YXkgdGhlIEdlbnRvbyBhbmQKPiBZb2N0by9PcGVuRW1iZWRkZWQgcmVj
aXBlcyBhcmUgY3VycmVudGx5IGdlbmVyYXRlZC4KPiAKPiBTZWU6Cj4gaHR0cHM6Ly9naXRodWIu
Y29tL3Jvcy1pbmZyYXN0cnVjdHVyZS9zdXBlcmZsb3JlCj4gaHR0cHM6Ly9naXRodWIuY29tL3Jv
cy1pbmZyYXN0cnVjdHVyZS9zdXBlcmZsb3JlL3RyZWUvbWFzdGVyL3N1cGVyZmxvcmUvZ2VuZXJh
dG9ycwo+IAo+IE15IGN1cnJlbnQgaWRlYSB3b3VsZCBiZSB0bzoKPiAtIEFkZCBpbiBCdWlsZHJv
b3QgdGhlIG1pbmltdW0gY2hhbmdlcywgaWYgbmVlZGVkCj4gIMKgIChtaW5pbWFsIGluZnJhIHRo
aW5ncyBsaWtlIHBrZy1jYXRraW4sIG90aGVyIG5vbi1ST1MgcGFja2FnZSBkZXBlbmRlbmNpZXMp
Cj4gLSBQcm9wb3NlIGEgImJ1aWxkcm9vdCIgZ2VuZXJhdG9yIGluIHN1cGVyZmxvcmUgdXBzdHJl
YW0gdGhhdCBjcmVhdGUKPiAgwqAgYW4gbWFpbnRhaW4gc29tZSBvZiB0aGUgUk9TMiByZWNpcGVz
LgoKICBXZSBnZW5lcmFsbHkgcHJlZmVyIHRvIGtlZXAgZXZlcnl0aGluZyB1cHN0cmVhbSBpbiBC
dWlsZHJvb3QsIGJlY2F1c2UgaXQgCnNpbXBsaWZpZXMgbWFraW5nIGNoYW5nZXMgdG8gaW5mcmFz
dHJ1Y3R1cmUgKHRoYXQgbWF5IGFsc28gYWZmZWN0IHBhY2thZ2VzKS4gV2UgCmRvIGtlZXAgZ2Vu
ZXJhdG9ycyBpbiBCdWlsZHJvb3QgYXMgd2VsbDogdXRpbHMvc2NhbmNwYW4sIHV0aWxzL3NjYW5w
eXBpLiBTbyB0aGUgCmdlbmVyYXRvciBjb3VsZCBiZSBhZGRlZCB0aGVyZS4gQWx0ZXJuYXRpdmVs
eSwgeW91IGNvdWxkIGFkZCBhIHNlY3Rpb24gaW4gdGhlIApCdWlsZHJvb3QgbWFudWFsIGFib3V0
IGhvdyB0byBpbnN0YWxsIHN1cGVyZmxvcmUgYW5kIHJ1biBpdCB0byBhZGQgYSBCdWlsZHJvb3Qg
CnBhY2thZ2UuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
