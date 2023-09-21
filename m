Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CFEE7D0A2
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 20:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A3CA408BB;
	Thu, 21 Sep 2023 20:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A3CA408BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V6lXSNFz-S_o; Thu, 21 Sep 2023 20:30:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34F85408B0;
	Thu, 21 Sep 2023 20:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34F85408B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67A0D1BF2B8
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 20:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41434404B4
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 20:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41434404B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dbk6Q9i0Y-Ni for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 20:29:53 +0000 (UTC)
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB03640447
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 20:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB03640447
Received: from [192.168.50.162] ([84.33.144.138])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jQJ3qwI3WiQUsjQJ3qEirk; Thu, 21 Sep 2023 22:29:50 +0200
Message-ID: <e21f3ec4-8e3a-422d-bbc0-c85a6e5fc28b@benettiengineering.com>
Date: Thu, 21 Sep 2023 22:29:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20230917202539.365838-1-giulio.benetti@benettiengineering.com>
 <20230918081559.1025134-1-giulio.benetti@benettiengineering.com>
 <983c8224-7628-6b66-6f32-a29d398e17f8@mind.be>
 <6cc2bc56-81a3-49c4-81fb-9912c6bacf42@benettiengineering.com>
 <903bb436-381e-96cf-cfd7-f3edd40505b7@mind.be>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <903bb436-381e-96cf-cfd7-f3edd40505b7@mind.be>
X-CMAE-Envelope: MS4xfHQnmQ+X3lB45rQmtLfdj+zSI/8h5C2D5xdqnz+kKUHK8eg/0yXedmJlSO4/j1O6MFv9pmt1NS0NHiOpEGbWQkCCY4nA1Om9ooTWFolO0YI2XclWo2iz
 Q3wfq1z/pkUC6WwWgPPk3eDcTHtojmAJR2cS6SgHBeuM4O/1dZAHzR5YCVjYNHDwt5VyZPWSiz89KKt88UuhoEtfW8uCiqe2LzNB2x0SsC9PsbPVSjpEaBqV
 CE97p/r67kzDMhxqRP7grCZLW08ykLrbHkmB3ohnCJoY5eN8hFGF2paBB9iKFvTxP3+dYckjqBp8D5XtAO/OgCCqKbnw2YCLc/mPCzgefuIM+3+bOR6byCuG
 MJi2DjWQCtgZJ9TSrdDwUTzGCBM35ZVzQYHdZWq1MIfcGbGBIeTnBmp/f7RnLE8nB1GHnoaMqlv4F3cJ/U2w/6GAolKY3B2ICRlXHaMk0qTuIApqxBxO7xde
 AsLSEVxCtxyI43c+45uAONjtprsXD4fcSmOyHg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695328190; bh=HtYb9M4f1BCoAg8UXSPF6w4QN3CFstIkgeRRMijtdoY=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Kha60kdIYAuzMVsVs9mDYn1Y1i/UUJOd6SZ8iiX2XWbADcuMQDa8aiWvSyVuKXiZ8
 b7qDmGQDbuqIuEqfmGclbq+8eHBIKqaO0BO25SvaxRntolDRltU1Ahi3jz8mgV//vJ
 xFnH+hGfog8q4JpjZw9oaUv/tZResaqhLIN1kkoXZEwVac3ihQxu+MOtbvx1pU0MKp
 JB1ifgEXtrkiTGMY3TQ7R1LS6aeJJ4QFTBVtFq4k/rLZcbTG6/JitvhSdyyb81VR6F
 +SlgH8BoQQ31CCvrrAw7DDx4YhkYZZtmuwVQWR/12JP+FGDEopo9h8kuTAFgerGuVD
 mEzriojjM3Q3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Kha60kdI
