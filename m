Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769E1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3265040103;
	Tue, 15 Mar 2022 21:15:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gbdzrhT7Q0YH; Tue, 15 Mar 2022 21:15:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2EE04018E;
	Tue, 15 Mar 2022 21:15:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75AFD1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72BE4813A0
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I8OIpBVnYDXg for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:15:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D5FD81297
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:15:12 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id pv16so387831ejb.0
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qmNd1BNL/NgKYML+VVbs4k4ljgivfKlfkgCWcZXj+kc=;
 b=H9ZiRCx1yILJklkPGL73f4L9wFMfRL1HLzp5K6l9VX6gJ5Hq+mo819LoVmjyfDPSNO
 +Qhh0AmDDtUe6XXu02nARW2z0P2sHJNeUUC+0JLQ1qSJAplG2uMBD1YZWeg8ZWnsM3oQ
 RrYJyC7ifr9e4WWO8LDPAl11MfOPsYlN0F+9iIGwNr0yHUe3pMaDKHAkZIDi+EapI4MK
 P6EwQrNYI7y9rkmF8Id193eDcspUQUYpC64mcRcbRFmB64PrFXp74trgWBG3w4F917Ia
 DnDkomucBgTcAaxdkMaUTme15CvMrkGiFVIcZCTfx5PCu0xW/O6G5XHLG5Gh3ejnzSCJ
 h4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qmNd1BNL/NgKYML+VVbs4k4ljgivfKlfkgCWcZXj+kc=;
 b=I/El7SRJziTLPp2aNVYbOQnUxfR4Aw+jpq123wpH/o8rKmUdltY6eiEMS2T7/Cznek
 z39Qwk8Ch/AjT4ZEv/h7Xf9EMIG9w9X5+7FUKQEESFrddDxIht9aI/36zZ5e/djuz7Bj
 CrmQt7AsrPLVikRSoIdXqUWkCpBZPrFlsliZdUDhNajL/+BHn0sH8hRfNkpsJD1Ixngq
 WPFht20L9M2B0aUIzk+yZlkVRp7rY6paNz7aWIaDoHjkqMOSDRubOeDWZswEWImdpqoV
 u0T+wxFZDAunRc6VkQpcZQb3Jo0YqSbdCBn73aetRZHM5XLUQvf4ge6Tsm4OTKN8yjTM
 97NQ==
X-Gm-Message-State: AOAM5320rdLto0NTX9R+VqMkrIVCYU1Krgm8bAjTfZFWNUjQwlAyuyuY
 QIF7rhFYspoe3UiO6hfk2YqQoD94gA1V9Q==
X-Google-Smtp-Source: ABdhPJwVdnO9llLoVYJ2Qds0LZe+OYCMUlu/WpTGDnTDmBks21c/2V/n9OxW0cC54sh3Domlyi3lYQ==
X-Received: by 2002:a17:906:7f02:b0:6cf:86d8:c31c with SMTP id
 d2-20020a1709067f0200b006cf86d8c31cmr25275506ejr.518.1647378910500; 
 Tue, 15 Mar 2022 14:15:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ky5-20020a170907778500b006d1b2dd8d4csm68894ejc.99.2022.03.15.14.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:15:10 -0700 (PDT)
