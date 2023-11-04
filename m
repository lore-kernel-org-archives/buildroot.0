Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CE4C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 14:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AF0C82347;
	Sat,  4 Nov 2023 14:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AF0C82347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8iaiK6OjaoMK; Sat,  4 Nov 2023 14:13:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D10BC82321;
	Sat,  4 Nov 2023 14:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D10BC82321
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02B121BF2AB
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCB6860A69
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCB6860A69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hNVrkBmgJxJR for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 14:13:11 +0000 (UTC)
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4768960A5D
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 14:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4768960A5D
Received: from smtpclient.apple ([151.38.235.186])
 by Aruba Outgoing Smtp  with ESMTPA
 id zHOequHm5Ljo1zHOeqgttT; Sat, 04 Nov 2023 15:13:08 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 4 Nov 2023 15:13:07 +0100
Message-Id: <106AC1FF-F6AC-4D4B-B89B-175D99FBBA81@benettiengineering.com>
References: <20231104150157.6830ab67@windsurf>
In-Reply-To: <20231104150157.6830ab67@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (21B80)
X-CMAE-Envelope: MS4xfNi5KoehPYL44R0QWl2s3F03Rahi9gYYtg0TQgXoQE564CUak4pW1Ls+2sb793uuFtTXMi7Uo1LWIMsyqFElbv/GS57RZ+t5BYoPiTC9ggUAXkNuMFnh
 KTOLs5aJ3P5ZJFPNa9OLoHQ3aECri7P7bsp0KY12cEaBp8Pi/k4g0XBjA3LAPge2SWPrRE8xPlUMQRrB6ZN75wdRYfI7t67dMOko78CePB2FcBlUOuEoemqg
 asvCkW5ly/EZrbFOxVG/VKEoPQj4EMRUU1fQA/zdiLVX4s9AgyGcl21WPIW5WNT6ztsO5PHbfCvXrxVCvIgzVafLU58xReG43Pjcq6Q3AYU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1699107188; bh=SSpvYXbIxc2hIxeKbXlNsVmMDTmC4vtrX43QgeFrnXA=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=SSR/ZTw8Rqo6Ss9HlrCqTTqNSSMnfCj0C6HWXQJqziJZyT4v7c/+lU532FIXp/IGj
 Ax/6z3aeSISVlnooA2cuxMjOWyhhbP0wpsdY+urO5n+a+rzYzrhO/7TJr8GofcaPzQ
 W1NEtzYL6tB+VfSmdthAJoskWrhRvD8Q52A2Nuaq59WNNT2rvPH2gKa5Zl9gwPkB6M
 Z8PcO0VJeYXai/ogVSYeKxspFlTV5tKW7Y/5oDkUyM2Hn9O5MwemCDbIoXoRVlC7F1
 JRiMnvaK2OlGdj+aijR07nR6HTirkIeF/2B2oK/VyWmhnhjzJipM0LHKI0PZqgoC1s
 zgQCRAGF9KGww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=SSR/ZTw8
Subject: Re: [Buildroot] [PATCH 1/2] board/bananapi/bananapi-m2-berry:
 switch to use extlinux.conf
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDQgbm92IDIwMjMsIGFsbGUgb3JlIDE1OjAyLCBUaG9tYXMgUGV0YXp6b25p
IDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBoYSBzY3JpdHRvOgo+IAo+IO+7v09uIFRo
dSwgMiBOb3YgMjAyMyAxOTozMDo0OCArMDEwMAo+IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVu
ZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPiAKPj4gSnVzdCByZWJ1aWx0LCBm
bGFzaGVkIGFuZCBnaXZlbiBhIHJ1biwgdGhpcyBpcyB0aGUgbG9nLCBzcGVjaWZpY2FsbHkgaW4K
Pj4gdS1ib290Ogo+IAo+IEh1bSwgaW5kZWVkLCB0aGUgVS1Cb290IGRvY3VtZW50YXRpb24gc2F5
czoKPiAKPiAiTm90ZSB0aGF0IGluIHRoZSBhYnNlbmNlIG9mIGFueSBwYXJ0aXRpb24gdGhhdCBp
cyBleHBsaWNpdGx5IG1hcmtlZAo+IGJvb3RhYmxlLCBVLUJvb3QgZmFsbHMgYmFjayB0byBzZWFy
Y2hpbmcgdGhlIGZpcnN0IHZhbGlkIHBhcnRpdGlvbiBvZiBhCj4gZGlzayBmb3IgYm9vdCBjb25m
aWd1cmF0aW9uIGZpbGVzLiIKClRoYW5rIHlvdSBmb3IgZGlnZ2luZyBhbmQgZmluZGluZyB0aGUg
cmVhc29uIQoKQmVzdCByZWdhcmRzCkdpdWxpbwoKPiAKPiBTbywgdGhhdCdzIHdoeSBpdCB3b3Jr
cy4KPiAKPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8s
IEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFp
bmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
