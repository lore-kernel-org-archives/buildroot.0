Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63C9C47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 20:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39DE140062;
	Sun, 28 Jan 2024 20:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39DE140062
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DJ3xrQrEVVdK; Sun, 28 Jan 2024 20:32:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62BC640089;
	Sun, 28 Jan 2024 20:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62BC640089
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6633E1BF321
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 20:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AED140391
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 20:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AED140391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZhiZlCEacAQl for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 20:32:42 +0000 (UTC)
X-Greylist: delayed 853 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 28 Jan 2024 20:32:42 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37D2B4016D
Received: from mail24c26.carrierzone.com (mail30c26-2170.carrierzone.com
 [64.29.152.9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37D2B4016D
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 20:32:42 +0000 (UTC)
X-Authenticated-User: thirdharmonic@myfairpoint.net
Feedback-ID: uhmgawa@third-h
Received: from anvil.third-harmonic.com
 (burl-mse-70-20-54-127.static.ngn.east.myfairpoint.net [70.20.54.127] (may be
 forged)) (authenticated bits=0)
 by mail24c26.carrierzone.com (8.14.9/8.13.1) with ESMTP id 40SKIPe5008984;
 Sun, 28 Jan 2024 20:18:27 +0000
Message-ID: <65B6B6C6.6000507@third-harmonic.com>
Date: Sun, 28 Jan 2024 15:19:18 -0500
From: uhmgawa <uhmgawa@third-harmonic.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
 rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: ps.report@gmx.net
References: <65AEA68E.3080104@third-harmonic.com>
 <20240124182523.4471d181@gmx.net>
In-Reply-To: <20240124182523.4471d181@gmx.net>
X-VADE-SPAMSTATE: clean
X-VADE-SPAMSCORE: 0
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtvddgudefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfjqffuvffqrffktedpqfgfvfdpgffpggdqvedvieenuceurghilhhouhhtmecufedtudenucenucfjughrpefkfffhfgggvfevufhfjggtgfesthekrgdttdefjeenucfhrhhomhepuhhhmhhgrgifrgcuoehuhhhmghgrfigrsehthhhirhguqdhhrghrmhhonhhitgdrtghomheqnecuggftrfgrthhtvghrnhepfeehueeujedvhfevffegfedtkeduhfdulefgtdeuhffhgeevudeltdffheeugfefnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghuihhlughrohhothdrohhrghdphhgvtghhrghordhlihenucfkphepjedtrddvtddrheegrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjedtrddvtddrheegrdduvdejpdhhvghloheprghnvhhilhdrthhhihhrugdqhhgrrhhmohhnihgtrdgtohhmpdhmrghilhhfrhhomhepuhhhmhhgrgifrgesthhhihhrugdqhhgrrhhmohhnihgtrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepphhsrdhrvghpohhrthesghhmgidrnhgvthdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-Origin-Country: US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=carrierzone.com; s=mailmia; t=1706473108;
 bh=Fb1m9TsNiBPLmbR9YM31RzJedm18uYbb1SGIucPYtJI=;
 h=Date:From:To:CC:Subject:References:In-Reply-To:From;
 b=liNsez6tqM0OnnLAYAQ5XRx99aCIXBMxjBAIYYqN88mATz5nja26t8n873usr0CD/
 UL3OiZBgR+ulc8/dCqeYT1nzId0ClZRR+r4v4d/4c7lSxHupM4Vt8ELUZ9Xt9icCuW
 gH1L3WQywOxq2zaoXpIWH48Fwx1MUeXjjybAvK5Q=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=carrierzone.com header.i=@carrierzone.com
 header.a=rsa-sha256 header.s=mailmia header.b=liNsez6t
Subject: Re: [Buildroot] Buildroot + u-boot + raspberry-pi Zero W
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDEvMjQvMjAyNCAxMjoyNSBQTSwgUGV0ZXIgU2VpZGVyZXIgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKCj4gSGVsbG8gKiwKPgo+IE9uIE1vbiwgMjIgSmFuIDIwMjQgMTI6MzE6NTggLTA1MDAsIHVo
bWdhd2EgPHVobWdhd2FAdGhpcmQtaGFybW9uaWMuY29tPiB3cm90ZToKPgo+PiBJIGhhdmUgYSB2
YW5pbGxhIGJ1aWxkIG9mIGdpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QuZ2l0IEAg
YjIwMDYzMmIxYWIgZm9yIHJhc3BiZXJyeXBpMHdfZGVmY29uZmlnCj4+IHdoaWNoIHNlZW1zIGZp
bmUgZGlyZWN0bHkgYm9vdGluZyB0aGUga2VybmVsIHVzaW5nIHRoZSBzdG9jayBCcm9hZGNvbSBi
aW5hcnkgYm9vdGxvYWRlci4gIEhvd2V2ZXIKPj4gY2hhbmdpbmcgdGhlIEJ1aWxkcm9vdCBib290
bG9hZGVyIGNvbmZpZyB0byBCUjJfVEFSR0VUX1VCT09UPXksIHNldmVyYWwgaXNzdWVzIGFwcGVh
cjoKPj4g4oCiIFdoaWxlIG91dHB1dC9pbWFnZXMvdS1ib290LmJpbiBpcyBnZW5lcmF0ZWQsIGl0
IGlzIG5vdCBwcmVzZW50IGluIG91dHB1dC9pbWFnZXMvYm9vdC52ZmF0IG5vciBkb2VzIHRoZSBm
aWxlIC9ib290L2NvbmZpZy50eHQgcmVmbGVjdCB0aGUgZXhwZWN0ZWQgbGF1bmNoIG9mIHUtYm9v
dCB3aXRoICJrZXJuZWw9dS1ib290LmJpbiIgYnV0IHJhdGhlciByZW1haW5zIHNldCB0byBkaXJl
Y3RseSBib290IHRoZSBrZXJuZWwgekltYWdlLgo+Cj4gVGhlIGJ1aWxkcm9vdCBkZWZjb25maWdz
IGFyZSB2ZXJ5IG1pbmltYWwgc3RhcnRpbmcgcG9pbnRzIGZvciB5b3VyIG93biBkZXZlbG9wbWVu
dAo+IChtb3N0bHkgc2ltcGxlIGJvb3Rpbmcgd2l0aCBtaW5pbWFsIGZlYXR1cmUgc2V0IGFuZCBj
b25zb2xlIG91dHB1dC9sb2dpbiB2aWEgc2VyaWFsCj4gbGluZSkuLi4sIGV2ZXJ5dGhpbmcgbW9y
ZSBzcGVjaWFsIGhhcyB0byBiZSBkb25lIGJ5IChsb2NhbCkgYWRqdXN0bWVudHMuLi4sIGUuZy4g
aW4KPiB5b3VyIGNhc2U6Cj4KPiAtIHByb3ZpZGluZyBhbiBhZGp1c3RlZCBnZW5pbWFnZS5jZmcg
KG1vcmUgc3RyYWlnaHQgZm9yd2FyZCBiZWZvcmUgYXV0b2dlbmVyYXRlZCwKPiAgIHNlZSBjb21t
aXQgWzFdIGFuZCBbMl0pIHRvIGluY2x1ZGUgKGFkZGl0aW9uYWwpIHUtYm9vdC5iaW4gdG8gYm9v
dC52ZmF0Cj4KPiAtIHByb3ZpZGluZyBhbiBhZGp1c3RlZCBjb25maWcudHh0IChzZWUgWzFdIGFu
ZCBCUjJfUEFDS0FHRV9SUElfRklSTVdBUkVfQ09ORklHX0ZJTEUpOgo+Cj4gCWVuYWJsZV91YXJ0
PTEKPiAJa2VybmVsPXUtYm9vdC5iaW4KCkkgYWN0dWFsbHkgdHJpZWQgdGhlIGFib3ZlIGFzIGEg
ZGlyZWN0IG1vZGlmaWNhdGlvbiBvZiAvYm9vdC9jb25maWcudHh0IGJlZm9yZSBteSBwcmlvciBt
YWlsLgpTdGlsbCBkaWRuJ3QgcmVzb2x2ZSBteSBpc3N1ZSAoYmVsb3cpLiAgQW55d2F5IGFmdGVy
IGNhcHR1cmluZyB0aGUgY2hhbmdlcyBhcyBwcmVzY3JpYmVkCmFib3ZlLCBpdCB0b29rIHNvbWUg
cmF0dGxpbmcgYXJvdW5kIHRvIGZpbmQgYSAibWFrZSBycGktZmlybXdhcmUtcmVpbnN0YWxsIiB3
YXMgYWxzbyByZXF1aXJlZAp0byBwZXJjb2xhdGUgdGhlIGNoYW5nZSBpbnRvIHRoZSBidWlsZHJv
b3QncyBtYWtlIHNjb3BlLiAKCj4KPgo+IEFmdGVyIGNvcHlpbmcgdS1ib29vdC5iaW4gbWFudWFs
bHkgdG8gdGhlIGJvb3QgcGFydGl0aW9uIGFuZCBvdmVyd3JpdGluZwo+IHRoZSBjb25maWcudHh0
IG15IFJQaSB6ZXJvIHcgYm9vdHMgdS1ib290IHdpdGggdGhlIGZvbGxvd2luZyBvdXRwdXQgdmlh
IHNlcmlhbCBsaW5lOgo+Cj4gCVUtQm9vdCAyMDI0LjAxIChKYW4gMjQgMjAyNCAtIDE2OjM3OjI2
ICswMTAwKQo+Cj4gCURSQU06ICA0NDggTWlCCj4gCVJQSSBaZXJvIFcgKDB4OTAwMGMxKQo+IAlD
b3JlOiAgNjcgZGV2aWNlcywgMTQgdWNsYXNzZXMsIGRldmljZXRyZWU6IGVtYmVkCj4gCU1NQzog
ICBtbWNAN2UyMDIwMDA6IDAsIG1tY0A3ZTMwMDAwMDogMQo+IAlMb2FkaW5nIEVudmlyb25tZW50
IGZyb20gRkFULi4uIFVuYWJsZSB0byByZWFkICJ1Ym9vdC5lbnYiIGZyb20gbW1jMDoxLi4uIAo+
IAlJbjogICAgc2VyaWFsLHVzYmtiZAo+IAlPdXQ6ICAgc2VyaWFsLHZpZGNvbnNvbGUKPiAJRXJy
OiAgIHNlcmlhbCx2aWRjb25zb2xlCj4gCU5ldDogICBObyBldGhlcm5ldCBmb3VuZC4KPiAJc3Rh
cnRpbmcgVVNCLi4uCj4gCUJ1cyB1c2JAN2U5ODAwMDA6IFVTQiBEV0MyCj4gCXNjYW5uaW5nIGJ1
cyB1c2JAN2U5ODAwMDAgZm9yIGRldmljZXMuLi4gMSBVU0IgRGV2aWNlKHMpIGZvdW5kCj4gCSAg
ICAgICBzY2FubmluZyB1c2IgZm9yIHN0b3JhZ2UgZGV2aWNlcy4uLiAwIFN0b3JhZ2UgRGV2aWNl
KHMpIGZvdW5kCj4gCUhpdCBhbnkga2V5IHRvIHN0b3AgYXV0b2Jvb3Q6ICAwIAo+IAlDYXJkIGRp
ZCBub3QgcmVzcG9uZCB0byB2b2x0YWdlIHNlbGVjdCEgOiAtMTEwCj4gCU5vIGV0aGVybmV0IGZv
dW5kLgo+IAlObyBldGhlcm5ldCBmb3VuZC4KCkknZCBoYXphcmQgeW91ciBjb25maWcudHh0IGRv
ZXNuJ3QgaGF2ZSAiZHRvdmVybGF5PW1pbml1YXJ0LWJ0IiB3aGljaCB3YXMgdGhlIHJvb3QgY2F1
c2Ugb2YgbXkKaXNzdWUgYXMgYnkgZGVmYXVsdCB0aGUgbWluaXVhcnQgaXMgaW50ZW5kZWQgdG8g
c2VydmUgYXMgdGhlIHUtYm9vdCBjb25zb2xlLiAgT25jZSB0aGF0J3MgZ29uZQpib3RoIHUtYm9v
dCBhbmQgdGhlIGtlcm5lbCAodmlhIHUtYm9vdCBib290YXJncykgc3VjY2Vzc2Z1bGx5IHNwZWFr
IHRvIHRoZSBtaW5pdWFydC4gIEkgc3RhcnRlZAp0byBnZXQgc3VzcGljaW91cyBhZnRlciByZWFs
aXppbmcgL2Jvb3QvY21kbGluZS50eHQgY29udGFpbmVkICJjb25zb2xlPXR0eUFNQTAsMTE1MjAw
IiB3aGljaAp3YXMgc3VjY2Vzc2Z1bGx5IGJvb3RpbmcgdGhlIGRlZmF1bHQga2VybmVsIGRpcmVj
dGx5IGZyb20gdGhlIGJvb3Rjb2RlLmJpbi9zdGFydC5lbGYgZmlybXdhcmUuCgo+IFsxXSBodHRw
czovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvZTM3ZWU1YWNk
Y2ViYjU5YzBiY2M4OWVjYTY5NTQwY2VhMmVkNDQxZAo+IFsyXSBodHRwczovL2dpdGxhYi5jb20v
YnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvZmM1Y2RlZWQ3MjQxNzRkMjQ4ZGQxZjk3
OWFjZWE0MGFmNmUzNDRjZQo+IFszXSBodHRwczovL2hlY2hhby5saS8yMDIxLzEyLzIwL0Jvb3Qt
UmFzcGJlcnJ5LVBpLTQtVXNpbmctdWJvb3QtYW5kLUluaXRyYW1mcy8KCkFsbCBvZiB0aGUgYWJv
dmUgd2FzIHZlcnkgaGVscGZ1bC4gIFRoYW5rcyEKCi1qb2huICAgKEFLQSAnKicpCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