Message-ID: <71ec36a0-eef9-a6a5-c7b4-ea8d2a4d64b5@mind.be>
Date: Tue, 15 Mar 2022 22:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220301232111.1092975-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220301232111.1092975-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libscrypt: bump to version
 1.22
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
Cc: =?UTF-8?Q?Stefan_S=c3=b8rensen?= <stefan.sorensen@spectralink.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMi8wMy8yMDIyIDAwOjIxLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IC0gRHJvcCBw
YXRjaCBhbmQgdXNlIHtDLExEfUZMQUdTX0VYVFJBIHdoaWNoIGFyZSBhdmFpbGFibGUgc2luY2UK
PiAgICBodHRwczovL2dpdGh1Yi5jb20vdGVjaG5pb24vbGlic2NyeXB0L2NvbW1pdC9iZGZlYzI2
NzQ0MTIyZThmNTJhNThiYzA4NmM4OWIyN2ZhYWY1ODg4Cj4gLSBXaGlsZSBhdCBpdCwgYWxzbyBt
b3ZlIFBSRUZJWCB0byBMSUJTQ1JZUFRfTUFLRV9PUFRTIGFzIGFkdm9jYXRlZCBieQo+ICAgIEFy
bm91dCBpbgo+ICAgIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJv
b3QvcGF0Y2gvMjAyMjAyMjExNzI5MDAuMTkzNzg1Ni0xLWZvbnRhaW5lLmZhYnJpY2VAZ21haWwu
Y29tLwo+IC0gVXBkYXRlIGluZGVudGF0aW9uIGluIGhhc2ggZmlsZSAodHdvIHNwYWNlcykKPiAK
PiBodHRwczovL2dpdGh1Yi5jb20vdGVjaG5pb24vbGlic2NyeXB0L2NvbXBhcmUvdjEuMjEuLi52
MS4yMgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJp
Y2VAZ21haWwuY29tPgoKICBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKICBSZWdhcmRzLAog
IEFybm91dAoKPiAtLS0KPiAgIC4uLmlvbnMtdG8tQ0ZMQUdTLWFuZC1MREZMQUdTLXZhcmlhYmxl
cy5wYXRjaCB8IDM0IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIHBhY2thZ2UvbGlic2NyeXB0L2xp
YnNjcnlwdC5oYXNoICAgICAgICAgICAgICB8ICA0ICstLQo+ICAgcGFja2FnZS9saWJzY3J5cHQv
bGlic2NyeXB0Lm1rICAgICAgICAgICAgICAgIHwgMTQgKysrKystLS0KPiAgIDMgZmlsZXMgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pCj4gICBkZWxldGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9saWJzY3J5cHQvMDAwMS1BbGxvdy1hZGRpbmctb3B0aW9ucy10by1DRkxB
R1MtYW5kLUxERkxBR1MtdmFyaWFibGVzLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bGlic2NyeXB0LzAwMDEtQWxsb3ctYWRkaW5nLW9wdGlvbnMtdG8tQ0ZMQUdTLWFuZC1MREZMQUdT
LXZhcmlhYmxlcy5wYXRjaCBiL3BhY2thZ2UvbGlic2NyeXB0LzAwMDEtQWxsb3ctYWRkaW5nLW9w
dGlvbnMtdG8tQ0ZMQUdTLWFuZC1MREZMQUdTLXZhcmlhYmxlcy5wYXRjaAo+IGRlbGV0ZWQgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IGEwMjNhNmZlMWMuLjAwMDAwMDAwMDAKPiAtLS0gYS9wYWNr
YWdlL2xpYnNjcnlwdC8wMDAxLUFsbG93LWFkZGluZy1vcHRpb25zLXRvLUNGTEFHUy1hbmQtTERG
TEFHUy12YXJpYWJsZXMucGF0Y2gKPiArKysgL2Rldi9udWxsCj4gQEAgLTEsMzQgKzAsMCBAQAo+
IC1Gcm9tIDA5N2M1ZDkyNDhmNGFmZDM0YzczZGU1YWJhMDFhMTQzZWY3ODQyNTcgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCj4gLUZyb206ID0/VVRGLTg/cT9TdGVmYW49MjBTPUMzPUI4cmVuc2Vu
Pz0gPHN0ZWZhbi5zb3JlbnNlbkBzcGVjdHJhbGluay5jb20+Cj4gLURhdGU6IFR1ZSwgMTQgTWFy
IDIwMTcgMDk6MjM6NTEgKzAxMDAKPiAtU3ViamVjdDogW1BBVENIXSBBbGxvdyBhZGRpbmcgb3B0
aW9ucyB0byBDRkxBR1MgYW5kIExERkxBR1MgdmFyaWFibGVzCj4gLU1JTUUtVmVyc2lvbjogMS4w
Cj4gLUNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+IC1Db250ZW50LVRy
YW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4gLQo+IC1UaGlzIGFsc28gcmVtb3ZlcyBhIG51bWJlciBv
ZiBoYXJkLWNvZGVkIENGTEFHUywgbGVhdmluZyBpdCB1cCB0byB0aGUKPiAtdXNlciB0byBwYXNz
IGFwcHJvcHJpYXRlIG9wdGltaXphdGlvbi9oYXJkZW5pbmcgZmxhZ3MuCj4gLQo+IC1TaWduZWQt
b2ZmLWJ5OiBTdGVmYW4gU8O4cmVuc2VuIDxzdGVmYW4uc29yZW5zZW5Ac3BlY3RyYWxpbmsuY29t
Pgo+IC0tLS0KPiAtIE1ha2VmaWxlIHwgNCArKy0tCj4gLSAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IC0KPiAtZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIv
TWFrZWZpbGUKPiAtaW5kZXggNzAyMmE0YS4uMzA5OGE5YSAxMDA2NDQKPiAtLS0tIGEvTWFrZWZp
bGUKPiAtKysrIGIvTWFrZWZpbGUKPiAtQEAgLTUsOCArNSw4IEBAIE1BS0VfRElSICAgICA/PSBp
bnN0YWxsIC1kCj4gLSBJTlNUQUxMX0RBVEEgPz0gaW5zdGFsbAo+IC0KPiAtIENDPz1nY2MKPiAt
LUNGTEFHUz89LU8yIC1XYWxsIC1nIC1EX0ZPUlRJRllfU09VUkNFPTIgLWZzdGFjay1wcm90ZWN0
b3IgLWZQSUMKPiAtLUxERkxBR1M/PS1XbCwteixub3cgLVdsLC16LHJlbHJvIC1XbCwtc29uYW1l
LGxpYnNjcnlwdC5zby4wIC1XbCwtLXZlcnNpb24tc2NyaXB0PWxpYnNjcnlwdC52ZXJzaW9uCj4g
LStvdmVycmlkZSBDRkxBR1MrPS1mUElDCj4gLStvdmVycmlkZSBMREZMQUdTKz0tV2wsLXosbm93
IC1XbCwteixyZWxybyAtV2wsLXNvbmFtZSxsaWJzY3J5cHQuc28uMCAtV2wsLS12ZXJzaW9uLXNj
cmlwdD1saWJzY3J5cHQudmVyc2lvbgo+IC0gQ0ZMQUdTX0VYVFJBPz0tV2wsLXJwYXRoPS4KPiAt
Cj4gLSBhbGw6IHJlZmVyZW5jZQo+IC0tLQo+IC0yLjcuNAo+IC0KPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saWJzY3J5cHQvbGlic2NyeXB0Lmhhc2ggYi9wYWNrYWdlL2xpYnNjcnlwdC9saWJzY3J5
cHQuaGFzaAo+IGluZGV4IGZkYTYzZDFjMGQuLmZjZGM0YmJlZWIgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9saWJzY3J5cHQvbGlic2NyeXB0Lmhhc2gKPiArKysgYi9wYWNrYWdlL2xpYnNjcnlwdC9s
aWJzY3J5cHQuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQK
PiAtc2hhMjU2CTY4ZTM3N2U3OTc0NWMxMGQ0ODliNzU5Yjk3MGU1MmQ4MTlkYmI4MGRkOGNhNjFm
OGM5NzUxODVkZjNmNDU3ZDMJbGlic2NyeXB0LTEuMjEudGFyLmd6Cj4gLXNoYTI1NglhYWNiZmQ5
ZTE5ZTViMzhlYTA5NjE2Y2ViZjA3NTFlZjBjYzdiNmExOWVhMGZkNzhmNGIwNTk4YjJjNTAzMzk0
CUxJQ0VOU0UKPiArc2hhMjU2ICBhMmQzMGVhMTZlNmQyODg3NzI3OTFkZTY4YmU1NjE1Mzk2NWZl
NGZkNGJjZDc4Nzc3NzYxOGI4MDQ4NzA4OTM2ICBsaWJzY3J5cHQtMS4yMi50YXIuZ3oKPiArc2hh
MjU2ICBhYWNiZmQ5ZTE5ZTViMzhlYTA5NjE2Y2ViZjA3NTFlZjBjYzdiNmExOWVhMGZkNzhmNGIw
NTk4YjJjNTAzMzk0ICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlic2NyeXB0L2xp
YnNjcnlwdC5tayBiL3BhY2thZ2UvbGlic2NyeXB0L2xpYnNjcnlwdC5tawo+IGluZGV4IGZhODll
ZDMxYmMuLmQyOGJkNGU5MDAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJzY3J5cHQvbGlic2Ny
eXB0Lm1rCj4gKysrIGIvcGFja2FnZS9saWJzY3J5cHQvbGlic2NyeXB0Lm1rCj4gQEAgLTQsMjMg
KzQsMjkgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAtTElCU0NS
WVBUX1ZFUlNJT04gPSAxLjIxCj4gK0xJQlNDUllQVF9WRVJTSU9OID0gMS4yMgo+ICAgTElCU0NS
WVBUX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHRlY2huaW9uLGxpYnNjcnlwdCx2JChMSUJTQ1JZUFRf
VkVSU0lPTikpCj4gICBMSUJTQ1JZUFRfTElDRU5TRSA9IEJTRC0yLUNsYXVzZQo+ICAgTElCU0NS
WVBUX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gICBMSUJTQ1JZUFRfSU5TVEFMTF9TVEFHSU5H
ID0gWUVTCj4gICAKPiArTElCU0NSWVBUX01BS0VfT1BUUyA9IFwKPiArCSQoVEFSR0VUX0NPTkZJ
R1VSRV9PUFRTKSBcCj4gKwlDRkxBR1NfRVhUUkE9IiQoVEFSR0VUX0NGTEFHUykiIFwKPiArCUxE
RkxBR1NfRVhUUkE9IiQoVEFSR0VUX0xERkxBR1MpIiBcCj4gKwlQUkVGSVg9L3Vzcgo+ICsKPiAg
IGRlZmluZSBMSUJTQ1JZUFRfQlVJTERfQ01EUwo+IC0JJChUQVJHRVRfTUFLRV9FTlYpICQoTUFL
RSkgLUMgJChARCkgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpCj4gKwkkKFRBUkdFVF9NQUtFX0VO
VikgJChNQUtFKSAtQyAkKEBEKSAkKExJQlNDUllQVF9NQUtFX09QVFMpCj4gICBlbmRlZgo+ICAg
Cj4gICBkZWZpbmUgTElCU0NSWVBUX0lOU1RBTExfU1RBR0lOR19DTURTCj4gLQkkKFRBUkdFVF9N
QUtFX0VOVikgJChNQUtFKSAtQyAkKEBEKSBQUkVGSVg9L3VzciBcCj4gKwkkKFRBUkdFVF9NQUtF
X0VOVikgJChNQUtFKSAtQyAkKEBEKSAkKExJQlNDUllQVF9NQUtFX09QVFMpIFwKPiAgIAkJREVT
VERJUj0kKFNUQUdJTkdfRElSKSBpbnN0YWxsCj4gICBlbmRlZgo+ICAgCj4gICBkZWZpbmUgTElC
U0NSWVBUX0lOU1RBTExfVEFSR0VUX0NNRFMKPiAtCSQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0Up
IC1DICQoQEQpIFBSRUZJWD0vdXNyIFwKPiArCSQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpIC1D
ICQoQEQpICQoTElCU0NSWVBUX01BS0VfT1BUUykgXAo+ICAgCQlERVNURElSPSQoVEFSR0VUX0RJ
UikgaW5zdGFsbAo+ICAgZW5kZWYKPiAgIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
