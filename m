Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F09C433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8597E417BF;
	Tue,  3 May 2022 20:34:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWSyfqLUZ2dY; Tue,  3 May 2022 20:34:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20908417B8;
	Tue,  3 May 2022 20:34:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EF531BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D9DA83E62
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:34:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vVvoc2S14ZBt for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:34:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6680783E49
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:34:24 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id l18so35539032ejc.7
 for <buildroot@buildroot.org>; Tue, 03 May 2022 13:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LaZxSXg/6gr2eP2N5fi56juJcKqibEiLlBMEqS7Cmws=;
 b=JaAJWpJ0kPh5Vq1a9ylQDeOAmrRGzBgqyGrZBUMcSMiLq7+ZLvohnO9xJ7CGXwW/62
 xOAZOOBidL+UEmXzwufV0VvwE2ET7/h0Pz2T6o+dp1D4BhAEUQ60kKjqH/aaQZ6Km/H3
 giRppwTRTayeRS2ZULumO31sYecvCSrS8+TrqJuCUCiS3E78akoB5N8gRFgJQ00xvHw1
 jxZH1X3U/yzo0ccKgJEvs0f0G2djfN+uV6Mn9xWTnrUMdOsaF9MHKcUQ9kJ9UdtYWdUC
 8rwGsKpPuj7IgCDR0fDshwE47pXaQpueBfqX8k7ati4Al2aDb9C+cSfmxAzi3r2Ko2q4
 wO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LaZxSXg/6gr2eP2N5fi56juJcKqibEiLlBMEqS7Cmws=;
 b=MPT588M5c9o6lpzwV9Vrgr2qtAs46Nlz+af3v4tQn7DzjxTnbHeJvJYOSfe5OkK/BJ
 lx400ouzQxp/AQYo7PEUhulXpUdL6C4qQ3HSvAVQw7oesSv/D+VvqNcenVvxNmN4oHW0
 KM0r+Q6kHwGiUUQKjCkmDufHzfoDdT7d9X0rX2adFr8MU40jXcMsl7sCIDGeRd/m5QMt
 u3u10QggSD5Zb1Sh6/XdkLPwt6bCGD+/gXG3unuygUJF7g/gx7RpAvvJcx/Y5WWSNB40
 ompJnRE/NtzUDIRYYytYfsfH/HHH85KfOtV8tzXEPrVDHegUL4EIy4B5GKL96kCu1nZo
 1xsw==
X-Gm-Message-State: AOAM532kC0G4Z0GR20SDhvVh5FdfLMLN2OiaZd2BVVjneyMj94AYcYPe
 A7LCm1Bf1XzusWgvXUF+00Meqg==
X-Google-Smtp-Source: ABdhPJyTPieW7u3g9mXzwU0++vuQnH5zpRE8VBlE9Y4ISIMbx6DxeJ1XDtxVY/WHCeIVpeK1rqMO9g==
X-Received: by 2002:a17:907:94ca:b0:6da:e637:fa42 with SMTP id
 dn10-20020a17090794ca00b006dae637fa42mr17654633ejc.347.1651610062657; 
 Tue, 03 May 2022 13:34:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 yl1-20020a17090693e100b006f3ef214de2sm4868180ejb.72.2022.05.03.13.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 13:34:22 -0700 (PDT)
