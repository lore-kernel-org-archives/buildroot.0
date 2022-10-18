Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183E8C4332F
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 11:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4984441843;
	Tue, 18 Oct 2022 11:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4984441843
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJzcRypQaWPJ; Tue, 18 Oct 2022 11:49:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02478417C9;
	Tue, 18 Oct 2022 11:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02478417C9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BACF1BF37F
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 11:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 339F340A96
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 11:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 339F340A96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A-hzLPRvOpK0 for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 11:49:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6E3D40286
Received: from mail.dallmeier.com (mail.dallmeier.de [212.77.172.125])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6E3D40286
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 11:49:52 +0000 (UTC)
Received: from mbx1.dallmeier.de ([10.2.1.127]:8744)
 by mail.dallmeier.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 (Exim 4.95)
 (envelope-from <feedback@dallmeier.com>) id 1okl6P-0008Tn-2a;
 Tue, 18 Oct 2022 13:49:45 +0200
Received: from [10.2.4.202] (10.2.4.202) by MBX1.dallmeier.de (10.2.1.127)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Tue, 18
 Oct 2022 13:49:45 +0200
Message-ID: <a6f51821-8f4b-93ee-e6f4-5dd824053cd3@dallmeier.com>
Date: Tue, 18 Oct 2022 13:49:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <59335227-32d1-9d2f-ce9c-4a7a45ea913b@dallmeier.com>
 <20221014193021.GD2503@scaer>
In-Reply-To: <20221014193021.GD2503@scaer>
X-ClientProxiedBy: MBX1.dallmeier.de (10.2.1.127) To MBX1.dallmeier.de
 (10.2.1.127)
X-C2ProcessedOrg: 2d8b9317-1e46-4b99-bf0b-1ae0db9755e6
X-Outside: True
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=dallmeier.com; s=maildallmeiercom; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:CC:References:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LfGSMpUiPtqXZXkZYvKQpCo3oF4yM3ulcmshqAfcHF0=; b=ahgdBxtpkiRJcZNHX2AkW7NUNW
 eDO7pLy/3rGPdicwajp9Olk79houcwLsNREtrtOhRfaS0AupFKBXiy36kQAXCn622HvYBtbLCVA23
 GASEZOwDHh7pP/vEn4KzBwjgTS2II//5wFYIZz4xnWXLzBrA+P83eHkJnF+QQt8hRuH8=;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=dallmeier.com header.i=@dallmeier.com
 header.a=rsa-sha256 header.s=maildallmeiercom header.b=ahgdBxtp
