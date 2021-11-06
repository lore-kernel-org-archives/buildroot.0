Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FA7C433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 11:30:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2C4B611C0
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 11:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2C4B611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C1146F94F;
	Sat,  6 Nov 2021 11:30:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-hZomnLaO5z; Sat,  6 Nov 2021 11:30:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0C2C607C1;
	Sat,  6 Nov 2021 11:30:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D384E1BF83E
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 11:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF671405CA
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 11:30:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2CJUakNjTbVc for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 11:30:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98FAA4057D
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 11:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636198214;
 bh=jZHUzs0XQOvOiKlLZbhqEBEyKAIxhu7l8QVXBWeieEc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=LM5wmQE04vKEHpJhE5ciI8bp9EMd7yDmkHmjd5fSOHCGsbnuBo8BAOJjHDGlV2jZz
 e4NLPB2HCQIydmCSDIMF1ne5xj9vD2c8Lt21cxWJXnp42SIQKm4+nKCqYkbAlN2cFc
 YU90HJqeI0RtRinaZiZPhUuo7v2cVYnLq9mjbcSU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.26]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZCbB-1nEJ1j2j7R-00V8Bf; Sat, 06
 Nov 2021 12:30:14 +0100
Date: Sat, 6 Nov 2021 12:30:13 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211106123013.5773071a@gmx.net>
In-Reply-To: <20211106115027.79c8bc06@windsurf>
References: <20211106091508.29167-1-ps.report@gmx.net>
 <20211106115027.79c8bc06@windsurf>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:7XmQvyyloJQzrnn4UXzPbPHPKwLJgvcOu/MR/kjl27oZewOUy20
 8NlGwzQQvrSLhlP8CCdjosq/kxvCR8fSwqrq7CeynoXI4HZNeALpgtZ/AuA8pomaLdnKvvR
 dB4FiDFboEY/RJzEseCJpb+DKPTq1mwpUZusUy7aANTjT4QY3HC9ooQSuR+JuDLD78dXu+Q
 ic8F7EbsHioCBgfkxH5gQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cP8ikqAFoiw=:HM8Diz0Ow+MwNsEvTQfJHD
 FB+ABFcvfKEQu3DjUGlNio5mN/8+l94Bdg3MqHRY3rlR5jFXbk62jYcQRoxhcNGp9a6RxYo1Z
 iwemO/uQSzVlWJjadQhqJVBV6GVPhRfAFfwNvcUZqgKAQOWTUU/FgyN5onseH/rQ1XMssv6VW
 gGCgAtHpZGVV41h/Zv4m6CVYbtBvK0ZAYhGZDmH6YCGHcS+5KMyiBU+YF51uKnC+m+4iLoN4P
 7qAOdLLOoFGptVMLHGlTyL+jcWnFJpGPUj3Jqxc1WpDfBEmb5VQQUC9oVSNJD3GkmMwKLjQT9
 ANXEeWVqfXF4baxFSKZi+IF/9FsHJKjDNmfKrxqW9GkCR3IiZkgbeI8yvxOhvjTxm2Dihhvfv
 709HWhBM5mhVwvymrCtN7VBKu5CvHpQ9Tdv2KG1EpyKvbaWvpmNV49EaWVKEYpU5QIiRtxfHP
 aBF1zhBgA3jQwn+LkmQovm+c2xNqCKiY5Mba3SE8/KV7xKsesJC5G/COCARrmAhhJhy1t3I/a
 kUPN3ELmF+AEf8zACeoOS7W3GHitDroSab3ZyZQ5LrpYZaudEuEhKiyG1wouTRl/eBA5Hwwcp
 GYUkOcEEijvx0YjqOkhFLPD0vd3+jduUb9kK/oTfzLVRdA59Zic3QgLVf9rPcePAN6j0JkAsK
 0AdL8hnZCqZu3rWvaGh8JzdBXspMrtUXxoq8b52lBnG2wD6JDwLtHJBd4YeyIgtu8VS7Fn09b
 qyasKuRVAyohbDHl/hxsrkoQWdZ/CPNGN/SIQckOvhUKrahfKqCTITMhzcpV/zfFBbD8l00Ly
 e10KLCqRHDztTCcuohikz1oz8QoHnEdBnOqEY+ioq/pRgOSQlh3Im0SoVFESzzWuvkjcc2R8N
 eVUJZIq05kPkX+kMUg2EUU4r2N8whae0ffaUxkvivPq4Mdzp9xmcJvzlsuNU0Go8H+Nxe93+I
 L9rIzO1q3XckcSPyoZZAfO0ZsDWulkxhZCfYbyN4vZSKhrTsy4BwitMeyl4VghRPLBnhXmm5Z
 px48eiwd/WmhVKni0jH8Zyzd1uIBUn3REiinKHnWvrqUrzC6AjOafFBu83gtHqngSH4zC4aw6
 N3w7VApXUASFYg=
