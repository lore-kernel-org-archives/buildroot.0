Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1CAE7717F
	for <buildroot@archiver.kernel.org>; Tue, 10 Dec 2024 10:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6FAA81086;
	Tue, 10 Dec 2024 10:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7O9t68EKeoqG; Tue, 10 Dec 2024 10:23:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA44481087
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA44481087;
	Tue, 10 Dec 2024 10:23:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB25DE11
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 10:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9205607DA
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 10:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9r6Mvck9ywox for <buildroot@buildroot.org>;
 Tue, 10 Dec 2024 10:23:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.146;
 helo=smtpcmd13146.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E8F1C60766
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8F1C60766
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8F1C60766
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 10:23:38 +0000 (UTC)
Received: from [172.25.4.118] ([151.79.164.54])
 by Aruba Outgoing Smtp  with ESMTPSA
 id KxOwtxcHU15fBKxOxt4UmW; Tue, 10 Dec 2024 11:23:35 +0100
Message-ID: <71f241d3-bbc5-4b2d-ad8e-131aa29de1c7@benettiengineering.com>
Date: Tue, 10 Dec 2024 11:23:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
References: <20241207201936.103809-1-giulio.benetti@benettiengineering.com>
 <24da891859b2444d6044c3bb22c18a40@free.fr>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <24da891859b2444d6044c3bb22c18a40@free.fr>
X-CMAE-Envelope: MS4xfIMp1Nnao/fGND+Ty3EPrfpCvJezrCfLYsT6hq1IvrV2fFChVevS4FF4LOi+nXGiqeJ4MusXIERwZZ1I3UE+DENFJuAAn9uvTJRDmmFz3EXgq8eM4Nk0
 u99Myc9cSt7jHs41/a2y6wPFi/zIbxNYGCBMyRE7g6FVfLjj9vMeMRU+Ht8ZHW64hIB8scsUazPNoAQAUklzHc4UF6GbrTRX2EseuR8RYrTzryFyFZqt665V
 O/fdLclz6/ZVYsgJaQRomwZ7xaOd+UqS+3vQoUzvZxI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1733826215; bh=xIUC1A6bCGDrMUIy1t5990ohVrkH1qarhcmkbiZTPEI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=gXpCjcEkQ8GRvJuWXmX1tt4OgHNnLh8jcEuJIsuD78REqc1KUdDQvk1+d3YIeA0Z/
 CjzWkx2QXgjwtb4VZVWw4loHz4YBTdOBR0/txf0mB4ZKuZXBAwD/KwPd8VOCjVa4x9
 e9LZ+FRk3tU+ZYv4g44CWNrI+YEzBmJTYXcexhpMvLtsO2zVL7JZZHbZ4p9jWkJliv
 dVEAg17VeJbKqZ/wPRla0a71JKVUc+ryHFNozb4hXbum3FMBEUwr8N+ix4JTFW6vb6
 rhNfsoLimYg4AieUTa/wC6uN6SeSekCmyd7QC+hJJi3bnEGOjbGTHg2KG8j6jDFNSH
 c769Kkt0T8eqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=gXpCjcEk
Subject: Re: [Buildroot] [PATCH] package/rtl8192eu: bump to 2024-12-03
 version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKT24gMTIvOS8yNCAyMzo1MiwgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4gSGkg
R2l1bGlvLAo+IAo+IE9uIDA3LzEyLzIwMjQgMjE6MTksIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+
PiBUaGlzIHZlcnNpb24gYWxsb3dzIHRvIGJ1aWxkIHdpdGggTGludXggNi4xMy4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVl
cmluZy5jb20+Cj4gCj4gQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KPiAKPiBJIGZpeGVkIGEg
Y2hlY2stcGFja2FnZSBlcnJvci4KPiAKPj4gLS0tCj4+IMKgcGFja2FnZS9ydGw4MTkyZXUvcnRs
ODE5MmV1Lmhhc2ggfCAyICstCj4+IMKgcGFja2FnZS9ydGw4MTkyZXUvcnRsODE5MmV1Lm1rwqDC
oCB8IDIgKy0KPj4gwqAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnRsODE5MmV1L3J0bDgxOTJldS5oYXNo
IGIvcGFja2FnZS9ydGw4MTkyZXUvIAo+PiBydGw4MTkyZXUuaGFzaAo+PiBpbmRleCBhOGI3Y2I5
MzU4Li4zZTcwZDM2ZDU3IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3J0bDgxOTJldS9ydGw4MTky
ZXUuaGFzaAo+PiArKysgYi9wYWNrYWdlL3J0bDgxOTJldS9ydGw4MTkyZXUuaGFzaAo+PiBAQCAt
MSwyICsxLDIgQEAKPj4gwqAjIExvY2FsbHkgY29tcHV0ZWQKPj4gLXNoYTI1NiAKPj4gOGRhMGY1
NGJkOWFlMDk0YjVmNjFmZTNjNGRkMjA3YjJkZjYyYjQyODY5NzBlMjgyOGY3YzVjZTExNDY0NDdm
YiAKPj4gcnRsODE5MmV1LTU2ZjY3MmE4Yjk1NzJjNzQzMTQ4ZjJlNjAwNjhmZDM0MWQ1MmQ1YTMu
dGFyLmd6Cj4+ICtzaGEyNTYgCj4+IGRiZDU2NWVkYzhkNTJhMTQyOWQ4NTUxNzk1ZmI0ZGEzY2E0
NGNmMjc4Njc0NjYwMTBlMGU2ZDAwYzg2YWVmNWMgCj4+IHJ0bDgxOTJldS02NzU1Y2U5YzE1YmJj
YjVkY2ZmYmNhN2Y2ZjA4ZTY2MWNjZGFhY2RiLnRhci5nego+PiBcIE5vIG5ld2xpbmUgYXQgZW5k
IG9mIGZpbGUKPiAKPiBUaGUgY29tbWFuZDoKPiAKPiAgwqDCoMKgIHV0aWxzL2RvY2tlci1ydW4g
bWFrZSBjaGVjay1wYWNrYWdlCj4gCj4gcmVwb3J0cyBoZXJlOgo+IAo+ICDCoMKgwqAgcGFja2Fn
ZS9ydGw4MTkyZXUvcnRsODE5MmV1Lmhhc2g6MjogbWlzc2luZyBuZXdsaW5lIGF0IGVuZCBvZiBm
aWxlCj4gCj4gSSBmaXhlZCBpdCBiZWZvcmUgYXBwbHlpbmcuCgpUaGFuayB5b3UuIEkgaGF2ZSB0
byBidWlsZCBpbnNpZGUgZG9ja2VyIHRvIGF2b2lkIHRoaXMuCgpCZXN0IHJlZ2FyZHMKLS0gCkdp
dWxpbyBCZW5ldHRpCkNFTyZDVE9AQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