Subject: Re: [Buildroot] [PATCH] package/dhcpcd: Fix kconfig option for
 privilege separation
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
From: feedback--- via buildroot <buildroot@buildroot.org>
Reply-To: feedback@dallmeier.com
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIwMjItMTAtMTQgMjE6MzAsIFlhbm4gRS4gTU9SSU4gd3JvdGU6Cj4gQW5kcmVhcywgQWxs
LAo+IAo+IE9uIDIwMjItMTAtMTQgMTE6MTAgKzAyMDAsIGZlZWRiYWNrLS0tIHZpYSBidWlsZHJv
b3Qgc3Bha2UgdGh1c2x5Ogo+PiBIaSBhbGwsCj4+Cj4+IHdlIGFyZSBub3Qgc3VyZSBpZiB0aGlz
IGlzIGV2ZW4gYSBidWcsIGJ1dCBCUjJfUEFDS0FHRV9ESENQQ0RfRU5BQkxFX1BSSVZTRVAgaXMg
bm90IHNlbGVjdGFibGUgdmlhICdtZW51Y29uZmlnJyB3aXRob3V0IHNldHRpbmcgYQo+PiBzdHJp
bmcgZm9yIHRoZSBib29sIHZhbHVlLgo+IAo+IFRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uCj4g
Cj4gVGhhdCB3YXMgb24gcHVycG9zZSB0aGF0IHRoaXMgd2FzIG5vdCBzZWxlY3RhYmxlLCBzZWUg
dGhlIGNvbW1pdCBsb2cKPiB0aGF0IGludHJvZHVjZWQgdGhlIG9wdGlvbiwgMjBkZDk0NTNmMzJj
IChwYWNrYWdlL2RoY3BjZDogYWRkCj4gQlIyX1BBQ0tBR0VfREhDUENEX0VOQUJMRV9QUklWU0VQ
KSwgd2hpY2ggcmVmZXJyZWQgdG86Cj4gCj4gICAgICBodHRwczovL3BhdGNod29yay5vemxhYnMu
b3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjEwMzAzMDkxOTA0LjQ2NzcwNi0xLWZvbnRh
aW5lLmZhYnJpY2VAZ21haWwuY29tCj4gCj4gd2hpY2ggYmFzaWNhbGx5IHNhaWQgKHBhcmFwaHJh
c2luZyk6Cj4gCj4gICAgICBGb3Igc3VjaCBjb21wbGV4IGNvbmRpdGlvbnMsIGl0IGlzIGVhc2ll
ciB0byBpbnRyb2R1Y2UgYSBLY29uZmlnCj4gICAgICBzeW1ib2wsIHJhdGhlciB0aGFuIHdyaXRl
IGNvbXBsZXggTWFrZWZpbGUgY29kZSBpbiB0aGUgLm1rIGZpbGUuCj4gCj4gSW5kZWVkLCBiZWZv
cmUgMjBkZDk0NTNmMzJjLCB0aGVyZSB3ZXJlIHF1aXRlIGEgZmV3IHJlcGV0aXRpdmUgY29kZQo+
IGJsb2NrcyB0byBoYW5kbGUgZWFjaCBvZiB0aGVtLCBzZWUgY29tbWl0IGQ0MTI1MzlkYmNhMiAo
cGFja2FnZS9kaGNwY2Q6Cj4gZGlzYWJsZSBwcml2c2VwIG9uIG9sZGVyIGtlcm5lbHMpLgo+IAo+
IENhbiB5b3UgZXhwbGFpbiB3aHkgeW91J2Qgd2FudCB0byBleHBsaWNpdGx5IGRpc2FibGUgcHJp
dmlsZWdlCj4gc2VwYXJhdGlvbiBpbiBkaGNwY2Q/CgpUaGFuayB5b3UgZm9yIHRoZSBleHBsYW5h
dGlvbi4gSSBkaWRuJ3Qga25vdyB0aGF0IHlvdSB1c2UgdGhlIGtjb25maWcgCnZhbHVlcyBhbHNv
IGZvciBvdGhlciBwdXJwb3NlcyBzb21ldGltZXMuCgpGaXJzdCB3ZSB0aG91Z2h0IHRoZSBrZXJu
ZWwgdmVyc2lvbiBmcm9tIG9uZSBvZiBvdXIgc3lzdGVtcyBpcyB0b28gb2xkIApiZWNhdXNlIG9m
IHNvbWUgc3RyYW5nZSBlcnJvciBtZXNzYWdlcyBkdXJpbmcgc3RhcnR1cCBvZiBkaGNwY2QsIGJ1
dCBpdCAKc2VlbXMgdGhhdCB0aGVyZSB3YXMgYW5vdGhlciBwcm9ibGVtIGludm9sdmVkIHdoaWNo
IGhhcyBiZWVuIGZpeGVkLgpJIGhhdmUgdHVybmVkIHByaXZpbGVnZSBzZXBhcmF0aW9uIGJhY2sg
b24gZm9yIG5vdy4KCgoKPj4gLS0tIGEvcGFja2FnZS9kaGNwY2QvQ29uZmlnLmluCj4+ICsrKyBi
L3BhY2thZ2UvZGhjcGNkL0NvbmZpZy5pbgo+PiBAQCAtMTIsNyArMTIsNyBAQCBjb25maWcgQlIy
X1BBQ0tBR0VfREhDUENECj4+ICDCoGlmIEJSMl9QQUNLQUdFX0RIQ1BDRAo+PiAgIAo+PiAgwqBj
b25maWcgQlIyX1BBQ0tBR0VfREhDUENEX0VOQUJMRV9QUklWU0VQCj4+IC3CoMKgwqDCoMKgwqAg
Ym9vbAo+PiArwqDCoMKgwqDCoMKgIGJvb2wgImVuYWJsZSBwcml2aWxlZ2Ugc2VwYXJhdGlvbiIK
Pj4gIMKgwqDCoMKgwqDCoMKgIGRlZmF1bHQgeQo+PiAgwqDCoMKgwqDCoMKgwqAgZGVwZW5kcyBv
biBCUjJfVVNFX01NVQo+PiAgwqDCoMKgwqDCoMKgwqAgIyBBdWRpdCBoZWFkZXJzIHdlcmUgb25s
eSBhZGRlZCBpbiByZWNlbnQga2VybmVscyBmb3Igc29tZSBhcmNoZXMKPj4KPj4gQmVzdCByZWdh
cmRzLAo+PiBBbmRyZWFzCj4gCj4+IDxodG1sPgo+IAo+IFBsZWFzZSwgYXZvaWQgaHRtbCBtYWls
OyBvdXIgcGF0Y2h3b3JrIGRpZCBub3QgZXZlbiBjYXRjaCBpdDoKPiAgICAgIGh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8KPiAKPiBOZXh0IHRpbWUs
IHBsZWFzZSB1c2UgImdpdCBzZW5kLWVtYWlsIiwgd2hpY2ggc2VuZHMgcGF0Y2hlcyBpbiBhIGZv
cm1hdAo+IHJlYWR5IHRvIGJlIGRpZ2VzdGVkIHRvIGJlIGFwcGxpZWQgZWFzaWx5LgoKU29ycnkg
Zm9yIHRoZSBIVE1MIG1haWwsIHRoaXMgb25lIGlzIHRleHQgaG9wZWZ1bGx5LgoKCgo+IFJlZ2Fy
ZHMsCj4gWWFubiBFLiBNT1JJTi4KPiAKPj4gICAgPGhlYWQ+Cj4+ICAgICAgPG1ldGEgaHR0cC1l
cXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPgo+
PiAgICA8L2hlYWQ+Cj4+ICAgIDxib2R5Pgo+PiAgICAgIDxmb250IGZhY2U9Im1vbm9zcGFjZSI+
SGkgYWxsLDxicj4KPj4gICAgICAgIDxicj4KPj4gICAgICAgIHdlIGFyZSBub3Qgc3VyZSBpZiB0
aGlzIGlzIGV2ZW4gYSBidWcsIGJ1dAo+PiAgICAgICAgQlIyX1BBQ0tBR0VfREhDUENEX0VOQUJM
RV9QUklWU0VQIGlzIG5vdCBzZWxlY3RhYmxlIHZpYQo+PiAgICAgICAgJ21lbnVjb25maWcnIHdp
dGhvdXQgc2V0dGluZyBhIHN0cmluZyBmb3IgdGhlIGJvb2wgdmFsdWUuPGJyPgo+PiAgICAgICAg
PGJyPgo+PiAgICAgICAgLS0tIGEvcGFja2FnZS9kaGNwY2QvQ29uZmlnLmluPGJyPgo+PiAgICAg
ICAgKysrIGIvcGFja2FnZS9kaGNwY2QvQ29uZmlnLmluPGJyPgo+PiAgICAgICAgQEAgLTEyLDcg
KzEyLDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0RIQ1BDRDxicj4KPj4gICAgICAgIMKgaWYgQlIy
X1BBQ0tBR0VfREhDUENEPGJyPgo+PiAgICAgICAgwqA8YnI+Cj4+ICAgICAgICDCoGNvbmZpZyBC
UjJfUEFDS0FHRV9ESENQQ0RfRU5BQkxFX1BSSVZTRVA8YnI+Cj4+ICAgICAgICAtwqDCoMKgwqDC
oMKgIGJvb2w8YnI+Cj4+ICAgICAgICArwqDCoMKgwqDCoMKgIGJvb2wgImVuYWJsZSBwcml2aWxl
Z2Ugc2VwYXJhdGlvbiI8YnI+Cj4+ICAgICAgICDCoMKgwqDCoMKgwqDCoCBkZWZhdWx0IHk8YnI+
Cj4+ICAgICAgICDCoMKgwqDCoMKgwqDCoCBkZXBlbmRzIG9uIEJSMl9VU0VfTU1VPGJyPgo+PiAg
ICAgICAgwqDCoMKgwqDCoMKgwqAgIyBBdWRpdCBoZWFkZXJzIHdlcmUgb25seSBhZGRlZCBpbiBy
ZWNlbnQga2VybmVscyBmb3Igc29tZQo+PiAgICAgICAgYXJjaGVzPGJyPgo+PiAgICAgICAgPGJy
Pgo+PiAgICAgICAgQmVzdCByZWdhcmRzLDxicj4KPj4gICAgICAgIEFuZHJlYXM8YnI+Cj4+ICAg
ICAgICA8YnI+Cj4+ICAgICAgPC9mb250Pgo+PiAgICA8L2JvZHk+Cj4+IDwvaHRtbD4KPiAKPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKPiAKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
