Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED0FC4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 19:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 134484016B;
	Wed, 17 Apr 2024 19:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMX4hOl6o-V0; Wed, 17 Apr 2024 19:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD9E84017D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD9E84017D;
	Wed, 17 Apr 2024 19:40:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D87751BF4E7
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 19:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C246040234
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 19:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xpwo2G9hP3GA for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 19:40:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 38DAE4017D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38DAE4017D
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38DAE4017D
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 19:40:32 +0000 (UTC)
Received: from [192.168.50.121] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id xB8vrJ1dk1qvyxB8vr48Nk; Wed, 17 Apr 2024 21:40:29 +0200
Message-ID: <810bfc26-b829-42a8-8ae3-bf42ac3b7eec@benettiengineering.com>
Date: Wed, 17 Apr 2024 21:40:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: DTrustee <dterry_engineer@yahoo.com>, buildroot@buildroot.org
References: <e2634bc6-2e68-4331-8354-49407b40f191.ref@yahoo.com>
 <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
 <6068206a-9a0c-4ef4-a5bb-9e6f35218297@benettiengineering.com>
 <d144cbba-9be6-477f-9a79-e72361487734@yahoo.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <d144cbba-9be6-477f-9a79-e72361487734@yahoo.com>
X-CMAE-Envelope: MS4xfHyIk6/CW6cutz2YQeBkPKIrfIJsT4CszWQJnzfKbdstSBCPN+kE27h/+vckmYd30STH+Vm2KkQUmF3oTeIsFfApdeoeoGGt0w7mFJyOBKWDCpB2FOLA
 dGLuFn/3bLkXwly1zMumNUyLPm5ypiihgHTISYXKRZVVXgUlRwD/21DRke3IVwIH0Pvw0ZFJ5Y62rny7iPQ87SkCoxZgzWDOL7dfu65zMu2h9s8/L7Kc8DO4
 MLp6r6TNnHu2JUhqscD4BA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1713382829; bh=S8ZrKbYxGGvouiNsE9JySrpbAfagVhllUajsF5eaQ8E=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=icO5HxKUQ0CmUeOEcmcw0z3YMgnVXoI/RDlt5R9VycVsEapKmJVMvHFs1qoPkOj0V
 ksi/88AACt93jpVWw9eYAJ5dOLYRRzMrffgPN4DUJqiIL2JzMKGvfvFyX3OMU3FmPr
 wXk6WefTveb6SxWkK2QHz4AeWjN5zg43HA+ZJSiep89dwO38XTkN+Zrxpi0cB7yJ1F
 3+/RKomYy2y3WAqPmdHqEpatCfDzh8UvJ/UOdskyImIyg1r9Nx8v9om1WEKp3cguF2
 hD/OGERJ8AcyKP6C9NYr+uQszfsVyfm5rY953z3z1LC4ecb06fQRjhiBYEDtIkGrsL
 Kr2ZadZqZyQwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=icO5HxKU
Subject: Re: [Buildroot] Problem with device tree
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

