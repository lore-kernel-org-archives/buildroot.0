Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D6BCFD364
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 08:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C2B160F0E;
	Tue, 25 Nov 2025 08:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7KcIS7c5NbR9; Tue, 25 Nov 2025 08:57:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E076A60905
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E076A60905;
	Tue, 25 Nov 2025 08:57:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1533CE4
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 08:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A5CC40437
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 08:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gwa0OkazOR4 for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 08:57:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 90A3C40422
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90A3C40422
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90A3C40422
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 08:57:44 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -728499641; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 25 Nov 2025 08:57:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vNorj-00000009f2D-2IP4;
 Tue, 25 Nov 2025 09:57:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Frager, Neal" <neal.frager@amd.com>
In-Reply-To: <SA1PR12MB56156F87B1E140220AD2D278F0D1A@SA1PR12MB5615.namprd12.prod.outlook.com>
 (Neal Frager's message of "Tue, 25 Nov 2025 07:33:12 +0000")
References: <20251121180848.2106965-1-neal.frager@amd.com>
 <87a50bhyj5.fsf@dell.be.48ers.dk>
 <SA1PR12MB56156F87B1E140220AD2D278F0D1A@SA1PR12MB5615.namprd12.prod.outlook.com>
Date: Tue, 25 Nov 2025 09:57:39 +0100
Message-ID: <874iqiij5o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=QJQIHEP+wQxj7UaSChfMYk5o998Gdis3jilWSq+x8B9X8QibkdN5FEkADDmH7fW4u5cRkSUnOSeTrIlWlrexdVlxlKZ7bbkLwB/pX+zDUzPtiCEBtOYqlmnyaRdiKLpJ79ewrQIUlv+lAKYCR05fgLOypdBDpyM1CufGyztU7CCyx7us1OFinoOkfI8RK17JK/4oi7VCGYhkMW7MfwZRHes6SiYpq+MYPuRP/COLxwHjonliEyRHBGLtHSH6gEITjcvfnQaku6so1KFp5sKPbL/ZEi3NzGup8dnFUJWV4axMWRBMAHdzfgd0Bti8dMwwmkWH0qFOEqrAoVqU9xmNTg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=w2btLRMCPs+5p2c5H5dDV+xX24udZGlepXcmqGfmG1w=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=QJQIHEP+
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to
 xilinx_v2025.2
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
Cc: "yann.morin@orange.com" <yann.morin@orange.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZyYWdlciwiID09IEZyYWdlciwgTmVhbCA8bmVhbC5mcmFnZXJAYW1kLmNvbT4gd3Jp
dGVzOgoKSGksCgo+IEludGVyZXN0aW5nIHRoYXQgdGhpcyBldmVyIGJ1aWxkcyBjb3JyZWN0bHku
Li4KCiA+IFdoYXQgaGFwcGVucyB3aGVuIHlvdSBhZGQgdGhlIGluY2x1ZGUgYXMgZGlyZWN0ZWQ/
ICBEb2VzIGFkZGluZyB0aGUgaW5jbHVkZSBvZgogPiBzdGRpby5oIGZpeCB0aGUgYnVpbGQgaXNz
dWU/CgpZZXMgaXQgZG9lcy4KCk5vdGljZSB0aGF0IHRoZSBidWlsZCBpcyBzdGlsbCBxdWl0ZSBu
b2lzeSBhcyBpdCB1c2VzIGRlcHJlY2F0ZWQgb3BlbnNzbApmdW5jdGlvbnM6CgpsbXNfaGFzaC5j
OjQ1Ojk6IHdhcm5pbmc6IOKAmFNIQTI1Nl9VcGRhdGXigJkgaXMgZGVwcmVjYXRlZDogU2luY2Ug
T3BlblNTTCAzLjAgWy1XZGVwcmVjYXRlZC1kZWNsYXJhdGlvbnNdCiAgIDQ1IHwgICAgICAgICBT
SEEyNTZfVXBkYXRlKCZjdHgtPnNoYTI1NiwgbWVzc2FnZSwgbWVzc2FnZV9sZW4pOwogICAgICB8
ICAgICAgICAgXn5+fn5+fn5+fn5+fgoKCkkgaGF2ZSBhbHNvIHZlcmlmaWVkIHRoYXQgZ2VuZXJh
dGluZyBhIHNpZ25lZCBib290LmJpbiBvdXRwdXRzIGEgYml0CmlkZW50aWNhbCBmaWxlIHRvIHdo
YXQgdGhlIDIwMjUuMSB2ZXJzaW9uIGNyZWF0ZXMuCgogPiBBc3N1bWluZyBpdCBkb2VzLCBJIHdp
bGwgY3JlYXRlIGEgcGF0Y2ggZm9yIHRoaXMgYW5kIHN1Ym1pdCBpdCBpbnRlcm5hbGx5IHRvCiA+
IGdldCBpbmNsdWRlZCB3aXRoIHRoZSAyMDI2LjEgcmVsZWFzZS4gIEFuZCBpbiB0aGUgbWVhbnRp
bWUsIGFkZCBhIGRvd25zdHJlYW0KID4gcGF0Y2ggZm9yIHRoaXMgZm9yIGJ1aWxkcm9vdC4KClRo
YW5rcyEKCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
