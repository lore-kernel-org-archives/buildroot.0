Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66081C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 16:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CE0281AAD;
	Sun, 19 Mar 2023 16:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CE0281AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZqQXAFIefP1E; Sun, 19 Mar 2023 16:43:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C37E8145F;
	Sun, 19 Mar 2023 16:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C37E8145F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8FC41BF2F8
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C345F40385
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C345F40385
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U3BgSapfsb_N for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 16:43:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A392A400A6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A392A400A6
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 16:43:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ADD2440006;
 Sun, 19 Mar 2023 16:43:05 +0000 (UTC)
Date: Sun, 19 Mar 2023 17:43:04 +0100
To: Martin =?UTF-8?B?SHVuZGViw7hsbA==?= <martin@geanix.com>
Message-ID: <20230319174304.52895f9b@windsurf>
In-Reply-To: <20230316094515.598356-1-martin@geanix.com>
References: <20230316094515.598356-1-martin@geanix.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679244186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cz0XjfH7JjlKTUHxLyW2mFfffVjEPTxiPha7aPyWXBg=;
 b=JUyuvWs5luf/R0JtPuXY2putLO3m0ERWuhIhQKgeOogocZZmfh3loTCKQ8XHoxOoumzVoq
 97D4MQ/78Hz/Difr5Yd8dPbqUD/XjSP4sx9LaWvD1wjukWMbpIV1TKWDUBLsbJ/beTQRvq
 8KaBWseXFJVgcChzuXKKj6fCn+meMXhCoDcZT+lQIjwduEX38kFKD3OCM8/iZ2/9/zMGTe
 ye1DsMibzBbRE+dkN2vSROu7Od1NyHKtptcX1iBHHZ+BdNP+sGUVq3XtZTmqZ9z047eZk5
 spU3B77NpMkZaihLATVQ3riu4JTiFCBO7gGTUpod7+FcDfudcKFBfvavnDQ+5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JUyuvWs5
Subject: Re: [Buildroot] [PATCHv2] ifupdown: bump to 0.8.41
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

T24gVGh1LCAxNiBNYXIgMjAyMyAxMDo0NToxNSArMDEwMApNYXJ0aW4gSHVuZGViw7hsbCA8bWFy
dGluQGdlYW5peC5jb20+IHdyb3RlOgoKPiBGcm9tOiBNYXJ0aW4gSHVuZGVib2xsIDxtYXJ0aW5A
Z2Vhbml4LmNvbT4KPiAKPiBNVVNMIHN1cHBvcnQgaXMgcGF0Y2hlZCBieSBkZWZpbmluZyBGTk1f
RVhUTUFUQ0ggdG8gemVybywgd2hpY2ggb21pdHMKPiBHTlUtb25seSBleHRlbmRlZCBwYXR0ZXJu
IG1hdGNoaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcnRpbiBIdW5kZWLDuGxsIDxtYXJ0aW5A
Z2Vhbml4LmNvbT4KClRoYW5rcywgSSd2ZSBhcHBsaWVkLiBPbmUgY29tbWVudCBiZWxvdyB0aG91
Z2guCgo+ICtTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gSHVuZGViw7hsbCA8bWFydGluQGdlYW5peC5j
b20+Cj4gK1Vwc3RyZWFtLXN0YXR1czogRGVuaWVkIFtodHRwczovL3NhbHNhLmRlYmlhbi5vcmcv
ZGViaWFuL2lmdXBkb3duLy0vbWVyZ2VfcmVxdWVzdHMvNV0KCklzbid0IHRoZSBmZWVkYmFjayBm
cm9tIHVwc3RyZWFtIGNvbXBsZXRlbHkgYm9ndXMgaGVyZT8gVGhleSBzYXkgIk5vdGUKdGhhdCB0
aGlzIHdvdWxkIG9ubHkgaGlkZSB0aGUgcHJvYmxlbSBieSB0dXJuaW5nIGEgYnVpbGQgZmFpbHVy
ZSBpbnRvIGEKbWlzYmVoYXZpbmcgcHJvZ3JhbS4iLCB3aGljaCBJIGRvbid0IHRoaW5rIGlzIGNv
cnJlY3QuIERpZCB5b3UgdHJ5IHRvCmFyZ3VlIHdpdGggdGhlbT8KClRoYW5rcyEKClRob21hcwot
LSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4u
Y29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
