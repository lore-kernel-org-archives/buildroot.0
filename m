Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74A3C433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 19:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31E64400E5;
	Wed, 12 Jan 2022 19:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGMP_34JMQjY; Wed, 12 Jan 2022 19:10:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67D6C4011D;
	Wed, 12 Jan 2022 19:10:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 934C51BF3CD
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80A6E84C23
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4HCCnF9YOd4Q for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 19:10:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8784F84C22
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 19:10:43 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id q25so13952598edb.2
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 11:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FLqqLBEba5HqFh6cLNqb3RqcCFHk/IogLipag9M3FwY=;
 b=Zmhhg3qrbAwap/51VmEN2RXCRH7DyYd6DSqnhc3Kf4O30CWYi9pGm8OoLOmRGfQ9yR
 C0KGrPWhpNgyHxTJG70qNej101ZGMqm5rs8yXDK7am3BUryn2BbQ4C+SId/x4HqPJejG
 /PZ3t7omw9cDrEJGGZQJ9RcpnfXgpHv/T3Qcb+lSOoIWQue0/50jxP7F95v55nQMCq4t
 KHqo5W9+MKOai7xrygsOLwM1O3H3Amybw4pxgdo16VVeqFFROYum8YoYkE11lfz9udlS
 GkYrAELV+5jU2ZReI8KAJ1uqnw6+dagAz+yjIMn2aFUXXb6QpLq4Je05dD+pNMHkWFrV
 Om9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FLqqLBEba5HqFh6cLNqb3RqcCFHk/IogLipag9M3FwY=;
 b=B46Inwa4uJ+h0OXY6pWxegtRnsjxfjo383Uf3vSi1/HdgMXhyiu3UILr/LHsgq95Do
 vGdL6nmUgEV8tRMFGgNjP56PuqS0iiIo4nRI+8BlFTEx+eePNto/mA9GxAktI59Y6fnQ
 gRLSI2+rEER2CephYk95eCN8vUmT1+CvDUHSFH/yBmEjFDCoUnF7C7cLjTNBT7I5GDkX
 yBN1kMmVP2PZz4SCSqLEEgBbDFVFVnWjZHMFNxGZTWKW+vmw0JzuuXz/j4gaiF5jzKdC
 dxny/9vymF4u+jwsk12sZCxXOE/E+vtJvRiS0zl8pIO88r6AHf6yWTFm1dKzVB1VCUXJ
 KJUg==
X-Gm-Message-State: AOAM532mSkquSvAdqMd5eRbhO46Xi/Jg4p5eYiOClXvVqm6FTQjW9coi
 iI0xV1uJEPbrBHiU/Dz6EFKNeA==
X-Google-Smtp-Source: ABdhPJxZ3Tq80d+Fla7CdbtAXjKK7iiEJFkB7hj61XX03rLAFDTT6+3PTN0W2ipbjSdFhywLyhOXrw==
X-Received: by 2002:a05:6402:2696:: with SMTP id
 w22mr1003898edd.296.1642014641693; 
 Wed, 12 Jan 2022 11:10:41 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qf18sm176913ejc.124.2022.01.12.11.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 11:10:41 -0800 (PST)
