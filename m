Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4660C433F5
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 21:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24EB260ABA;
	Mon, 17 Jan 2022 21:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74q2sJwNpub6; Mon, 17 Jan 2022 21:50:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59EDC60A98;
	Mon, 17 Jan 2022 21:50:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E64721BF388
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 21:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D43EA60A98
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 21:50:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lHOXQGDU0ExQ for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 21:50:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56F7860598
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 21:50:54 +0000 (UTC)
Received: from smtpclient.apple ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPA
 id 9ZtrnY6njgdXd9ZtrnmBmd; Mon, 17 Jan 2022 22:50:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642456251; bh=iIs9gR/kwfRPwcJEpeE3ROuEDmgbmCo7ejI3bH80bng=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=S2fIQToFzLZavH8/o80FnXlWuC9s62nICJMtZv17CGbuBIveKmTZj9USG4QWqLsAs
 Ek0jitRg38fmhdtWgZFE8uSMGa1BVv5Va3YXHAq56TVXHN40b1LhIrjP2Pqtq00pUl
 HJw0iZutrbboRTsb5t7wfNmpQLZfvc3duG6etBRLZg1UdfrwwKC8S6604yDNDxGgni
 ccSWBVObvq+8WtddFVDrFD2L4rI5iiD0LxiIXpx+VIW5GyfotDohnIv/xJg6AepPYs
 bwbflEqoO3DzcrSB28GoowKMV00wK7w7PlngsVPsLl3wbmQVUvw4/3w2uwn8nsc/+I
 qDyD54G9Z6tCw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 17 Jan 2022 22:50:50 +0100
Message-Id: <70BDD76B-E7F2-44C0-A90B-0FABCFD8755D@benettiengineering.com>
References: <20220117210739.2022551-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20220117210739.2022551-1-giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfPjrvZVtRVJHrccF1dtBnHj4Gg8rqNNErRyIXz0qUEMctg7Al2tCkB42Ne/igz5DlsllSGWIezmkPwOuBoSolU+lajNcO+y4NXSSJdNWUo/smLd0Y5cY
 PeTaXANvInvHdCQQIkTEGhXh36s2t2j0bJRhqZlsBGCCjxzIeVTaHuwu/yKgOJlcq5lyPys0aRSutri0G0EyYJN+eXhug3JoaaKGTu/cdvC/fBglxQ30B0Xd
 /H+jhEKmCiOHsqfN8cVHaR/7xx5lwWoZn2Zz9f92mIs=
