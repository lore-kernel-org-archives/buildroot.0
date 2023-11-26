Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E8CC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 11:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1197D400B8;
	Sun, 26 Nov 2023 11:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1197D400B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ogiSVnrpTJEN; Sun, 26 Nov 2023 11:27:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1C4E40291;
	Sun, 26 Nov 2023 11:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1C4E40291
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5AF931BF484
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 11:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4216F812D2
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 11:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4216F812D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 04UDwYZyaDwG for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 11:27:32 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7B43812CB
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 11:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7B43812CB
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D1807780516;
 Sun, 26 Nov 2023 12:27:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 12:27:25 +0100
Date: Sun, 26 Nov 2023 12:27:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231126112725.GS3177259@scaer>
References: <20231125081052.881728-1-james.hilliard1@gmail.com>
 <20231125081052.881728-2-james.hilliard1@gmail.com>
 <20231125153609.GJ3177259@scaer>
 <CADvTj4oC_mtb0EymNkFQ969rPRoaw8L8QVvAV2n--knCYB9=iQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4oC_mtb0EymNkFQ969rPRoaw8L8QVvAV2n--knCYB9=iQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700998050;
 bh=sLBo5wGFZd2Y+MyQgXruq/LA3SgKMJ+tMNDwf1QMWU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=krddRrR93NJPlpBFp980ihDKM4l4u+TCmM5BeP/OspZtBeetwOpfobbMZ2xXDXzIS
 8BfNd0mu2R8KlJOMUgqhJCRt9oct79jDUz6vMX0+m03nQoWArDwaG6tfkgZCalpUHu
 vyo9DBvnBQelzNh5XNlLjpUMRg4UqDoFXwm6hdONOdF8r3ILfWdTfOpfkjfOV+uEgp
 0DSvSE95B1K2GiG8M5YvfpeleuLOs8vBznMt4t21EQT3lsad8NoaSOUPz42WJl2RmU
 zIS6IjCtsK6I2sHTjteW4uXJJlppKDkVuxw4i2ghhsJ+KNaAivbQC9tZn4B0VeE52h
 x3R9fjHLNugGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=krddRrR9
