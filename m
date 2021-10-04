Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04F8C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 07:30:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13BF66115B
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 07:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13BF66115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB3178421C;
	Mon,  4 Oct 2021 07:30:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JoacJY0hJrOx; Mon,  4 Oct 2021 07:30:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51B9C8412B;
	Mon,  4 Oct 2021 07:30:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 879161BF306
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 07:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 763498412B
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 07:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rmE5Puzl6OA for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 07:30:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CDEC840C0
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 07:30:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0EB8A20002;
 Mon,  4 Oct 2021 07:30:20 +0000 (UTC)
Date: Mon, 4 Oct 2021 09:30:20 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20211004093020.191b907d@windsurf>
In-Reply-To: <CAJPV9MpbeTF4vGvOtP15bNGGLbt8StceDxYWs8LLebgyEr=gvg@mail.gmail.com>
References: <20211004064143.6281-1-jose.pekkarinen@unikie.com>
 <20211004090036.65722dda@windsurf>
 <CAJPV9MpbeTF4vGvOtP15bNGGLbt8StceDxYWs8LLebgyEr=gvg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] system: add optional rsync with preserved
 permissions
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
Cc: "Yann E.
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCA0IE9jdCAyMDIxIDEwOjA4OjA5ICswMzAwCkpvc8OpIFBla2thcmluZW4gPGpvc2Uu
cGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKCj4gTmV2ZXIgaGVhcmQgb2YgaXQsIGJ1dCBh
ZnRlciBhIHF1aWNrIGNoZWNrIGl0IGxvb2tzIGxpa2UKPiBpdCBpcyBhIGJldHRlciBhbnN3ZXIg
dG8gbXkgcHJvYmxlbSwgc2luY2UgSSBmb3VuZCB0aGF0LCBmb3IKPiBleGFtcGxlLCBpZiBJIHdh
bnQgdG8gcHJvdmlkZSwgYW4gYXV0aG9yaXplZF9rZXlzIGZpbGUgb3duZWQKPiBieSByb290LCB3
aXRoIDYwMCBwZXJtaXNzaW9ucywgcnN5bmMgY29waWVzIHRoZSBmaWxlIHdpdGggNjQ0LAo+IHdo
aWNoIGlzIGNsb3NlciwgYnV0IG5vdCBwZXJmZWN0LgoKWWVzLCB3aXRoIGEgcGVybWlzc2lvbiB0
YWJsZSwgeW91IGNhbiBhZGp1c3Qgbm90IGp1c3QgdGhlIHBlcm1pc3Npb25zLApidXQgYWxzbyB0
aGUgb3duZXJzaGlwIG9mIGZpbGVzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1v
d25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
