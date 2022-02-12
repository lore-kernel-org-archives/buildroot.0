Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179EFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 12:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B26FC60BB5;
	Sat, 12 Feb 2022 12:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gH9Y1YimPW_h; Sat, 12 Feb 2022 12:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6C776064D;
	Sat, 12 Feb 2022 12:55:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 945211BF84C
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 12:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 882DF40272
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 12:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vbDZgNJAA1o3 for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 12:55:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9859940227
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 12:55:21 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id a8so28084779ejc.8
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 04:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SACpwycJ+Y28JpV3RQ4ujBBiNlOI0Iq3sgjUeFvM9m0=;
 b=Z3SOiF5g/2DZTv00GBddBB8cAeYJ0pmeA6uIttPzcH4fDgwD8kf0hkWE9ha705i++1
 EVP1rN6HHO/TnVoD/sEthe6+nEijP5SRR6lvBupCuizRybtejt+8V77IME+SVim51r89
 mx4Gx3UDJZz3PNtRi54q3b1WlSf0rc/ty/CzRAaw0BMSFiBDQz+eiRfTy65XZJm9f2uB
 T8rO7nh4sWPE3KwM9ffkEhszkCKtbeSg6I281ASXP8HDuswiKlIqNs2gTxxk4IoadXiS
 7VxUVeLUMTPp6/CyNSofs1yR7lGcAu46GJ1GU+9z0sv6TzeHwfOucDsRPRXO/hn5/K5I
 jdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SACpwycJ+Y28JpV3RQ4ujBBiNlOI0Iq3sgjUeFvM9m0=;
 b=LyLWoRPM3ingMJIBEuZxlf52YfQIns6wdfQZVwZ/FIbTg52Tn4RBPrLzRRcLOyorAF
 +yHbuBMzf53sad8od51Gx+0+vKvgcAJ5z/BgydeeIDnFxWvKOJlbGRWl66V5TUr3Iz/j
 Dbf6NvEPvrOcb6cuM1CL4hhDLio5ezwa9huC483Cc04w2OJ6LO3dkP/3ktOCNcCTftnT
 zT4JsYuOWsvXL/Rb80x60w7u7xllpBRJWot39IccBEScT2qtCyFPq0hs13ts83iCMreJ
 8fj5QDwF0ERXy2FsGalJyINTcQXrGrqWnbTeJSuEk7EJw+d1JnugwdFT6/DAacJklHEZ
 wL4g==
X-Gm-Message-State: AOAM533RRJgf3q6tmwVbRDNQ3eb5c67+swSzN9gr0OdJDzUf6sHRkgDq
 cWwAoVuJG91Y81h4ibtXdg9OfQ==
X-Google-Smtp-Source: ABdhPJyXjHZBnrZgffGPjwOGW/4RMgWgONU2+NTbxCwE0LukZOFUl292Uu7e10QWGGUXrur7Cp6cSQ==
X-Received: by 2002:a17:907:628f:: with SMTP id
 nd15mr4806539ejc.585.1644670519868; 
 Sat, 12 Feb 2022 04:55:19 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n7sm8704018edr.8.2022.02.12.04.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 04:55:19 -0800 (PST)
Message-ID: <6b5d3b43-fe50-0dd2-2903-e404ee7792b9@mind.be>
Date: Sat, 12 Feb 2022 13:55:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@smile.fr>
References: <20220131015937.4113728-1-james.hilliard1@gmail.com>
 <20220131104553.715b97ce@windsurf>
 <731c2ec5-e693-f2d4-5f48-0eaf376c57d1@smile.fr>
 <CADvTj4q9ea12wJk3FfpRdwKVhvLDGrBa9HW89rA2tfPQhX+NRg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4q9ea12wJk3FfpRdwKVhvLDGrBa9HW89rA2tfPQhX+NRg@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package:{clang, lld,
 llvm}: bump to version 11.1.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Romain Naour <romain.naour@gmail.com>,
 Matthew Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMi8wMi8yMDIyIDIwOjM5LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBPbiBNb24sIEph
biAzMSwgMjAyMiBhdCA0OjM2IEFNIFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZy
PiB3cm90ZToKPj4KPj4gSGVsbG8gSmFtZXMsIFRob21hcywgQWxsLAo+Pgo+PiBMZSAzMS8wMS8y
MDIyIMOgIDEwOjQ1LCBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWlsZHJvb3QgYSDDqWNyaXQgOgo+
Pj4gT24gU3VuLCAzMCBKYW4gMjAyMiAxODo1OTozNyAtMDcwMAo+Pj4gSmFtZXMgSGlsbGlhcmQg
PGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Pj4KPj4+PiBUaGlzIGFwcGVhcnMg
dG8gYmUgdGhlIGxhdGVzdCB2ZXJzaW9uIHRoYXQgaGFzIGEgd29ya2luZyBsbGQgYnVpbGQuCj4+
Pj4KPj4+PiBWZXJzaW9uIDEyLjAuMCBhbmQgbmV3ZXIgaGF2ZSBicm9rZW4gbGxkIHN0YW5kLWFs
b25lIGJ1aWxkczoKPj4+PiBodHRwczovL2J1Z3MubGx2bS5vcmcvc2hvd19idWcuY2dpP2lkPTQ5
MjI4Cj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlh
cmQxQGdtYWlsLmNvbT4KPj4+Cj4+PiBJcyB0aGlzIHJlYWxseSBlbm91Z2g/IEkgcmVtZW1iZXIg
c2VlaW5nIHBhdGNoZXMgYSBsb25nIHRpbWUgYWdvIGRvaW5nCj4+PiBidW1wcyBvbiBMTFZNL0Ns
YW5nIGFuZCB0aGF0IHdhcyBtdWNoIG1vcmUgaW52b2x2ZWQsIHdoaWNoIEkgdGhpbmsKPj4+IGV4
cGxhaW5zIHdoeSB3ZSdyZSBzdGlsbCBhdCB2ZXJzaW9uIDkueC4KPj4+Cj4+PiBSb21haW4sIGFu
eSBjb21tZW50cyBvbiB0aGlzPwo+Pgo+PiBBZGRpbmcgTWF0dCBpbiBDYzoKPj4KPj4gSUlSQywg
dGhlcmUgaXMgYW4gaXNzdWUgd2l0aCBsaWJjbGMgcGFja2FnZSB3aGljaCBpcyBwYXJ0IG9mIHRo
ZSBsbHZtIHByb2plY3QuCj4+Cj4+IER1ZSB0byB0aGUgZ2FwIGJldHdlZW4gdGhlIHR3byB2ZXJz
aW9uLCBhbGwgQ01ha2Ugb3B0aW9ucyBtdXN0IGJlIHJldmlld2VkIChsb25nCj4+IGFuZCBib3Jp
bmcgdGFzayBJIGFncmVlKS4KPiAKPiBPaCwgSSBndWVzcyB0aGVyZSB3YXMgYWxyZWFkeSBhIHNl
cmllcyBoZXJlIHdpdGggbW9yZSBjaGFuZ2VzOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5v
cmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8/c2VyaWVzPTIzMzQzMSZzdWJtaXR0ZXI9JnN0YXRl
PSomcT0mYXJjaGl2ZT1ib3RoJmRlbGVnYXRlPQoKICBHaXZlbiB0aGUgZGlzY3Vzc2lvbiBpbiBi
b3RoIHRoZXNlIHRocmVhZHMsIEkndmUgbWFya2VkIHRoZSBwYXRjaCBhcyBDaGFuZ2VzIApSZXF1
ZXN0ZWQuCgogIFJlZ2FyZHMsCiAgQXJub3V0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
