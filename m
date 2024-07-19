Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E3AC3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 13:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE6D2404DB;
	Fri, 19 Jul 2024 13:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1MjJsEsVppYl; Fri, 19 Jul 2024 13:43:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6EEF409A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6EEF409A2;
	Fri, 19 Jul 2024 13:43:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E6E81BF3A9
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 13:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B67A40328
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 13:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fd7_Ete5cAD6 for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 13:43:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3109400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3109400E4
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3109400E4
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 13:43:47 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([151.216.37.99]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNKhm-1sfCB242xe-00SonM; Fri, 19
 Jul 2024 15:43:43 +0200
Date: Fri, 19 Jul 2024 15:43:42 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <Zpptjqx6nQD2XetS@probook>
References: <20240718-ztext-v4-1-15a9744f1edb@gmx.net>
 <ZpoMYixDlvqpfpJ6@probook>
 <08cd73a1-8e7c-4891-b3c8-84fba092877d@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08cd73a1-8e7c-4891-b3c8-84fba092877d@mind.be>
X-Provags-ID: V03:K1:Wh44li+Vq11K6d75+TJ5vWc7bDuj68MwVEzamN49bEWRcGigfIP
 QFyRf2X/BiROc4wv+WTOuEdocE7RMyqUdbJVbVnOGyAHCfxY/Endzfov93QgYsBPglsDlJV
 w8iT3Tb8BRV0R6bsRsszTJ+SoqzdY4r1XhK6arpiBgExrPyTvlvwZ9/1gbGEwbqB2uIIgxg
 1uy3kCpSM7Kttp2DlofTw==
UI-OutboundReport: notjunk:1;M01:P0:priQ4dV0v5Y=;DtKZinJZFLmGn8LONRuA+jyG3cT
 q1l+Id+TJJNdHUCE0oA7l2rWtrERtkE+gDcx66pSZqPWD3FYiPKkrgo0Q+ki3CyqHhiNwrXTw
 9TTdDDfZAKgnzsyQrf49G1vzhiVMusGU5ZRgvG92H20PIR3qU3ZWBrTPaAeBkjGmYpiZioadf
 EyuZGowtxI1/oyZH/kV45xX2hOYkybCV0ZSJ/MfTrgJToF2ugeFUQDymjHvAvlJzokD40+LQ8
 R60LFlzuWEiM7u0Zlgx8ocwo0T5fQDU7cBs34kuQRPyLoU3Jq0sw21D281gG7a32QIrV6uPAX
 GuoVjCgDTU5cTeGz/Zhi7Ol9FSwV0XuJ7ZB73yRN9dPMVC2XZ89QFVCarkVPCkWQjlg1lzcr0
 gn0bjRXnTxaV/i3lvKXRKbAPRY03OeS2YUqaQPmbKLVx6HRF+Vyt0D90W/0nXACDEihTqzdBe
 +xNUOvqWtIrz/ugL+AHKKqPAQT9FL/U6/uexrgYuU21A0R3oL9QIJHsioWZdOOrN0OYnnybdP
 qwaa4M79bEI54ij7BT5kUP2aQ88xxHCDhcP7Eib3FRh2Y5SS1zoO8xO5vHdnyABDNgrJQx61r
 ksDQVqf5pZBrRs/xzd8+SXxARb2SO353JQHYZJDn9+XhE0VZJzh750aEO/DOMpe4Wdwt5pb4F
 pkdPmhy8ShVFhnKm6yxUulvW4IkiZ+ys53niVdM+hrd5+cLkPtATE9NZ7/8KbtoJUHP8cpgfu
 8xAojBQ8FosLCxJY/j3Lvdbc7uovXXWWLoe3ldf+02yixR/D+ApszryLSgdRTAteoAypdd02M
 J0hHRZ3cMBbmCTPGqpuDtCnA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1721396623; x=1722001423; i=j.neuschaefer@gmx.net;
 bh=fLLYjC/+sf0EJvXxzE0eIQIEA/dKqay38+1br/Ma6qA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=gLXMNIZZEQIWaEfdYYSrcJK4NLUxg6lYZC8pQfYw6CpnDMusNVRzl+jjyAzNQv+J
 U6OKhXBJrzTeOPgyOIkkysUogjfJz0hAcrso6JpkFwbSw0u/PPIO14ibNv8C1f+7H
 J3JarzKmk8mUIgRZ7ssRSPGiHvgvs7BjY/dAS7qIVw+2BwCx+ZBmfmWuWyEhlW09L
 EPUPWwthlzr2NFE0gFdsyBifYyokbF6VdJ8c7N1ht/DJR4pt+jMg3T7Ii6edG8rPo
 halfBHuPDTlvK3cbQTjbqZnLwgbXzBdYkevINeKXsBYZPUsiOf25CzNFiwssLoxER
 mutB37778reepV2YAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=gLXMNIZZ
Subject: Re: [Buildroot] [PATCH v4] Config.in: ban textrels on musl
 toolchains
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBKdWwgMTksIDIwMjQgYXQgMDk6MTk6MjJBTSArMDIwMCwgQXJub3V0IFZhbmRlY2Fw
cGVsbGUgd3JvdGU6Cj4gT24gMTkvMDcvMjAyNCAwODo0OSwgSi4gTmV1c2Now6RmZXIgd3JvdGU6
Cj4gPiBPbiBUaHUsIEp1bCAxOCwgMjAyNCBhdCAxMDozMzoyM1BNICswMjAwLCBKLiBOZXVzY2jD
pGZlciB3cm90ZToKPiA+ID4gK2lmZXEgKCQoQlIyX1RPT0xDSEFJTl9VU0VTX01VU0wpJChCUjJf
QklORk1UX1NVUFBPUlRTX1NIQVJFRCkseXkpCj4gPgo+ID4gSSBqdXN0IG5vdGljZWQgdGhhdCBC
UjJfQklORk1UX1NVUFBPUlRTX1NIQVJFRCBpcyBpbmNvcnJlY3QsIGJlY2F1c2UKPiA+IGl0J3Mg
dHJ1ZSByZWdhcmRsZXNzIG9mIHdoZXRoZXIgc2hhcmVkIGxpYnJhcmllcyBhcmUgYWN0dWFsbHkg
dXNlZC4KPiA+IFdoYXQgSSB3YXMgYWltaW5nIGZvciBpcyAiQlIyX1NIQVJFRF9MSUJTIG9yIEJS
Ml9TSEFSRURfU1RBVElDX0xJQlMiLgo+ID4KPiA+IEkgc3VwcG9zZSB0aGlzIHNob3VsZCB3b3Jr
Ogo+ID4KPiA+IGlmZXEgKCQoQlIyX1RPT0xDSEFJTl9VU0VTX01VU0wpJChCUjJfU0hBUkVEX0xJ
QlMpJChCUjJfU0hBUkVEX1NUQVRJQ19MSUJTKSx5eSkKPgo+ICBXaGF0IHdlIGRvIGlzOgo+Cj4g
aWZlcSAoJChCUjJfVE9PTENIQUlOX1VTRVNfTVVTTCk6JChCUjJfU1RBVElDX0xJQlMpLHk6KQo+
Cj4gIFRoaXMgc2F5cyB0aGF0IG11c2wgbXVzdCBiZSB5IGFuZCBzdGF0aWMgbXVzdCBub3QgYmUu
CgpOaWNlIHRyaWNrLCBJJ2xsIHVzZSBpdC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
