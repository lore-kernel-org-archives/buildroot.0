Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5644BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 07:47:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8BA261164
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 07:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8BA261164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DA0084B08;
	Mon,  4 Oct 2021 07:47:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hq7mVnz2-_us; Mon,  4 Oct 2021 07:47:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 133B884AF8;
	Mon,  4 Oct 2021 07:47:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1ABAF1BF2C5
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 07:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0262042718
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 07:47:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DWeJ2LaP9bgR for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 07:47:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8662242717
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 07:47:18 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id AD4FD1C000A;
 Mon,  4 Oct 2021 07:47:15 +0000 (UTC)
Date: Mon, 4 Oct 2021 09:47:14 +0200
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211004094714.2c79febf@kmaincent-XPS-13-7390>
In-Reply-To: <20211003124719.GH1504958@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-6-kory.maincent@bootlin.com>
 <20211003124719.GH1504958@scaer>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 5/7] support/testing/infra/emulator.py:
 update encoding when calling qemu
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCk9uIFN1biwgMyBPY3QgMjAyMSAxNDo0NzoxOSArMDIwMAoiWWFubiBFLiBN
T1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKCj4gQWZ0ZXIgcmV2aWV3IGZy
b20gVGhvbWFzLCBJJ3ZlIGluZGVlZCByZXZlcnRlZCB0byB1c2luZyB1dGYtOCwgYnV0IHVzaW5n
Cj4gY29kZWNlcnJvcnM9J3JlcGxhY2UnIHRvIGZpeCBpbnZhbGlkIHV0Zi04IHNlcXVlbmNlcy4K
PiAKPiBJJ3ZlIGFsc28gcmV3b3JkZWQgdGhlIGNvbW1pdCBsb2cgYWNjb3JkaW5nbHkuCj4gCj4g
QXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRoYW5rcyBmb3IgdGhpcyBpbnZlc3RpZ2F0aW9u
IG9uIHRoZSB1dGY4IGNoYXJhY3RlciBpc3N1ZSBhbmQgZm9yIGNvbXBsZXRpbmcgdGhlCm1lcmdp
bmcgcHJvY2VzcyA6KQoKUmVnYXJkcywKS8O2cnkKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
