Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A78C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:38:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 684486140B
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 684486140B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3248C6068A;
	Mon,  4 Oct 2021 20:38:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1PuTIxG08UUs; Mon,  4 Oct 2021 20:38:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78093605CF;
	Mon,  4 Oct 2021 20:38:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63EB41BF2C5
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 533E683B3B
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mMCqk2R2sDS8 for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 20:37:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4210183B36
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 20:37:56 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XUihmZhVGJzjeXUihmJvNc; Mon, 04 Oct 2021 22:37:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633379875; bh=OcFUfZXKKnOZQHo8iX81zbjxJkpTthD4idugih7ur2E=;
 h=Subject:From:To:Date:MIME-Version:Content-Type;
 b=EtRqbje8KYaYj8alibN76EzhHFkjWAGUArxutrbnITmQAw+RbrmtgivbEUzcJ4B/h
 HZBhILT36hh5rxqUJQHKSsRqrZlZH482t+M6GDNUtUhGWKEphtLVrTr08kfp3A3u2K
 2gtJdch76rlfRRztyOFxTJridsdwncajvxXe58ZQp/9b6L50uFjbJavvves5rLFqkn
 03N2BE/qbTEKuB+DLxxajGGCiuMZQMclGv5+puHYgr838EwEhErRrVyqqQ1+uE7aTp
 YvtODZutLehKclaPaMBdkmZmt3h2uFV92eb1yFhL5haRr8eVy5gXnwI/8bWe8Ejvcc
 Mq7tSY04yOlog==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Peter Korsgaard <peter@korsgaard.com>
References: <20211004150113.GB1504958@scaer>
 <1462D59B-55E2-4933-AD39-7EF25B2FBE9E@benettiengineering.com>
 <8d31c452-eed9-5643-37e3-945bdba91968@benettiengineering.com>
Message-ID: <ef8e95bf-74df-5746-f5a5-39cb0b770faf@benettiengineering.com>
Date: Mon, 4 Oct 2021 22:37:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8d31c452-eed9-5643-37e3-945bdba91968@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfCFXue1Fres2tNm3CCVzZY+TKjUBYnPCjphil/X+XexauI5tsRxc6zwH/09yMPWuVmNk0ORsL5GRYrqcGlWXmbHIABTiN0+BjzKWv3gY39mgJ8zDqWS9
 +cnsT5AKufa7Qpr9ujmnc+vBCdCksQEbCwLixgWl2QkkKHnd5H/T3TGSGCAdHdFcpUZRrhgXpkc7fA4zaDKJwUK9UyLM+VL2QhuZHGVcqWtuzf4lXGiAeLHr
 8MAhYbrbUsIvx3CzDUm5URfIXgXh3L+7FLRQJjewVz5wKeDJ/tTZPgCzT7BaeI7qoWKiclZgsoJC83xRpSbb+BUm6TRCvtDirzMEPdMcZ7lGIrtQGRyoNptQ
 SUh7kLNh
