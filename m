Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EA3C6FD1D
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 14:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7666061070;
	Mon, 27 Mar 2023 14:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7666061070
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kixARlcy7Oba; Mon, 27 Mar 2023 14:52:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF3306106D;
	Mon, 27 Mar 2023 14:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF3306106D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 84EBC1BF31A
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 14:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51EDC410CB
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 14:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51EDC410CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aYcDMSBP7RT6 for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 14:52:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C171D410C7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C171D410C7
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 14:52:09 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8C2D91C0003;
 Mon, 27 Mar 2023 14:52:07 +0000 (UTC)
Date: Mon, 27 Mar 2023 16:52:06 +0200
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <20230327165206.2959b6d4@bootlin.com>
In-Reply-To: <20230327135948.90710-1-luca.ceresoli@bootlin.com>
References: <20230327135948.90710-1-luca.ceresoli@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679928727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=loUQ4T+zb3u2A589BA2p+XvI/qj/gEgjmMngYXx30+Q=;
 b=X+qyofjwq2yEY511ThaWubU9mOY0Tqwsdd6g0e1sEe/uQnB7Ge7KnwWhxAckM1cEeRrKhA
 phbUS+7RmonlElopO0kDpjQK9yLHYpsoueneSl2f/OFNG4xZoff9Udazpk/aH21gA3wKhP
 KjwQ4QD6XSgNkt3u+omiYBZv/HmSJ8fUzXvJq1SO1ADyPJT6xoLGYYGnws/uXfUXGWdKsR
 U2ZaO/fNE8NthE7e0k5TIDwnnOmc4eOdg/Oa57n7mrcfXXP7rpPAyt2BLizvxWWdQ+IYqY
 XoKYCrHZNzG1y860w8vcBvMhlGQ3C1yhEZkRaR9MSBfE4yGG2XQLZVZBwzHsgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X+qyofjw
Subject: Re: [Buildroot] [PATCH v2] package/linux-tools: add USB tools
 (testusb and ffs-test)
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwKCk9uIE1vbiwgMjcgTWFyIDIwMjMgMTU6NTk6NDggKzAyMDAKTHVjYSBDZXJlc29s
aSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4gd3JvdGU6Cgo+IEV4dGVuZCB0aGUgbGludXgt
dG9vbHMgcGFja2FnZSB0byBhbHNvIGJ1aWxkIHRoZSB1c2Vyc3BhY2UgVVNCIHRvb2xzLCB3aGlj
aAo+IGN1cnJlbnRseSBpbmNsdWRlIHRlc3R1c2IgYW5kIGZmcy10ZXN0Lgo+IAo+IFRoZXNlIHRv
b2xzIGFyZSBpbiB0aGUga2VybmVsIHRyZWUgc2luY2UgYSBsb25nIHRpbWUsIGJ1dCBhIE1ha2Vm
aWxlIHdhcwo+IGFkZGVkIG9ubHkgaW4gNS45IHRvIGFsbG93IGJ1aWxkaW5nIGluIHRoZSBzYW1l
IHdheSBhcyBvdGhlciB0b29scyBwcm92aWRlZAo+IHdpdGggdGhlIGtlcm5lbC4gSGVyZSB3ZSB1
c2UgdGhlIE1ha2VmaWxlIGFuZCB0aHVzIHZlcnNpb24gPj0gNS45IGlzCj4gcmVxdWlyZWQuIFN1
cHBvcnQgZm9yIG9sZGVyIGtlcm5lbHMgbWF5IGJlIGFkZGVkIGxhdGVyIGlmIG5lZWRlZC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29t
Pgo+IAo+IC0tLQo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gCj4gIC0gVXNlIEFMTF9UQVJHRVRTIHRv
IHNlbGVjdCB0b29scyB0byBidWlsZCBhbmQgaW5zdGFsbCBpbnN0ZWFkIG9mIHRoZSB1Z2x5Cj4g
ICAgcmVtb3ZhbCBsb2dpYwo+IC0tLQo+ICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMSArCj4gIHBhY2thZ2UvbGludXgtdG9vbHMvQ29uZmlnLmluICAg
ICAgICAgICAgICAgICB8IDI2ICsrKysrKysrKysrKysrCj4gIHBhY2thZ2UvbGludXgtdG9vbHMv
bGludXgtdG9vbC11c2J0b29scy5tay5pbiB8IDM0ICsrKysrKysrKysrKysrKysrKysKPiAgMyBm
aWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL2xpbnV4LXRvb2xzL2xpbnV4LXRvb2wtdXNidG9vbHMubWsuaW4KPiAKClRoYW5rcyBmb3Ig
dGhpcyB2Mi4KClJldmlld2VkLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGlu
LmNvbT4KClJlZ2FyZHMsCkhlcnbDqQoKLS0gCkhlcnbDqSBDb2RpbmEsIEJvb3RsaW4KRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