Message-ID: <0abbcb3c-e2db-ae06-a065-2bcb71b74f8d@mind.be>
Date: Wed, 12 Jan 2022 20:10:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210518113652.29609-1-patrickdepinguin@gmail.com>
 <20210518113652.29609-4-patrickdepinguin@gmail.com>
 <5269b781-3bed-9b6c-9a4f-2d077964a16e@smile.fr>
 <CAAXf6LVZ38y=7X2YzN9WoC-0N940D2WGUFP54aRhT4FebTkfnA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAAXf6LVZ38y=7X2YzN9WoC-0N940D2WGUFP54aRhT4FebTkfnA@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 3/4] core: introduce BR2_KERNEL_ARCH_OVERRIDE
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMi8wMS8yMDIyIDEyOjA0LCBUaG9tYXMgRGUgU2NoYW1waGVsZWlyZSB3cm90ZToKPiBI
aSBSb21haW4sCj4gCj4gRWwgbHVuLCAxMCBlbmUgMjAyMiBhIGxhcyAwOjI3LCBSb21haW4gTmFv
dXIgKDxyb21haW4ubmFvdXJAc21pbGUuZnI+KSBlc2NyaWJpw7M6Cj4+Cj4+IEhlbGxvIFRob21h
cywKPj4KPj4gTGUgMTgvMDUvMjAyMSDDoCAxMzozNiwgVGhvbWFzIERlIFNjaGFtcGhlbGVpcmUg
YSDDqWNyaXQgOgo+Pj4gRnJvbTogVGhvbWFzIERlIFNjaGFtcGhlbGVpcmUgPHRob21hcy5kZV9z
Y2hhbXBoZWxlaXJlQG5va2lhLmNvbT4KPj4+Cj4+PiBUaGVyZSBhcmUgY2FzZXMgd2hlcmUgYSA2
NC1iaXQgYXJjaGl0ZWN0dXJlIGlzIHJ1bm5pbmcgYSA2NC1iaXQga2VybmVsIGJ1dAo+Pj4gMzIt
Yml0IHVzZXJzcGFjZS4gRXhhbXBsZXMgaW5jbHVkZToKPj4+ICAgICAgKiBhYXJjaDY0IGFyY2hp
dGVjdHVyZSwgd2l0aCBhYXJjaDY0IGtlcm5lbCBhbmQgMzItYml0IChBUk0pIHVzZXJzcGFjZQo+
Pj4gICAgICAqIHg4Nl82NCBhcmNoaXRlY3R1cmUsIHdpdGggeDg2XzY0IGtlcm5lbCBhbmQgMzIt
Yml0IChpMzg2KSB1c2Vyc3BhY2UKPj4KPj4gQ2FuIHlvdSBwcm92aWRlIGEgbmV3IHFlbXUgZGVm
Y29uZmlnIHRoYXQgY292ZXIgdGhpcyB1c2UgY2FzZT8KPj4gVGhpcyBpcyBmb3IgZ2l0bGFiLWNp
IHJ1bnRpbWUgdGVzdGluZy4KPj4KPj4gQmVzdCByZWdhcmRzLAo+PiBSb21haW4KPj4KPj4gUFM6
IChUaGlzIGVtYWlsIGRvZXNuJ3QgY291bnQgYXMgYSByZXZpZXcgb2YgdGhpcyBzZXJpZXMgOikp
Cj4gCj4gCj4gVGhhbmtzIGZvciB5b3VyIGludGVyZXN0IGluIHRoaXMgc2VyaWVzIDotKQo+IAo+
IEN1cnJlbnRseSB0aGUgcWVtdSBkZWZjb25maWcgdGhhdCBJIHVzZSB1c2VzIGFuIGV4dGVybmFs
IHRvb2xjaGFpbgo+IGJ1aWx0IHZpYSBjcm9zc3Rvb2wtbmcuIENyb3NzdG9vbC1uZyBpcyBjYXBh
YmxlIG9mIGNyZWF0aW5nIGEgbXVsdGlsaWIKPiB0b29sY2hhaW4gc3VwcG9ydGluZyAzMi1iaXQg
YW5kIDY0LWJpdCBiaW5hcmllcy4KPiBIb3dldmVyLCBCdWlsZHJvb3QgZG9lcyBub3QgY3VycmVu
dGx5IHN1cHBvcnQgdGhpcyBmb3IgaW50ZXJuYWwKPiB0b29sY2hhaW5zLiBIb3cgZG8geW91IHN1
Z2dlc3QgdG8gcHJvY2VlZCBoZXJlPwo+IENvdWxkIHdlIHBlcmhhcHMgYWRkIGEgY3Jvc3N0b29s
LW5nLWJ1aWx0IG11bHRpbGliIHRvb2xjaGFpbiB0byB0aGUKPiBCb290bGluIHRvb2xjaGFpbnM/
CgogIEJvb3RsaW4gdG9vbGNoYWlucyBubyAtIHRoZXkgYXJlIGdlbmVyYXRlZCBieSBCdWlsZHJv
b3QuCgogIEhvd2V2ZXIsIGl0IHdvdWxkIGJlIHVzZWZ1bCB0byBoYXZlIHN1Y2ggYSB0b29sY2hh
aW4gYXMgYW4gYXV0b2J1aWxkZXIgCnRvb2xjaGFpbi4gV2UgY291bGQgdXNlIGl0IGJvdGggaW4g
YSAzMi1iaXQgYW5kIDY0LWJpdCBjb25maWcuIFdlIGNhbiBzaW1wbHkgYWRkIAp5b3VyIGJpbmFy
eSB0byBhdXRvYnVpbGQuYnVpbGRyb290Lm9yZy90b29sY2hhaW5zL3RhcmJhbGxzIGFuZCBhZGQg
dHdvIGNvbmZpZyAKZnJhZ21lbnRzIHRvIHN1cHBvcnQvY29uZmlnLWZyYWdtZW50cy9hdXRvYnVp
bGQuCgogIFRoZSBzYW1lIHRvb2xjaGFpbiB0YXJiYWxsIGNhbiB0aGVuIGFsc28gYmUgdXNlZCBm
b3IgYSBydW50aW1lIHRlc3QuCgogIFJlZ2FyZHMsCiAgQXJub3V0CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
