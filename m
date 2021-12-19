Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FDDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 06:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 378B884DCA;
	Sun, 19 Dec 2021 06:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7LiMr1p4Fsaw; Sun, 19 Dec 2021 06:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74BB184DC6;
	Sun, 19 Dec 2021 06:55:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6EAF1BF3C1
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 06:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CACEF4014C
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 06:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id diEbiu2R35-p for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 06:55:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F9E340148
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 06:55:22 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 935E2240005;
 Sun, 19 Dec 2021 06:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1639896920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/GOxyAY/V9Hf7mo0UEPI/guWQILnVuXPENTBUNp6usE=;
 b=GsVHqOdh8VLrMXnwIQPVlTprWejCl0mWfja0CfjGCSxqJWNVaLw39ovBtjuP27YzpO7oOv
 MdgU+cOl84T57dmIkz3PgvbcNzK+PXsedCtF49VizE9NeTRLzizStG8heQQcYAf//fj8zD
 6VMNdFfxqYHJBV3orfGDdP/50+2/8af7npr87+LIKjF1a6veJAI76tWPl3YtCqROTzjxov
 GGf2XDK8+hzs7uU3HPM7sHYB6I+WW5EL5DGEOkBJGZL8REx/zkHfXyvxjvSi0JSbQkfEuU
 hUK1exy9OAW4tz/08FMDF48MKYhqipZv+mDigs9Rot/IJh7fcCTR01YWzTFqAw==
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20211215180021.274991-1-thierry.bultel@linatsea.fr>
 <20211215180021.274991-3-thierry.bultel@linatsea.fr>
 <966fe55d-c5d7-7f5a-63ec-f68be64a38c6@mind.be>
 <f5028ffa-5461-ae87-ad4c-227605361ddf@linatsea.fr>
 <28def8c0-8d05-015e-e9b2-a25b31d9237b@mind.be>
From: Thierry Bultel <thierry.bultel@linatsea.fr>
Message-ID: <7aa7dc74-284a-3c33-defa-aef4d6e11799@linatsea.fr>
Date: Sun, 19 Dec 2021 07:55:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <28def8c0-8d05-015e-e9b2-a25b31d9237b@mind.be>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 3/3] fs/dracut: new fs type
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4KPj4+IMKgWW91IHNob3VsZCBhbHNvIGNoZWNrIHRoZW4gaWYgaXQgZ2V0cyBwcm9wZXJseSB1
cGRhdGVkIGJ5IAo+Pj4gc3VwcG9ydC9taXNjL3JlbG9jYXRlLXNkay5zaCAoSSB0aGluayB5ZXMp
Lgo+PiBJIGFtIHNvcnJ5LCBidXQgSSBkbyBub3Qgc2VlIHRoZSBwb2ludCBoZXJlLCB3b3VsZCB5
b3UgbWluZCBleHBsYWluIAo+PiBwbGVhc2UgPwo+Cj4gwqBJZiB0aGVyZSdzIHN1Y2ggYSB3cmFw
cGVyIHNjcmlwdCB0aGF0IHNldHMgdGhlIGVudmlyb25tZW50IHZhcmlhYmxlcyAKPiBjb3JyZWN0
bHksIHRoZSBpZGVhIGlzIHRvIGJlIGFibGUgdG8gdXNlIHRoYXQgYXMgcGFydCBvZiB0aGUgU0RL
LiBUaGF0IAo+IGFsc28gbWVhbnMgaXQgbXVzdCBiZSBwb3NzaWJsZSB0byBtb3ZlIGl0IHRvIGEg
ZGlmZmVyZW50IHBsYWNlLiBTaW5jZSAKPiBpdCBjb250YWlucyBoYXJkY29kZWQgcGF0aHMgdG8g
SE9TVF9ESVIsIHRoZXNlIG5lZWQgdG8gYmUgY2hhbmdlIHdoZW4gCj4gdGhlIFNESyBpcyByZWxv
Y2F0ZWQuIFRoZSByZWxvY2F0ZS1zZGsuc2ggc2NyaXB0IHNob3VsZCBkbyB0aGF0LCBidXQgCj4g
aXQncyBpbXBvcnRhbnQgdG8gY2hlY2sgdGhhdCBpbmRlZWQgaXQgZG9lcy4KCkkgcHJvYmFibHkg
bWlzcyBzb21ldGhpbmcgaGVyZS4gSXMgaXQgYSBiYWQgaWRlYSB0byAtbm90LSB1c2UgaGFyZGNv
ZGVkIApwYXRocyBpbiB0aGUgd3JhcHBlciBzY3JpcHQsIGJ1dCBlbnZpcm9ubWVudCB2YXJpYWJs
ZXMgaW5zdGVhZCA/Ckl0IHNob3VsZCBiZSBzb21ldGhpbmcgbGlrZToKCi0tLS0tLS0tLS0tLS0K
IyEvYmluL2Jhc2gKc2V0IC1lCgppZiBbIC16ICIkKiIgXTsgdGhlbgogwqDCoMKgIGVjaG8gIk5v
IGFyZ3VtZW50IHN1cHBsaWVkIgogwqDCoMKgIGV4aXQKZmkKCkRSQUNVVF9MREQ9JHtUQVJHRVRf
Q1JPU1N9bGRkIFwKRFJBQ1VUX0lOU1RBTEw9IiR7SE9TVF9ESVJ9L2xpYi9kcmFjdXQvZHJhY3V0
LWluc3RhbGwiIFwKZHJhY3V0YmFzZWRpcj0ke0hPU1RfRElSfS91c3IvbGliL2RyYWN1dCBcCmRy
YWN1dHN5c3Jvb3RkaXI9JHtUQVJHRVRfRElSfSBcCiR7SE9TVF9ESVJ9L2Jpbi9kcmFjdXQgIiRA
IgotLS0tLS0tLS0tCgpTbyB0aGF0IHNob3VsZCBub3QgaW1wYWN0IHRoZSByZWxvY2F0aW9uIC4u
LgoKQnkgdGhlIHdheSwgaW4gY3Bpby5taywgSSBhbHNvIGhhZCB0bwoKZXhwb3J0IFRBUkdFVF9D
Uk9TUwoKClJlZ2FyZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
