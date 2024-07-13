Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F021C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3B66400BF;
	Sat, 13 Jul 2024 19:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOLDfRHEY2Ym; Sat, 13 Jul 2024 19:23:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D343401D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D343401D8;
	Sat, 13 Jul 2024 19:23:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2C671BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CFB360605
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8N-6AhNPh-uk for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:23:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 209D1605F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 209D1605F5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 209D1605F5
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:23:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.112.6]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7K3Y-1sRbKi02ns-00HUSi; Sat, 13
 Jul 2024 21:23:08 +0200
Message-ID: <af335782-20ce-4f0d-876e-97c9d2777ca7@gmx.de>
Date: Sat, 13 Jul 2024 21:23:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20240713115244.848755-1-fiona.klute@gmx.de>
 <ae7df766-114c-4b14-82ba-54528af7edc1@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <ae7df766-114c-4b14-82ba-54528af7edc1@mind.be>
X-Provags-ID: V03:K1:Dafo6OA61x1CmThSmNuIwqCzWp8jHOcFnTTSDDjYVF9ivICcDSg
 +ZygDoml7WXVBmRPZ8FTcdFFMV54FlxI426EoblbfzqgwwX7LNvo7oRmIkYIgP4LGPf0BmN
 Gg37L5Nmgd1ytXgvyOPOLPR3MljJYvvbhEG/yNLHkObCPiVzrIIwdbCIPQc6P9p6+zswtPF
 kTrIMS8kIP8QfM0YgYcYQ==
UI-OutboundReport: notjunk:1;M01:P0:sXLqUf2Wqn8=;FVsrqY6kyYYOpGGCcoP+PFLqp8/
 lD2EWebcxT0kB/iwDLU22SeyqSZweDW8tCdpW5ONhYl/VwVCn0/Wqx5fVCrav7DzoP9xP4r2i
 NHWZ4kXeceUWrV/Qpmf/JRlEdYSbbs3S60bVvw3mOMnCPBwYpU8ZqjXrtCw70Y1M+Td05nwpQ
 CHGyKBdQVzGk5dNThKmf/AdUHcwuWYyrGQcJQa3G6cuMP5lnd7URVOeDUkmqbn0bYRo5SbSrw
 pVzRUPjOQZHdV1pknsl19en+canZ6HJHrn9g5zkUM2z1h5/npzucJDyksdIew9HVMqBdtMMs0
 gAN0lSXqiGhEnajRNXYWL1BipVvnKmPJM7g/HaTg2tzTY71Yhw34N6CbdAjawKxP9dIcP99cm
 agbukeYa+Ws9a2fxtPI1ZgJfxcnxvoWJZ1DbFlNz4a2BRmdzZfJvamonM9/klnchDRYyNCM+P
 XKmG/TzQVMsb5cgvVioQDKYXs1Eub0FLzdCoNGaCPEXO0wuUgamwmLK8ZkfRkygqKqFms6Bbe
 8A4nRjZqhxd88TZ7Qofb3HJ/9mpNKQVgsepO/7LpCCgYLPTqliSca7EpVMTzSIKDQYxeM5Ufa
 j8Bo+/u9Bg4QUzKDVKnp3qZdFacXJ5cMFiKN0Xz0Z9lCAAvXVsE97yhb9k4Zqut7gmbQO6ODv
 slxGTG1LB1k0zjs4wJMpq+qWj1KvRIGNog62HkLFo6vOb4PoU6leq75xUiaovx6TyTOAbDSYf
 NCXN/r/vm5Q50Vppri8f5BsxVvAPQ7EzIY10dmNhnh/3SQSCzuiXSjNFCXMTGBlR4OjmqVP6X
 c4nsQ3wGoR0bzyS7qiZQyfrQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720898588; x=1721503388; i=fiona.klute@gmx.de;
 bh=LK50qNZN8lgiw98Q6IvgDF+Onn6dSDG7vG2jJHYr9sw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=NVSB76mavcHLes1NrQ+T/X4feTwPkwF7LjkFpRB/GZcAw3bWpBYSSuDbUjjHteET
 TM0QymnJeohQdI8z4TqufY0af3DJ58evKTKZmBx6N9uOigolP5CAO7uUYG0Zl+JzH
 HaddK8ra1tf6jGaKdkOVQ+cUjAL1Bkznp94QiaaRS071JQX4O60z2crQ2vppHvcGI
 vXUQswON3Ef32WOlqvMUnliSj9E0hZB/zYXjtLyTkdITfn9KfdJjeV6T74V4/5+gO
 mNn4oSKOHaL8B2IvjrbLOjsWkTmkcSsp9wH8PMlNP7DE/ixJjHUc+HX5+Wde3S/lW
 6GlJGE7en3Hpf1Ji0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=NVSB76ma
