Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE23C2BA15
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 19:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 410C440111;
	Tue, 18 Jun 2024 19:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9duYyMT9TI2B; Tue, 18 Jun 2024 19:12:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 052644011D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 052644011D;
	Tue, 18 Jun 2024 19:12:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76AF61BF2F5
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 19:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6490D61018
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 19:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ceIid9T4Ghu1 for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 19:12:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BEB5E60ECE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEB5E60ECE
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEB5E60ECE
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 19:12:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.119.83]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYeMj-1rp4qQ1xEh-00KAbj; Tue, 18
 Jun 2024 21:12:41 +0200
Message-ID: <91d7aa43-3f8b-427d-995e-2fcce5824d74@gmx.de>
Date: Tue, 18 Jun 2024 21:12:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Jos=C3=A9_Mendes?= <jp.baltazar.mendes@gmail.com>,
 buildroot@buildroot.org
References: <CAFAK9+dyXdn6RBLLm=Dw2+7rxxoiAPx0_kBJGn1dR6+SweOCiQ@mail.gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <CAFAK9+dyXdn6RBLLm=Dw2+7rxxoiAPx0_kBJGn1dR6+SweOCiQ@mail.gmail.com>
X-Provags-ID: V03:K1:2RVrVyiTvojKbMBAJ5GYdFCzcuI0HHjt5s9pGWOlqM0UTCRIfNd
 N+VojJBj/unTBtbjJHTCkvQYRQfSi+lSd3z1ly9QhmwJpjh4NoY6e6oy3hmoxotfXexV7Fj
 VU7+H5cWJUC6JxNLbD0+P1o6vOku5yQRrAkd32fohojoiXx//dwhoV5dx9+ShGl7RXzgD89
 efnUH4ssruOMUKYYx6h4A==
UI-OutboundReport: notjunk:1;M01:P0:IcPzpi4jL/k=;U/2+LwRXUC6FXr1iRKijpeEm4sy
 8Po1oV0FARe0qe+q2YblOVQTevrO4ImlLREhIyAh/Kge3HO+JU24uqiwOcyNsG6xrOijEfQEW
 H9rnHb/6LeGAXjGcGIMzwyZlEQAIy7V+1ubSVFQxyVEua47lnQidGNHx3UQQSzGNODistACMr
 X7vKnhapg5RFdyKH4FS5txvQtHzxn6hl5CIIK2NwTfwjfYv6wHdZhdUkxg5+kVLr9hnhZaDM7
 N8qIs88OEo5kfsFG3AqNYnmBUOXPEJk758S0VFLFBzvBPLsopc3naD6/jMOvUmBLoF9Av4/bo
 csy9+iNb+puEemmyAnKdaqhfDkO5I+Xh/ry0+m84cQhOs2fHdnhc/Q9dHTJfcZBKg0nlJewf/
 56LKUfR4vmGXKa87vSm2ZcrT2VWjV8vpMXJd6B3zRDrKjG95WfYJccFwQXWJ7IHfMJXt8JUTm
 jc1lpaJSnOMyWGIzX85GfFrRBiYqvVnx+RoyOrtH1ygJp8SO/pM39hCOzFeD8znFUcNRhH5hN
 XzXR2b21Hw/N+ckv2n1616FaTvgwK4wN1FjzvkLZHS9ZAKUofBxxN0wFBkA6W4KpyPSRR95VD
 XM59MP66DNxR/PakZgm3f7+p2d7Q0xDGYOZXRKQ71ZUWhIUOpMM9R10H3r+Px7zBnkWO6eXc9
 4oFQ5b2z/da+Y+vN2UgW/gSS+axRDhOitmak9kXBp8k4AHOAhZOpFDG7dv+WLbJQ11uJdCe7O
 ksYG+3woUqvaBIoUFM+8PCeKm/SApEB4YPUfeYVY5mlF/lH0gn1nrTlSGJQiMutPshyh28lJw
 vK7x1CjN37e9N303UVk0ENl1IlkQ94JFYYExsXIBtBSZw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1718737961; x=1719342761; i=fiona.klute@gmx.de;
 bh=66KNYMNdPoJid97pIQI+OtWpN1KvZhpaBi0ia6eiMCs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Hh5qYOLjyXSLipB6wUMrM6mvLyUey37ndeRN4gr6sIGDYfS1YHtinxKk0FVoNYMT
 r+x42Ajh7NbcQMaTxCJl8IewO0OwZdkxHtApt9Wd/0sF/Y3hxvPtZHqkMeoJGHBeq
 gYWs0AHvTHGQ5S+gaW55MW5wSAKCPEPjSAU+ScZOGiSFO1bI2GpOb1jZzE6VRRuet
 cfDMTVPJCcw74Margqx04p1MA4JDtT8pxFry83tPUStyEJuBYJuE7s9arvNa6vAvN
 3o2aacrJc3vjHgWQmZ7xKlYHlxbyYyGUnjQHdzl9EDo9ejVRIU4pjgZ7jRg7w22TW
 XG/vTZSjcdAUPIefQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Hh5qYOLj
