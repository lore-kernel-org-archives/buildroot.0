Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52E6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Apr 2022 06:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24E5440930;
	Fri, 15 Apr 2022 06:37:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pDIiF9kAY2Lh; Fri, 15 Apr 2022 06:37:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D09474093F;
	Fri, 15 Apr 2022 06:37:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0EF871BF855
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 06:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEB7C40916
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 06:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cnCaquQAXXVM for <buildroot@lists.busybox.net>;
 Fri, 15 Apr 2022 06:37:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B26C408E9
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 06:37:03 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 95FDB240006;
 Fri, 15 Apr 2022 06:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650004619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NqFI2r0y0CvF82rXsrV6YQY1fMh+8wdcpYdcy6mzaRQ=;
 b=cbvsGl2WU931UkuWLHXpQeCQhWPDGBZMkq3/Yzqh72bkObrhnICkJW8PuG3H3vrW4q6Jdq
 GaQHd064IN7EDzjCkySILpmF1JBTVN0uLuUMVzPnzF6nCjN3ba76L/iMJPhLPgItbqZoA6
 jiU6/cRRlOwlfd33OnGGwQ92GSee0WnEctb24lKRX9TBcYUFhZGmXj/3GDsvfDP6mPNRD8
 EeJgxcQbCor0OdvaucW1BQe/65C+Nu/2Bu5CR+b3SrLTpHuo1TqR/NbDAIWmy9SHztqUXP
 gbAOARjPz9OsKmY3/aSWr3osGyRLHf13i3lUWwTTiIn2lUFzCAiKz99KmDCt4Q==
Date: Fri, 15 Apr 2022 08:36:57 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220415083657.357a65ce@bootlin.com>
In-Reply-To: <20220414203059.1818820-1-fontaine.fabrice@gmail.com>
References: <20220414203059.1818820-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/php-apcu: needs threads
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmFicmljZSwKCk9uIFRodSwgMTQgQXByIDIwMjIgMjI6MzA6NTkgKzAyMDAKRmFicmljZSBG
b250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgoKPiBwaHAtYXBjdSBu
ZWVkcyB0aHJlYWRzIHNpbmNlIGl0cyBhZGRpdGlvbiBpbiBjb21taXQKPiA4ZGRlZWZmYTE4NmQ4
YmNlODc1YWM3MTNjMWU3MTQ4M2M2MTg4NDJhOgo+IAo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAv
aG9tZS9idWlsZHJvb3QvYXV0b2J1aWxkL2luc3RhbmNlLTMvb3V0cHV0LTEvYnVpbGQvcGhwLWFw
Y3UtNS4xLjIwL2FwY19sb2NrLmM6MjA6Cj4gL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0
YW5jZS0zL291dHB1dC0xL2J1aWxkL3BocC1hcGN1LTUuMS4yMC9hcGNfbG9jay5oOjQxOjExOiBm
YXRhbCBlcnJvcjogcHRocmVhZC5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gICAgNDEg
fCAjIGluY2x1ZGUgInB0aHJlYWQuaCIKPiAgICAgICB8ICAgICAgICAgICBefn5+fn5+fn5+fgo+
IAo+IEZpeGVzOgo+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzMx
NDQwNTQyM2FlZWNlNWVlNTVkNzZlYzVjNGZhMTkxOWU3ZWU4NTMKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiAtLS0KPiAg
cGFja2FnZS9waHAtYXBjdS9Db25maWcuaW4gfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BocC1hcGN1L0NvbmZpZy5p
biBiL3BhY2thZ2UvcGhwLWFwY3UvQ29uZmlnLmluCj4gaW5kZXggNjMzODk4MDIyMi4uZjhlMWVi
MTdiYiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BocC1hcGN1L0NvbmZpZy5pbgo+ICsrKyBiL3Bh
Y2thZ2UvcGhwLWFwY3UvQ29uZmlnLmluCj4gQEAgLTEsNiArMSwxMCBAQAo+ICBjb25maWcgQlIy
X1BBQ0tBR0VfUEhQX0FQQ1UKPiAgCWJvb2wgInBocC1hcGN1Igo+ICsJZGVwZW5kcyBvbiBCUjJf
VE9PTENIQUlOX0hBU19USFJFQURTCj4gIAloZWxwCj4gIAkgIEFQQ3UgaXMgYW4gaW4tbWVtb3J5
IGtleS12YWx1ZSBzdG9yZSBmb3IgUEhQLgo+ICAKPiAgCSAgaHR0cHM6Ly9wZWNsLnBocC5uZXQv
cGFja2FnZS9BUEN1Cj4gKwo+ICtjb21tZW50ICJwaHAtYXBjdSBuZWVkcyBhIHRvb2xjaGFpbiB3
LyB0aHJlYWRzIgo+ICsJZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUwoKQWNr
ZWQuCgpUaGFua3MsCkhlcnbDqQoKLS0gCkhlcnbDqSBDb2RpbmEsIEJvb3RsaW4KRW1iZWRkZWQg
TGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
