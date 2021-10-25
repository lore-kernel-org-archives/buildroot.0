Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B23EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:28:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D958560C4B
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D958560C4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A9A36086F;
	Mon, 25 Oct 2021 12:28:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U5hJkukjFkcM; Mon, 25 Oct 2021 12:28:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E276560865;
	Mon, 25 Oct 2021 12:28:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D07131BF375
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C51A080CC0
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vJAyg7rdmt6z for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 12:28:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id 098AD80CB4
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:28:42 +0000 (UTC)
Received: from [192.168.153.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ez5kmbsUXrIRlez5km5pHi; Mon, 25 Oct 2021 14:28:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635164921; bh=5qYK95IADqGiucnhYMN8cGkO1UM2Qbjffsy/8y3NA0c=;
 h=Subject:From:To:Date:MIME-Version:Content-Type;
 b=kc0A61RrUFMgpEypwPTwkKajF48f0t/MKSRMBv8mgEUX8EsOevKMrrM9ggFSdaPjV
 j1nwu3TSozdDh9GrQPf3iRayiwhDPed+jlEI/9AEOhgwtoAuaQJbS9qf19K2shyNzL
 iWwufTw6xajafuhKgJADPdDgncWo83aSPOvTNFiBfq9Gk6BIzIzTknr6XImuhGfct7
 wFK+MWww3N9HJCqmXCQ+WEgJexV/58S5RwMw8AV426NTs5Uc2J6IU6vV/IUsk7BaST
 Bo+r6FYcsXH30KiIrIt+GqYnBKhD7nYQt/AKlglSwRaZQSjKSUpdnPGZYvVYanijgZ
 RC2H/vcA8asFg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211024160940.4d4b6706@windsurf>
 <3646EE4F-A9B4-4C74-9DED-53A5EDC2A3FC@benettiengineering.com>
Message-ID: <bc87defa-10d5-9235-35bd-a068ebc82128@benettiengineering.com>
Date: Mon, 25 Oct 2021 14:28:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3646EE4F-A9B4-4C74-9DED-53A5EDC2A3FC@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfDaqdBdVznC2LjpLhJzAZ8W0Kub6fZzyYhh6T95SlpfyrxOX+6gagMnD5/ejRhPwvKuEtj22jgbK6H5X/j/WhYmHxl6VOToAngAPEhrAICbc09b/y+df
 mTmiJKbcgxEabel254BJEQ/SLseI+4/pFvE7XtpteGDV4JWv+5j777Dn/VxCga6gIB43v7eCQ34lVyECTOVmGwMHivfrbycR3PfhJSws1pZLrzrMsPYDzBbg
 J67jcsY94qSloIMv7Ieid5A/h65Jui2gG4yC/dkIcY0zTn2qdNG6sUP0P014v2zDkQ86jZBN3lTWhOnZk8m+r4CrA/uTF1tuRapP97egK7ZZAeJA2u7w8HaF
 UhH2dDsO
Subject: Re: [Buildroot] [PATCH 0/8] Olimex boards u-boot/linux update
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, Leon Anavi <leon.anavi@konsulko.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gMTAvMjQvMjEgNDo0MCBQTSwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4g
SGkgVGhvbWFzLAo+IAo+PiBJbCBnaW9ybm8gMjQgb3R0IDIwMjEsIGFsbGUgb3JlIDE2OjA5LCBU
aG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBoYSBzY3JpdHRv
Ogo+Pgo+PiDvu79IZWxsbyBHaXVsaW8sCj4+Cj4+PiBPbiBGcmksIDIyIE9jdCAyMDIxIDAwOjAw
OjE1ICswMjAwCj4+PiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2lu
ZWVyaW5nLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gR2l1bGlvIEJlbmV0dGkgKDgpOgo+Pj4gICBjb25m
aWdzL29saW1leF9hMTBfb2xpbnV4aW5vOiBidW1wIHRvIExpbnV4IGtlcm5lbCA1LjE0LjEzIGFu
ZCB1LWJvb3QKPj4+ICAgICAyMDIxLjEwCj4+PiAgIGNvbmZpZ3Mvb2xpbWV4X2ExMF9vbGludXhp
bm86IHVzZSBGUFUgTkVPTiBzdHJhdGVneQo+Pj4gICBjb25maWdzL29saW1leF9hMTNfb2xpbnV4
aW5vOiBidW1wIHRvIExpbnV4IGtlcm5lbCA1LjE0LjEzIGFuZCB1LWJvb3QKPj4+ICAgICAyMDIx
LjEwCj4+PiAgIGNvbmZpZ3Mvb2xpbWV4X2ExM19vbGludXhpbm86IHVzZSBGUFUgTkVPTiBzdHJh
dGVneQo+Pj4gICBjb25maWdzL29saW1leF9hMjBfb2xpbnV4aW5vX2xpbWUyOiBidW1wIHRvIExp
bnV4IGtlcm5lbCA1LjE0LjEzIGFuZAo+Pj4gICAgIHUtYm9vdCAyMDIxLjEwCj4+PiAgIGNvbmZp
Z3Mvb2xpbWV4X2EyMF9vbGludXhpbm9fbGltZTogYnVtcCB0byBMaW51eCBrZXJuZWwgNS4xNC4x
MyBhbmQKPj4+ICAgICB1LWJvb3QgMjAyMS4xMAo+Pj4gICBjb25maWdzL29saW1leF9hMjBfb2xp
bnV4aW5vX21pY3JvOiBidW1wIHRvIExpbnV4IGtlcm5lbCA1LjE0LjEzIGFuZAo+Pj4gICAgIHUt
Ym9vdCAyMDIxLjEwCj4+PiAgIGNvbmZpZ3Mvb2xpbWV4X2EzM19vbGludXhpbm86IGJ1bXAgdG8g
TGludXgga2VybmVsIDUuMTQuMTMgYW5kIHUtYm9vdAo+Pj4gICAgIDIwMjEuMTAKPj4KPj4gSSBo
YXZlIGFwcGxpZWQgYWxsIHRoZSBwYXRjaGVzIGJ1bXBpbmcgVS1Cb290L0xpbnV4LCBJIGhvcGUg
dGhhdCB5b3UKPj4gd2VyZSBhYmxlIHRvIHRlc3QgdGhlbSBvbiByZWFsIGhhcmR3YXJlLgo+IAo+
IFllcyBJ4oCZdmUgdGVzdGVkIG9uIHJlYWwgYm9hcmQgZXhjZXB0IGExMCB0aGF0IEkgZG9u4oCZ
dCBvd24gYW5kIEnigJl2ZSBicm9rZW4gdGhlIGEzMyB0aGF0IEnigJlsbCBoYXZlIG9uIFR1ZXNk
YXkgc28gSSB3aWxsIHRlc3QgaXQuCgpKdXN0IHJlY2VpdmVkIGEzMyBvbGludXhpbm8sIHRlc3Rl
ZCBhbmQgaXQgd29ya3MgY29ycmVjdGx5LgpUaGUgcHJldmlvdXMgYm9hcmQgaXMgZGVmaW5ldGVs
eSBicm9rZW4uCgpCZXN0IHJlZ2FyZHMKLS0gCkdpdWxpbyBCZW5ldHRpCkJlbmV0dGkgRW5naW5l
ZXJpbmcgc2FzCgo+PiBNYWtlIHN1cmUgdG8gbW9uaXRvciB0aGUgbmV4dAo+PiBHaXRsYWIgQ0kg
YnVpbGQgcmVzdWx0cyB0byBzZWUgaWYgdGhlcmUncyBhbnkgbmV3IGJ1aWxkIGZhaWx1cmUuCj4g
Cj4gU3VyZSBJIHdpbGwKPiAKPj4KPj4gSG93ZXZlciwgZm9yIHRoZSB0d28gcGF0Y2hlcyBlbmFi
bGluZyBORU9OIGFzIHRoZSBGUFUsIEkgbWFya2VkIHRoZW0gYXMKPj4gcmVqZWN0ZWQuIEluZGVl
ZCwgdXNpbmcgTkVPTiBhcyB0aGUgRlBVIGlzIG5vdCBhbHdheXMgYSBnb29kIGlkZWEsIGFzCj4+
IGl0IGV4cGxhaW5lZCBpbiB0aGUgQ29uZmlnLmluLmhlbHAgdGV4dDoKPj4KPj4gICAgICAgICAg
IFRoaXMgb3B0aW9uIGFsbG93cyB0byB1c2UgdGhlIE5FT04gU0lNRCB1bml0LCBhcyBhdmFpbGFi
bGUKPj4gICAgICAgICAgIGluIHNvbWUgQVJNdjcgcHJvY2Vzc29ycywgYXMgYSBmbG9hdGluZy1w
b2ludCB1bml0LiBJdAo+PiAgICAgICAgICAgc2hvdWxkIGhvd2V2ZXIgYmUgbm90ZWQgdGhhdCB1
c2luZyBORU9OIGZvciBmbG9hdGluZyBwb2ludAo+PiAgICAgICAgICAgb3BlcmF0aW9ucyBkb2Vz
bid0IHByb3ZpZGUgYSBjb21wbGV0ZSBjb21wYXRpYmlsaXR5IHdpdGggdGhlCj4+ICAgICAgICAg
ICBJRUVFIDc1NC4KPiAKPiBUaGFuayB5b3UgZm9yIHBvaW50aW5nIEkgZGlkbuKAmXQga25vdyBh
bmQgZm91bmQgaXQgb24gQXJtIHdlYnNpdGUgdG9vLiBTbyBub3cgSSB1bmRlcnN0YW5kIHRoZSBy
ZWFzb24gdG8gbm90IHByZWZlciBORU9OIG9ubHkgb24gY29ydGV4IGE4Lgo+IFdoaWxlIG9uIGE3
IGluc3RlYWQgd2UgaGF2ZSB0aGUgTkVPTitWRlBWNAo+IHRoYXQgY292ZXIgSUVFRSA3NTQuCj4g
Cj4gQmVzdCByZWdhcmRzCj4gR2l1bGlvIEJlbmV0dGkKPiAKPj4KPj4gQmVzdCByZWdhcmRzLAo+
Pgo+PiBUaG9tYXMgUGV0YXp6b25pCj4+IC0tIAo+PiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25l
ciBhbmQgQ0VPLCBCb290bGluCj4+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcgYW5kIHRyYWluaW5nCj4+IGh0dHBzOi8vYm9vdGxpbi5jb20KPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
