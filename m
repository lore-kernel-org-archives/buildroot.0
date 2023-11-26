Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E13C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 16:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0071260888;
	Sun, 26 Nov 2023 16:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0071260888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uu6qWTV3wUMr; Sun, 26 Nov 2023 16:40:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D9196066D;
	Sun, 26 Nov 2023 16:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D9196066D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5A4B1BF3FF
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 16:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEB0E81234
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 16:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEB0E81234
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YwtAePE_CEyL for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 16:40:02 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73D3E81227
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 16:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73D3E81227
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 56E8B780331;
 Sun, 26 Nov 2023 17:39:55 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 17:39:55 +0100
Date: Sun, 26 Nov 2023 17:39:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231126163955.GX3177259@scaer>
References: <20231125081052.881728-1-james.hilliard1@gmail.com>
 <20231125081052.881728-2-james.hilliard1@gmail.com>
 <20231125153609.GJ3177259@scaer>
 <CADvTj4oC_mtb0EymNkFQ969rPRoaw8L8QVvAV2n--knCYB9=iQ@mail.gmail.com>
 <20231126112725.GS3177259@scaer>
 <CADvTj4qHe+Puev4JLopaBbH-Kq0+NAR_GH0G43JkcGy125tqXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4qHe+Puev4JLopaBbH-Kq0+NAR_GH0G43JkcGy125tqXQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701016799;
 bh=TwSc58J1dlmCPhsBDUZ+X/vnfs1KDw5HzCpBkqBDfFE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gZipk83L0cqsVaEtk3cCdjmSJa4OkbNNGxbZdpk6S64AMNj9dTq36RpWPwuRghh+6
 +rItuycslLDMTYTmiHjNEl0yviRdGcykFxotd1yL+buAUnLAVA0QLutPq5W3e0cYke
 T3+Mr9FGNzVQ2z1P9MPxrbiHbN8bEBg0Cp5sbDtNx3fLG/YyrCKjrCso3+Kd8PYnEq
 25fYeX28yDN15ZKF9GJUUhc4wGxjouGo4WFUmElMl4KHTZ889qiIX4pQ11JfmymD1X
 g229lW8+r3+XvEx7Hl77LFYPrFhyUtjRFiBmhvE0UKYeCwirjJ8wiqTFQRE2Vyflvt
 +MrzCwv8gU0ZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gZipk83L
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjMtMTEtMjYgMDk6MTkgLTA3MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBTdW4sIE5vdiAyNiwgMjAyMyBhdCA0OjI34oCvQU0gWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+ID4gPiBPbiBTYXQsIE5vdiAy
NSwgMjAyMyBhdCA4OjM24oCvQU0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUu
ZnI+IHdyb3RlOgpbLS1TTklQLS1dCj4gPiA+IFRoZXJlJ3Mgbm8gY29uZmxpY3Qgc2luY2UgcHlk
YW50aWMtY29yZSBpcyBhIG5ldyBwYWNrYWdlIHdpdGggbm8gcmV2ZXJzZQo+ID4gPiBkZXBlbmRl
bmNpZXMuCj4gPiBJdCBpcyBub3QganVzdCBhYm91dCByZXZlcnNlIGRlcGVuZGVuY2llcy4gQXNz
dW1pbmcgd2UganVzdCBhcHBseSB0aGUKPiA+IHB5ZGFudGljLWNvcmUgbmV3IHBhY2thZ2UsIGFu
ZCBrZWVwIHRoZSBvbGQgcHlkYW50aWMgKGUuZyB3ZSBoYXZlIHRvCj4gPiByZXZlcnQgdGhlIGJ1
bXAgbGF0ZXIgZm9yIHZhcmlvdXMgcmVhc29ucyksIHdoYXQgaGFwcGVucyBhdCBidWlsZCB0aW1l
Cj4gPiBvciBhdCBydW50aW1lLCBpZiB0aGUgdXNlciBlbmFibGVzIHB5ZGFudGljLWNvcmUgYW5k
IHB5ZGFudGljICh0aGUgb2xkKT8KPiBTbyBweWRhbnRpYy1jb3JlIGlzIGp1c3QgYSBuZXcgZGVw
ZW5kZW5jeSBmb3IgcHlkYW50aWMgdG8gaGFuZGxlIGNvcmUKPiB2YWxpZGF0aW9uIGxvZ2ljLiBJ
ZiBweWRhbnRpYy1jb3JlIGlzIHVzZWQgd2l0aCBvbGQgcHlkYW50aWMgdGhlcmUgc2hvdWxkbid0
Cj4gYmUgYW55IGJ1aWxkL3J1bnRpbWUgaXNzdWVzIGFzIHRoZXkgd291bGQgbm90IGNvbmZsaWN0
IGluIGFueSB3YXkuCj4gCj4gPiBJZiB0aGF0IG1ha2VzIHB5ZGFudGljLW9sZCBmYWlsIHRvIGJ1
aWxkIG9yIHJ1biwgdGhhdCBpcyB3aGF0IHdlIGNhcmUKPiA+IGFib3V0Lgo+IFdoeSB3b3VsZCBp
dCBtYWtlIHB5ZGFudGljLW9sZCBmYWlsPyBUaGUgcHlkYW50aWMtY29yZSBwYWNrYWdlIHVzZXMg
YQo+IGRpZmZlcmVudCBtb2R1bGUgbmFtZXNwYWNlIHdoaWNoIGlzIHR5cGljYWxseSBob3cgcHl0
aG9uIHBhY2thZ2VzCj4gcHJldmVudCBpbXBvcnQgY29uZmxpY3RzIGluIGdlbmVyYWwuCj4gCj4g
VG8gaW1wb3J0IGZyb20gcHlkYW50aWMtY29yZSB5b3UgaW1wb3J0IGxpa2U6Cj4gZnJvbSBweWRh
bnRpY19jb3JlIGltcG9ydCBTY2hlbWFWYWxpZGF0b3IsIFZhbGlkYXRpb25FcnJvcgo+IAo+IFRv
IGltcG9ydCBmcm9tIHB5ZGFudGljIHlvdSBpbXBvcnQgbGlrZToKPiBmcm9tIHB5ZGFudGljIGlt
cG9ydCBCYXNlTW9kZWwKPiAKPiBOZXcgcHlkYW50aWMgc2ltcGx5IGludGVybmFsbHkgaW1wb3J0
cyBmcm9tIHB5ZGFudGljX2NvcmUgYnV0IG9sZAo+IHB5ZGFudGljIGRvZXMgbm90IGFuZCB3aWxs
IGZ1bmN0aW9uIHRoZSBzYW1lIHdoZXRoZXIgb3Igbm90IHdlIGhhdmUKPiBweWRhbnRpY19jb3Jl
IGluc3RhbGxlZC4KClNvLCBweWRhbnRpYy1jb3JlIGRvZXMgbm90IHByb3ZpZGUgYSBzdWJzZXQg
b2YgdGhlIG1vZHVsZXMgcHJldmlvdXNseSBpbgpweWRhbnRpYywgc28gdGhlcmUgd2lsbCBub3Qg
YmUgYSBjb25mbGljdC4KClRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9ucy4gOi0pCgpSZWdhcmRz
LApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4g
TU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBj
b25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAv
IENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAt
LS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5v
ICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJ
TCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
