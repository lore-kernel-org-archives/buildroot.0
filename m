Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B2BC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 09:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C310820C7;
	Tue,  6 Feb 2024 09:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g28BCJn-aIGT; Tue,  6 Feb 2024 09:52:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C45582169
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C45582169;
	Tue,  6 Feb 2024 09:52:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B6BE71BF27C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 09:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94F1E41ECC
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 09:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94F1E41ECC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NVqc7Ut7THHz for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 09:52:36 +0000 (UTC)
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C36841E78
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 09:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C36841E78
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XI7yrRLYDZ3lVXI7zrI0gI; Tue, 06 Feb 2024 10:52:31 +0100
Message-ID: <71301602-56ac-46b4-a853-bd71ed74da27@benettiengineering.com>
Date: Tue, 6 Feb 2024 10:52:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: franco ariel <fran.millocs@live.com.ar>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <PH0PR19MB5409C4B7C56D0550E15A83ABD0462@PH0PR19MB5409.namprd19.prod.outlook.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <PH0PR19MB5409C4B7C56D0550E15A83ABD0462@PH0PR19MB5409.namprd19.prod.outlook.com>
X-CMAE-Envelope: MS4xfHDWuSR4S2TzvnAXJZsZt0p35ZqCT0VGG0Mry0SyOsaj4NZb7OcevKQZ8/IzZ6MskR+Cciz0MKxtr44rAnmn1mUbwM9zrRdfN2Jj+vqE8cPbed53mqZD
 hKAp6KZpiGQ9ZaQxnTUJJtMV00GUFOGr4lg3s2o+RTl/L1/3Lt7YraNb0ALJo7G4Ok3OaCCmeHtWuAQYV32/tlRZp7YnoLqEW/DWd/ZwOkNiO4oSXDxvSOZB
 KOGKN7IT4GNRkxCS0ZyTUA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707213151; bh=VCPMIcTk2Erhz2qdE6zn0OWqlA+MsEXbW8eZ/ynv1JE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=T4MWKSr+NKNmkALk49bfDN+fMX7TleuPQbXgYL7IQlqtz6erLwHplQlmj0MdlhYqq
 WCDe8gRd0FIErnduIZXhPIUPMNKlMG89IqaKDPq3yRpOMexAkBKRaJ/ybdjsoHSfys
 DGVvSnTc0NYNQT2OjR0Vmr4eA4/ReXGUHrXqoTh9vsA0AUkn80YHe6IKybPWSTT63Y
 Vdm2ACyS+ewyU49nvnZxzpYWaxDqUFAokX13R+SvyEbO0KP+stEVvgEfRG7GmlP1A4
 OQIfZP4lXbJtxMEIV/8zXtTECIYR5rCdIbBjsaXoLz5guLJPyOAg/vdapplRt+PNtv
 U22rxpH4No2Hw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=T4MWKSr+
Subject: Re: [Buildroot] Best board to fast boot
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRnJhbmNvLAoKT24gMDYvMDIvMjQgMDU6MTQsIGZyYW5jbyBhcmllbCB3cm90ZToKPiBIZWxs
byBndXlzIQo+IEkgZmV3IHdlZWtzIGFnbyBJIHN0YXJ0ZWQgd29ya2luZyB3aXRoIGJ1aWxkcm9v
dCBvbiBycGk0LCBhbmQgaXQncyBsb29rIAo+IGFtYXppbmcsIHRoYW5rcyB0byB0aGUgY29tbXVu
aXR5IEkgd2FzIGFibGUgdG8gcnVuIGEgZmx1dHRlciBhcHAgb24gbXkgCj4gcnBpNC4gQnV0IG5v
dywgSSB3YW50IHRvIGtlZXAgZ29pbmcgZm9yd2FyZCB3aXRoIG15IHByb2plY3QsIHNvIMK/V2l0
Y2ggCj4gb25lIGFyZSB0aGUgYmVzdCBib2FyZCB0byBhY2hpZXZlIHRlIGJlc3QgYm9vdCB0aW1l
IHRvIGEgUXQgYXBwbGljYXRpb24/IAo+IEkgd2FzIGxvb2tpbmcgZm9yIHRoZSBSb2NrcHJvNjQg
ZnJvbSBwaW5lIGJ1dCBJJ20gbm90IHN1cmUsIHNpbmNlIHRoZXJlIAo+IGlzIG5vdCBzbyBtdWNo
IGluZm9ybWF0aW9uIGFib3V0IHRoaXMgYm9hcmQuCj4gCj4gV2hhdCBkbyB5b3UgdGhpbmsgaXQg
d2lsbCBiZSBnb29kIGZvciBteSBwcm9qZWN0PyBPbiBycGk0IEkgd2FzIGFibGUgdG8gCj4gZ2V0
IDEwc2VjIGJvb3QgdGltZSB1bnRpbCB0aGUgcXQgYXBwIHNob3dzIHVwLiBBbmQgSSB3YW50IHRv
IGFjaGlldmUgCj4gbGVzcyB0aGFuIDdzLgoKVGhpcyBkZXBlbmRzIGEgbG90IG9uIG9wdGltaXph
dGlvbiB5b3UgZG8gb24gYm9vdGxvYWRlciwgbGludXggYW5kIGluaXQKc2NyaXB0LgoKSSBzdWdn
ZXN0IHlvdSB0byB0YWtlIGEgbG9vayBhdCB0aGVzZSBzbGlkZXM6Cmh0dHBzOi8vYm9vdGxpbi5j
b20vZG9jL3RyYWluaW5nL2Jvb3QtdGltZS9ib290LXRpbWUtc2xpZGVzLnBkZgoKQmVzdCByZWdh
cmRzCi0tIApHaXVsaW8gQmVuZXR0aQpDRU8mQ1RPQEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