Subject: Re: [Buildroot] [PATCH v1] package/gdb: fix gdb-10.2 compile for
 uclibc < v1.0.35 (getrandom related)
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

SGVsbG8gVGhvbWFzLAoKT24gU2F0LCA2IE5vdiAyMDIxIDExOjUwOjI3ICswMTAwLCBUaG9tYXMg
UGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gT24gU2F0
LCAgNiBOb3YgMjAyMSAxMDoxNTowOCArMDEwMAo+IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRA
Z214Lm5ldD4gd3JvdGU6Cj4gCj4gPiAtIGZpeCBnZXRyYW5kb20gY29tcGlsZSBmb3IgdWNsaWJj
IDwgdjEuMC4zNSwgYWRkIG1pc3Npbmcgc3RkZGVmLmgKPiA+ICAgaW5jbHVkZSAoZml4ZWQgaW4g
dWNsaWJjIHNpbmNlIHYxLjAuMzUsIHNlZSBbMV0pCj4gPiAKPiA+IEZpeGVzOgo+ID4gCj4gPiAg
IC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvNmQ0YTYyYzcwM2M4NWRk
OTkzZGRiMmQ5MGViZTFmNmNhZDI0ZTBiMAo+ID4gCj4gPiAgIC4uLi9ob3N0L3g4Nl82NC1idWls
ZHJvb3QtbGludXgtdWNsaWJjL3N5c3Jvb3QvdXNyL2luY2x1ZGUvc3lzL3JhbmRvbS5oOjI3OjM1
OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCYc2l6ZV904oCZCj4gPiAgICAgIDI3IHwgZXh0
ZXJuIGludCBnZXRyYW5kb20odm9pZCAqX19idWYsIHNpemVfdCBjb3VudCwgdW5zaWduZWQgaW50
IGZsYWdzKQo+ID4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
fn5+fn4KPiA+IAo+ID4gWzFdIGh0dHBzOi8vY2dpdC51Y2xpYmMtbmcub3JnL2NnaS9jZ2l0L3Vj
bGliYy1uZy5naXQvY29tbWl0Lz9pZD0wMDk3MmMwMmMyYjZlMGE5NWQ1ZGVmNGE3MWJkZmIxODhl
MDkxNzgydAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0
QGdteC5uZXQ+Cj4gPiAtLS0KPiA+ICAuLi5nZXRyYW5kb20tY29tcGlsZS1mb3ItdWNsaWJjLXYx
LjAuMzUucGF0Y2ggfCAzOSArKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDM5IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nZGIvMTAu
Mi8wMDA2LUZpeC1nZXRyYW5kb20tY29tcGlsZS1mb3ItdWNsaWJjLXYxLjAuMzUucGF0Y2ggIAo+
IAo+IEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuIERpZCB5b3UgdmVyaWZ5IHRoYXQgdGhpcyB3
YXMgb25seSBhcHBsaWNhYmxlCj4gdG8gZ2RiIDEwLngsIGFuZCBub25lIG9mIHRoZSBvbGRlciBv
ciBuZXdlciB2ZXJzaW9ucyA/CgpKdXN0IG5vdy4uLiwgZ2RiLTkuMiBzZWVtcyBub3QgYWZmZWN0
ZWQsIGdkYi0xMS4xIHNob3dzIHRoZSBzYW1lIGZhaWx1cmUsIHBhdGNoIGZvbGxvd3MuLi4KClJl
Z2FyZHMsClBldGVyCgo+IAo+IFRoYW5rcyEKPiAKPiBUaG9tYXMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