Subject: Re: [Buildroot] [PATCH v2 1/2] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMTMuMDcuMjQgdW0gMTY6Mzcgc2NocmllYiBBcm5vdXQgVmFuZGVjYXBwZWxsZToKPiAgwqBI
aSBGaW9uYSwKPgo+IE9uIDEzLzA3LzIwMjQgMTM6NTIsIEZpb25hIEtsdXRlIHZpYSBidWlsZHJv
b3Qgd3JvdGU6Cj4+IEZyb206ICJGaW9uYSBLbHV0ZSAoV0lXQSkiIDxmaW9uYS5rbHV0ZUBnbXgu
ZGU+Cj4+Cj4+IFRoZSBCUjJfRVhURVJOQUwgZW52aXJvbm1lbnQgdmFyaWFibGUgaXMgcGFzc2Vk
IGludG8gdGhlIGNvbnRhaW5lciwKPj4gYW5kIGVhY2ggcGF0aCBsaXN0ZWQgaW4gaXQgbW91bnRl
ZC4gVGhpcyBhbGxvd3MgdXNpbmcgZXh0ZXJuYWwgdHJlZXMKPj4gd2hlbiBydW5uaW5nIGEgYnVp
bGQgdXNpbmcgdXRpbHMvZG9ja2VyLXJ1bi4gVGVzdGluZyB0aGUgZXhpc3RlbmNlIG9mCj4+IHRo
ZSB2YXJpYWJsZSBpbnN0ZWFkIG9mIGEgbm9uLWVtcHR5IHZhbHVlIGFsbG93cyBwYXNzaW5nIGFu
IGVtcHR5Cj4+IEJSMl9FWFRFUk5BTCB2YXJpYWJsZSB0byBkaXNhYmxlIGN1cnJlbnRseSBzZXQg
ZXh0ZXJuYWwgdHJlZXMuCj4KPiAgwqBJIGhhdmVuJ3QgbG9va2VkIGF0IHlvdXIgcGF0Y2hlcyB5
ZXQsIGJ1dCBJIGhhZCBhIHNlcmllcyBwcmVwYXJlZAo+ICh0aGF0IEkgYXBwYXJlbnRseSBmb3Jn
b3QgdG8gc2VuZCBzbyBJIGp1c3Qgc2VudCBpdCBvdXQgbm93IHdpdGggeW91ciBpbgo+IENjKSB0
aGF0IGhhcyB0aGUgc2FtZSBwdXJwb3NlLiBQZXJoYXBzIHlvdSBjYW4gc2VlIGlmIHRoZXJlJ3Mg
YW55Cj4gY29tbW9uYWxpdHkgYW5kIHdoaWNoIGFwcHJvYWNoIG9mIHRoZSB0d28gd29ya3MgYmVz
dC4gSSBhbHJlYWR5IGZvcmdvdAo+IGhvdyBteSBhcHByb2FjaCB3b3JrZWQgc28gSSBtYWtlIGFi
c29sdXRlbHkgbm8gY2xhaW0gdGhhdCBpdCB3b3VsZCBiZQo+IGJldHRlci4KPgo+ICDCoE9oLCBu
b3cgSSBzZWUgdGhhdCB0aGV5J3JlIGluIGZhY3QgY29tcGxlbWVudGFyeSAtIEkgZG9uJ3QgaGFu
ZGxlCj4gQlIyX0VYVEVSTkFMIGFzIGEgdmFyaWFibGUsIGFuZCB5b3UgZG9uJ3QgaGFuZGxlIGNh
bGxpbmcgZG9ja2VyLXJ1biBmcm9tCj4gYW4gb3V0cHV0IGRpcmVjdG9yeSB0aGF0IGFscmVhZHkg
aGFzIHRoZSAuYnIyX2V4dGVybmFsLm1rIGZpbGUuIFNvCj4gdGhleSdyZSBjb21wbGVtZW50YXJ5
IQoKSSBhZ3JlZSEgSSB0aGluayB0aGUgb25seSB0aGluZyB3ZSBuZWVkIHRvIGdldCB0aGUgc2Ft
ZSBiZWhhdmlvciBhcyBmb3IKbWFrZSAoZW52IG92ZXJyaWRlcyBmaWxlcykgaXMgdG8gY2hhaW4g
dGhlIGNvbmRpdGlvbmFsIGJsb2NrcyB3aXRoCnByZWZlcmVuY2UgdG8gdGhlIGVudmlyb25tZW50
IHZhcmlhYmxlOgoKaWYgWyAtdiBCUjJfRVhURVJOQUwgXTsgdGhlbgogICAgICMgZnJvbSBteSBw
YXRjaAplbGlmIFsgLWUgJy5icjItZXh0ZXJuYWwubWsnIF07IHRoZW4KICAgICAjIGZyb20geW91
ciBwYXRjaCAyCmZpCgpJJ3ZlIGp1c3Qgc2VudCB2MyB3aXRoIHRoZSBjaGFuZ2VkIG1vdW50cG9p
bnRzIGhhbmRsaW5nIHN1Z2dlc3RlZCBieQpCcmFuZG9uLCBpZiB0aGF0J3MgZ29vZCB0byBtZXJn
ZSBub3cgaXQgbWlnaHQgYmUgZWFzaWVzdCB0byByZXNwaW4geW91cgpwYXRjaCBvbiB0b3AuIDot
KQoKQmVzdCByZWdhcmRzLApGaW9uYQoKPj4gU2lnbmVkLW9mZi1ieTogRmlvbmEgS2x1dGUgKFdJ
V0EpIDxmaW9uYS5rbHV0ZUBnbXguZGU+Cj4+IC0tLQo+PiBDaGFuZ2VzIHYxIC0+IHYyOgo+PiAq
IENvcnJlY3RseSBoYW5kbGUgc3BhY2VzIGluIGV4dGVybmFsIHRyZWUgcGF0aHMKPj4KPj4gwqAg
dXRpbHMvZG9ja2VyLXJ1biB8IDExICsrKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAx
MSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS91dGlscy9kb2NrZXItcnVuIGIvdXRp
bHMvZG9ja2VyLXJ1bgo+PiBpbmRleCAxYWRiMDJkNzRlLi44MDI0YzJkM2EzIDEwMDc1NQo+PiAt
LS0gYS91dGlscy9kb2NrZXItcnVuCj4+ICsrKyBiL3V0aWxzL2RvY2tlci1ydW4KPj4gQEAgLTkw
LDEwICs5MCwyMSBAQCBpZiBbICIke0JSMl9ETF9ESVJ9IiBdOyB0aGVuCj4+IMKgwqDCoMKgwqAg
ZG9ja2VyX29wdHMrPSggLS1lbnYgQlIyX0RMX0RJUiApCj4+IMKgIGZpCj4+Cj4+ICtpZiBbIC12
IEJSMl9FWFRFUk5BTCBdOyB0aGVuCj4+ICvCoMKgwqAgSUZTPSI6IiByZWFkIC1yIC1hIGJyMl9l
eHRfYXJyIDw8PCAiJHtCUjJfRVhURVJOQUx9Igo+PiArwqDCoMKgIGZvciBicjJfZXh0IGluICIk
e2JyMl9leHRfYXJyW0BdfSI7IGRvCj4+ICvCoMKgwqDCoMKgwqDCoCBtb3VudHBvaW50cys9KCAi
JHticjJfZXh0fSIgKQo+PiArwqDCoMKgIGRvbmUKPj4gK8KgwqDCoCBkb2NrZXJfb3B0cys9KCAt
LWVudiBCUjJfRVhURVJOQUwgKQo+PiArZmkKPj4gKwo+PiArIyBkaXIgbmFtZXMgbWlnaHQgY29u
dGFpbiBzcGFjZXMsIHNvIHNwbGl0IG9ubHkgb24gbGluZWJyZWFrcyBmb3IKPj4gdGhpcyBsb29w
Cj4+ICtJRlM9JCdcbicKPj4gwqAgIyBzaGVsbGNoZWNrIGRpc2FibGU9U0MyMDEzICMgY2FuJ3Qg
dXNlIHdoaWxlLXJlYWQgYmVjYXVzZSBvZiB0aGUKPj4gYXNzaWdubWVudAo+PiDCoCBmb3IgZGly
IGluICQocHJpbnRmICclc1xuJyAiJHttb3VudHBvaW50c1tAXX0iIHxMQ19BTEw9QyBzb3J0IC11
KTsgZG8KPj4gwqDCoMKgwqDCoCBkb2NrZXJfb3B0cys9KCAtLW1vdW50ICJ0eXBlPWJpbmQsc3Jj
PSR7ZGlyfSxkc3Q9JHtkaXJ9IiApCj4+IMKgIGRvbmUKPj4gK3Vuc2V0IElGUwo+Pgo+PiDCoCBp
ZiB0dHkgLXM7IHRoZW4KPj4gwqDCoMKgwqDCoCBkb2NrZXJfb3B0cys9KCAtdCApCj4+IC0tCj4+
IDIuNDUuMgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
