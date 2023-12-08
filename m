Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ABBC10F04
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 23:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 125AA6FA18;
	Fri,  8 Dec 2023 23:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 125AA6FA18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l1u3bTK51jq0; Fri,  8 Dec 2023 23:12:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6181360F5C;
	Fri,  8 Dec 2023 23:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6181360F5C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79F181BF5D7
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 23:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57FEF83EE2
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 23:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57FEF83EE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f5tcCvQ0rVLL for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 23:12:51 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 225A583EE1
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 23:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 225A583EE1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 626B813F86A;
 Sat,  9 Dec 2023 00:12:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 09 Dec 2023 00:12:46 +0100
Date: Sat, 9 Dec 2023 00:12:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZXOi7tN9L6o6nEmp@landeda>
References: <20231207220930.1356097-1-fontaine.fabrice@gmail.com>
 <ZXOehwwVDyiGPpRf@landeda>
 <CAPi7W838vzhK48R5GduRL660bWQnS1WGTPsDmnx+gsj3HfVX3w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W838vzhK48R5GduRL660bWQnS1WGTPsDmnx+gsj3HfVX3w@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702077169;
 bh=QoMpfQwMqz1BhCBLs2iJDN4tkdi6QiN0U8OVKIVQhqw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=suW9dflWOYvwbBLFPKkjhAwG+wSnc2EGcgwdybX4dX7+4l9ktkiktE/eRKOpx5gVQ
 aiayUBZgAcoLmx/Vd8tcBq125L8GZUcRI+2vtCdRsj9Wl9jUxIxtQwLfJi5gw3g1V5
 WVzcgpHRMDLNQSp3EOjXfRZh5kSn6E77bUbyt38FlwkzK+tfW9+VCyFs7isX5UjwFo
 1VK6hsolMg7ucO2dew8yyMHl9sQGv3KEFtG0G1Bf3QlwcKhmo8ZLBWf11tiuUppgbR
 DkcUwj30g70aoMdsQ/8wwm/8ZRyk7BL4xGM7bRi7bMSy4e3nEYwsRM4EEqvvPEXdJm
 HIxtl+LeQPIuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=suW9dflW
Subject: Re: [Buildroot] [PATCH 1/1] package/memtest86: pass TARGET_CC
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
Cc: Steve Kenton <skenton@ou.edu>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmJyaWNlLCBBbGwsCgpPbiAyMDIzLTEyLTA5IDAwOjA0ICswMTAwLCBGYWJyaWNlIEZvbnRhaW5l
IHNwYWtlIHRodXNseToKPiBMZSB2ZW4uIDggZMOpYy4gMjAyMyDDoCAyMzo1NCwgWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IGEgw6ljcml0IDoKPiA+IE9uIDIwMjMtMTIt
MDcgMjM6MDkgKzAxMDAsIEZhYnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5Ogo+ID4gPiBQYXNz
IENDPSQoVEFSR0VUX0NDKSB0byBtYWtlIHRvIGF2b2lkIHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFp
bHVyZSByYWlzZWQKPiA+ID4gc2luY2UgYnVtcCB0byB2ZXJzaW9uIDYuMjAgaW4gY29tbWl0Cj4g
PiA+IGE3NDMwODc1OTNhNWZkNWIzM2UyNjUwNTkxY2FkYTA5OTI5YzI3YTY6ClstLVNOSVAtLV0K
PiA+ID4gIGRlZmluZSBNRU1URVNUODZfQlVJTERfQ01EUwo+ID4gPiAtICAgICAkKFRBUkdFVF9D
T05GSUdVUkVfT1BUUykgJChNQUtFKSAtQyAkKEBEKS8kKE1FTVRFU1Q4Nl9CVUlMRF9ESVIpCj4g
PiA+ICsgICAgICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKSAkKE1BS0UpIENDPSQoVEFSR0VUX0ND
KSBcCj4gPiBDQz0kKFRBUkdFVF9DQykgaXMgYWxyZWFkeSBwcmVzZW50IGluIFRBUkdFVF9DT05G
SUdVUkVfT1BUUywgc28gd2h5IGlzCj4gPiBpdCBub3QgYWNjb3VudGVkIGZvcj8KPiBCZWNhdXNl
ICJDQz0kKFRBUkdFVF9DQykgbWFrZSIgaXMgbm90IHRoZSBzYW1lIGFzICJtYWtlCj4gQ0M9JChU
QVJHRVRfQ0MpIgoKWWVhaCwgSSBrbm93IHRoYXQgcHJldHR5IHdlbGwgKGV2ZW4gaWYgSSBuZXZl
ciByZW1lbWJlciB0aGUgcnVsZXMgb2YKcHJlY2VkZW5jZSBmb3IgdGhlIGVudmlyb25tZW50LCBh
cmd1bWVudCwgYW5kIE1ha2VmaWxlIHZhcmlhYmxlcykuLi4KCj4gYXMgYnVpbGR7MzIsNjR9L01h
a2VmaWxlIGlzIHNldHRpbmcgQ0MgdG8gZ2NjLgoKQnV0IHRoYXQgd2FzIG5vdCB0aGUgY2FzZSBw
cmV2aW91c2x5LCBJIGd1ZXNzLCBhcyB5b3Ugc2FpZCBpdCBhcHBlYXJlZAp3aXRoIHRoZSBidW1w
IHRvIDYuMjAuIFNvIG1heWJlIHdlIHNob3VsZCBub3cgbW92ZSB0aGUgd2hvbGUgb2YKJChUQVJH
RVRfQ09ORklHVVJFX09QVFMpIHRvIGJlIGFyZ3VtZW50cyByYXRoZXIgdGhhbiBlbnZpcm9ubWVu
dAp2YXJpYWJsZXMsIGluc3RlYWQgb2YganVzdCBtb3ZpbmcgQ0MgdGhlcmUuCgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKPiA+Cj4gPiBSZWdhcmRzLAo+ID4gWWFubiBFLiBNT1JJTi4KPiA+Cj4g
PiA+ICsgICAgICAgICAgICAgLUMgJChARCkvJChNRU1URVNUODZfQlVJTERfRElSKQo+ID4gPiAg
ZW5kZWYKPiA+ID4KPiA+ID4gIGRlZmluZSBNRU1URVNUODZfSU5TVEFMTF9JTUFHRVNfQ01EUwo+
ID4gPiAtLQo+ID4gPiAyLjQyLjAKPiA+ID4KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4g
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiA+Cj4gPiAtLQo+ID4gLi0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4KPiA+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwg
LyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gPiB8ICszMyA2NjIgMzc2
IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAg
ICAgICAgICAgfAo+ID4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiA+IHwgaHR0cDovL3ltb3Jp
bi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNw
aXJhY3kuICB8Cj4gPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0t
LS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwo+IAo+IEJlc3QgUmVnYXJkcywK
PiAKPiBGYWJyaWNlCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJ
TiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNw
aXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FN
UEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0t
LS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwK
fCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAg
IHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