Subject: Re: [Buildroot] [PATCH 2/3] package/python-pydantic-core: new
 package
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjMtMTEtMjUgMTc6MTEgLTA3MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBTYXQsIE5vdiAyNSwgMjAyMyBhdCA4OjM24oCvQU0gWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgpbLS1TTklQLS1dCj4gPiBTbyB3
aGF0IGhhcHBlbnMgaWYgSSBhcHBseSB0aGlzIHBhdGNoLCB3aGljaCBhZGRzIHB5ZGFudGljLWNv
cmUsIGJ1dCBJCj4gPiBkbyBub3QgYXBwbHkgdGhlIG5leHQgb25lLCB3aGljaCBidW1wcyBweWRh
bnRpYywgc28gd2UgZW5kIHVwIGluIGEKPiA+IHNpdHVhdGlvbiB3aXRoIGFuIG9sZCBweWRhbnRp
Yywgd2l0aCB0aGUgbmV3IGNvcmUgYWxzbyBpbnN0YWxsZWQ/Cj4gPgo+ID4gRG8gdGhlIHR3byBj
b25mbGljdCwgb3IgaXMgaXQgYW4gT0sgc2l0dWF0aW9uIChvYnZpb3VzbHkgdGhlCj4gPiBweWRh
bnRpYy1jb3JlIHdvdWxkIGJlIG9mIGxpdHRsZSB1c2UpPwo+ID4KPiA+IElmIHRoZXJlIGlzIGEg
Y29uZmxpY3QsIHRoZW4gd2Ugd2lsbCB3YW50IHRvIGludHJvZHVjZSB0aGUgbmV3IHBhY2thZ2UK
PiA+IGF0IHRoZSBzYW1lIHRpbWUgd2UgZG8gdGhlIGJ1bXAsIGFuZCB0aGF0IHNob3VsZCBiZSBl
eHBsYWluZWQgaW50IGhlCj4gPiBjb21taXQgbG9nLgo+ID4KPiA+IElmIHRoZXJlIGlzIG5vIGNv
bmZsaWN0LCB0aGVuIGp1c3Qgc2F5LCB3ZSBjYW4gYW1tZW5kIHRoZSBjb21taXQgbG9nCj4gPiBh
Y2NvcmRpZ25seS4KPiAKPiBUaGVyZSdzIG5vIGNvbmZsaWN0IHNpbmNlIHB5ZGFudGljLWNvcmUg
aXMgYSBuZXcgcGFja2FnZSB3aXRoIG5vIHJldmVyc2UKPiBkZXBlbmRlbmNpZXMuCgpJdCBpcyBu
b3QganVzdCBhYm91dCByZXZlcnNlIGRlcGVuZGVuY2llcy4gQXNzdW1pbmcgd2UganVzdCBhcHBs
eSB0aGUKcHlkYW50aWMtY29yZSBuZXcgcGFja2FnZSwgYW5kIGtlZXAgdGhlIG9sZCBweWRhbnRp
YyAoZS5nIHdlIGhhdmUgdG8KcmV2ZXJ0IHRoZSBidW1wIGxhdGVyIGZvciB2YXJpb3VzIHJlYXNv
bnMpLCB3aGF0IGhhcHBlbnMgYXQgYnVpbGQgdGltZQpvciBhdCBydW50aW1lLCBpZiB0aGUgdXNl
ciBlbmFibGVzIHB5ZGFudGljLWNvcmUgYW5kIHB5ZGFudGljICh0aGUgb2xkKT8KCklmIHRoYXQg
bWFrZXMgcHlkYW50aWMtb2xkIGZhaWwgdG8gYnVpbGQgb3IgcnVuLCB0aGF0IGlzIHdoYXQgd2Ug
Y2FyZQphYm91dC4KClstLVNOSVAtLV0KPiA+IENvdWxkIHlvdSBwbGVhc2UgZXh0ZW5kIHRoZSBt
YW51YWwgdG8gZGVzY3JiZSB0aGUgYWRkaXRpb25hbCBzZXR1cCB0eXBlcwo+ID4gdGhhdCBhcmUg
Y3VycmVudGx5IHN1cHBvcnRlZCBieSBCdWlsZHJvb3QsIHBsZWFzZT8KPiBZZWFoLCBzbyB3ZSdy
ZSBwcmV0dHkgY2xvc2UgcmlnaHQgbm93IHRvIGhhdmluZyBhbGwgb3VyIHB5dGhvbiBpbmZyYXN0
cnVjdHVyZQo+IG1pZ3JhdGVkIHRvIHBlcDUxNyBzbyBJIHdhcyB0aGlua2luZyBvbmNlIHdlIGhh
dmUgdGhhdCB0aGVuIGEgbG90IG9mIHRoaW5ncwo+IGluY2x1ZGluZyB0aGUgZG9jdW1lbnRhdGlv
biBjYW4gYmUgc2lnbmlmaWNhbnRseSBzaW1wbGlmaWVkIGFzIG1hdHVyaW4gYW5kCj4gc2V0dXB0
b29scy1ydXN0IGluZnJhc3RydWN0dXJlIHdpbGwgYmUgcGVwNTE3IGJhc2VkIGFuZCB3ZSBjYW4g
ZHJvcCBhbGwgdGhlCj4gbGVnYWN5IGRvY3MgbGlrZSBkaXN0dXRpbHMgYW5kIHRoZSBkb2NzIHJl
bGF0ZWQgdG8gbGVnYWN5IG5vbi1wZXA1MTcgc2V0dXB0b29scy4KCkJ1dCBub25lIG9mIHRoYXQg
aXMgb24gbWFzdGVyLCBmb3IgdGhlIHJlbGVhc2UgdG8gY29tZSwgc28gd2Ugd291bGQgc3RpbApu
ZWVkIHRoZSBtYW51YWwgdG8gYmUgdXAtdG8tZGF0ZSBmb3IgbWFzdGVyLgoKUmVnYXJkcywKWWFu
biBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklO
ICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3Bp
cmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1Q
QUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0t
LS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8
IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAg
fCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