SGkgRG9uLAoKT24gMTcvMDQvMjQgMTg6MjUsIERUcnVzdGVlIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gSSBrbm93IHlvdSBhcmUgYWxsIGJ1c3ksIGRvbid0IG1lYW4gdG8gYnVnIGFueW9uZSBidXQg
SSBjYW5ub3QgZ2V0IAo+IGJ1aWxkcm9vdCB0byBtYWtlIHdpdGhvdXQgZXJyb3JzLiBJIGhhdmUg
bm8gaWRlYSB3aHkgIm9wZXJhdG9yICc8JyBoYXMgCj4gbm8gbGVmdCBvcGVyYW5kIiBpcyBnZW5l
cmF0ZWQgb3Igd2hpY2ggaW5jbHVkZSBmaWxlIGlzIHRoZSBjYXVzZS4gSSAKPiB0cnVseSBhcHBy
ZWNpYXRlIHlvdXIgaGVscC4gSXMgdGhlcmUgZG9jdW1lbnRhdGlvbiB0aGF0IHdhbGtzIHRocm91
Z2ggCj4gdGhlIGJ1aWxkIHByb2Nlc3M/IEkgaGF2ZSBsb29rZWQgYXQgdGhlIEJvb3RsaW4gdHJh
aW5pbmcgYnV0IGl0IGlzIAo+IHNldmVyYWwgeWVhcnMgb2xkIG5vdyBhbmQgb3V0IG9mIGRhdGUu
Cj4gCj4gQnVpbGRsb2cgaXMKPiAKPiBodHRwczovL3Bhc3RlYmluLmNvbS9FcXQ2emk5YQo+IAo+
IGNvbmZpZyBpcwo+IAo+IGh0dHBzOi8vcGFzdGViaW4uY29tLzhQMmhCOXVZCj4gCj4gYnVpbGRy
b290IDIwMjQuMDIuMQoKc2luY2UgeW91J3JlIGZvbGxvd2luZyBCb290bGluIGNvdXJzZSBJIHN1
Z2dlc3QgeW91IGFzIGEgZmlyc3Qgc3RlcCB0bwp1c2UgQnVpbGRyb290IHZlcnNpb24gcG9pbnRl
ZCBpbiB0aGUgY291cnNlKHVubGVzcyB5b3UncmUgYWxyZWFkeSBkb2luZyAKaXQgb2YgY291cnNl
KS4KClRoZW4gbGF0ZXIsIG9uY2UgeW91IG1hc3RlciB0aGluZ3MgbW9yZSwgeW91IGNhbiBtb3Zl
IHRvIHVzZSBsYXRlc3QKQnVpbGRyb290IHZlcnNpb24uCgpLaW5kIHJlZ2FyZHMKLS0gCkdpdWxp
byBCZW5ldHRpCkNFTyZDVE9AQmVuZXR0aSBFbmdpbmVlcmluZwoKPiBIYXZlIGEgQmxlc3NlZCBk
YXkhCj4gCj4gRG9uCj4gCj4gCj4gCj4gT24gNC85LzI0IDQ6NTkgUE0sIEdpdWxpbyBCZW5ldHRp
IHdyb3RlOgo+PiBIaSBEb24sCj4+Cj4+IE9uIDA5LzA0LzI0IDIzOjIzLCBEb24gdmlhIGJ1aWxk
cm9vdCB3cm90ZToKPj4+IFRoaXMgaXMgbXkgZmlyc3QgdGltZSB1c2luZyBidWlsZHJvb3QuIEZv
bGxvd2luZyB0aGUgaW5zdHJ1Y3Rpb25zIG9mIAo+Pj4gYm9vdGxpbi5jb20vZG9jL3RyYWluaW5n
L2J1aWxkcm9vdC9idWlsZHJvb3QtbGFicy5wZGYsIGJ1aWxkaW5nIGZvciAKPj4+IEJlYWdsZWJv
bmUgQmxhY2sgdGhvdWdoIG5vdCB0aGUgd2lyZWxlc3Mgb2YgdGhlIHRyYWluaW5nIHBkZi4gVW5k
ZXIgCj4+PiBLZXJuZWwgLSBzZWxlY3RlZCBkZXZpY2UgdHJlZSBibG9iIGFuZCBpbi10cmVlIGRl
dmljZSB0cmVlIG5hbWUgSSBwdXQgCj4+PiBhbTMzNXgtYm9uZWJsYWNrLiBIb3dldmVyIEkgZ2V0
Cj4+Pgo+Pj4gRGV2aWNlIFRyZWUgU291cmNlIChhcmNoL2FybS9kdHMvYW0zMzV4LS5kdGIpIGlz
IG5vdCBjb3JyZWN0bHkgCj4+PiBzcGVjaWZpZWQuCj4+PiBQbGVhc2UgZGVmaW5lICdDT05GSUdf
REVGQVVMVF9ERVZJQ0VfVFJFRScKPj4+IG9yIGJ1aWxkIHdpdGggJ0RFVklDRV9UUkVFPTxkZXZp
Y2VfdHJlZT4nIGFyZ3VtZW50Cj4+Pgo+Pj4gV2hhdCBkb2VzIGl0IHdhbnQ/IFNvbWV0aGluZyBp
cyBtaXNzaW5nIGJ1dCBJIGRvbid0IGtub3cgd2hhdC4KPj4KPj4gU3RhcnRpbmcgZnJvbcKgIExp
bnV4IHZlcnNpb24gNi41WzBdIHlvdSBoYXZlIHRvIHNwZWNpZnkgdGhlIAo+PiBtYW51ZmFjdHVy
ZXIgZm9sZGVyIHRvbyBjb21wYXJlZCB0byBwcmV2aW91cyB2ZXJzaW9ucyhpLmUuIDYuNFsxXSku
IFNvIAo+PiBpZiB5b3UncmUgdXNpbmcgYSBrZXJuZWwgbmV3ZXIgdGhhbiA2LjUgeW91IGhhdmUg
dG8gc3BlY2lmeSBzb21ldGhpbmcgCj4+IGxpa2U6Cj4+IGFyY2gvYXJtL2R0cy90aS9vbWFwL2Ft
MzM1eC0uZHRiCj4+Cj4+IEhvcGUgdGhpcyBoZWxwcy4KPj4KPj4gWzBdOiBodHRwczovL2VsaXhp
ci5ib290bGluLmNvbS9saW51eC92Ni41LXJjMS9zb3VyY2UvYXJjaC9hcm0vYm9vdC9kdHMKPj4g
WzFdOiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni40LjE2L3NvdXJjZS9hcmNo
L2FybS9ib290L2R0cwo+Pgo+PiBCZXN0IHJlZ2FyZHMKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