Message-ID: <23632e6a-536f-1e8d-7f4f-51d6cded7018@mind.be>
Date: Tue, 3 May 2022 22:34:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: =?UTF-8?Q?Jos=c3=a9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Philippe Serbruyns <Philippe.Serbruyns@ugent.be>
References: <20220426113010.1463133-1-salvador.joseluis@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220426113010.1463133-1-salvador.joseluis@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/zfs: refactor test cases
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNi8wNC8yMDIyIDEzOjMwLCBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gd3JvdGU6Cj4g
UGF0Y2ggdGl0bGU6IHBhY2thZ2UvemZzOiByZWZhY3RvciB0ZXN0IGNhc2VzCgogIFRoZXJlJ3Mg
bm90IG5lZWQgdG8gcmVwZWF0IHRoaXMsIGl0J3MgYWxyZWFkeSBpbiB0aGUgc3ViamVjdCBsaW5l
LgoKICBBcHBsaWVkIGJvdGggdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0
Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iu
am9zZWx1aXNAZ21haWwuY29tPgo+IC0tLQo+IFRoZXNlIHBhdGNoIHNlcmllcyByZWZhY3RvciB0
aGUgdGVzdCBjYXNlIGFuZCBhZGQgbXVzbCB0b29sY2hhaW4uCj4gSGVyZSBpcyB0aGUgZmlyc3Qg
b25lLCB0aGF0IG9ubHkgcmVmYWN0b3IgdGhlIGN1cnJlbnQgemZzIHRlc3QgY2FzZXMuCj4gCj4g
ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weSB8IDYyICsrKystLS0t
LS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNTIg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3Rlc3RfemZzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMu
cHkKPiBpbmRleCA3MDY5MzRjYTY1Li4xY2MwMzBlNzhjIDEwMDY0NAo+IC0tLSBhL3N1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5Cj4gKysrIGIvc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKPiBAQCAtMywxMyArMywxMiBAQCBpbXBvcnQgb3MK
PiAgIGltcG9ydCBpbmZyYS5iYXNldGVzdAo+ICAgCj4gICAKPiAtY2xhc3MgVGVzdFpmc0dsaWJj
KGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4gK2NsYXNzIFRlc3RaZnNCYXNlKGluZnJhLmJhc2V0
ZXN0LkJSVGVzdCk6Cj4gICAgICAgY29uZmlnID0gXAo+ICAgICAgICAgICAiIiIKPiAgICAgICAg
ICAgQlIyX3g4Nl82ND15Cj4gICAgICAgICAgIEJSMl94ODZfY29yZWk3PXkKPiAgICAgICAgICAg
QlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15Cj4gLSAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5B
TF9CT09UTElOX1g4Nl82NF9DT1JFX0k3X0dMSUJDX1NUQUJMRT15Cj4gICAgICAgICAgIEJSMl9S
T09URlNfREVWSUNFX0NSRUFUSU9OX0RZTkFNSUNfRVVERVY9eQo+ICAgICAgICAgICBCUjJfTElO
VVhfS0VSTkVMPXkKPiAgICAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15
Cj4gQEAgLTYwLDU4ICs1OSwxNyBAQCBjbGFzcyBUZXN0WmZzR2xpYmMoaW5mcmEuYmFzZXRlc3Qu
QlJUZXN0KToKPiAgICAgICAgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soY21kKQo+ICAgCj4gICAK
PiAtY2xhc3MgVGVzdFpmc1VjbGliYyhpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgo+IC0gICAgY29u
ZmlnID0gXAo+ICtjbGFzcyBUZXN0WmZzR2xpYmMoVGVzdFpmc0Jhc2UpOgo+ICsgICAgY29uZmln
ID0gVGVzdFpmc0Jhc2UuY29uZmlnICsgXAo+ICsgICAgICAgICIiIgo+ICsgICAgICAgIEJSMl9U
T09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9YODZfNjRfQ09SRV9JN19HTElCQ19TVEFCTEU9eQo+
ICsgICAgICAgICIiIgo+ICsKPiArCj4gK2NsYXNzIFRlc3RaZnNVY2xpYmMoVGVzdFpmc0Jhc2Up
Ogo+ICsgICAgY29uZmlnID0gVGVzdFpmc0Jhc2UuY29uZmlnICsgXAo+ICAgICAgICAgICAiIiIK
PiAtICAgICAgICBCUjJfeDg2XzY0PXkKPiAtICAgICAgICBCUjJfeDg2X2NvcmVpNz15Cj4gLSAg
ICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15Cj4gICAgICAgICAgIEJSMl9UT09MQ0hBSU5f
RVhURVJOQUxfQk9PVExJTl9YODZfNjRfQ09SRV9JN19VQ0xJQkNfU1RBQkxFPXkKPiAtICAgICAg
ICBCUjJfUk9PVEZTX0RFVklDRV9DUkVBVElPTl9EWU5BTUlDX0VVREVWPXkKPiAtICAgICAgICBC
UjJfTElOVVhfS0VSTkVMPXkKPiAtICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJT
SU9OPXkKPiAtICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1
LjE1LjM1Igo+IC0gICAgICAgIEJSMl9MSU5VWF9LRVJORUxfVVNFX0NVU1RPTV9DT05GSUc9eQo+
IC0gICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJib2FyZC9xZW11
L3g4Nl82NC9saW51eC5jb25maWciCj4gLSAgICAgICAgQlIyX1BBQ0tBR0VfWkZTPXkKPiAtICAg
ICAgICBCUjJfUEFDS0FHRV9QWVRIT04zPXkKPiAtICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT05f
Q0ZGST15Cj4gLSAgICAgICAgQlIyX1BBQ0tBR0VfUFlUSE9OX1NFVFVQVE9PTFM9eQo+IC0gICAg
ICAgIEJSMl9QQUNLQUdFX1pMSUJfTkc9eQo+IC0gICAgICAgIEJSMl9QQUNLQUdFX0xJQlJFU1NM
PXkKPiAtICAgICAgICBCUjJfVEFSR0VUX1JPT1RGU19DUElPPXkKPiAtICAgICAgICAjIEJSMl9U
QVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0Cj4gICAgICAgICAgICIiIgo+ICAgCj4gLSAgICBk
ZWYgdGVzdF9ydW4oc2VsZik6Cj4gLSAgICAgICAga2VybmVsID0gb3MucGF0aC5qb2luKHNlbGYu
YnVpbGRkaXIsICJpbWFnZXMiLCAiYnpJbWFnZSIpCj4gLSAgICAgICAgY3Bpb19maWxlID0gb3Mu
cGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAicm9vdGZzLmNwaW8iKQo+IC0gICAg
ICAgIHNlbGYuZW11bGF0b3IuYm9vdCgKPiAtICAgICAgICAgICAgYXJjaD0ieDg2XzY0IiwKPiAt
ICAgICAgICAgICAga2VybmVsPWtlcm5lbCwKPiAtICAgICAgICAgICAga2VybmVsX2NtZGxpbmU9
WyJjb25zb2xlPXR0eVMwIl0sCj4gLSAgICAgICAgICAgIG9wdGlvbnM9WyItY3B1IiwgIk5laGFs
ZW0iLCAiLW0iLCAiMzIwIiwgIi1pbml0cmQiLCBjcGlvX2ZpbGVdLAo+IC0gICAgICAgICkKPiAt
ICAgICAgICBzZWxmLmVtdWxhdG9yLmxvZ2luKCkKPiAgIAo+IC0gICAgICAgIGNtZHMgPSBbCj4g
LSAgICAgICAgICAgICMgSW5pdAo+IC0gICAgICAgICAgICAibW9kcHJvYmUgemZzIiwKPiAtICAg
ICAgICAgICAgIm1vdW50IC1vIHJlbW91bnQsc2l6ZT0xMzJNIC90bXAiLAo+IC0gICAgICAgICAg
ICAiZmFsbG9jYXRlIC1sIDY0TSAvdG1wL2NvbnRhaW5lcjEucmF3IiwKPiAtICAgICAgICAgICAg
ImZhbGxvY2F0ZSAtbCA2NE0gL3RtcC9jb250YWluZXIyLnJhdyIsCj4gLSAgICAgICAgICAgICJ6
cG9vbCBjcmVhdGUgLW0gL3Bvb2wgcG9vbCByYWlkeiAvdG1wL2NvbnRhaW5lcjEucmF3IC90bXAv
Y29udGFpbmVyMi5yYXciLAo+IC0gICAgICAgICAgICAiZGQgaWY9L2Rldi91cmFuZG9tIGJzPTFN
IGNvdW50PTggb2Y9L3Bvb2wvdXJhbmRvbSIsCj4gLSAgICAgICAgICAgICJzaGEyNTZzdW0gL3Bv
b2wvdXJhbmRvbSA+IC90bXAvdXJhbmRvbS5zaGEyNTYiLAo+IC0gICAgICAgICAgICAjIENoZWNr
IFpGUwo+IC0gICAgICAgICAgICAienBvb2wgZXhwb3J0IHBvb2wiLAo+IC0gICAgICAgICAgICAi
enBvb2wgaW1wb3J0IHBvb2wgLWQgL3RtcC9jb250YWluZXIxLnJhdyAtZCAvdG1wL2NvbnRhaW5l
cjIucmF3IiwKPiAtICAgICAgICAgICAgImRkIGNvbnY9bm90cnVuYyBicz0xTSBjb3VudD0zMiBz
ZWVrPTE2IGlmPS9kZXYvdXJhbmRvbSBvZj0vdG1wL2NvbnRhaW5lcjEucmF3IiwKPiAtICAgICAg
ICAgICAgInpwb29sIHNjcnViIC13IHBvb2wiLAo+IC0gICAgICAgICAgICAic2hhMjU2c3VtIC1j
IC90bXAvdXJhbmRvbS5zaGEyNTYiLAo+IC0gICAgICAgICAgICAienBvb2wgc3RhdHVzIC12IiwK
PiAtICAgICAgICAgICAgIyBDaGVjayBQeVpGUwo+IC0gICAgICAgICAgICAiYXJjX3N1bW1hcnki
LAo+IC0gICAgICAgIF0KPiAtICAgICAgICBmb3IgY21kIGluIGNtZHM6Cj4gLSAgICAgICAgICAg
IHNlbGYuYXNzZXJ0UnVuT2soY21kKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
