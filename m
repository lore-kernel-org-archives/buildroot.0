Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD986C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 12:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D49B823AB;
	Mon, 15 Aug 2022 12:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D49B823AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rtayvDadYfCr; Mon, 15 Aug 2022 12:52:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5267881D7D;
	Mon, 15 Aug 2022 12:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5267881D7D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3A6F1BF3B9
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EAFA408E5
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EAFA408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sT9U5GwgS95S for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 12:52:46 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E82B9405AC
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp2.osuosl.org (Postfix) with ESMTP id E82B9405AC
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 12:52:45 +0000 (UTC)
Received: from smtpclient.apple ([151.35.242.151])
 by Aruba Outgoing Smtp  with ESMTPA
 id NZTOoS9Y1tk1HNZTPoTK46; Mon, 15 Aug 2022 14:45:40 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 15 Aug 2022 14:45:38 +0200
Message-Id: <8F776D99-F7CF-4239-B99B-2C9880F0FCAA@benettiengineering.com>
References: <20220815143538.19dbf4a4@windsurf>
In-Reply-To: <20220815143538.19dbf4a4@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (19G71)
X-CMAE-Envelope: MS4xfOes9uEn/judef7jnjYzp7tXQKnxhw8BO9IWGGo2B9H3XmstSpBREyMMVtPCwgW6Hky+jEi93mHXvWUttaystj9D9GON+BgtiYaFveYCgCEJ/A3UKHPt
 hlphEBpo0OFB+VNDrAAQ4K31smNEGx1/SYM+4zpmUDfSy95pzaHKH0aGXqyS5EstcfJSzcziutLnKfL2+GlCnEy+1EvFdVesIaH5uUxqDczbv7fJ3gc1Ah+Q
 L3BG3e2Z9Y+M7Mkw2N20Jr4eKfUm+aQF9/4hc0ZdQwZ/XDMwmawDtF8qf33S3doGl/GOPH59mVl5UY12Cc/FljjbOO6hIE5/OXRH+aOBTdwK6Lk6HRsOT98U
 03KA2l6n
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660567540; bh=dcDloupmYIT2wcy06uvHKaH/tTAgHDHL/U0XYFlB3iY=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=esKSdNBGULQG8eUF/MopCfnrZs34PkVL0Pt1k6pYUOC6+NtmbI/3XQASfG4wsefBm
 T+j4f0tGWlCqgJBNSECtwgob5PNOT7k58sMWCuX0d1xCUmWW7RETDZQay77x7X0HNe
 VhrdfIwLOTAIMWoyNxQefR1NBJRCEB1PTOUOFzk9ZBtIxFnluDap2zkHgk7wpfwDcS
 FiD7GGKk4dXGWRNKOwYCCok1NPFWqcFABoCSw+tyf52h6UGJhuEd8b3MF6nSs6YepQ
 VgOD7WebFasxnE+Nd1XurvSHUHybpua+F+RXrWkKAWL6ZmO2IQqFjuFaFhmUuE9eC7
 MKiP1XFZ0muOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=esKSdNBG
Subject: Re: [Buildroot] [PATCH 2/2] package/opencv4:
 BR2_PACKAGE_OPENCV4_LIB_OBJDETECT requires BR2_PACKAGE_OPENCV4_LIB_DNN
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
Cc: Stefano Cottafavi <stefano.cottafavi@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDE1IGFnbyAyMDIyLCBhbGxlIG9yZSAxNDozNSwgVGhvbWFzIFBldGF6em9u
aSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gaGEgc2NyaXR0bzoKPiAKPiDvu79PbiBN
b24sICA4IEF1ZyAyMDIyIDAwOjI1OjI5ICswMjAwCj4gR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5i
ZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+IAo+PiBPcGVuY3Y0IGxpYnJh
cnkgb2JqZGV0ZWN0IG5lZWRzIGxpYnJhcnkgZG5uLCBvdGhlcndpc2UgaXQgdGhyb3dzOgo+PiBg
YGAKPj4gLS0gTW9kdWxlIG9wZW5jdl9vYmpkZXRlY3QgZGlzYWJsZWQgYmVjYXVzZSBvcGVuY3Zf
ZG5uIGRlcGVuZGVuY3kgY2FuJ3QgYmUgcmVzb2x2ZWQhCj4+IGBgYAo+PiBTbyBsZXQncyAic2Vs
ZWN0IEJSMl9QQUNLQUdFX09QRU5DVjRfTElCX0ROTiIgaWYKPj4gQlIyX1BBQ0tBR0VfT1BFTkNW
NF9MSUJfT0JKREVURUNUIGlzIGVuYWJsZWQuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8g
QmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPj4gLS0tCj4+
IHBhY2thZ2Uvb3BlbmN2NC9Db25maWcuaW4gfCAxICsKPj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuY3Y0L0NvbmZpZy5pbiBi
L3BhY2thZ2Uvb3BlbmN2NC9Db25maWcuaW4KPj4gaW5kZXggYmRlZGRjYzA4OS4uNDk5MWI0MjUy
YiAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9vcGVuY3Y0L0NvbmZpZy5pbgo+PiArKysgYi9wYWNr
YWdlL29wZW5jdjQvQ29uZmlnLmluCj4+IEBAIC0xNTUsNiArMTU1LDcgQEAgY29uZmlnIEJSMl9Q
QUNLQUdFX09QRU5DVjRfTElCX09CSkRFVEVDVAo+PiAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfT1BF
TkNWNF9MSUJfQ0FMSUIzRAo+PiAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTkNWNF9MSUJfSU1H
UFJPQwo+PiAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTkNWNF9MSUJfTUwKPj4gKyAgICBzZWxl
Y3QgQlIyX1BBQ0tBR0VfT1BFTkNWNF9MSUJfRE5OCj4gCj4gQWxwaGFiZXRpYyBvcmRlcmluZyB3
YXMgbm90IGNvcnJlY3QsIGFuZCBpdCBhbHNvIGxhY2tlZCB0aGUgcHJvcGFnYXRpb24KPiBvZiB0
aGUgImRlcGVuZHMgb24iIG9mIHNlbGVjdCBCUjJfUEFDS0FHRV9PUEVOQ1Y0X0xJQl9ETk4uCgpP
aCBubywgYWdhaW4gdGhlIGRlcGVuZGVuY2llcyBpbiBDb25maWcuaW4hCkkgc3RpbGwga2VlcCBm
b3JnZXR0aW5nIHRoZW0gOi0vCgo+IAo+IFRoZSBmaW5hbCBwYXRjaCBpcyBhdDoKPiAKPiAgaHR0
cHM6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvY29tbWl0Lz9pZD1lMjI5OTQzNzg1NTM0
ZTA4ODRjNjJjNzM0NmE4YzZkZjhkNTY1ZTFlCgpUaGFuayB5b3UgVGhvbWFzLCB5b3XigJlyZSB0
b28ga2luZC4KCkJlc3QgcmVnYXJkcwpHaXVsaW8KCj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IFRo
b21hcwo+IC0tIAo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4K
PiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0
dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
