Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936C6C4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 11:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35E114028D;
	Fri,  8 Dec 2023 11:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35E114028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJs7oTUHrYkA; Fri,  8 Dec 2023 11:29:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CD6040248;
	Fri,  8 Dec 2023 11:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CD6040248
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D8131BF37A
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 11:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66E3A40266
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 11:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66E3A40266
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 83isvZYaleuE for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 11:29:08 +0000 (UTC)
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4883D40230
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 11:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4883D40230
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id BZ2XrRWcfRfrMBZ2Xr6jQx; Fri, 08 Dec 2023 12:29:05 +0100
Message-ID: <e43a1b9b-fa82-43f3-8225-e5a76ac1cbde@benettiengineering.com>
Date: Fri, 8 Dec 2023 12:29:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Stefano Cottafavi <stefano.cottafavi@gmail.com>, buildroot@buildroot.org
References: <CAPn86JAC9RLnYULz=M+y55KGgzvF_yWZa3ujNSbg58aCS6KPZQ@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CAPn86JAC9RLnYULz=M+y55KGgzvF_yWZa3ujNSbg58aCS6KPZQ@mail.gmail.com>
X-CMAE-Envelope: MS4xfCDjx8yepEPSTn8Zhf5DWQfshtoS1sNex9lmRoMDBHcp0FdwzdBQbXxJnYbUQ/GymRK+2FtpjupIeIlUxoVsxqDc8wp9xCkqeXekQN53cJF8efTnETUx
 G9gOaTU/JKI4uR6HX+ARNRxgFnvXcDrWXAr5PCoETvNEKHzAus0uWbQnvQJfLYjSIbBHIFoAHrJPLVNDF/YgaAVCZGZj1El5dWnqNJ82IoSyhK0EIahFWsoM
 IeCf1uUiSEil2Kj7ulhhxMimdaHhPy6Coschf+oX2Co=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1702034945; bh=tc0eCAsOADdVqcyVQVt/iQ2LHrxbrysPeqv2kSZueVk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=h46nOYbAZf+sMvq9XN/AhuuCnp4xCS2vn2+UWDliybD5dJQ/jyWq3vHA7cWijodGi
 SOMReH0+EixmNZ1uGSLJFJ9SLhXN5mu31QFL7QdaTXUQTA6c19nYsYmf5G9h+af2o7
 VWaf2Xs4rC+Vm8vPpghoZEglJHRMoIirq0+sARMkYRQkNoWczfKsbHSHMRDfrBgGT0
 hHUtHLHbTBjYnAJRcsj/TWgIYaNj29fayxJejLW/DrRQdBSlb1O8cWZ4ioqjJZ65Zq
 4zLEP7wH8wZOekWNyQD8XgWmy3A+HvtTF96InSQk2Unfyd2htBTF1wSD/pkKPNywnw
 I1j/jd5xZWe6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=h46nOYbA
Subject: Re: [Buildroot] help - custom user not working
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

SGkgU3RlZmFubywKCk9uIDA4LzEyLzIzIDExOjQ1LCBTdGVmYW5vIENvdHRhZmF2aSB3cm90ZToK
PiBIaSwKPiBJJ20gdHJ5aW5nIHRvIGFkZCBhIGN1c3RvbSB1c2VyIHRvIHRoZSBtaW5pbWFsICJy
YXNwYmVycnlwaTRfZGVmY29uZmlnIiAKPiBidWlsZC4KPiBJJ20gdXNpbmcgQnVpbGRyb290IDIw
MjMuMTEsIGZvbGxvd2luZyB0aGUgbWFudWFsIEkndmUgY3JlYXRlZCBhIAo+ICJ1c2Vycy50eHQi
IGZpbGUgKGluIHRoZSBidWlsZHJvb3Qgcm9vdCBmb2xkZXIpIHdpdGgganVzdCBvbmUgbGluZToK
PiAKPiBwaSAtMSBwaSAtMSA9cmFzcGJlcnJ5IC9ob21lL3BpIC9iaW4vc2ggLQo+IAo+IFRoZSBj
b25maWcgZmlsZSBjb250YWluczoKPiAKPiBCUjJfUk9PVEZTX1VTRVJTX1RBQkxFUz0idXNlcnMu
dHh0Igo+IAo+IFRoZSBidWlsZCBpcyBzdWNjZXNzZnVswqBhbmQgbG9va2luZyBhbmQgdGhlICJm
dWxsX3VzZXJzX3RhYmxlLnR4dCIgCj4gKG91dHB1dCBvZiB0aGUgYnVpbGQpIEkgY2FuIHNlZSB0
aGUgdXNlciBkZWZpbml0aW9uIGFib3ZlLgo+IAo+IEhvd2V2ZXIsIHdoZW4gSSB0cnkgdG8gbG9n
IG9uIGFzICJwaSIgSSBnZXQgIkxvZ2luIGluY29ycmVjdCIgZXJyb3IuCj4gCj4gSWYgSSBsb2dp
biBhcyByb290IGFuZCBjaGVjayB0aGUgL2V0Yy9wc3N3ZCwgSSBETyBOT1Qgc2VlIHRoZSB1c2Vy
IHBpCj4gCj4gQ2FuIHlvdSBoZWxwIG1lIHVuZGVyc3RhbmQgd2hhdCBhbcKgSSBtaXNzaW5nPwoK
SSd2ZSBidWlsZCByZXByb2R1Y2VkIGhlcmUgd2hhdCB5b3UndmUgZGVzY3JpYmVkIGFuZCBpbgpy
b290ZnMudGFyL2V0Yy9wYXNzd2QKSSBjb3JyZWN0bHkgZmluZDoKcGk6eDoxMDA6MTAxOjovaG9t
ZS9waTovYmluL3NoCgpTaW5jZSBpdCBidWlsZHMgY29ycmVjdGx5IGl0IG1lYW5zIGl0IGZpbmRz
IHVzZXJzLnR4dCBmaWxlIGluIEJ1aWxkcm9vdApyb290IGZvbGRlciwgc28gZXZlcnl0aGluZyBs
b29rcyBnb29kIHRvIG1lLgoKSSBzdWdnZXN0IHlvdSB0byBjaGVjayByb290ZnMudGFyIGFyY2hp
dmUgZm9yIHRoZSBmaW5hbCB0YXJnZXQgcm9vdGZzLgpUaGlzIGlzIGJlY2F1c2UgdGFyZ2V0LyBm
b2xkZXIgZG9lc24ndCBjb250YWluIHRoZSBjb21wbGV0ZSBmaW5hbCByb290ZnMKZmlsZXMsIGZv
ciBleGFtcGxlIGl0IG1pc3NlcyBwaSB1c2VyIGluIHRhcmdldC9ldGMvcGFzc3dkIGZpbGUuCgot
LSAKR2l1bGlvIEJlbmV0dGkKQ0VPJkNUT0BCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
