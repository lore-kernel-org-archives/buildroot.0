Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD01C678D4
	for <buildroot@archiver.kernel.org>; Fri,  3 Mar 2023 10:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A12F382193;
	Fri,  3 Mar 2023 10:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A12F382193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pqhe66Sp-PIa; Fri,  3 Mar 2023 10:31:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E50008218E;
	Fri,  3 Mar 2023 10:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E50008218E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D6F61BF34B
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 10:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5976E60BF8
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 10:31:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5976E60BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y6s-oMvXAsBN for <buildroot@lists.busybox.net>;
 Fri,  3 Mar 2023 10:31:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5717F60ADB
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5717F60ADB
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 10:31:38 +0000 (UTC)
Received: from [172.20.10.9] ([151.18.232.97])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Y2hLpkWKjrCpHY2hMpGvkO; Fri, 03 Mar 2023 11:31:36 +0100
Message-ID: <8e4dfa1a-818b-a2c6-0014-175a02ad8900@benettiengineering.com>
Date: Fri, 3 Mar 2023 11:31:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Christian Stewart <christian@paral.in>
References: <20230302151859.400567-1-giulio.benetti@benettiengineering.com>
 <CA+h8R2r5SvTysWRJO12UFCG8TdMQo1+Y+q+Mdam4nwj43+yNVw@mail.gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CA+h8R2r5SvTysWRJO12UFCG8TdMQo1+Y+q+Mdam4nwj43+yNVw@mail.gmail.com>
X-CMAE-Envelope: MS4xfOpj/MRy/yIIB5+Ma4NpOI5LTbPK4oa9vv4v4Y9gsQAOy6DH43ib1B/l4vOQSkijGbj08/QRSQ2qz07SOn9tSmxtYuN/9msGIp7kmqeriHhl5dRasQ7B
 R7Qw5SlCcdzKdUegyGcVDLK42k86hW6d55rF0RF/xgGqu/guo2x/o30BH08QSiQGJbd8VDwm2J22J2kjMcpAeGtqyWItxby4f7BxfJMRF2w2jajT9kcYyhPW
 /jSih4o81Jswe8VqarmLUw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1677839496; bh=IhSbZy3ZBznuQB27IW1OddSpJGL/F3UVi5G8ofrBLJs=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=M+Q9101m2LPLN5f0oV0pEAJ1XLNo0k4Vbp6AAAH8kFxA1jBB3LHo05cep+bVHK85J
 7yjJZDJIp08yvNiPdhufYrzTRpq+OH+2YET/J/sW6V/gYJooaczLosgIn7OpCKtGpB
 KbtmG8Cq9oO7Zryn9NoipEDmDXaViN3WsC/0IV/TcqE+3rJ1IG+XlNosUA1NJDwv/h
 PoAAAHNOYeeDmSPc1DO1s+aJKee8SI2UhcuCS3bObBE9HyiIoykN2vUlOkLp5Yz/aR
 8F6WBbXhdXkwcYgTFui55KHz2onfGXa+Kp4zefg9VRRRJqdWjZObYHCxPfxYnbLToP
 CvKK/vyKkbdSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=M+Q9101m
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: fix build failure on
 PowerPC64
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQ2hyaXN0aWFuLAoKT24gMDMvMDMvMjMgMDg6NDksIENocmlzdGlhbiBTdGV3YXJ0IHdyb3Rl
Ogo+IEhpIEdpdWxpbywKPiAKPiBPbiBUaHUsIE1hciAyLCAyMDIzIGF0IDc6MTnigK9BTSBHaXVs
aW8gQmVuZXR0aQo+IDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90
ZToKPj4KPj4gTGV0J3MgYWRkIGxvY2FsIHBhdGNoIHBlbmRpbmcgdXBzdHJlYW0gdG8gZml4IGdl
dF9yYSgpIGNvbmZsaWN0IG9uCj4+IFBvd2VyUEM2NCBhcmNoaXRlY3R1cmUuCj4+Cj4+IFswXTog
aHR0cHM6Ly9naXRodWIuY29tL21vcnJvd25yLzg4MjFjdS0yMDIxMDExOC9wdWxsLzkzCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5n
aW5lZXJpbmcuY29tPgo+PiAtLS0KPj4gICAuLi4vMDAwMS1GaXgtYnVpbGQtb24tUG93ZXJQQzY0
LnBhdGNoICAgICAgICAgfCAxMjMgKysrKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEyMyBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcnRs
ODgyMWN1LzAwMDEtRml4LWJ1aWxkLW9uLVBvd2VyUEM2NC5wYXRjaAo+IAo+IFRoZSByZXBvIG93
bmVyIG1vcnJvd25yIHJlcXVlc3RlZCB0aGF0IHdlIHN3aXRjaCB0byB0aGUgbmV3ZXIgdmVyc2lv
bgo+IG9mIHRoZSBwYWNrYWdlLCBhbmQgc2VuZCB0aGUgUFIgdGhlcmUuCj4gCj4gSSBzZW50IHRo
ZSBQUiB0aGVyZTogaHR0cHM6Ly9naXRodWIuY29tL21vcnJvd25yLzg4MjFjdS0yMDIxMDkxNi9w
dWxsLzczCgpUaGFuayB5b3UhCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5n
IHNhcwoKPiBUaGUgcGF0Y2ggdG8gdXBkYXRlIHRvIHRoZSBuZXcgdmVyc2lvbjoKPiAKPiBodHRw
czovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjMwMzAz
MDc0ODI5LjIxMzk4ODEtMS1jaHJpc3RpYW5AcGFyYWwuaW4vCj4gCj4gQmVzdCByZWdhcmRzLAo+
IENocmlzdGlhbiBTdGV3YXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
