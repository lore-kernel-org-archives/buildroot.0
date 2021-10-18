Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4786FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:54:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0433C6135E
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0433C6135E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C807D404D3;
	Tue, 19 Oct 2021 17:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hFfyzQXcnYiP; Tue, 19 Oct 2021 17:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C66B4030C;
	Tue, 19 Oct 2021 17:54:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 846AD1BF4D8
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74470402A8
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xBr__zXE0K55 for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 17:53:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9711C4022B
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 17:53:59 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4D1AF100005;
 Tue, 19 Oct 2021 17:53:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mctJD-0005YQ-BP; Tue, 19 Oct 2021 19:53:55 +0200
Resent-To: =?utf-8?Q?Jos=C3=A9?= Pekkarinen <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
Resent-From: Peter Korsgaard <peter@korsgaard.com>
Resent-Date: Tue, 19 Oct 2021 19:53:55 +0200
Resent-Message-ID: <87o87kaojw.fsf@dell.be.48ers.dk>
X-From-Line: nobody Mon Oct 18 10:20:16 2021
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Jos=C3=A9?= Pekkarinen <jose.pekkarinen@unikie.com>
References: <20211001062052.770583-1-jose.pekkarinen@unikie.com>
Date: Mon, 18 Oct 2021 10:20:16 +0200
In-Reply-To: <20211001062052.770583-1-jose.pekkarinen@unikie.com>
 (=?utf-8?Q?=22Jos=C3=A9?=
 Pekkarinen"'s message of "Fri, 1 Oct 2021 09:20:52 +0300")
Message-ID: <87tuheeocf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/audit: Fix type output on log
 folder creation
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

Pj4+Pj4gIkpvc8OpIiA9PSBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2ll
LmNvbT4gd3JpdGVzOgoKID4gVGVzdGluZyBidWlsZHJvb3QgMjAyMS4wNSBJIG9ic2VydmVkIHRo
YXQgYWZ0ZXIgZmlyc3QKID4gYm9vdCBJIHdhcyBoYXZpbmcgdGhlIGZvbGxvd2luZyBmb2xkZXJz
OgoKID4gL2NvbnRleHQ6CiA+IC9zeXN0ZW1fdTpvYmplY3RfcjphdWRpdGRfbG9nX3QKCiA+IFRo
ZSByb290IG9mIHRoaXMgcHJvYmxlbSB0dXJuZWQgdG8gYmUgYSBkaWZmZXJlbmNlIGluIHRoZQog
PiBvdXRwdXQgb2YgJChzZWxhYmVsX2xvb2t1cCAtYiBmaWxlIC1rIC92YXIvbG9nL2F1ZGl0KSBj
YWxsZWQKID4gYnkgUzAyYXVkaXRkIHRoYXQgZnJvbSB0aGlzIHZlcmlzb24gb24gbG9va3MgbGlr
ZToKCiA+ICQgc2VsYWJlbF9sb29rdXAgLWIgZmlsZSAtayAvdmFyL2xvZy9hdWRpdAogPiBEZWZh
dWx0IGNvbnRleHQ6IHN5c3RlbV91Om9iamVjdF9yOmF1ZGl0ZF9sb2dfdAoKID4gVGhpcyBwYXRj
aCB3aWxsIGN1dCBpdCB0byByZXRyaWV2ZSB0aGUgdHlwZSBwaWVjZSBvbmx5LgoKID4gU2lnbmVk
LW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+CgpD
b21taXR0ZWQgdG8gMjAyMS4wMi54IGFuZCAyMDIxLjA4LngsIHRoYW5rcy4KCi0tIApCeWUsIFBl
dGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
