Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5E7C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 19:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D67783F08;
	Sat,  4 Dec 2021 19:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RJVfCeLTRn5D; Sat,  4 Dec 2021 19:13:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD43D83F04;
	Sat,  4 Dec 2021 19:13:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 316D21BF3D0
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 19:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20C3F40293
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 19:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xIpo2cYjUuFo for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 19:12:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EB12401CC
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 19:12:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:44c6:1f1c:4326:e15f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1135C5FF67;
 Sat,  4 Dec 2021 20:12:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638645173;
 bh=e6eiTTNksTw6SdOEOLJyXMJJxdq+QJFJjrNVzjv7eMs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IgrAmZQqb1ijR6Nowpp1ZRgYGMSMa9ZRt4zCdBXZ6Ke+OEZwagoXXyB3l8NLoG6Hf
 db4duUzxgXF76XNoIUXZ3yyf3o2ICxAIO3Zdn4mv+5INSQWBKPnFYDtgk0mAOAMVqL
 6PfuNh5AeEDmRSvTdXyQAaOGejIoKFYIlGy5fIBMnrS8n8qLjP1m5KCWxAH5mNwbH3
 EGdDU6dopPdeimt3B74S0EYRAnvG7bbCchIVMUZAKwi7iux6ZKWuoy/iJGHDo1pyXx
 TrLjx2UaoWnNhrzzxRVu37xiZKJfs60JBnT2o4BVB++c8+EOTd6D7AkDYeEzoJNKOC
 ELQjPAoUcZIsQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Dec 2021 20:12:38 +0100
Date: Sat, 4 Dec 2021 20:12:38 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20211204191238.GC472627@scaer>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1636810092.git.yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 00/16 v2] core: add show-vars,
 a json-formatted equivalent to printvars (branch yem/show-vars)
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
 Herve Codina <herve.codina@bootlin.com>, eeppeliteloop@gmail.com,
 Vadim Kochan <vadim4j@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsLAoKT24gMjAyMS0xMS0xMyAxNDoyOCArMDEwMCwgWWFubiBFLiBNT1JJTiBzcGFrZSB0aHVz
