Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E85C43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 08:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EC6541B8D;
	Tue, 26 Jul 2022 08:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EC6541B8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6T6QwWFANbM5; Tue, 26 Jul 2022 08:21:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 653C741B52;
	Tue, 26 Jul 2022 08:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 653C741B52
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 831291BF239
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A2C461049
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A2C461049
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XGej3JiKOAtS for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 08:21:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBB6360E8E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBB6360E8E
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 08:21:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0C2511C0012;
 Tue, 26 Jul 2022 08:21:43 +0000 (UTC)
Date: Tue, 26 Jul 2022 10:21:42 +0200
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20220726102142.71da58e4@windsurf>
In-Reply-To: <20211210141209.1812043-7-jose.pekkarinen@unikie.com>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-7-jose.pekkarinen@unikie.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658823704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7nMpTPirnJeiXhqGUMGHD9qPMFwnxa6Dilkzob8UNj0=;
 b=Dk8JmEZ+2sPh/TV598dqMKkFBXoRHpMTNhkn5qIzXbGxtoTv7/p10lcxeHyUQc9vBba0yT
 WKYIeT3Bmxw561hA4DdvSlGkyh3Rord67b9/bG9AAqfFaWWVn1H/1iOnp17FuWjfuwrlEn
 qom1jW11Y69160rLA2OgOLmB1IlxRLTAFsW3L+r8TGHNl5FaYQvdu5CnQJlHpwevzieQoH
 9vJr0jsTMHUeWzvvsZU4bfW/w+5vuU1bic6aDPiBuH2hf6eFGvV1ixIL0jhlODtJx5bWeG
 L9bf1x4SjGhtOaa4gnRjN631mPBlfBaopKmySXRYGzcv+8HpIViJlVsvOJwO9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dk8JmEZ+
Subject: Re: [Buildroot] [PATCH 7/7] package/avocado-vt: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zw6ksCgpPbiBGcmksIDEwIERlYyAyMDIxIDE2OjEyOjA5ICswMjAwCkpvc8OpIFBl
a2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKCj4gVGhpcyBwYXRj
aCBhZGRzIGEgYmFzaWMgcGFja2FnZSBmb3IgYXZvY2Fkby12dAo+IHBsdWdpbi4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4K
ClRoYW5rcyBhIGxvdCBmb3IgeW91ciBjb250cmlidXRpb24hCgpEbyB5b3UgaGF2ZSBhbiBleGFt
cGxlIG9uIGhvdyB0byB1c2UgdGhpcyBpbiB0aGUgY29udGV4dCBvZiBCdWlsZHJvb3Q/CgpGaXJz
dCwgeW91ciBwYXRjaCB3YXMgbWlzc2luZyBsb3RzIG9mIGRlcGVuZGVuY2llczogcHl0aG9uLW5l
dGFkZHIsCnB5dGhvbi1uZXRpZmFjZXMsIHB5dGhvbi1zaW1wbGVqc29uLCBhbmQgb25lIG1vcmUg
SSBjYW4ndCByZW1lbWJlci4KClRoZW4sIEkgdHJpZWQgdG8gZm9sbG93Cmh0dHBzOi8vYXZvY2Fk
by12dC5yZWFkdGhlZG9jcy5pby9lbi9sYXRlc3QvR2V0U3RhcnRlZEd1aWRlLmh0bWwgYnkKcnVu
bmluZyAiYXZvY2FkbyB2dC1ib290c3RyYXAgLS12dC10eXBlIHFlbXUiIG9uIHRoZSB0YXJnZXQs
IGJ1dCB0aGlzCmNoZWNrcyBpZiBnY2MgaXMgaW5zdGFsbGVkIG9uIHRoZSB0YXJnZXQsIHdoaWNo
IG9idmlvdXNseSBmYWlscyBiZWNhdXNlCndlIGRvbid0IHN1cHBvcnQgaW5zdGFsbGluZyBhIGNv
bXBpbGVyIG9uIHRoZSB0YXJnZXQuCgpDb3VsZCB5b3Ugc2hvdyBhIHNpbXBsZSBleGFtcGxlIG9m
IHVzaW5nIGF2b2NhZG8tdnQgaW4gdGhlIGNvbnRleHQgb2YKQnVpbGRyb290PyBJZGVhbGx5LCBh
IHJ1bnRpbWUgdGVzdCBpbiBzdXBwb3J0L3Rlc3RpbmcvIHdvdWxkIGJlIHVzZWZ1bC4KU2VlIHN1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfYXZvY2Fkby5weSBmb3IgYW4gZXhhbXBs
ZSB0ZXN0CmNhc2UgSSBoYXZlIGFkZGVkIGZvciBhdm9jYWRvIGl0c2VsZi4KCkJlc3QgcmVnYXJk
cywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxp
bgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRw
czovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
