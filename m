Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FB1C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CC3560AD6;
	Sat,  4 Nov 2023 21:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CC3560AD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uctWBAUeE7D1; Sat,  4 Nov 2023 21:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACBCC60AE9;
	Sat,  4 Nov 2023 21:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACBCC60AE9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5801C1BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29B0E81F1B
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29B0E81F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5cOracVW56xg for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:35:23 +0000 (UTC)
Received: from linux1801mail.webawere.nl (linux1801mail.webawere.nl
 [185.158.164.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CF9C81F17
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CF9C81F17
Received: from [185.47.134.76] (helo=share.bybram.com)
 by linux1801.webawere.nl with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2-12-g29d01ae2a)
 (envelope-from <dev@bybram.com>) id 1qzOIa-00DIwQ-2Y;
 Sat, 04 Nov 2023 22:35:20 +0100
From: Bram Oosterhuis <dev@bybram.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231102191032.095142db@windsurf>
In-Reply-To: <20231102191032.095142db@windsurf>
Message-ID: <20231104213517.Horde.o27r9AtgGcJYwgSgZsafIb9@share.bybram.com>
User-Agent: Horde Application Framework 5
Date: Sat, 04 Nov 2023 21:35:17 +0000
MIME-Version: 1.0
X-Authenticated-Id: dev@bybram.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=bybram.com; 
 s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Message-ID:
 In-Reply-To:References:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lb954ig9HqS/AwRaRQ5Aaq8Tqa4dAhpphbVxIFInIT0=; b=QSwaKlnqscUNGggrvrCARttLws
 eBEea1D0sn1pEj2AftSegJwV2Ma1pOnTOcIm1C54x5gBGCy91SSlCXV5QODmZK0nJy3Xc9D5ZoaAf
 wFFpqvO6jEHtFDtL6JZHBxMsyM4SFVc+1+Mzh+2cnm64dK8SG6IVrndjtc07JEtQLgBVZfGiSrnmT
 rjXcxlSHWYy5Ztk7ghfAYdZMBj4wEslJKma09Q5UpN748aPAN5y7tAM/+c8UhQZViQuN5BopKumAq
 EAsYl61iXRU12A5+hX9GViDw/9iSywCTk6VZKuBfw/GrqdUTwwxSbWEGe1cmgChxWawBpb8ZiKItG
 h6LSAngQ==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bybram.com header.i=@bybram.com
 header.a=rsa-sha256 header.s=x header.b=QSwaKlnq
Subject: Re: [Buildroot] [PATCH 1/2] configs/raspberrypi: bump Linux version
 to 6.1.55
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
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLArCoApJIHRlc3RlZCBpdCB1c2luZyBhIHByaXZhdGUgZGVmY29uZmlnIG9uIGEg
UlBJM2IsIGJ1dCBJIHNlZSBJIHNjcmV3ZWQgdXAgd2hlbiBtb3ZpbmcgdG8gdGhlIHVwc3RyZWFt
LiBBbHNvIHJhc3BiZXJyeSBqdXN0IHJlbGVhc2VkIGxpbnV4IHY2LjEuNi4gSSB0aGluayBpdHMg
YmV0dGVyIHRvIGRyb3AgdGhlc2UgcGF0Y2hlcyBhbmQgSSB3aWxsIHByb3ZpZGUgYSBuZXcgc2V0
IG9mIHBhdGNoZXMuCsKgCkNoZWVycywgwqBCcmFtCsKgCiJUaG9tYXMgUGV0YXp6b25pIHZpYSBi
dWlsZHJvb3QiIGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnIOKAkyAyIG5vdmVtYmVyIDIwMjMgMTk6
MTAKPiBIZWxsbyBCcmFtLAo+wqAKPiBPbiBXZWQsIDExIE9jdCAyMDIzIDE4OjI0OjI5ICswMjAw
Cj4gQnJhbSBPb3N0ZXJodWlzIDxkZXZAYnlicmFtLmNvbT4gd3JvdGU6Cj7CoAo+ID4gTGludXgg
Ni4xIGhhcyBiZWVuIG1hcmtlZCBMVFMgZm9yIGEgbG9uZyB0aW1lIG5vdy4gVGltZSB0byBidW1w
Cj4gPiBMaW51eCBmb3IgUmFzcGJlcnJ5UGkncyB0byB0aGUgbGF0ZXN0IDYuMS41NS12Ny4gU2lu
Y2UgQXByaWwgMjAyMgo+ID4gdGhlIFJhc3BiZXJyeVBpIGRlZmNvbmZpZ3MgaGF2ZSBjb21wcmVz
c2VkIGtlcm5lbCBtb2R1bGUgZW5hYmxlZAo+ID4gYnkgZGVmYXVsdC4gKHNlZSBbMV0gYW5kIFsy
XSkuCj4gPsKgCj4gPiBUbyBsb2FkIGNvbXByZXNzZWQga2VybmVsIG1vZHVsZXMga21vZCBhbmQg
eHogcGFja2FnZXMgYXJlIG5lZWRlZAo+ID4gYmVjYXVzZSBidXN5Ym94IGRvZXNuJ3Qgc3VwcG9y
dCBpdC4KPiA+wqAKPiA+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgv
Y29tbWl0L2M0NWI0MjIzYTRlNGE4Y2ZlMzllZGJiNDk0OTMyOWVhNDc4ZmE0ZTIKPiA+IFsyXSBo
dHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgvaXNzdWVzLzQ5NjYKPiA+wqAKPiA+
IFNpZ25lZC1vZmYtYnk6IEJyYW0gT29zdGVyaHVpcyA8ZGV2QGJ5YnJhbS5jb20+Cj7CoAo+IFRo
YW5rcyBmb3IgdGhpcyBwYXRjaC4gQ291bGQgeW91IGNsYXJpZnkgaW4gdGhlIGNvbW1pdCBsb2cg
b24gd2hpY2gKPiBwbGF0Zm9ybXMgaXQgd2FzIHJ1bnRpbWUtdGVzdGVkLCB2cy4gdGhlIHBsYXRm
b3JtcyBmb3Igd2hpY2ggeW91IG9ubHkKPiB2ZXJpZmllZCB0aGUgYnVpbGQ/Cj7CoAo+ID4gKyMg
RW5hYmxlIGNvbXByZXNzZWQga2VybmVsIG1vZHVsZSBzdXBwb3J0Cj4gPiArQlIyX1BBQ0tBR0Vf
QlVTWUJPWF9TSE9XX09USEVSUwo+ID4gK0JSMl9QQUNLQUdFX0tNT0RfVE9PTFMKPiA+ICtCUjJf
UEFDS0FHRV9YWgo+ID4gK0JSMl9QQUNLQUdFX0tNT0QKPiA+ICtCUjJfUEFDS0FHRV9IT1NUX0tN
T0RfWFoKPsKgCj4gSSdtIGFmcmFpZCB0aGlzIGhhcyBjZXJ0YWlubHkgbm90IGJlZW4gdGVzdGVk
LCBhcyBJIGJlbGlldmUgdGhlc2UgbGluZXMKPiBoYXZlIG5vIGVmZmVjdCBzaW5jZSB0aGV5IGxh
Y2sgdGhlID15IHRvIGVuYWJsZSB0aGUgb3B0aW9uOgo+wqAKPiBCUjJfUEFDS0FHRV9YWj15Cj7C
oAo+IGZvciBleGFtcGxlLgo+wqAKPiA+IFwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQo+wqAK
PiBQbGVhc2UgZml4IHRoaXMgdG8gaGF2ZSBhIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUuCj7CoAo+
IChPZiBjb3Vyc2UsIHNhbWUgZm9yIGFsbCBvdGhlciBkZWZjb25maWdzKQo+wqAKPiBUaGFua3Mh
Cj7CoAo+IFRob21hcwo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
