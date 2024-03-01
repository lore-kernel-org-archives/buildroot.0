Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898E4C54798
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 00:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4116B606E5;
	Fri,  1 Mar 2024 00:46:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiKdhTkSTeqI; Fri,  1 Mar 2024 00:46:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4537060786
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4537060786;
	Fri,  1 Mar 2024 00:46:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B4FA1BF98E
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 00:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 845AD41D97
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 00:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aWvJcvQ8oqW9 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 00:46:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8BD9041D92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BD9041D92
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BD9041D92
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 00:46:49 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id fr30rHezOP5FJfr30rSMSJ; Fri, 01 Mar 2024 01:46:46 +0100
Message-ID: <2e865888-e1d0-46a8-b3cb-fc26ce92a8d8@benettiengineering.com>
Date: Fri, 1 Mar 2024 01:46:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>, buildroot@buildroot.org
References: <20240228181409.3756293-1-sairon@sairon.cz>
 <5951f2b8-0ade-484a-97c0-0b59936e253d@sairon.cz>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <5951f2b8-0ade-484a-97c0-0b59936e253d@sairon.cz>
X-CMAE-Envelope: MS4xfNrj0s/orJzcf0VcGMGDif0uaZLiC3/BmTkJYGJOxQXq2/KgSqtbm2c58R5CAth8Pk/4hgT23Ip+JMhhW16ziAZRJng78/TrldN3gBcUSpw5oMM/n6O1
 YfXmHKzAt3gtjRQ2RepeWw54JXI6kuIPSEnVJyh85pVF+usOcZqT7tGHFUJ4zGR0sGc/mxrbfC8JoH484WV96pIn4u22KMNpIhvNO5QMLBK5K2lOSfo91fnj
 0lpkWavMx1uKEwDvRNpZPAB3lYg3gjyG0YMNAb7+Zo8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1709254006; bh=wyHgBfgwtZWnJtthCTkMDAWF5AQtncuYEIl8glhI5SE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=GiRI8GqfNO+aIgQW4FRc3uG/LffsfJBuoPWr0kIAzc0mgcvKU6VZfFFZH4mgnqq2X
 J2bPPbW4RJEY/l4YE4i4dCBGeOIby3xbvwL68W7wStPH3ZWXiXH2tHvLRsZWLkcSpL
 c5XVBQkjvO7QofkAuw1L7Xpxboll5IBwndi+r6oyM+Ca/g2Vba45JEKOmJXJ1fZKUT
 3FIZAijhL6esXPv9ya1hlD7xN/C/6dMHFVDoO0Kv6kemL+Y2lWkesEBdMQal9xQtyg
 CnPC26Z9s3gwsTeMZPeg67hA1V5gji8/EE4wZEiFj0EaazTtLR9/Wp4G2M3P9G/3Km
 c7M9ZGWd9M+YA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=GiRI8Gqf
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: only install fsidd
 binary and unit file with enabled nfsd
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
Cc: Petr Vorel <petr.vorel@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmEsCgpPbiAyOC8wMi8yNCAxOToyMywgSmFuIMSMZXJtw6FrIHdyb3RlOgo+IE9uIDI4LiAw
Mi4gMjQgMTk6MTQsIEphbiDEjGVybcOhayB3cm90ZToKPj4gVW5pdCBmaWxlIGZvciB0aGUgRlNJ
RCBkYWVtb24gZGVwZW5kcyBvbiB0aGUgbmZzLXNlcnZlci5zZXJ2aWNlLCB3aGljaCBpcwo+PiBy
ZW1vdmVkIHdpdGhvdXQgQlIyX1BBQ0tBR0VfTkZTX1VUSUxTX1JQQ19ORlNEIGVuYWJsZWQuIEFs
c28gZG9uJ3QgCj4+IGluc3RhbGwKPj4gdGhlIGZzaWRkIHNlcnZpY2UgYmluYXJ5IHdpdGhvdXQg
bmZzZCBlbmFibGVkLgo+IAo+IEFsc28sIEkgKnRoaW5rKiB0aGF0IHNxbGl0ZSAoYW5kIGxpYmV2
ZW50PykgZGVwZW5kZW5jaWVzIGNvdWxkIGJlIAo+IGRyb3BwZWQgaW4gdGhlIGNhc2Ugd2hlbiBu
ZnNkIChvciBuZnNkY2xkL25mc2RjbHRyYWNrKSBpcyBub3QgaW5zdGFsbGVkLiAKPiBCdXQgdGhl
cmUgYXJlIG5vIGNvbmZpZ3VyZSBmbGFncyBmb3IgdGhpcyBzY2VuYXJpbyBpbiB0aGUgdXBzdHJl
YW0sIG5mc2QgCj4gaXMgc2ltcGx5IHJlbW92ZWQgYWZ0ZXIgdGhlIGluc3RhbGwgaW4gQlIsIHNv
IHRoaXMgd291bGQgZWl0aGVyIG5lZWQgYml0IAo+IG1vcmUgZWxhYm9yYXRlIHBhdGNoaW5nIG9y
IHVwc3RyZWFtIGNvb3JkaW5hdGlvbi4gTWF5YmUgR2l1bGlvIG9yIFBldHIgCj4gY2FuIGdpdmUg
c29tZSBpbnNpZ2h0cyBoZXJlLgo+IAo+IEFueXdheSwgbGV0IG1lIGtub3cgd2hhdCB5b3UgdGhp
bmsgYW5kIGlmIGl0J3Mgd29ydGggcHVyc3VpbmcgdGhpcy4KCkNoZWNraW5nIG5mcy11dGlscyBj
b25maWd1cmUuYWMgSSBzZWUgdGhhdCBhdCB0aGUgbW9tZW50IGJvdGggbGliZXZlbnQKYW5kIHNx
bGl0ZTMgYXJlIHJlcXVpcmVkIFswXS4KCkkgaGF2ZW4ndCBkaWdnZWQgZW5vdWdoIGlmIFJQQ19O
RlNEIHJlYWxseSByZXF1aXJlcyB0aG9zZSAyCmRlcGVuZGVuY2llcywgYnV0IGlmIHlvdSB0aGlu
ayB0aGV5IGRvbid0IHJlcXVpdGUgaXQgeW91IGhhdmUgZmlyc3Qgb2YKYWxsIHRvIHBhdGNoIGNv
bmZpZ3VyZS5hYyB0byBhdm9pZCBjaGVja2luZyBmb3IgdGhlbSBpbiBhbnkgY2FzZSBhbmQKdGhl
biB5b3UgaGF2ZSB0byBkZWVwZXIgYW5kIGZpbmFsbHkgc2VlIGlmIGl0IHJlYWxseSBkb2Vzbid0
IG5lZWQgdGhhdC4KClRvIGJlIGhvbmVzdCwgdGhlIHdheSB0aGUgcGFja2FnZSBpcyBoYW5kbGVk
IGF0IHRoZSBtb21lbnQgaXMgbm90IHRoZQpiZXN0IHdheSB0byBnby4gSSBtZWFuLCBidWlsZGlu
ZyBzb21ldGhpbmcgd2UgZG9uJ3QgbmVlZCBhbmQgbGF0ZXIKcmVtb3ZpbmcgaXQgaXQncyBhbiBv
cHRpb24sIGJ1dCBub3QgdGhlIGJlc3Qgb25lLgpJdCB3b3VsZCBiZSBncmVhdCBpZiB5b3UgY291
bGQgcHJvdmlkZSBhIHBhdGNoZXMgZm9yIG5mcy11dGlscyB0byBhbGxvdwpkaXNhYmxpbmcgcnBj
ZGVidWcsIHJwYy5sb2NrZCBhbmQgcnBjLm5mc2QsIHJwYy5xdW90YWQgYW5kIHNlbmQgdGhlbSAK
dXBzdHJlYW0uClRoaXMgd2F5IHdlIGNvdWxkIGRyb3AgdGhlc2UgbGluZXMgWzFdCmFuZCB0aGlz
IGxpbmUgYXMgd2VsbCBbMl0KYW5kIGhhbmRsZSBldmVyeXRoaW5nIGFzIGRvbmUgZm9yIEdTUyBb
M10KClRoYXQgd291bGQgYmUgYSBnb29kIHN0YXJ0aW5nIHBvaW50LiBUaGVuIGxhdGVyIHlvdSBj
b3VsZCBtb3JlIGVhc2lseQptb3ZlIGRlcGVuZGVuY2llcyBpbnNpZGUgY29uZmlndXJlLmFjLCBi
dXQgZm9yIHRoZSBtb21lbnQgaWYgeW91CnJlbW92ZSBsaWJldmVudCBhbmQgc3FsaXRlIGZyb20g
bmZzLXV0aWxzIHBhY2thZ2UgZGVwZW5kZW5jaWVzIGl0IHdpbGwKZmFpbCB0byBidWlsZCwgYmVj
YXVzZSBpdCB3aWxsIGZhaWwgb24gY29uZmlndXJlLmFjIGFuZCBpbiBhbnkgY2FzZSBpdAp3aWxs
IHRyeSB0byBidWlsZCBhbGwgdGhlIGRhZW1vbnMgSSd2ZSBsaXN0ZWQgYWJvdmUgdGhhdCBoYXZl
CmRlcGVuZGVuY2llcy4KClNvIHRoZXJlJ3MgbW9yZSB3b3JrIHRvIGJlIGRvbmUgYnV0IGlmIGRl
cGVuZGVuY2llcyB5b3UndmUgZm91bmQgYXJlCmNvcnJlY3QgdGhlbiB5ZXMsIGl0IGNhbiBiZSBk
b25lLgoKQmVzdCByZWdhcmRzCgpbMF06IApodHRwczovL2dpdC5saW51eC1uZnMub3JnLz9wPXN0
ZXZlZC9uZnMtdXRpbHMuZ2l0O2E9YmxvYjtmPWNvbmZpZ3VyZS5hYztoPTU4ZDE3MjhjNWJjNmE3
OTI4NTQ4NTE0ZDU2ODM3ZWVhM2I2ZTkxY2Q7aGI9SEVBRCNsMzQ0ClsxXTogCmh0dHBzOi8vZ2l0
bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvbWFzdGVyL3BhY2thZ2UvbmZz
LXV0aWxzL25mcy11dGlscy5taz9yZWZfdHlwZT1oZWFkcyNMNDEtNDUKWzJdOiAKaHR0cHM6Ly9n
aXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi9tYXN0ZXIvcGFja2FnZS9u
ZnMtdXRpbHMvbmZzLXV0aWxzLm1rP3JlZl90eXBlPWhlYWRzI0w3MgpbM106IApodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iL21hc3Rlci9wYWNrYWdlL25m
cy11dGlscy9uZnMtdXRpbHMubWs/cmVmX3R5cGU9aGVhZHMjTDU0LTYyCi0tIApHaXVsaW8gQmVu
ZXR0aQpDRU8mQ1RPQEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
