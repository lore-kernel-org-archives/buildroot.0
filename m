Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77918C54E68
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 22:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14CD160634;
	Tue, 19 Mar 2024 22:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jAdK0bSwy1rA; Tue, 19 Mar 2024 22:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A5D56074D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A5D56074D;
	Tue, 19 Mar 2024 22:31:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FC621BF28F
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 22:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29BD56074D
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 22:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bxMTlNEgElcd for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 22:31:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.132;
 helo=smtpdh18-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4043A60634
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4043A60634
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4043A60634
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 22:31:24 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id mhzOrjm40UaPXmhzOr05ma; Tue, 19 Mar 2024 23:31:22 +0100
Message-ID: <de337dcc-6b8b-4082-80a0-85e36469e188@benettiengineering.com>
Date: Tue, 19 Mar 2024 23:31:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christian Stewart <christian@aperture.us>, stefan@agner.ch
References: <893660729815cb737418892a77d27ba089a6cbde.1677568448.git.stefan@agner.ch>
 <20240319215037.8766-1-christian@aperture.us>
 <CA+h8R2p6raJ3KpOU0mP-dTgj=nKxk62o8xutd3HPdf7K+Jpc=Q@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CA+h8R2p6raJ3KpOU0mP-dTgj=nKxk62o8xutd3HPdf7K+Jpc=Q@mail.gmail.com>
X-CMAE-Envelope: MS4xfFiTeYhxgJkSn6DL4VaAsl4DpTJc1Zh9rO0scdIslCq4X6OIeqDQ5AmdEai6ryTChaM6ftwvyECIo2Oaj5mnnNNs0RJt4JdJ0RIGSAi3eWAMyJLEoWGC
 fb9U5q0wMAZOD/4EVjWn5/NSHrDADzmf8gPk5zZUyNEXlOaIaW4bkYxFLd8yk1+IRVstYSCaAzVXrHJ9HO6Ea4x6+PDe3Aau5H8xfrwE6JIS/zR9IaXyy4sd
 09N7ZJSqSbIx7oWFY4kukS9YKYMpjL1bb51EJ5hTV4I=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1710887482; bh=CES1o+qcsnna38cl24nmiUXCKUXe4RDeNNzcUda6/5U=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=JZT6C75Pc+XpPx3xGJTDHxm3ulQ7N830Cx9BUhoWZP20rK1UkL6scyeIOpuq/KAFU
 SnzEko55k9ecFVAbk7COlXu7uOnRhcFu7+CPjn4BYSYiIzxmOH5iMGQfLChX+vNSD8
 5NlhhmqHYk1fCzokAX8I7yJRg3T+eG9vjNUFhyHgwTO3rvLG3f3HCKWyOThwnDzD4J
 Lbd580+S9aweKGwV2Hh6VIBjgRUg7Goq1XPn1GTMVaSOy3HGpijJKotWZPw3YvN5VC
 WGF81JxvvCqCOx0Hx4GeAkn8JB8FmRm2vYKOUNUgeOeRIPxywFEzoTN71RIkN4KYpJ
 lOPi+9P1gPM9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=JZT6C75P
Subject: Re: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: bump to
 version 2024-03-16 on branch v5.6.4.2
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

SGkgQ2hyaXN0aWFuLAoKT24gMTkvMDMvMjQgMjI6NTIsIENocmlzdGlhbiBTdGV3YXJ0IHZpYSBi
dWlsZHJvb3Qgd3JvdGU6Cj4gQWxsLAo+IAo+IE9uIFR1ZSwgTWFyIDE5LCAyMDI0IGF0IDI6NTDi
gK9QTSBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPiB3cm90ZToKPj4K
Pj4+IFRoaXMgdmVyc2lvbiBhZGRzIHN1cHBvcnQgdXAgdG8gTGludXggdmVyc2lvbiA2LjguCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0
dGllbmdpbmVlcmluZy5jb20+Cj4+PiAtLS0KPj4+IHBhY2thZ2UvcnRsODgxMmF1LWFpcmNyYWNr
LW5nL3J0bDg4MTJhdS1haXJjcmFjay1uZy5oYXNoIHwgMiArLQo+Pj4gcGFja2FnZS9ydGw4ODEy
YXUtYWlyY3JhY2stbmcvcnRsODgxMmF1LWFpcmNyYWNrLW5nLm1rICAgfCAyICstCj4+PiAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBbc25p
cF0KPj4+Cj4+PiAtc2hhMjU2ICA5NjlmYTk2YzkwZTE2ZmNhZjhmNmIzMGQ0NTc2YTg0NDZjNzA0
MTkzMmJlYTM0YmJmZWE3ZTljOTEwMzhiZmU1ICBydGw4ODEyYXUtYWlyY3JhY2stbmctNGE5ODNl
NDdkYWZjMDQ4MDE5NDEyMzUwZDM2MjcwODY0ZjZiNWYyZC50YXIuZ3oKPj4+ICtzaGEyNTYgIDc1
MmQ5YWU2NzE0MDk2NmVkZGM0NjMyMzhmZGUxZjZiODY0NTdkYjIyYTQ1ZjYxYzEzODg2YzMyNDRl
YWZmZTEgIHJ0bDg4MTJhdS1haXJjcmFjay1uZy1mMjM5NzlmMGQyMGFhZmI1NjNhYzcxYjU2ZmNi
Yzc0MjY4Yzc5OGMyLnRhci5nego+Pj4KPj4+IFtzbmlwXQo+Pj4KPj4+IC1SVEw4ODEyQVVfQUlS
Q1JBQ0tfTkdfVkVSU0lPTiA9IDRhOTgzZTQ3ZGFmYzA0ODAxOTQxMjM1MGQzNjI3MDg2NGY2YjVm
MmQKPj4+ICtSVEw4ODEyQVVfQUlSQ1JBQ0tfTkdfVkVSU0lPTiA9IGYyMzk3OWYwZDIwYWFmYjU2
M2FjNzFiNTZmY2JjNzQyNjhjNzk4YzIKPj4KPj4gVGhhbmtzLCBmaXhlcyBidWlsZCBvbiA2Ljgu
eC4KPj4KPj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1
cmUudXM+Cj4gCj4gCj4gSSB3YXMgdHJ5aW5nIHRvIHJlcGx5IHRvIGFuIGFscmVhZHkgc2VudCBw
YXRjaDoKPiAKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290
L3BhdGNoLzIwMjQwMzE4MjAzNTM3LjM0MTUyMy0xLWdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdp
bmVlcmluZy5jb20vCj4gCj4gTm90IHN1cmUgaWYgdGhlIHJlcGx5IHdlbnQgdG8gdGhlIGNvcnJl
Y3QgbWVzc2FnZSB0aHJlYWQuCgpJdCBkaWQgOi0pCgo+IAo+IFRyeWluZyB0byBpbXBvcnQgYW5k
IHNlbmQgcmVwbGllcyB0byBtYm94IHdpdGggZ21haWwgaXMgbm90IHNvIGVhc3khCgpJIGFncmVl
IQoKVGhhbmsgeW91IGFuZApCZXN0IHJlZ2FyZHMKLS0gCkdpdWxpbyBCZW5ldHRpCkNFTyZDVE9A
QmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKCj4gCj4gVGhhbmtzLAo+IENocmlzdGlhbgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
