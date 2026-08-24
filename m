Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504AFC5DF9C
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 20:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3FB160618;
	Mon, 24 Aug 2026 20:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLJ9cqnq30Jw; Mon, 24 Aug 2026 20:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787601692;
	bh=BWjwpqK/3PpHb9fHqnjEm9BbirzWyMa4FvxuQ3Y9EVk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HwRETjpqpio7Mt670/g4u5cjG9QHGkQBqYrQJnvahCikn5R96jssHr1mIfD+j2L+S
	 rRM8apXvNu7q7sAOBSmhHdNf3ojh8j4mkL7GMY8bHg017TGAUjwifJjCctAkgQnv0j
	 RqOBsPNhLDO9t1LX2mp2m7H5/YCSBRfhW4dN5JqvmVk35eQItGjXhwz2eHb6IA8XX0
	 K6iCKj5I1ZGjdpVf1XHmu47GVVMOotFmk8B0A+nsdSxgNsrqW8hknM8glkoKD8Bywq
	 plSwuTbyF8H58KHVPCALr3zVCTtU2vpj5zSFye7VgOO28qZHsy4Opzz1Nzr4Mayrv1
	 U23QA57ayaDpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04E8A60624;
	Mon, 24 Aug 2026 20:01:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 92423279
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83DEE60624
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLkiOPqJs0ea for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 20:01:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7824E60618
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:01:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3D9221A1804;
 Mon, 24 Aug 2026 20:01:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 11DDA5FFC1;
 Mon, 24 Aug 2026 20:01:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6F04011C797BD; 
 Mon, 24 Aug 2026 22:01:22 +0200 (CEST)
Date: Mon, 24 Aug 2026 22:01:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aoyi1476LyooLpig@windsurf>
References: <20260724164829.304335-1-bernd@kuhls.net>
 <20260724164829.304335-2-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260724164829.304335-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH/RFC 2/3] package/taglib: needs gcc >= 7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBKdWwgMjQsIDIwMjYgYXQgMDY6NDg6MjhQTSArMDIwMCwgQmVybmQgS3VobHMgd3Jv
dGU6Cj4gRml4ZXMgYSBidWlsZCBlcnJvciBjYXVnaHQgYnkgdGhlIEdpdGxhYiBwaXBlbGluZXM6
Cj4gCj4gL2J1aWxkcy9ia3VobHMvYnVpbGRyb290L2JyLXRlc3QtcGtnL2Jvb3RsaW4tYWFyY2g2
NC1nbGliYy1vbGQvYnVpbGQvdGFnbGliLTIuMy90YWdsaWIvbXBlZy9tcGVnZmlsZS5jcHA6MTEz
OjEwOgo+ICBlcnJvcjogZXhwZWN0ZWQgcHJpbWFyeS1leHByZXNzaW9uIGJlZm9yZSDigJhjb25z
dOKAmQo+ICAgICAgICBpZihjb25zdCBIZWFkZXIgaGVhZGVyKCZmaWxlLCBoZWFkZXJPZmZzZXQg
KyBpLCB0cnVlKTsgaGVhZGVyLmlzVmFsaWQoKSkgewo+IAo+IHdoaWNoIHdhcyBpbnRyb2R1Y2Vk
IGJ5IGNvZGUgZm9ybWF0IGNoYW5nZXMgaW4gdXBzdHJlYW0gY29tbWl0Cj4gaHR0cHM6Ly9naXRo
dWIuY29tL3RhZ2xpYi90YWdsaWIvY29tbWl0L2RmZTJhYTUyNTMyZmM5ZjczYTY3NDk5ZGQxN2Zi
NTI3YTg1NmEyMmYKPiAKPiB3aGljaCB3YXMgZmlyc3QgcmVsZWFzZWQgd2l0aCB0YWdsaWIgMi4w
LCBhZGRlZCB0byBidWlsZHJvb3Qgd2l0aCBjb21taXQKPiA5Y2QzNDY0YWZhMTNmZDAxOTBmYjNl
OTRmZDg1MGNjODA2M2NmMjk3Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJu
ZEBrdWhscy5uZXQ+Cj4gLS0tCj4gSSBoYXZlIG5vIGlkZWEgaWYgdGhpcyBwYXRjaCBpcyBjb3Jy
ZWN0LCBhdCBsZWFzdCBibG9ja2luZyBnY2MgNiBtYWtlcwo+IHRoZSBHaXRsYWIgcGlwZWxpbmVz
IGhhcHB5LiBJdCBzZWVtcyB0byBtZSB0aGF0IHRoZSB1cHN0cmVhbSBjb21taXQgdXNlcwo+IG5l
d2VyIGxhbmd1YWdlIGZlYXR1cmVzIG5vdCBzdXBwb3J0ZWQgYnkgZ2NjIDYsIGJ1dCB3aXRoIG15
IGxpbWl0ZWQKPiBrbm93bGVkZ2UgYWJvdXQgQysrIEkgY291bGQgbm90IGZpbmQgZXZpZGVuY2Ug
dG8gc3VwcG9ydCBteSB0aGVvcnkuCgpJJ20gYWxzbyBub3QgYSBDKysgZ3VydSwgYnV0IHNvbWUg
cmVzZWFyY2ggc2hvd3MgdGhhdCB0aGlzIGlzIGNhbGxlZAoiaW5pdC1zdGF0ZW1lbnQiLCB3YXMg
ZGVzY3JpYmVkIGJ5IHByb3Bvc2FsIFAwMzA1UjEgYW5kIGFjY29yZGluZyB0bwpodHRwczovL2Vu
LmNwcHJlZmVyZW5jZS5jb20vY3BwL2NvbXBpbGVyX3N1cHBvcnQvMTcgdGhpcyBmZWF0dXJlCmlu
ZGVlZCBoYXMgYmVlbiBzdXBwb3J0ZWQgc2luY2UgZ2NjIDcuCgpJJ3ZlIGV4dGVuZGVkIHRoZSBj
b21taXQgbG9nIHdpdGggdGhpcyBpbmZvcm1hdGlvbiwgYW5kIGFwcGxpZWQgdG8KbWFzdGVyLiBU
aGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJv
b3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcK
aHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