Subject: Re: [Buildroot] U-Boot for RaspberryPi CM4IO
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSm9zw6ksIGFsbCEKCkFtIDE4LjA2LjI0IHVtIDE0OjQ0IHNjaHJpZWIgSm9zw6kgTWVuZGVz
Ogo+IEhlbGxvIGFsbCwKPgo+IEknbSByZWxhdGl2ZWx5IG5ldyB0byBCdWlsZHJvb3QgYW5kIHZl
cnkgbmV3IHRvIFUtQm9vdC4KPgo+IE15IGdvYWwgaXMgdG8gbWFrZSBhIHN5c3RlbSB3aXRoIHJl
ZHVuZGFudCBib290YWJsZSBwYXJ0aXRpb25zIG9udG8gd2hpY2gKPiBPVEEgdXBkYXRlcyB3aWxs
IGJlIGFwcGxpZWQgKHN3dXBkYXRlKS4gVGhlIHJlZHVuZGFudCBwYXJ0IEkgYWJzb2x1dGVseQo+
IG5lZWQgaXMgdGhlIHJvb3RmcyBidXQgaWYgdGhlIGJvb3Rsb2FkZXIgY291bGQgYWxzbyBiZSB1
cGRhdGFibGUgdGhhdCB3b3VsZAo+IGJlIGdyZWF0Lgo+Cj4gSSBoYXZlbid0IGhhZCBtdWNoIHBy
b2dyZXNzIHdpdGggVS1Cb290IGFzIGl0IHNlZW1zIHRvIHJlcXVpcmUgYSBkZWZjb25maWcKPiBh
bmQgd2hlbiBJIHByb3ZpZGUgcmFzcGJlcnJ5cGljbTRpb182NF9kZWZjb25maWcgZnJvbSB0aGUg
ZGVmYXVsdHMsIGl0Cj4gc2VlbXMgdG8gY29tcGxhaW4gdGhhdCBpdCBlaXRoZXIgZG9lcyBub3Qg
ZXhpc3Qgb3Igc2V2ZXJhbCBwYXJhbWV0ZXJzIGFyZQo+IG1pc3NpbmcuCgpUaGUgZGVmY29uZmln
IHlvdSBuZWVkIHRoZXJlIGlzbid0IGEgQnVpbGRyb290IG9yIExpbnV4IG9uZSwgeW91IG5lZWQg
dG8KcGljayBhIHN1aXRhYmxlIG9uZSBmb3IgVS1Cb290LCBzZWUgaGVyZToKCmh0dHBzOi8vZG9j
cy51LWJvb3Qub3JnL2VuL2xhdGVzdC9ib2FyZC9icm9hZGNvbS9yYXNwYmVycnlwaS5odG1sCgo+
ICAgQW55IHRpcHMgb24gaG93IHRvIHByb2NlZWQgLyB3aGF0IHRvIGRvPwoKSSdtIGN1cnJlbnRs
eSB3b3JraW5nIHdpdGggYW4gUlBpIENNNCBiYXNlZCBzeXN0ZW0sIHRoZXJlIFUtQm9vdCBidWls
dAp3aXRoIHJwaV9hcm02NF9kZWZjb25maWcgd29ya2VkIG91dCBvZiB0aGUgYm94IChhc3N1bWlu
ZyBhIHN1aXRhYmxlIERUQgppcyBpbnN0YWxsZWQpLiBZb3UnbGwgbmVlZCB0byBhZGp1c3QgdGhl
IGNvbmZpZy50eHQgdGhhdCBnZXRzIGluc3RhbGxlZAp0byBhY3R1YWxseSBydW4gdS1ib290LmJp
biBpbnN0ZWFkIG9mIHRoZSBMaW51eCBpbWFnZSB0aGF0IGhhcyBiZWVuCmJ1aWx0LCBhbmQgcHJv
dmlkZSB3aGF0ZXZlciBib290IGNvbmZpZ3VyYXRpb24geW91IG5lZWQgZm9yIFUtQm9vdC4KCkkg
YWN0dWFsbHkgaGF2ZSB0d28gcmVsYXRlZCBwYXRjaGVzIGZvciBib2FyZC9yYXNwYmVycnlwaS9w
b3N0LWltYWdlLnNoCnRoYXQgSSdkIGxpa2UgdG8gdXBzdHJlYW0gZXZlbnR1YWxseSAodG8gaW5z
dGFsbCBhIGJvb3Quc2NyIGlmIGFueSBoYXMKYmVlbiBidWlsdCBhbmQgVS1Cb290IGlzIHVzZWQs
IGFuZCBzdXBwb3J0IGZvciB1c2luZyB0aGUgcHJlY29tcGlsZWQKRFRCcyBmcm9tIHRoZSBycGkt
ZmlybXdhcmUgcGFja2FnZSksIEkgaW50ZW5kIHRvIHNlbmQgdGhlbSB0byB0aGUgbGlzdCBzb29u
LgoKQmVzdCByZWdhcmRzLApGaW9uYQoKPiBCZXN0IHJlZ2FyZHMsCj4KPiBKb3PDqSBNZW5kZXMK
Pgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
