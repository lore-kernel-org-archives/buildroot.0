Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5736FC3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 12:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03921405E8;
	Mon, 15 Jul 2024 12:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjhHoJsN_zgD; Mon, 15 Jul 2024 12:15:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86B2F40577
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86B2F40577;
	Mon, 15 Jul 2024 12:15:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1CDB1BF3B8
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBCB24047C
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bv85AkrHitTN for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 12:15:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 53FB240533
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53FB240533
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53FB240533
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 12:15:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F28B71C000B;
 Mon, 15 Jul 2024 12:15:06 +0000 (UTC)
Date: Mon, 15 Jul 2024 14:15:05 +0200
To: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@gmail.com>
Message-ID: <20240715141505.12489c82@windsurf>
In-Reply-To: <D2PZUUV1LBT7.1EDN48KIUUPUB@gmail.com>
References: <20240714160457.39434-1-foss@athaariq.my.id>
 <D2PZUUV1LBT7.1EDN48KIUUPUB@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721045707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1yo1aaDEIVLuar1+WSw9ZnyMvVKWyTzZrV5hXlYGvFQ=;
 b=mZahsM1BKnj8ZetBYkB00wDfcMxNgiNEU1AJquEMx6KvncfKP5Xpg0FbLZY2HMjMhcyW4S
 vyMTC82z1ogayKwPznxmSqoTQ6FdEnDICkiz4pwarkpR7EKnOSuXOF/GSYtDOKAujOA0Q5
 TVAuwJYocFcyNj+NrlOn6+zjCPALkf0hw+0E+jH91T+cShJgm4o+802tRjCPRey2o9OzU1
 l0p9nR4MvQ2llacVaHJUSTms3n1KvaGVa/mqyITrQCZATv5uLTt+gc2KR/7auceRQADhMN
 b6jf3qWNsQes+oFFpLM2nfmFuiIkkGEcSrMFqz2B7a4SZ/uBFr7wafW45KRXJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mZahsM1B
Subject: Re: [Buildroot] [PATCH v4 1/3] package/rpi-firmware: bump version
 to 1.20240529
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
Cc: Athaariq Ardhiansyah <foss@athaariq.my.id>,
 Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBNb24sIDE1IEp1bCAyMDI0IDExOjEwOjIyICswMjAwCkdhw6tsIFBPUlRBWSA8
Z2FlbC5wb3J0YXlAZ21haWwuY29tPiB3cm90ZToKCj4gSW4gYWxsLCBhIGJ1bXAgb2YgdGhlIHJw
aS1maXJtd2FyZSAqKlNIT1VMRCoqIGNvcnJlc3BvbmQgdG8gYSBidW1wIG9mCj4gdGhlIGxpbnV4
IGtlcm5lbCwgZm9yIGV2ZXJ5IHJhc3BiZXJyeXBpIGRlZmNvbmZpZyBmaWxlcyAoaW4gYSBzZXBh
cmF0ZQo+IGNvbW1pdCkuIFNlZSBjb21taXRbMl1bM10uCj4gCj4gWW91IHdpbGwgZmluZCB0aGUg
Y29tbWl0IGlkIGluIGV4dHJhL2dpdF9oYXNoWzRdIGluIHRoZSBycGktZmlybXdhcmUKPiB0cmVl
OiBjMTQzMmI0YmFlNWI2NTgyZjRkMzJiYTM4MTQ1OWYzM2MzNGQxNDI0LiBBbmQsIHlvdSB3aWxs
IGZpZ3VyZSBvdXQKPiBpdCBjb3JyZXNwb25kcyB0byB0YWcgc3RhYmxlXzIwMjQwNTI5WzVdIGlu
IHRoZSBsaW51eC1yYXNwYmVycnlwaSB0cmVlLgoKVGhlc2UgcnVsZXMgc2hvdWxkIGJlIHdyaXR0
ZW4sIGluIHRoZSBycGktZmlybXdhcmUubWssIGFuZCBwcm9iYWJseSBpbgp0aGUgdmFyaW91cyBS
UGkgZGVmY29uZmlncy4KCj4gQ291bGQgeW91IHVwZGF0ZSBCUjJfTElOVVhfS0VSTkVMX0NVU1RP
TV9UQVJCQUxMX0xPQ0FUSU9OIGFjY29yZGluZ2x5IGluCj4gYSBkZWRpY2F0ZWQgY29tbWl0PyAo
SSB0aGluayB5b3UgY291bGQgdXNlIHRoZSB0YWcgbmFtZSwgbm8gdGVzdGVkKS4KClllcywgaXQg
Y2FuIHVzZSB0YWdzLgoKQmVzdCByZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25p
LCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
