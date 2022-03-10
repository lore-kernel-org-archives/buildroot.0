Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C41C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 14:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5BD340270;
	Thu, 10 Mar 2022 14:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2tGP3cgfu0Db; Thu, 10 Mar 2022 14:13:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F00284012E;
	Thu, 10 Mar 2022 14:13:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E8E71BF419
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 14:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B2FF4014B
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 14:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FrShHG-ZFB22 for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 14:12:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B0F540012
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 14:12:58 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id r22so7902774ljd.4
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 06:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=J5RUdFzgPuVkJiKcqSioXtPd6jaXeq1D/NIMWKojRHk=;
 b=NZO+bwqa5557S2sFqUyuIOUqs/Vyf0xra+id+r+qRH3KnaSCvta718wSionoTWVxzF
 /xYXPP2jclYbjTizHhuZL9LE4vLzGzTmxARw92pkIPoT30wyWn0rYF2anUSQWFDGDj74
 1T5CTteXAaSspbS0HC+oWSpcK24eJJaN2dXKaCWRgj2ii+dwoocijyjq1CLCxQTqGr40
 BtIaiDiCMJUDUw7jwt3HFZYU6fYmJNhyKadnFxKMcQF6ljruM4GNz6NjKMiFEAosTVkd
 KolDEXidgEO76vqe7NX5awPRGfjKVAj6iP9PSKW63aK7RW9iHW9of61yG8OKPBd0naz6
 pHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=J5RUdFzgPuVkJiKcqSioXtPd6jaXeq1D/NIMWKojRHk=;
 b=hdiZhurwkbmb/wIvtlX8EvXDXmidlPweq/8Gna4b8KfzdJOBVFcqabtfcfBTUAxon9
 +7dTYQd66bu+DBsKUEH/c9zDzz9S+h7nuEjk5hPt/bQkbwtgMnJBTuVdZ0ehPrds4Qbl
 9GqRSLdY3MrN8AJbE/XFWHVEPT2wxceOepR38ndxd7GnalJLhyM47BUY/OVH02BmMewQ
 JvRwpqRK+J4Gj+3S776GlJBd6TRwKUUs7yxjlLx4pjiDN3TthLMeD08sI59UJqWf5KZG
 bBihkIwXrpzZ74Y0UDI8j4tt1Sn/FR40nakHcRXzDHnPBcxq8lcOCPs3Bdtl+LIQvFza
 bugw==
X-Gm-Message-State: AOAM530du7aXS/XN1prodA32gFFRlnyvsaIE8zNUIFtaeHKT8L86qHFE
 9oLUM61Uakowdp5x1Z8RkOmFi5oe2+Y=
X-Google-Smtp-Source: ABdhPJzV2JkIagzZ0GRq6d4wphSqfDyuM99MZLUGehkyVVUtW2RaajF7EAqJ7lYKPpmDthrKcGNqIQ==
X-Received: by 2002:a2e:3013:0:b0:247:ea0d:11e2 with SMTP id
 w19-20020a2e3013000000b00247ea0d11e2mr3163047ljw.2.1646921575978; 
 Thu, 10 Mar 2022 06:12:55 -0800 (PST)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 l19-20020a194953000000b00448303beb13sm999648lfj.272.2022.03.10.06.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 06:12:55 -0800 (PST)
Message-ID: <95291ce8-0b8d-9bfc-8a5c-db6d640d2255@gmail.com>
Date: Thu, 10 Mar 2022 15:12:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220308183527.17639-1-zajec5@gmail.com>
 <20220309220800.GF23050@scaer>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20220309220800.GF23050@scaer>
