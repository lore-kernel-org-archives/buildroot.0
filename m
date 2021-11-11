Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B3EC4332F
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 15:12:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 262AD61108
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 15:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 262AD61108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9B0081B17;
	Thu, 11 Nov 2021 15:12:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zMVFPufDuBgd; Thu, 11 Nov 2021 15:12:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42B8880EFF;
	Thu, 11 Nov 2021 15:11:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8719C1BF384
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 15:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7328E40240
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 15:11:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DobPObeq4A-S for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 15:11:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06FF640172
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 15:11:56 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id BFAD61BF203;
 Thu, 11 Nov 2021 15:11:53 +0000 (UTC)
Date: Thu, 11 Nov 2021 16:11:52 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211111161152.01598559@bootlin.com>
In-Reply-To: <20211109170420.1948423-1-yann.morin.1998@free.fr>
References: <20211109170420.1948423-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] core/pkg-generic: also list files installed
 in images/
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpPbiBUdWUsICA5IE5vdiAyMDIxIDE4OjA0OjIwICswMTAwCiJZYW5uIEUuIE1PUklOIiA8
eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgoKPiBTb21lIHBhY2thZ2VzIGluc3RhbGwg
bm90aGluZyBpbiB0YXJnZXQgbm9yIHN0YWdpbmcsIGJ1dCBpbnN0YWxsIGltYWdlcwo+IChsaWtl
IHRoZSBrZXJuZWwgdm1saW51eCwgb3IgYSBib290bG9hZGVyIGJvb3QgYmxvYi4uLikKPiAKPiBJ
ZiB3ZSB3YW50IHRvIGFwcm9wcmlhdGVseSBhY2NvdW50IGZvciB0aGUgZmlsZXMgaW5zdGFsbGVk
IGJ5IGVhY2gKPiBwYWNrYWdlLCB3ZSBhbHNvIG5lZWQgdG8gdGFrZSBpbWFnZXMvIGludG8gYWNj
b3VudC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThA
ZnJlZS5mcj4KPiBDYzogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGlu
LmNvbT4KPiBDYzogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+Cj4gLS0t
CgpKdXN0IGEgdHlwbzoKcy9hcHJvcHJpYXRlbHkvYXBwcm9wcmlhdGVseS8KCk9rIGZvciB0aGUg
cGF0Y2ggY29udGVudC4KCkJlc3QgcmVnYXJkcywKSGVydsOpCgotLSAKSGVydsOpIENvZGluYSwg
Qm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9v
dGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
