Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F291AC4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 22:11:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B56260ED5
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 22:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B56260ED5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35A3A402F0;
	Sat, 14 Aug 2021 22:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pmgtl2saU0uI; Sat, 14 Aug 2021 22:11:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C54F34034B;
	Sat, 14 Aug 2021 22:11:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 627FC1BF397
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 22:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51C4F4034B
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 22:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gARzajr1PPYa for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 22:11:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22B56402F0
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 22:11:16 +0000 (UTC)
Received: from [192.168.47.129] ([141.136.135.234])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F1s3m59rRxC2nF1s3me86N; Sun, 15 Aug 2021 00:11:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628979076; bh=cd1B5kuyDh1VX6r+remp+zOTxp//fmi6YM8NcghlGgY=;
 h=Subject:From:To:Date:MIME-Version:Content-Type;
 b=egsBgaXvZUWvq1CXCvRBNJGEdiNxyh5jqiIEwCbTUuVV5RszziWgFysqeNYgCjqG0
 9zHYWHED+5TM7XKVJl2nkXb0FyM29MQ0LyUOMuBJUghCVXP8LfsktSPNf+PMMoDjKF
 f2/h1z9fPkap/t9ZNHd2rHmj8fI4axbWM8tbK0XQGh/czeZ6zFw0RMI6deJYaipFko
 AXJ9JG3ZEgqI1NNXPp48mV/koCuRadQApNWwrL/7CWzLu1i2tx0OaFD2ydh+fkNJj9
 983dfTZLG6jaHFwG2ISmCSNdb7SRxCzVcsxBgMgCf1uCukdqul5zgdpPuIsTv0Q5bm
 0PHMrWjwwo8Pg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
References: <20210813213745.1555522-2-giulio.benetti@benettiengineering.com>
 <ABDF0725-3074-4D93-A484-A99F219E9A50@benettiengineering.com>
Message-ID: <b7dc62d5-83c6-67d3-963f-6c6a41fff108@benettiengineering.com>
Date: Sun, 15 Aug 2021 00:11:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ABDF0725-3074-4D93-A484-A99F219E9A50@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfPJpSnQtfs6/ZFJH24nWLvaPh2HS6vi4CynVqRncWTf1eKCFQGFGOP041WkqLllpt5Y3xyhl2bGyyDsxax5Gu5Ell8W1cLO1Z7LtMFetvtOEr/sYgjhS
 Qb+iH767WpA0dNkP73eZUACgbjUjS+sbvW4+vRaYCOhausREG+jcXYfsfo0EYYDcCDlJ6yqNnQAuNzpfahbBSAknhzzX+SY6WgbUzTz3UeklrGQy0jjGrgaF
 L76W1e3EtL1mwo4hzwYaurcm1LSJuM3e4fSvm1NR1dW2BbI56fIDSnAGeUPbZip6mqU+DeEk7H629LUkT/85pY6wCZ8t3J1nOnaTu+hbIgY=
Subject: Re: [Buildroot] [PATCH 1/3] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_97208
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

UGxlYXNlIGRyb3AgdGhpcyBwYXRjaCwgSSd2ZSBhbHJlYWR5IHNldCBpdCBhcyBSZWplY3RlZCBp
biBQYXRjaHdvcmsuClNvcnJ5IGZvciB0aGUgbm9pc2UKCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5l
dHRpIEVuZ2luZWVyaW5nIHNhcwoKT24gOC8xNC8yMSAxOjE1IEFNLCBHaXVsaW8gQmVuZXR0aSB3
cm90ZToKPiBIaSwKPiAKPj4gSWwgZ2lvcm5vIDEzIGFnbyAyMDIxLCBhbGxlIG9yZSAyMzozOCwg
R2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IGhh
IHNjcml0dG86Cj4+Cj4+IO+7v2xtYmVuY2ggcGFja2FnZSBmYWlscyB0byBidWlsZCBmb3IgdGhl
IE1pY3JvYmxhemUgYXJjaGl0ZWN0dXJlIHdpdGgKPj4gb3B0aW1pemF0aW9uIGVuYWJsZWQgd2l0
aCBnY2MgPSAxMS4xLjA6Cj4gCj4gXl5eIOKAmGdjYyA8PSAxMeKAmSwgbm90IG9ubHkgPQo+IAo+
PiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9hZTEvYWUxZTRkNjFlZDM2
N2M2Y2I2NDQ0MmM2MGQ5ODg4MmNjNzk4NTM0Ni8KPj4KPj4gSXQncyBiZWVuIHJlcG9ydGVkIHVw
c3RyZWFtIGJ5IFJvbWFpbiBOYW91cjoKPj4gaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9z
aG93X2J1Zy5jZ2k/aWQ9OTcyMDgKPj4KPj4gQ2M6IFJvbWFuIE5hb3VyIDxyb21haW4ubmFvdXJA
Z21haWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0
dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPj4gLS0tCj4+IHRvb2xjaGFpbi9Db25maWcuaW4g
fCA3ICsrKysrKysKPj4gMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvdG9vbGNoYWluL0NvbmZpZy5pbiBiL3Rvb2xjaGFpbi9Db25maWcuaW4KPj4gaW5k
ZXggMzg4OGVlYWZlMi4uMWRhZTBjYjJjYyAxMDA2NDQKPj4gLS0tIGEvdG9vbGNoYWluL0NvbmZp
Zy5pbgo+PiArKysgYi90b29sY2hhaW4vQ29uZmlnLmluCj4+IEBAIC0xNjMsNiArMTYzLDEzIEBA
IGNvbmZpZyBCUjJfVE9PTENIQUlOX0hBU19HQ0NfQlVHXzkzODQ3Cj4+ICAgICBib29sCj4+ICAg
ICBkZWZhdWx0IHkgaWYgQlIyX25pb3MyICYmICFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF85
Cj4+Cj4+ICsjIGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTk3
MjA4Cj4+ICsjIElDRTogaW4gZXh0cmFjdF9pbnNuLCBhdCByZWNvZy5jOjIyOTQgb24gbWljcm9i
bGF6ZS4KPj4gKyMgVGhpcyBidWcgc3RpbGwgZXhpc3RzIGluIGdjYyA9IDExLjEuMAo+PiArY29u
ZmlnIEJSMl9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfOTcyMDgKPj4gKyAgICBib29sCj4+ICsgICAg
ZGVmYXVsdCB5IGlmIEJSMl9taWNyb2JsYXplCj4+ICsKPj4gIyBodHRwczovL2djYy5nbnUub3Jn
L2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD05OTQxMAo+PiAjIEVycm9yOiBicmFuY2ggb2Zmc2V0
IG91dCBvZiByYW5nZSBvbiBOaW9zIElJLiBUaGlzIGJ1Zwo+PiAjIG5vIGxvbmdlciBleGlzdHMg
aW4gZ2NjID49IDkueC4KPj4gLS0gCj4+IDIuMjUuMQo+Pgo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
IGJ1aWxkcm9vdEBidXN5Ym94Lm5ldAo+IGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5u
ZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
