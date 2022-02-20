Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48653C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 11:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCF0160A81;
	Sun, 20 Feb 2022 11:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kWdyIt5TXZKl; Sun, 20 Feb 2022 11:43:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EA8F600C7;
	Sun, 20 Feb 2022 11:43:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A381C1BF2F7
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 11:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A02C1600C7
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 11:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0QuyhQm3GTad for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 11:43:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27695600BB
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 11:43:34 +0000 (UTC)
Received: from smtpclient.apple ([151.82.115.62])
 by Aruba Outgoing Smtp  with ESMTPA
 id LkcmnT1rpkz4hLkcnn2yGF; Sun, 20 Feb 2022 12:43:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645357413; bh=Fj2hguCtorXpWJaSyN7A1WdqtJlWghSkFaEAOMGetOw=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=OTTABgr1zqROrKeE6mpqAn02aDXhxTE5FP6K6UgeflHuomurcdVd5vzLEeWLa99v3
 doOLdQmJIYRn5nmYH84UqDZ0z/agXw+2fdK5Z/+h4Q4PwKXDeYV2v4925uQCGJrql9
 OEC2cwgt0QjRO28tnnQ49C+7a0/xntC8PktsTmnPQjde4yxo1TEEsm2qXFNxmxcxi1
 O0XeZuAR0nyGoshG4bEzDNdgW1geOCBHbGN4C5wfy9Nz8Iijt20gaku4TwRmedf1Io
 dSrfaeEAH6vRNER5keBov6131+/WgRUjxgiDIfR+cgSWBhWuDz768j0XKZyKKYZOxo
 98LbJVST3c7yw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 20 Feb 2022 12:43:31 +0100
Message-Id: <893D1C4B-6F6D-4F58-A77C-C71AFED67270@benettiengineering.com>
References: <CAHnHX5jBPNhPMUZz+TPiUk2_+FpWYV0EoHwCdHoKHNsLsqbM4g@mail.gmail.com>
In-Reply-To: <CAHnHX5jBPNhPMUZz+TPiUk2_+FpWYV0EoHwCdHoKHNsLsqbM4g@mail.gmail.com>
To: Mohd Faiz Rohani <mohd.faiz.rohani@gmail.com>
X-Mailer: iPhone Mail (19D52)
X-CMAE-Envelope: MS4wfDqPe5pmAV4f37e0jkA+d+a3STEIRgo44gPVq7IeQDLowMthOBwTjQ5XpxIE1nq3tmfHd54cLhLLW5Euf802klpkdP40jp7+2b2WvIJToB9N+9Nhyq8n
 9zxX5QoAMpxV1j1i7LLI3VAhxiSj4FtPFjLR6fOi62+oms7GzuoNzrrQ/UHmLvNAKAVA83CYqBMLPaNGIuPI5tp77Jud3O3tb+BHc9zM2+bw895v/zINHK/+
 lmZqeGQaGMZQfl8CmBKi0g==
Subject: Re: [Buildroot] Issue with login
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

SGkgTW9oZCwKCmhhdmUgeW91IHVzZWQgcm9vdCBhcyB1c2VyPyBPciBkaWQgeW91IHByb3ZpZGUg
YSB1c2VyIHRhYmxlPwoKR2l1bGlvCgpJbnZpYXRvIGRhIGlQaG9uZQoKPiBJbCBnaW9ybm8gMjAg
ZmViIDIwMjIsIGFsbGUgb3JlIDExOjU3LCBNb2hkIEZhaXogUm9oYW5pIDxtb2hkLmZhaXoucm9o
YW5pQGdtYWlsLmNvbT4gaGEgc2NyaXR0bzoKPiAKPiDvu78KPiBIaSBndXlzLAo+IAo+IEkgbWFu
YWdlZCB0byBjb21waWxlIHdpdGggc3VjY2VzcyB0aGUgVWJvb3QoVS1Cb290IDIwMTkuMDQpLCBM
aW51eCBrZXJuZWwoNC40LjE1NSlhbmQgcm9vdCBmaWxlIHN5c3RlbShzeXN0ZW1kIDI0OSkgdXNp
bmcgdGhlIEJ1aWxkcm9vdC0yMDIxLjExLjEuIEl0IHdhcyBhYmxlIHRvIGJvb3Qgc3VjY2Vzc2Z1
bGx5IHVudGlsIHRoZSBsb2dpbiBwcm9tcHQuIEhvd2V2ZXIsIGl0IHNlZW1zIGxpa2UgdGhlcmUg
aXMgYW4gZXJyb3Igd2l0aCB0aGUgbG9naW4gcHJvbXB0IGl0IGRvZXMgbm90IHdhbnQgdG8gZW50
ZXIsIGp1c3QgbG9vcGluZyBhcm91bmQgdGhlIGxvZ2luIHByb21wdCBhZnRlciBJIGhhdmUgZW50
ZXJlZCB0aGUgbG9naW4gbmFtZSAobm90IHNob3dpbmcgdGhlIHBhc3N3b3JkIHByb21wdCkuIERp
ZCBhbnlvbmUga25vdyBhYm91dCB0aGlzPwo+IAo+IFRoYW5rcy4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