Subject: Re: [Buildroot] [PATCH] package/xr819-xradio: add patch to build
 with Linux > 5.12
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxsLAoKPiBJbCBnaW9ybm8gMTcgZ2VuIDIwMjIsIGFsbGUgb3JlIDIyOjA3LCBHaXVsaW8g
QmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gaGEgc2NyaXR0
bzoKPiAKPiDvu79BcyBleHBsYWluZWQgaW4gdGhlIGxvY2FsIHBhdGNoIGl0c2VsZiBvZl9nZXRf
bWFjX2FkZHJlc3MoKSBoYXMgY2hhbmdlZCwgc28KPiB3ZSBuZWVkIHRvIGNoZWNrIGFnYWluc3Qg
TGludXggdmVyc2lvbiBhbmQgdXNlIGl0IHNsaWdodGx5IGRpZmZlcmVudGx5Lgo+IAo+IFBhdGNo
IGlzIHBlbmRpbmcgdXBzdHJlYW06Cj4gaHR0cHM6Ly9naXRodWIuY29tL2ZpZnRlZW5oZXgveHJh
ZGlvL3B1bGwvMTUKPiBJJ3ZlIHJlYWxpemVkIG9ubHkgbGF0ZXIgdGhlcmUgd2FzIGFscmVhZHkg
YW4gb3BlbmVkIFBSIGZvciB0aGlzLCBhbnl3YXkKPiBJTUhPIEkgdGhpbmsgbXkgcGF0Y2ggaXMg
d3JpdHRlbiBhIGxpdHRsZSBiZXR0ZXIsIHNvIHBsZWFzZSBhY2NlcHQgaXQuCj4gQW5kIG1vc3Qg
b2YgYWxsIFNlcmdleSBhbHJlYWR5IHRlc3RlZCBpdCBhbmQgaXQgd29ya3M6Cj4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMi1KYW51YXJ5LzYzNDA4
NC5odG1sCj4gCj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRp
QGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4gLS0tCj4gLi4uZml4LWJ1aWxkaW5nLXdpdGgtTGlu
dXgtdmVyc2lvbi01LjEyLnBhdGNoIHwgNjggKysrKysrKysrKysrKysrKysrKwo+IDEgZmlsZSBj
aGFuZ2VkLCA2OCBpbnNlcnRpb25zKCspCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UveHI4
MTkteHJhZGlvLzAwMDEtbWFpbi5jLWZpeC1idWlsZGluZy13aXRoLUxpbnV4LXZlcnNpb24tNS4x
Mi5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3hyODE5LXhyYWRpby8wMDAxLW1haW4u
Yy1maXgtYnVpbGRpbmctd2l0aC1MaW51eC12ZXJzaW9uLTUuMTIucGF0Y2ggYi9wYWNrYWdlL3hy
ODE5LXhyYWRpby8wMDAxLW1haW4uYy1maXgtYnVpbGRpbmctd2l0aC1MaW51eC12ZXJzaW9uLTUu
MTIucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmExZDkx
ZTJmZjcKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS94cjgxOS14cmFkaW8vMDAwMS1t
YWluLmMtZml4LWJ1aWxkaW5nLXdpdGgtTGludXgtdmVyc2lvbi01LjEyLnBhdGNoCj4gQEAgLTAs
MCArMSw2OCBAQAo+ICtGcm9tIDk5MGIxOTY2NDQ4OGE4YTNiYjhkMDE5YTNhNmIyNDJkZDhhZDRj
MjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IEdpdWxpbyBCZW5ldHRpIDxnaXVs
aW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+ICtEYXRlOiBNb24sIDE3IEphbiAy
MDIyIDEyOjI2OjAwICswMTAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gbWFpbi5jOiBmaXggYnVpbGRp
bmcgd2l0aCBMaW51eCB2ZXJzaW9uID4gNS4xMgo+ICsKPiArb2ZfZ2V0X21hY19hZGRyZXNzKCkg
b24gTGludXggdmVyc2lvbiA+IDUuMTIgcmVxdWlyZXMgbWFjIHBvaW50ZXIgYXMgc2Vjb25kCj4g
K2FyZ3VtZW50IGFuZCByZXR1cm4gYW4gaW50LiBTbyBsZXQncyBkZWFsIHdpdGggaXQgYnkgY2hl
Y2tpbmcgbGludXggdmVyc2lvbgo+ICt0byBtYWtlIGl0IGNvbXBhdGlibGUgd2l0aCBib3RoIExp
bnV4IHZlcnNpb24gPiA1LjEyIGFuZCBub3QuCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBHaXVsaW8g
QmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPiArLS0tCj4g
KyBtYWluLmMgfCAxNyArKysrKysrKysrKysrKysrKwo+ICsgMSBmaWxlIGNoYW5nZWQsIDE3IGlu
c2VydGlvbnMoKykKPiArCj4gK2RpZmYgLS1naXQgYS9tYWluLmMgYi9tYWluLmMKPiAraW5kZXgg
YjYwZTE4ZC4uZDM1NDUyMSAxMDA2NDQKPiArLS0tIGEvbWFpbi5jCj4gKysrKyBiL21haW4uYwo+
ICtAQCAtMTMsNiArMTMsNyBAQAo+ICsgI2luY2x1ZGUgPG5ldC9jZmc4MDIxMS5oPgo+ICsgI2lu
Y2x1ZGUgPGxpbnV4L29mX25ldC5oPgo+ICsgI2luY2x1ZGUgPGxpbnV4L21tYy9zZGlvX2Z1bmMu
aD4KPiArKyNpbmNsdWRlIDxsaW51eC92ZXJzaW9uLmg+Cj4gKyAKPiArICNpbmNsdWRlICJ4cmFk
aW8uaCIKPiArICNpbmNsdWRlICJmd2lvLmgiCj4gK0BAIC00OTksOCArNTAwLDEyIEBAIGludCB4
cmFkaW9fY29yZV9pbml0KHN0cnVjdCBzZGlvX2Z1bmMqIGZ1bmMpCj4gKyAgICBpbnQgaWZfaWQ7
Cj4gKyAgICBzdHJ1Y3QgaWVlZTgwMjExX2h3ICpkZXY7Cj4gKyAgICBzdHJ1Y3QgeHJhZGlvX2Nv
bW1vbiAqaHdfcHJpdjsKPiArKyNpZiBMSU5VWF9WRVJTSU9OX0NPREUgPiBLRVJORUxfVkVSU0lP
Tig1LCAxMiwgMCkKPiArKyAgICB1bnNpZ25lZCBjaGFyIGFkZHJbRVRIX0FMRU5dOwo+ICsrI2Vs
c2UKPiArICAgIHVuc2lnbmVkIGNoYXIgcmFuZG9tYWRkcltFVEhfQUxFTl07Cj4gKyAgICBjb25z
dCB1bnNpZ25lZCBjaGFyICphZGRyID0gTlVMTDsKPiArKyNlbmRpZgo+ICsgCj4gKyAgICAvL2lu
aXQgeHJhZGlvX2NvbW1vbgo+ICsgICAgZGV2ID0geHJhZGlvX2luaXRfY29tbW9uKHNpemVvZihz
dHJ1Y3QgeHJhZGlvX2NvbW1vbikpOwo+ICtAQCAtNTEzLDYgKzUxOCwxNiBAQCBpbnQgeHJhZGlv
X2NvcmVfaW5pdChzdHJ1Y3Qgc2Rpb19mdW5jKiBmdW5jKQo+ICsgICAgaHdfcHJpdi0+c2Rpb19m
dW5jID0gZnVuYzsKPiArICAgIHNkaW9fc2V0X2RydmRhdGEoZnVuYywgaHdfcHJpdik7Cj4gKyAK
PiArKyNpZiBMSU5VWF9WRVJTSU9OX0NPREUgPiBLRVJORUxfVkVSU0lPTig1LCAxMiwgMCkKClRo
aXMgXl5eIG11c3QgYmUgPj0gNS4xMy4KCk5lZWQgdG8gc2VuZCBhIHYyIGFuZCB1cGRhdGUgbXkg
UFIuCgpTb3JyeSBmb3IgdGhlIG5vaXNlCkdpdWxpbwoKPiArKyAgICAvLyBmaWxsIGluIG1hYyBh
ZGRyZXNzZXMKPiArKyAgICBpZiAoaHdfcHJpdi0+cGRldi0+b2Zfbm9kZSkgewo+ICsrICAgICAg
ICBlcnIgPSBvZl9nZXRfbWFjX2FkZHJlc3MoaHdfcHJpdi0+cGRldi0+b2Zfbm9kZSwgYWRkcik7
Cj4gKysgICAgfQo+ICsrICAgIGlmIChlcnIgPCAwKSB7Cj4gKysgICAgICAgIGRldl93YXJuKGh3
X3ByaXYtPnBkZXYsICJubyBtYWMgYWRkcmVzcyBwcm92aWRlZCwgdXNpbmcgcmFuZG9tXG4iKTsK
PiArKyAgICAgICAgZXRoX3JhbmRvbV9hZGRyKGFkZHIpOwo+ICsrICAgIH0KPiArKyNlbHNlCj4g
KyAgICAvLyBmaWxsIGluIG1hYyBhZGRyZXNzZXMKPiArICAgIGlmIChod19wcml2LT5wZGV2LT5v
Zl9ub2RlKSB7Cj4gKyAgICAgICAgYWRkciA9IG9mX2dldF9tYWNfYWRkcmVzcyhod19wcml2LT5w
ZGV2LT5vZl9ub2RlKTsKPiArQEAgLTUyMiw2ICs1MzcsOCBAQCBpbnQgeHJhZGlvX2NvcmVfaW5p
dChzdHJ1Y3Qgc2Rpb19mdW5jKiBmdW5jKQo+ICsgICAgICAgIGV0aF9yYW5kb21fYWRkcihyYW5k
b21hZGRyKTsKPiArICAgICAgICBhZGRyID0gcmFuZG9tYWRkcjsKPiArICAgIH0KPiArKyNlbmRp
Zgo+ICsrCj4gKyAgICBtZW1jcHkoaHdfcHJpdi0+YWRkcmVzc2VzWzBdLmFkZHIsIGFkZHIsIEVU
SF9BTEVOKTsKPiArICAgIG1lbWNweShod19wcml2LT5hZGRyZXNzZXNbMV0uYWRkciwgYWRkciwg
RVRIX0FMRU4pOwo+ICsgICAgaHdfcHJpdi0+YWRkcmVzc2VzWzFdLmFkZHJbNV0gKz0gMHgwMTsK
PiArLS0gCj4gKzIuMjUuMQo+ICsKPiAtLSAKPiAyLjI1LjEKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