Subject: Re: [Buildroot] [PATCH v2] package/mesa3d: fix build on m68k
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTAvNC8yMSAxMDozNSBQTSwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4gSGkgYWdhaW4gUGV0
ZXIsIFlhbm4sIEFsbCwKPiAKPiBPbiAxMC80LzIxIDU6MjMgUE0sIEdpdWxpbyBCZW5ldHRpIHdy
b3RlOgo+PiBIaSBQZXRlciwgWWFubiwgQWxsLAo+Pgo+Pj4gSWwgZ2lvcm5vIDQgb3R0IDIwMjEs
IGFsbGUgb3JlIDE3OjAxLCBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4g
aGEgc2NyaXR0bzoKPj4+Cj4+PiDvu79QZXRlciwgR2l1bGlvLCBBbGwsCj4+Pgo+Pj4gT24gMjAy
MS0xMC0wNCAxMzo0NiArMDIwMCwgUGV0ZXIgS29yc2dhYXJkIHNwYWtlIHRodXNseToKPj4+Pj4+
Pj4+ICJHaXVsaW8iID09IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5n
aW5lZXJpbmcuY29tPiB3cml0ZXM6Cj4+Pj4KPj4+Pj4gVG8gYnVpbGQgbWVzYTNkIGZvciBtNjhr
IHdlIG5lZWQgdG8gcGFzcyAtbWxvbmctanVtcC10YWJsZS1vZmZzZXRzIENGTEFHCj4+Pj4+IHNp
bmNlICdzd2l0Y2gnIGJsb2NrcyBhcmUgcHJldHR5IHdpZGUgYW5kIGxlYWQgdG8gYnVpbGQgZmFp
bHVyZS4gVGhpcyB3YXkKPj4+Pj4gJ3N3aXRjaCcgYmxvY2tzIHdpbGwgaGF2ZSBhIDMyLWJpdCBh
ZGRyZXNzaW5nIGJ5IGRlZmF1bHQgaW5zdGVhZCBvZiB0aGUKPj4+Pj4gc3RhbmRhcmQgMTYtYml0
LiBUaGlzIGNhbiBiZSBkb25lIG9ubHkgd2l0aCBtNjhrIGdjYyB2ZXJzaW9uID49IDcueAo+Pj4+
PiBiZWNhdXNlIGdjYyBmbGFnIHVzZWQgdG8gZml4IHRoaXMoLW1sb25nLWp1bXAtdGFibGUtb2Zm
c2V0cykgaXMKPj4+Pj4gYXZhaWxhYmxlIG9ubHkgZnJvbSB0aGF0IHZlcnNpb24gb24uCj4+Pj4K
Pj4+Pj4gRml4ZXM6Cj4+Pj4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRz
LzYwYzQ2NTNjMmE5MzEyNWVkYmRkMGJlYjQzY2Q0NzMwMTY0MzQ2NGEvCj4+Pj4KPj4+Pj4gU2ln
bmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVl
cmluZy5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiBWMS0+IFYyOgo+Pj4+PiAqIGFkZCBnY2MgPj0gNy54
IGRlcGVuZGVuY3kgdG8gQ29uZmlnLmluIGFzIHN1Z2dlc3RlZCBieSBZYW5uIE1vcmluCj4+Pj4+
ICogaW1wcm92ZSBjb21taXQgbG9nIGFjY29yZGluZyB0byBDb25maWcuaW4gY2hhbmdlCj4+Pj4K
Pj4+PiAuLgo+Pj4+Cj4+Pj4+ICsjIG02OGsgbmVlZHMgMzItYml0IG9mZnNldHMgaW4gc3dpdGNo
IHRhYmxlcyB0byBidWlsZAo+Pj4+PiAraWZlcSAoJChCUjJfbTY4aykseSkKPj4+Pj4gK01FU0Ez
RF9DRkxBR1MgKz0gLW1sb25nLWp1bXAtdGFibGUtb2Zmc2V0cwo+Pj4+PiArZW5kaWYKPj4+Pj4g
Kwo+Pj4+PiArTUVTQTNEX0NPTkZfT1BUUyArPSAtRENNQUtFX0NfRkxBR1M9IiQoTUVTQTNEX0NG
TEFHUykiCj4+Pj4+ICsKPj4+Pj4gJChldmFsICQobWVzb24tcGFja2FnZSkpCj4+Pj4KPj4+PiBE
b2VzIHRoYXQgcmVhbGx5IHdvcms/IG1lc2EzZCBpcyB1c2luZyBtZXNvbiwgbm90IGNtYWtlLgo+
IAo+IEl0IGNvbWVzIG91dCB0aGF0IGl0IHdvcmtzCj4gCj4+Pgo+Pj4gQXBwYXJlbnRseSwgbm86
Cj4+PiAgICAgIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzI2YS8yNmE5
N2UwODBjNDljNDJjMDZlZDU5ZWM2YTlkNTFkODFiMGFiODgyL2J1aWxkLWVuZC5sb2cKPiAKPiBU
aGlzIGhhcyBub3QgdGhpcyBwYXRjaCBhcHBsaWVkLCBzbyBpdCdzIG9rIGl0IGZhaWxzLgo+IAo+
IFRoZXJlIGlzIG9uZSB1bm5lY2Vzc2FyeSBsaW5lOgo+IE1FU0EzRF9DT05GX09QVFMgKz0gLURD
TUFLRV9DX0ZMQUdTPSIkKE1FU0EzRF9DRkxBR1MpIgo+IAo+IE9uIG1lc29uIHdlIGRvbid0IG5l
ZWQgaXQsIHNvIGl0J3Mgc3VwZXJmbG91cyBhbmQgd2hhdCByZWFsbHkgcGFzc2VzIHRoZQo+IGFk
ZGl0aW9uYWwgQ0ZMQUdTIGlzIGl0c2VsZjoKPiBNRVNBM0RfQ0ZMQUdTICs9IC1tbG9uZy1qdW1w
LXRhYmxlLW9mZnNldHMKPiBiZWNhdXNlIGluIHBrZy1tZXNvbi5tazoKPiAkKDIpX0NGTEFHUyA/
PSAkJChUQVJHRVRfQ0ZMQUdTKQo+IAo+IEkndmUganVzdCBzdWJtaXR0ZWQgYSBwYXRjaCB0byBy
ZW1vdmUgdGhlIHVubmVjZXNzYXJ5IGxpbmU6CgpodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjExMDA0MjAzNTM1LjkyMzQ2Ny0xLWdpdWxpby5i
ZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20vCgpJJ3ZlIGZvcmdvdHRlbiB0byBwb2ludCBp
dCwgc29ycnkgZm9yIHRoZSBub2lzZQoKQmVzdCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpC
ZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
