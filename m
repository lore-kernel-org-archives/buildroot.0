Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9BFC433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 09:19:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E02F060F93
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 09:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E02F060F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8345B404C1;
	Fri, 15 Oct 2021 09:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FJgPhPsSkMNg; Fri, 15 Oct 2021 09:19:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 971B8401F4;
	Fri, 15 Oct 2021 09:19:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D7AC1BF48C
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 09:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5989C40469
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 09:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dxDxjwpemo9Y for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 09:19:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20B7E40463
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 09:19:43 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id B43A124000C;
 Fri, 15 Oct 2021 09:19:40 +0000 (UTC)
Date: Fri, 15 Oct 2021 11:19:39 +0200
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211015111917.7619aaf3@kmaincent-XPS-13-7390>
In-Reply-To: <20211014200207.GC368016@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-3-kory.maincent@bootlin.com>
 <20211006181104.GD2081069@scaer>
 <20211007102318.556f7fc2@kmaincent-XPS-13-7390>
 <20211007095326.GA2814782@scaer>
 <20211007144351.629d2de0@kmaincent-XPS-13-7390>
 <20211007162931.GH2081069@scaer>
 <20211011122736.3b0df127@kmaincent-XPS-13-7390>
 <20211014200207.GC368016@scaer>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 2/7] boot/grub2: add support to build
 multiple Grub2 configurations in the same build
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
Cc: Adam Duskett <aduskett@gmail.com>, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCk9uIFRodSwgMTQgT2N0IDIwMjEgMjI6MDI6MDcgKzAyMDAKIllhbm4gRS4g
TU9SSU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cgo+IEvDtnJ5LCBBbGwsCj4g
Cj4gU29ycnkgZm9yIG15IGxhdGUgcmVwbHksIEkndmUgYmVlbiBwcmV0dHkgYnVzeSBoZXJlLi4u
CgpObyBwcm9ibGVtLCBiZSBhIG1haW50YWluZXIgaXMgYSBmdWxsLXRpbWUgam9iIGRvbmUgb24g
eW91ciBvd24gdGltZSBhbmQgeW91CmRvIGdyZWF0IHdvcmshIDopCgo+IFNvLCBpbiB0aGUgZW5k
LCB5b3VyIG9yaWdpbmFsIHByb3Bvc2FsLCB0byBpbnN0YWxsIGVhY2ggYW5kIGV2ZXJ5IHR1cGxl
cwo+IGludG8gdGFyZ2V0LywgaXMgcHJvYmFibHkgdGhlIGJlc3Qgb3B0aW9uIHdlIGhhdmUsIGFu
ZCBpdCBjYW4gYmUgYXMKPiBzaW1wbGUgYXMgc29tZXRoaW5nIGxpa2U6CgpBbHJpZ2h0Cgo+IAo+
IFRlc3QtYnVpbHQgd2l0aDoKPiAKPiAgICAgQlIyX3g4Nl9wZW50aXVtND15Cj4gICAgIEJSMl9U
T09MQ0hBSU5fRVhURVJOQUw9eQo+ICAgICBCUjJfVEFSR0VUX0dSVUIyPXkKPiAgICAgQlIyX1RB
UkdFVF9HUlVCMl9JMzg2X1BDPXkKPiAgICAgQlIyX1RBUkdFVF9HUlVCMl9JMzg2X0VGST15Cj4g
ICAgIEJSMl9UQVJHRVRfR1JVQjJfSU5TVEFMTF9UT09MUz15Cj4gCj4gU2lkZSBub3RlLCB1bnJl
bGF0ZWQgdG8gdGhpcyBpc3N1ZTogd2UgaGF2ZSBhIHBhcmFsbGVsIGJ1aWxkIGlzc3VlIHdpdGgK
PiBncnViMjoKPiAKPiAgICAgMjAyMS0xMC0xNCAyMTo0NTo1MiBjZCAuICYmIC9iaW4vc2ggLi9j
b25maWcuc3RhdHVzIGNvbmZpZy11dGlsLmgKPiAgICAgMjAyMS0xMC0xNCAyMTo0NTo1MiBjb25m
aWcuc3RhdHVzOiBjcmVhdGluZyBjb25maWctdXRpbC5oCj4gICAgIDIwMjEtMTAtMTQgMjE6NDU6
NTIgYmlzb24gLWQgLXAgZ3J1Yl9zY3JpcHRfeXkgLWIgZ3J1Yl9zY3JpcHQKPiAuLi9ncnViLWNv
cmUvc2NyaXB0L3BhcnNlci55IDIwMjEtMTAtMTQgMjE6NDU6NTIKPiAuLi9ncnViLWNvcmUvc2Ny
aXB0L3BhcnNlci55OjkyLjEtMTI6IHdhcm5pbmc6IGRlcHJlY2F0ZWQgZGlyZWN0aXZlOgo+IOKA
mCVwdXJlLXBhcnNlcuKAmSwgdXNlIOKAmCVkZWZpbmUgYXBpLnB1cmXigJkgWy1XZGVwcmVjYXRl
ZF0gMjAyMS0xMC0xNCAyMTo0NTo1Mgo+IDkyIHwgJXB1cmUtcGFyc2VyIDIwMjEtMTAtMTQgMjE6
NDU6NTIgICAgICAgfCBefn5+fn5+fn5+fn4gMjAyMS0xMC0xNAo+IDIxOjQ1OjUyICAgICAgIHwg
JWRlZmluZSBhcGkucHVyZSAyMDIxLTEwLTE0IDIxOjQ1OjUyCj4gLi4vZ3J1Yi1jb3JlL3Njcmlw
dC9wYXJzZXIueTogd2FybmluZzogZml4LWl0cyBjYW4gYmUgYXBwbGllZC4gIFJlcnVuIHdpdGgK
PiBvcHRpb24gJy0tdXBkYXRlJy4gWy1Xb3RoZXJdIDIwMjEtMTAtMTQgMjE6NDU6NTIKPiAvaG9t
ZS95bW9yaW4vZGV2L2J1aWxkcm9vdC9PL2hvc3QvYmluL2k2ODYtbGludXgtZ2NjIC1FIC1ESEFW
RV9DT05GSUdfSCAtSS4KPiAtSS4uICAtV2FsbCAtVyAtREdSVUJfVVRJTD0xIC1EX0ZJTEVfT0ZG
U0VUX0JJVFM9NjQgLUkuL2luY2x1ZGUKPiAtREdSVUJfRklMRT0idXRpbC9ncnViLWZzdGVzdC5j
IiAtSS4gLUkuLiAtSS4gLUkuLiAtSS4uL2luY2x1ZGUgLUkuL2luY2x1ZGUKPiAtSS4uL2dydWIt
Y29yZS9saWIvbGliZ2NyeXB0LWdydWIvc3JjLyAtSS4vZ3J1Yi1jb3JlL2xpYi9nbnVsaWIKPiAt
SS4uL2dydWItY29yZS9saWIvZ251bGliICAtRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklM
RTY0X1NPVVJDRQo+IC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLU9zIC1mbm8tc3RhY2stcHJvdGVj
dG9yIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQKPiAtRCdHUlVCX01PRF9JTklUKHgpPUBNQVJLRVJA
eEAnIC4uL3V0aWwvZ3J1Yi1mc3Rlc3QuYwo+IC4uL2dydWItY29yZS9rZXJuL2VtdS9ob3N0ZnMu
YyAuLi8gZ3J1Yi1jb3JlL2Rpc2svaG9zdC5jCj4gLi4vZ3J1Yi1jb3JlL29zZGVwL2luaXQuYyA+
IGdydWJfZnN0ZXN0LnBwIHx8IChybSAtZiBncnViX2ZzdGVzdC5wcDsgZXhpdCAxKQo+IDIwMjEt
MTAtMTQgMjE6NDU6NTIgLi4vZ3J1Yi1jb3JlL2tlcm4vZW11L2hvc3Rmcy5jOjIwOjEwOiBmYXRh
bCBlcnJvcjoKPiBjb25maWctdXRpbC5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5IDIwMjEt
MTAtMTQgMjE6NDU6NTIgICAgMjAgfCAjaW5jbHVkZQo+IDxjb25maWctdXRpbC5oPiAyMDIxLTEw
LTE0IDIxOjQ1OjUyICAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+Cj4gMjAyMS0xMC0x
NCAyMTo0NTo1MiBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLiAyMDIxLTEwLTE0IDIxOjQ1OjUyIG1h
a2VbMl06ICoqKgo+IFtNYWtlZmlsZToxMzEwNzogZ3J1Yl9mc3Rlc3QucHBdIEVycm9yIDEgMjAy
MS0xMC0xNCAyMTo0NTo1MiBtYWtlWzJdOiAqKioKPiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpv
YnMuLi4uCj4gCj4gQW5kIHJlLXN0YXJ0aW5nIHRoZSBidWlsZCBzdWNjZWVkcy4KCldlaXJkLCBJ
IGRvIG5vdCBmYWNlIHRoaXMgYnVpbGQgZXJyb3Igd2l0aCB0aGUgc2FtZSBkZWZjb25maWcuCgpS
ZWdhcmRzLApLw7ZyeQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
