Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839AAC6FA8F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 21:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 007F841D8C;
	Thu, 24 Aug 2023 21:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 007F841D8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V9oUDuRl7Lxj; Thu, 24 Aug 2023 21:39:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BFD541BBF;
	Thu, 24 Aug 2023 21:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BFD541BBF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 037711BF84C
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0A6483807
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0A6483807
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rC95VHSHKi2T for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 21:39:38 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8296282F32
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 21:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8296282F32
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF7E11C0002;
 Thu, 24 Aug 2023 21:39:33 +0000 (UTC)
Date: Thu, 24 Aug 2023 23:39:32 +0200
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Message-ID: <20230824233932.4c9b8d0d@windsurf>
In-Reply-To: <20230720131714.340963-1-vincent.stehle@arm.com>
References: <20230720131714.340963-1-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692913174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HO+mTtRi4cYsRJRDvAnR9loxwGpBNOeR5q2dtPAi8lM=;
 b=XYa3gS9R9tIsGa7bnAoThhXiUtkZCxTbo1huivdyCN/H+Y/NIkeIKw8hPT+AhesTwXJHQI
 4GAssZSE09mTzLsLEd7cRUcPXDDPGr1J4tiboYgQv7DzTDK4jrz5WIS3zSUQI9fOMxHFm7
 27dOcbzCNPUdcskV95XYEJ2v9ZRYKTf2+Wgn4o8VJdyzgQQN9bU3/Y+/RiYnIcXycHbrCL
 uOVT2W+ia6Y1z8xC+cO8Oa86xAtTNp8MAaIzUtGh3zPqUV3FnyaC6sozpuaJDx6ffJCV+V
 bVyyNBgK/EL0XTihnPi3f8Q64d0CvO+aOa4DUMsrS6W1pqQIfTgDU7K/bK1Hnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XYa3gS9R
Subject: Re: [Buildroot] [PATCH] configs/qemu_{arm, aarch64}_ebbr: bump Linux,
 U-Boot and TF-A
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAyMCBKdWwgMjAyMyAxNToxNzoxNCArMDIwMApWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+IHdyb3RlOgoKPiBCdW1wIHFlbXVfYXJtX2ViYnJfZGVmY29uZmln
IGFuZCBxZW11X2FhcmNoNjRfZWJicl9kZWZjb25maWcgaW4gc3luYzoKPiAKPiAtIEJ1bXAgTGlu
dXggdG8gdjYuNC4zCj4gLSBCdW1wIFUtQm9vdCB0byAyMDIzLjA3LjAyCj4gLSBCdW1wIFRGLUEg
dG8gdjIuOQo+IAo+IFdoaWxlIGF0IGl0LCB0dW5lIHRoZSBkb2N1bWVudGF0aW9uOgo+IAo+IC0g
SW5jcmVhc2UgdGhlIGFtb3VudCBvZiBtZW1vcnkgaW4gdGhlIGV4YW1wbGUgY29tbWFuZHMgdG8g
aGVscCBydW4gdGhlCj4gICBsYXJnZXN0IE9TIGRpc3RyaWJ1dGlvbnMuCj4gLSBVcGRhdGUgdGhl
IGxpbmsgdG8gdGhlIElSIEd1aWRlIHRvIHBvaW50IGF0IHRoZSBsYXRlc3QgdmVyc2lvbi4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+
Cj4gQ2M6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPiAKPiAtLS0KCkFw
cGxpZWQgdG8gbmV4dCwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8s
IEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jv
b3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
