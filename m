Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414E4C0015E
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4AD2612B8;
	Wed, 26 Jul 2023 21:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4AD2612B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZSv_AVuU1Tr; Wed, 26 Jul 2023 21:30:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EC5E6120B;
	Wed, 26 Jul 2023 21:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EC5E6120B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADBE41BF423
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 801E76120B
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 801E76120B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FP_Gwx6TxTnW for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:30:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F71660AC0
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:30:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F71660AC0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8443040006;
 Wed, 26 Jul 2023 21:30:13 +0000 (UTC)
Date: Wed, 26 Jul 2023 23:30:12 +0200
To: =?UTF-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <20230726233012.50b0ac6c@windsurf>
In-Reply-To: <20230608175538.1347170-1-salvador.joseluis@gmail.com>
References: <20230608175538.1347170-1-salvador.joseluis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690407014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ary62ouzg+TVO+h3fDXIt6WnvSYevEznFKb+PevdFLA=;
 b=Z4bXJcWkUbtFEyVGPoaiv7WXfxOj5cySLKX6YPwC0D14iGjUslt1SfktF97GE3X273WEqS
 SCPoiP666vHqEPUcBz1xaPf+jjfdh4QWtUPWms+ED8e85ptS8lzKxfmTFXaZ4LjOb3pbx9
 iVYrQtYAWsHVP9YRWv/j7dMdGYq6lN2Ol4Su3X3FnfHa8+5Jhf++ODTQ/Mxs/rnFyB38t5
 AHJCFtCHDvaxTE6kWSgCmqLSzufH2rIIUpAgTUsTRq3AOpDgQNMakRtEPFgbjtvMICpaMh
 kiGeszG2X8bVdA7I4FbszE25Itxd/ONSElLs1WA0w9p2W9ECedpxLYipzkYsWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z4bXJcWk
Subject: Re: [Buildroot] [PATCH] package/zfs: fix autotools crosscompilations
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 Michael Zimmermann <sigmaepsilon92@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zw6ksCgpPbiBUaHUsICA4IEp1biAyMDIzIDE5OjU1OjM4ICswMjAwCkpvc8OpIEx1
aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPiB3cm90ZToKCj4g
U2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVp
c0BnbWFpbC5jb20+CgpUaGFua3MgZm9yIHRoZSBjb250cmlidXRpb24sIGJ1dCB1bmZvcnR1bmF0
ZWx5IHdlIGNhbm5vdCBhcHBseSB0aGlzCnBhdGNoOiBpdCBkb2VzIG5vdCBleHBsYWluIGFueXRo
aW5nIGFib3V0IHdoaWNoICJhdXRvdG9vbHMKY3Jvc3Njb21waWxhdGlvbnMiIGlzc3VlcyBpdCBp
cyBmaXhpbmcuIEFyZSB0aGVzZSBmYWlsdXJlcyB2aXNpYmxlIGluCnRoZSBhdXRvYnVpbGRlcnM/
IElmIHNvLCB3aGF0IGxpbms/IElmIG5vdCwgd2hhdCBjb25maWd1cmF0aW9uL3NldHVwCmV4aGli
aXRzIHRoZSBwcm9ibGVtLCB3aGF0IGlzIHRoZSBlcnJvciBtZXNzYWdlLCBob3cgZG9lcyB0aGUg
cGF0Y2ggZml4CnRoZSBpc3N1ZT8KCkNvdWxkIHlvdSBzZW5kIGFuIHVwZGF0ZWQgcGF0Y2ggd2l0
aCBhIG5vbi1lbXB0eSBjb21taXQgbG9nIHRoYXQKY29udGFpbnMgYSBzdWZmaWNpZW50IGFtb3Vu
dCBvZiBkZXRhaWwgZm9yIHVzIHRvIHByb3Blcmx5CnJldmlldy91bmRlcnN0YW5kIHRoZSBjaGFu
Z2U/CgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBD
RU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJh
aW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