bHk6Cj4gSGVsbG8gQWxsIQo+IAo+IFRoaXMgc2VyaWVzIGludHJvZHVjZXMgYSBuZXcgdG9wLWxl
dmVsIGNvbW1hbmQsIHNob3ctdmFycywgd2hpY2ggbGlrZQo+IHByaW50dmFycywgcHJpbnRzIGFs
bCB0aGUgdmFyaWFibGVzIG9mIEJ1aWxkcm9vdCwgYW5kIGxpa2Ugc2hvdy1pbmZvLAo+IGRvZXMg
c28gaW4gYSBKU09OLWZvcm1hdHRlZCBvdXRwdXQuCj4gCj4gVGhlIGZpcnN0IDggcGF0Y2hlcyBh
cmUgcHJlcGFyYXRvcnkgY2xlYW51cHMgaW4gdGhlIGNvcmUgaW5mcmFzLiBUaGV5Cj4gd2VyZSBw
cmV2aW91c2x5IHBvc3RlZCBzZXBhcmF0ZWx5LCBidXQgdGhlaXIgcmFpc29uIGQnw6p0cmUgaXMg
b25seQo+IHJlYWxseSBvYnZpb3VzIHdpdGggdGhlIGludHJvZHVjdGlvbiBvZiB0aGlzIG5ldyBz
aG93LXZhcnMuCj4gCj4gVGhlbiB0aGUgZm9sbG93aW5nIDQgcGF0Y2hlcyBwcmVwYXJlIHRoZSBl
eGlzdGluZyBzaG93LWluZm8gaGVscGVycyBmb3IKPiBtb3JlIGdlbmVyaWNpdHkuCj4gCj4gVGhl
IDMgbmV4dCBwYXRjaGVzIGFkZCBhIGZldyBtb3JlIGl0ZW1zIHRvIHNob3ctaW5mbyAoSSdtIHNu
ZWFraW5nIHRoZW0KPiBpbiB0aGlzIHNlcmllcywgYW0gSSBub3QgZGV2aW91cz8pLiBUaGVyZSBh
cmUgaGludHMgaW4gdGhlIGNvbW1pdCBsb2dzCj4gYWJvdXQgc29tZXRoaW5nIHRoYXQgd2lsbCBj
b21lIGluIHRoZSBmdXR1cmUsIHRoYXQgd2lsbCBtYWtlIHVzZSBvZgo+IHRob3NlIG5ldyBmaWVs
ZHMgKGFuZCBub3cgYW0gSSBub3QgdGVhc2luZyB0b28gbXVjaD8pLgo+IAo+IEV2ZW50dWFsbHks
IHdlIGludHJvZHVjZSBzaG93LXZhcnMsIHdoaWNoIGlzIHByZXR0eSB0cml2aWFsIGluIGFuZCBv
ZmYKPiBpdGVsZiBvbmNlIGFsbCB0aGUgcHJlcGFyYXRvcnkgd29yayBoYXMgYmVlbiBkb25lLi4u
Cj4gCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAo+IAo+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBZYW5uIEUu
IE1PUklOICgxNik6Cj4gICAgICAgY29yZS9zaG93LWluZm86IHJlcG9ydCBidWlsZF9kaXIgcmVs
YXRpdmUgdG8gQ09ORklHX0RJUgo+ICAgICAgIHBhY2thZ2Uva29kaS0qOiBydW4gcGtnLWNvbmZp
ZyBhdCBidWlsZCB0aW1lLCBub3QgYXQgcGFyc2UgdGltZQo+ICAgICAgIHN1cHBvcnQvZGVwZW5k
ZW5jaWVzOiBhdm9pZCBzcHVyaW91cyB3YXJuaW5nIG9uIHByaW50LXZhcnMKClRob3NlIHRocmVl
IHBhdGNoZXMgYXJlIGZpeGVzLCBzbyBhcHBsaWVkIHRvIG1hc3Rlci4KCj4gICAgICAgcGFja2Fn
ZS9pbmZyYXM6IGRvIG5vdCBjb25kaXRpb25hbGx5IHNldCBlbXB0eSB2YXJpYWJsZXMKPiAgICAg
ICBwYWNrYWdlL3BrZy1weXRob246IGRvIG5vdCBzZXQgZW1wdHkgdmFyaWFibGVzCgpUaG9zZSB0
d28gcGF0Y2hlcywgbm90IGFwcGxpZWQKCj4gICAgICAgY29yZS9wa2ctZ2VuZXJpYzogYWxzbyBs
aXN0IGZpbGVzIGluc3RhbGxlZCBpbiBpbWFnZXMvCj4gICAgICAgTWFrZWZpbGU6IHJlYWxseSBj
b21tZW50IHN5bnRheCBjb2xvdXJpbmcKPiAgICAgICBjb3JlL3Nob3ctaW5mbzogJ25hbWUnIG9u
bHkgYXBwbGllcyB0byBwYWNrYWdlcwoKVGhvc2UgdGhyZWUgcGF0Y2hlcyBhcmUgZml4ZXMsIHNv
IGFwcGxpZWQgdG8gbWFzdGVyLgoKPiAgICAgICBzdXBwb3J0L3V0aWxzOiBtYWtlLWNvbW1hLWxp
c3QgZG9lcyBqdXN0IHRoYXQsIG5vdCBxdW90aW5nCj4gICAgICAgc3VwcG9ydC9taXNjL3V0aWxz
OiBpbnRyb2R1Y2UgJCh0YWIpPVx0IGFuZCAkKGVzY2FwZSk9XHgxYgo+ICAgICAgIHBhY2thZ2Uv
cGtnLXV0aWxzOiBpbnRyb2R1Y2UgaGVscGVyIHRvIHByb3Blcmx5IGpzb24tZXNjYXBlIGEgc3Ry
aW5nCj4gICAgICAgcGFja2FnZS9wa2ctdXRpbHM6IGdlbmVyYXRlIHByb3BlciBKU09OIHN0cmlu
Z3Mgd2hlcmUgdGhleSBhcmUgZW1pdHRlZAo+ICAgICAgIGNvcmUvc2hvdy1pbmZvOiByZXBvcnQg
d2hldGhlciBhIHBhY2thZ2UgaXMgb3ZlcnJpZGVuCj4gICAgICAgY29yZS9zaG93LWluZm86IGFs
c28gZXhwb3J0IHNvdXJjZSBhbmQgc3RhbXAgZGlyZWN0b3JpZXMgaW4gc2hvdy1pbmZvCj4gICAg
ICAgY29yZS9zaG93LWluZm86IHJlcG9ydCBwYWNrYWdlIGJ1aWxkIHN0ZXBzIGFuZCBzdGFtcCBm
aWxlcwo+ICAgICAgIE1ha2VmaWxlOiBpbnRyb2R1Y2Ugc2hvdy12YXJzLCBhIGpzb24tZm9ybWF0
dGVkIGVxdWl2YWxlbnQgdG8gcHJpbnR2YXJzCgpUaGUgcmVzdCBvZiB0aGUgc2VyaWVzIGlzIG5v
dCBhYm91dCBmaXhlcywgc28gd2lsbCBoYXZlIHRvIHdhaXQgZm9yCmFub3RoZXIgcm91bmQuCgpS
ZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAKPiAgTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAyMyArKysrKy0KPiAgLi4uL2tvZGktc2NyZWVuc2F2
ZXItYXN0ZXJ3YXZlLm1rICAgICAgICAgICAgICAgICAgfCAgNCArLQo+ICAuLi4va29kaS1zY3Jl
ZW5zYXZlci1jcGJsb2JzLm1rICAgICAgICAgICAgICAgICAgICB8ICA0ICstCj4gIC4uLi9rb2Rp
LXNjcmVlbnNhdmVyLW1hdHJpeHRyYWlscy5tayAgICAgICAgICAgICAgIHwgIDQgKy0KPiAgcGFj
a2FnZS9wa2ctYXV0b3Rvb2xzLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCAtCj4g
IHBhY2thZ2UvcGtnLWNtYWtlLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQg
LQo+ICBwYWNrYWdlL3BrZy1nZW5lcmljLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDI5ICstLS0tLS0KPiAgcGFja2FnZS9wa2cta2NvbmZpZy5tayAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMyAtCj4gIHBhY2thZ2UvcGtnLW1lc29uLm1rICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDQgLQo+ICBwYWNrYWdlL3BrZy1weXRob24ubWsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICA3IC0tCj4gIHBhY2thZ2UvcGtnLXFtYWtlLm1rICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDQgLQo+ICBwYWNrYWdlL3BrZy11dGlscy5tayAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDkwICsrKysrKysrKysrKysrKysrLS0tLS0KPiAg
cGFja2FnZS9wa2ctd2FmLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSAt
LQo+ICBzdXBwb3J0L2RlcGVuZGVuY2llcy9kZXBlbmRlbmNpZXMubWsgICAgICAgICAgICAgICB8
ICAyICstCj4gIHN1cHBvcnQvbWlzYy91dGlscy5tayAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMTQgKysrLQo+ICAxNSBmaWxlcyBjaGFuZ2VkLCAxMTEgaW5zZXJ0aW9ucygrKSwgOTAg
ZGVsZXRpb25zKC0pCj4gCj4gLS0gCj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5u
IEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmlj
cycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVy
IHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5
OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhl
cmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8g
XCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tLS0nCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBS
ZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6
IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04g
ICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0t
LS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRw
Oi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2
ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
