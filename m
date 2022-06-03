Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784E6C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 14:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29956409C8;
	Fri,  3 Jun 2022 14:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gbUXbPvZohPH; Fri,  3 Jun 2022 14:29:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 426D54097E;
	Fri,  3 Jun 2022 14:29:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80F711BF2F3
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 14:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F8E960BB9
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 14:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ravvwz6lC8eK for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 14:29:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D77F60B4C
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 14:29:22 +0000 (UTC)
Received: from [192.168.50.225] ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id x8Iinb2gAZPAlx8IjnV2Dk; Fri, 03 Jun 2022 16:29:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1654266561; bh=Zx0FmX8j+YYNIok/3srvRky6kxL2yfT+242VHPDQQuM=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=AdNaCjUa5m0XYLHCBVWGw1WrmKVBSqzwMLw5+XZmd4voYCPEcsAZ2o3BAyu9MtCqU
 r5DxU1IfTmkZao9+M/3TUc5cMpIcbwIMEHSHt4z8lrR7GeDWT5CYsyE05PtEjRQMg9
 ngLCxsx4YEa2wIOY1vciFp4HVpyVoWo4NYbXZ32W20W7KgqPAZfKKu9vIkA+EviJ5E
 XpBWjLSHn5IL1IEOJzaQ6VGVIbcFcMSNWzeXFK4USvMEsK+kpvogYXvA0vS0Q4ygox
 aL1ggyYigLLetIRBKBf3VgXqsmir1BMOoQJVp9h6Y4/QRamOCR+F2ggn4b/HhlOgGO
 e4xXAmHj6O/yA==
Message-ID: <ec82d1aa-fa0a-b079-1f2d-c25f9edbc905@benettiengineering.com>
Date: Fri, 3 Jun 2022 16:29:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Arnout Vandecappelle <arnout@mind.be>,
 Buildroot Mailing List <buildroot@buildroot.org>
References: <e123582d-c613-f81a-ac0d-b23bc4d3e74a@cartal.fr>
 <6478648f-ffb3-cda2-66ad-3758ead25319@mind.be>
 <9f7b2d02-3cea-636a-fbe0-fdcc8324ab89@benettiengineering.com>
In-Reply-To: <9f7b2d02-3cea-636a-fbe0-fdcc8324ab89@benettiengineering.com>
X-CMAE-Envelope: MS4xfHOnFB5GT9C7a0x5lTdfpzrgnvObgbZsZYOdN5YJ/xntOLSbL3pAEDtoNRiUbKxsonRvF/p6YBAqQPmz6eLp587GsSwYBAgvgY++zOWhjtjoVxBCmn3G
 BP9RtUnFEOZTXR9umYDwxXfQgaEGR5k5lgnyv2FxlpGmCOjjrzOvdD+l4W4ciRsxRHlJcbXAG0/L5BWX5yZ8QAMW9Ww1tnFj3Kzze+OdytJrVmq7/5ItNqml
 KdBRwm7eKGaLMhHVxuE+Yh6spER3KuSjPuKttWY/JUmrpic4fh756vdN/WF8fNCq
Subject: Re: [Buildroot] Make 4.3 and printvars
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
Cc: Jean-Pierre Cartal <jean-pierre@cartal.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDMvMDYvMjIgMTY6MjUsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+IEhpIEFybm91dCwKPiAK
PiBPbiAwMy8wNi8yMiAxNjowNSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4+IMKgwqBT
ZW5kaW5nIHRoaXMgaW4gbmFtZSBvZiBKZWFuLVBpZXJyZSwgd2hvIGlzIG5vdCBvbiB0aGUgbGlz
dC4KPj4KPj4+IEhlbGxvLAo+Pj4KPj4+IEEgcXVpY2sgbWFpbCB0byBsZXQgeW91IGtub3cgdGhh
dCBJIGFsc28gZmFjZWQgdGhlIG1ha2UgNC4zIHByaW50dmFycyAKPj4+IGlzc3VlIHlvdSBtZW50
aW9uZWQgaW4gQnVpbGRyb290IG1haWxpbmcgbGlzdC4KPj4+Cj4+PiBPbiBteSBzaWRlIGluY3Jl
YXNpbmcgdGhlIHN0YWNrIHNpemUgbGltaXQgYXMgZm9sbG93Ogo+Pj4KPj4+IHVsaW1pdCAtcyAx
NjAwMAo+Pj4KPj4+IHNvbHZlZCB0aGlzIGlzc3VlLgo+Pj4KPj4+IFJlZ2FyZHMuCj4+Cj4+Cj4+
IMKgwqBJIHRlc3RlZCBpdCBteXNlbGYgYW5kIGluZGVlZCwgaXQgd29ya3MhCj4gCj4gSSBjb25m
aXJtLCBpdCB3b3JrcyEKPiAKPj4gwqDCoEl0IHdvdWxkIGJlIGdyZWF0IGlmIHNvbWVvbmUgY291
bGQgaGFjayB0aGlzIGludG8gdGhlIE1ha2VmaWxlIAo+PiBpdHNlbGYgKHNvIHRoYXQgaXQgcmVj
dXJzZXMgaWYgdWxpbWl0IC1zIGlzIG5vdCBoaWdoIGVub3VnaCkgYW5kIAo+PiByZXZlcnQgMjVj
ZWM1ZWE3MzMyNTEuCj4gCj4gSSdtIHRyeWluZyB0byBidWlsZCBsaWJuc3MgdGhhdCBpcyBpbXBh
Y3RlZCBieSB0aGF0IHByb2JsZW0gdG9vIGFuZCBzZWUKPiBpZiBpdCBidWlsZHMgY29ycmVjdGx5
LiBJIGxldCB5b3Uga25vdyBhbGwuCgpBbmQgeWVzLCB0aGlzIHdvcmstYXJvdW5kIGlzIGdyZWF0
IGJlY2F1c2UgYWxzbyBsaWJuc3MgYnVpbGQgY29ycmVjdGx5CnNvIHdlIGNhbiBoYXZlIGl0IGJh
Y2sgYnVpbGRpbmcgaW4gcGFyYWxsZWwuCgpXb3VsZG4ndCBiZSBlbm91Z2ggdG8gaW5jcmVhc2Ug
dGhlIHN0YWNrIHNpemUgdG8gMTYwMDAgd2hlbiBNYWtlIDQuMyBpcwp1c2VkPwoKQmVzdCByZWdh
cmRzCi0tIApHaXVsaW8gQmVuZXR0aQpDVE8vQ0VPQEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
