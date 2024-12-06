Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD3BE77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 23:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E1C180E04;
	Fri,  6 Dec 2024 23:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUq91tTiAMtA; Fri,  6 Dec 2024 23:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 202CA80E14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 202CA80E14;
	Fri,  6 Dec 2024 23:22:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 316FDED2
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 23:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BDD960604
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 23:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3If13fFXOvu4 for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 23:22:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4CC39605F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CC39605F1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CC39605F1
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 23:22:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90C5FE0004;
 Fri,  6 Dec 2024 23:22:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tJheV-009SCZ-0F;
 Sat, 07 Dec 2024 00:22:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Lance Fredrickson <lancethepants@gmail.com>
Cc: buildroot@buildroot.org
References: <20241107134342.4306-1-tianyuanhao3@163.com>
 <20241107134342.4306-2-tianyuanhao3@163.com>
 <544b4ef9-04bd-43e5-8655-23556a740f7b@mind.be>
 <6e2e67e6.2701.193949deeb9.Coremail.tianyuanhao3@163.com>
 <7b139544-134b-4775-9070-ffd0dbd66438@gmail.com>
Date: Sat, 07 Dec 2024 00:22:27 +0100
In-Reply-To: <7b139544-134b-4775-9070-ffd0dbd66438@gmail.com> (Lance
 Fredrickson's message of "Fri, 6 Dec 2024 07:31:30 -0700")
Message-ID: <87frn04css.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 2/2] package/gnutls: fix configure options
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkxhbmNlIiA9PSBMYW5jZSBGcmVkcmlja3NvbiA8bGFuY2V0aGVwYW50c0BnbWFpbC5j
b20+IHdyaXRlczoKCiA+IEluIDIwMjQuMTEtcmMzIEkgYW0gbm93IGdldHRpbmcgdGhpcyBlcnJv
ciB0aGF0IHdhcyBub3QgcHJlc2VudCBpbgogPiAyMDI0LjExLXJjMi4KCiA+IEluIGZpbGUgaW5j
bHVkZWQgZnJvbSBkbHdyYXAvYnJvdGxpZW5jLmM6MTI6CiA+IGRsd3JhcC9icm90bGllbmMuaDox
MToxMDogZmF0YWwgZXJyb3I6IGJyb3RsaS9lbmNvZGUuaDogTm8gc3VjaCBmaWxlCiA+IG9yIGRp
cmVjdG9yeQogPiDCoMKgIDExIHwgI2luY2x1ZGUgPGJyb3RsaS9lbmNvZGUuaD4KID4gwqDCoMKg
wqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+fn5+fn5+fn5+CiA+IGNvbXBpbGF0aW9u
IHRlcm1pbmF0ZWQuCiA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkbHdyYXAvYnJvdGxpZGVjLmM6
MTI6CiA+IGRsd3JhcC9icm90bGlkZWMuaDoxMToxMDogZmF0YWwgZXJyb3I6IGJyb3RsaS9kZWNv
ZGUuaDogTm8gc3VjaCBmaWxlCiA+IG9yIGRpcmVjdG9yeQogPiDCoMKgIDExIHwgI2luY2x1ZGUg
PGJyb3RsaS9kZWNvZGUuaD4KID4gwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+
fn5+fn5+fn5+fn5+CiA+IGNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuCgogPiBMb29rcyBmcm9tIGRp
c2N1c3Npb24gdGhhdCBhIGRpZmZlcmVudCBwYXRjaCBpcyBuZWVkZWQgb3IgcGF0Y2ggMi8yCiA+
IG5lZWRzIHJldmVydGVkIHNpbmNlIDEvMiBpcyBzbGF0ZWQgZm9yIG5leHQuCgpJIGhhdmUgYXBw
bGllZCB0aGUgYnVtcCB0byAzLjguOCwgd2hpY2ggZml4ZXMgdGhlIGJ1aWxkIGhlcmUuIENhbiB5
b3UKdHJ5IGN1cnJlbnQgbWFzdGVyIGFzIHdlbGw/CgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