Subject: Re: [Buildroot] [PATCH v2] package/apache: add option
 BR2_PACKAGE_APACHE_UTILS_ONLY
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jim Reinhart <jimr@tekvox.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjEvMDkvMjMgMjI6MTAsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+IAo+IAo+IE9u
IDIxLzA5LzIwMjMgMjE6MjQsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+PiBIaSBBcm5vdXQsCj4+
Cj4+IE9uIDIxLzA5LzIzIDIwOjU4LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB2aWEgYnVpbGRyb290
IHdyb3RlOgo+Pj4gwqDCoEhpIEdpdWxpbwo+Pj4KPj4+IE9uIDE4LzA5LzIwMjMgMTA6MTUsIEdp
dWxpbyBCZW5ldHRpIHdyb3RlOgo+IFtzbmlwXQo+Pj4+ICvCoMKgwqAgLS13aXRoLXN0YXRpYy1o
dGRpZ2VzdCBcCj4+Pj4gK8KgwqDCoCAtLXdpdGgtc3RhdGljLWh0cGFzc3dkCj4+Pgo+Pj4gwqDC
oFRoaXMgc291bmRzIGxpa2UgdGhleSdyZSBsaW5rZWQgc3RhdGljYWxseT8gSXMgdGhlcmUgYSBy
ZWFzb24gdG8gZG8gCj4+PiB0aGF0IChvdGhlciB0aGFuIHRoYXQgeW91IGhhdmUgdG8gaW5zdGFs
bCB0aGUgc2hhcmVkIGxpYiB0byB0YXJnZXQsIAo+Pj4gb2YgY291cnNlKT8KPj4KPj4gSSB3YXMg
Y3VyaW91cyBhYm91dCB0aGlzIHRvbyBhbmQgc28gSSd2ZSB0cmllZCB0byBnaXZlIGE6Cj4+ICQg
ZmlsZSBodGRpZ2VzdAo+PiBhbmQgc2FtZSB0byBodHBhc3N3ZCBhbmQgdGhleSB0dXJuZWQgb3V0
IHRvIGJlIHNoYXJlZCBsaW5rZWQgYmluYXJpZXMsCj4+IHNvIHRoYXQgLS13aXRoLXN0YXRpYy0q
IG9wdGlvbiBpcyBwcmV0dHkgYW1iaWd1b3VzLgo+IAo+ICDCoFdlbGwsIGxvb2tpbmcgYXQgdGhl
IGNvbmZpZ3VyZSBzY3JpcHQsIGl0IGxvb2tzIGxpa2UgaXQgX2RvZXNfIGdldCAKPiBsaW5rZWQg
d2l0aCAtc3RhdGljIGlmIHRoYXQgb3B0aW9uIGlzIGVuYWJsZWQuIE9mIGNvdXJzZSwgLXN0YXRp
YyAKPiBkb2Vzbid0IG1lYW4gdGhhdCBpdCdzIG5vdCBsaW5rZWQgZHluYW1pY2FsbHkgYXQgYWxs
IC0gaWYgdGhlcmUgYXJlIHNvbWUgCj4gbGlicmFyaWVzIGZvciB3aGljaCBubyBzdGF0aWMgdmFy
aWFudCBpcyBhdmFpbGFibGUgKHdoaWNoIGlzIHRoZSBjYXNlIGlmIAo+IEJSMl9TSEFSRURfTElC
Uz15KSwgdGhlbiB0aG9zZSBhcmUgc3RpbGwgbGlua2VkIGR5bmFtaWNhbGx5LgoKQWggeWVzLCB5
b3UncmUgcmlnaHQuCgo+ICDCoEFGQUlDUyB0aGVyZSBzaG91bGQgYmUgbm8gcmVhc29uIHRvIHBh
c3MgdGhlc2UgdHdvIG9wdGlvbnMuCgpZb3UncmUgdG90YWxseSByaWdodCBoZXJlIHRvbywgZHJv
cHBpbmcgdGhlbSBpdCBidWlsZHMgY29ycmVjdGx5LgpJIGFsc28gdHJpZWQgdG8gY2hlY2sgaWYg
c3VwcG9ydC9NYWtlZmlsZSB3YXMgYWxyZWFkeSBwcm9kdWNlZCB0byBhdm9pZAphdXRvdG9vbHMg
Y29uZmlndXJlIHN0ZXAsIGJ1dCB1bmZvcnR1bmF0ZWx5IG5vdC4KClNvIEknbSBnb2luZyB0byBz
ZW5kIFY0IHdpdGhvdXQgdGhvc2UgMiB1c2VsZXNzIG9wdGlvbnMuCgpUaGFua3MgYSBsb3QgZm9y
IHJldmlld2luZyEKCkJlc3QgcmVnYXJkcwotLSAKR2l1bGlvIEJlbmV0dGkKQ0VPJkNUT0BCZW5l
dHRpIEVuZ2luZWVyaW5nIHNhcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