Subject: Re: [Buildroot] [PATCH V2] package/lzma-alone: new package
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
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gOS4wMy4yMDIyIDIzOjA4LCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+IE9uIDIwMjItMDMtMDgg
MTk6MzUgKzAxMDAsIFJhZmHFgiBNacWCZWNraSBzcGFrZSB0aHVzbHk6Cj4+IEZyb206IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4KPj4gVGhpcyBuZXcgcGFja2FnZSBwcm92
aWRlcyAibHptYV9hbG9uZSIgaG9zdCBiaW5hcnkgYmFzZWQgb24gdGhlIG9yaWdpbmFsCj4+IExa
TUEgU0RLLiBJdCBwcm92aWRlcyBmZXcgZXh0cmEgb3B0aW9ucyB3aGVuIGNvbXBhcmVkIHRvIHRo
ZSBMWk1BIFV0aWxzCj4+IC8gWFogVXRpbHMgcHJvamVjdCAibHptYSIgYmluYXJ5IChhbHJlYWR5
IHBhY2thZ2VkIGFzIHRoZSAibHptYSIpLgo+Pgo+PiBUaGlzIHBhY2thZ2luZyBzY2hlbWEgKExa
TUEgU0RLIHdpdGggbHptYSAtPiBsem1hX2Fsb25lIHJlbmFtZSkgZm9sbG93cwo+PiBEZWJpYW4n
cyBzb2x1dGlvbi4gUGxlYXNlIG5vdGUgdGhhdCBEZWJpYW4gYWxzbyB1c2VzIExaTUEgU0RLIGZv
ciB0aGUKPj4gYmFzZSAibHptYSIgdG9vbCB3aGljaCBtYXkgYmUgY29uc2lkZXJlZCBmb3IgQnVp
bGRyb290IHRvbyAtIGFzIGFuCj4+IGluZGVwZW5kZW50IGNoYW5nZS4gU2ltaWxhciBwYWNrYWdp
bmcgaXMgYWxzbyB1c2VkIGJ5IFVidW50dSAmIEFyY2guCj4+Cj4+IGx6bWFfYWxvbmUgaXMgYSBy
ZXF1aXJlbWVudCBmb3IgcHJlcGFyaW5nIGZpcm13YXJlIGltYWdlcyBmb3Igc29tZQo+PiBCcm9h
ZGNvbSBiYXNlZCBob21lIHJvdXRlcnMgd2l0aCBhIHBpY2t5IENGRSBib290bG9hZGVyLiBJdCBo
YXMgbGltaXRlZAo+PiBMWk1BIHN1cHBvcnQgYW5kIGJ1aWxkaW5nIGNvbXBhdGlibGUgaW1hZ2Vz
IHJlcXVpcmVzIHNwZWNpZnlpbmcKPj4gZGljdGlvbmFyeSBzaXplIGFuZCBsYy9scC9wYiBMWk1B
IHZhbHVlcyBtYW51YWxseS4KPj4KPj4gVmVyc2lvbiA5LjIyIGlzIHVzZWQgYXMgaXQncyB0aGUg
bGFzdCByZWxlYXNlIHVzaW5nIC50YXIuYnoyIGZvcm1hdC4KPiAKPiBXZSBjb3VsZCBpbnRyb2R1
Y2UgYSBob3N0IHZhcmlhbnQgb2YgcDd6aXAsIHNvIHRoYXQgd2UgY291bGQKPiBhdXRvbWF0aWNh
bGx5IGFkZCB0aGF0IHRvIEZPT19FWFRSQUNUX0RFUEVOREVOQ0lFUyBpZiB0aGUgaG9zdCBkb2Vz
IG5vdAo+IGFscmVhZHkgaGF2ZSA3emEgKG9yIDd6ciksIGxpa2Ugd2UgZG8gZm9yIGx6aXAgYXJj
aGl2ZXMgZm9yIGV4YW1wbGUuCgpJIGNhbiBzZWUgN3ogZm9ybWF0IHN1cHBvcnQgaXMgbm8gbGVz
cyBtZXNzeSB0aGFuIExaTUEgdG9vbHMuCgpJdCBzZWVtcyB0aGF0IDctWmlwIHByb2plY3QgZGlk
bid0IHByb3ZpZGUgY29tbWFuZC1saW5lIHRvb2wgaW5pdGlhbGx5CmFuZCB0aGF0IHJlc3VsdGVk
IGluIGRldmVsb3BpbmcgcDd6aXAuIEl0IHNlZW1zIGl0IGhhcyBjaGFuZ2VkIHRob3VnaC4KClNv
IHdlIGhhdmUgdHdvIHByb2plY3RzOgoKMS4gcDd6aXAKKiBQcm92aWRlcyAiN3oiIGFuZCAiN3ph
IgoqIExhc3QgdXBkYXRlZCBpbiAyMDE2CiogU3VmZmVycyBmcm9tIHNlY3VyaXR5IGlzc3Vlcwoq
IFJlcXVpcmVzIHBhdGNoaW5nICgxMSBEZWJpYW4gcGF0Y2hlcywgMiBmb3IgQ1ZFcykKCjIuIDct
WmlwCiogUHJvdmlkZXMgIjd6ciIgKGRvY3VtZW50ZWQgYXMgIjd6YSIpCiogTGFzdCB1cGRhdGVk
IGluIDIwMjEKKiBNZXNzeSBzb3VyY2UKKiBEb2Vzbid0IGV2ZW4gY29tcGlsZSBvbiBzb21lIHN5
c3RlbXM6Ci4uLy4uLy4uL0MvVXRpbC83ei83ek1haW4uYzozNjM6NTogZXJyb3I6IGluaXRpYWxp
emVyIGVsZW1lbnQgaXMgbm90IGNvbnN0YW50CiAgICAgIChjb25zdCBVSW50NjQpNjAgKiA2MCAq
IDI0ICogKDg5ICsgMzY1ICogKGtVbml4VGltZVN0YXJ0WWVhciAtIGtGaWxlVGltZVN0YXJ0WWVh
cikpOwogICAgICBeCgpXaGljaCBvbmUgb2YgYWJvdmUgd2Ugc2hvdWxkIHRyeSB0byBwYWNrYWdl
PwoKCj4gQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkh1Z2UgdGhhbmtzIGZvciB5b3VyIGhl
bHAuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
