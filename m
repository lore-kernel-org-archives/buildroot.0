Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22D1C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 415F4403F9;
	Sun, 30 Oct 2022 14:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 415F4403F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bcuRNMTlu6pu; Sun, 30 Oct 2022 14:03:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B021403D6;
	Sun, 30 Oct 2022 14:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B021403D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB2061BF489
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B70E181292
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B70E181292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YmBRyL9-Iimp for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:03:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68D3780F2C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68D3780F2C
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:03:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 40A59E0007;
 Sun, 30 Oct 2022 14:03:26 +0000 (UTC)
Date: Sun, 30 Oct 2022 15:03:25 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030150325.41df6969@windsurf>
In-Reply-To: <20221030125554.394467-1-fontaine.fabrice@gmail.com>
References: <20221030125554.394467-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667138606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zUMoQUU5RoHehAg5LV5XNCn1v2omPVsRAcnESTzcJ8s=;
 b=RpyzIlCAtGsg9WnRYVLGwE7WpTbHuyC2FZJ3W93n0n1/gy+kGlcYsFxtoUDBB2ugHrMZgV
 zVUcS2z6kHhhxrDrNTHoMC1eahTDcJ47pcyDz7u3WZocZ2yCdxk2280JmpSYfN0os4qMbM
 mz524UlRaaD2vHfmwR7EQLS98ob71ZNV3mqSJgWYxkRJs+XttSJWf5avPU0moSZ5GiwIja
 X80LBcKQyzR+cUgmfff/y/nX8g/N8bSiL6kpNeXGZn1ljtdcfOqkkomr5ZqA4pVhUFL5hl
 Ngk/9MNBBGLTlFCbSMzrvlQ28DLWjYDGWOQjDcS8VRRWmX+VE5zrrxU6yy2C1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RpyzIlCA
Subject: Re: [Buildroot] [PATCH 1/1] package/dahdi-linux: fix build with
 kernel >= 5.18
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAzMCBPY3QgMjAyMiAxMzo1NTo1NCArMDEwMApGYWJyaWNlIEZvbnRhaW5lIDxmb250
YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEZpeCB0aGUgZm9sbG93aW5nIGJ1aWxk
IGZhaWx1cmUgd2l0aCBrZXJuZWwgPj0gNS4xOCByYWlzZWQgc2luY2UgYnVtcCB0bwo+IHZlcnNp
b24gMy4yLjAgaW4gY29tbWl0IDZjYmZlZDBkYmY0M2M1ZTA0ZTNjYzU0M2I2NDJlM2M5OTZiZmVk
OTc6Cj4gCj4gL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS0wL291dHB1dC0xL2J1
aWxkL2RhaGRpLWxpbnV4LTMuMi4wL2RyaXZlcnMvZGFoZGkvd2N0NHh4cC9iYXNlLmM6IEluIGZ1
bmN0aW9uIOKAmHQ0X2FsbG9jYXRlX2J1ZmZlcnPigJk6Cj4gL2hvbWUvYXV0b2J1aWxkL2F1dG9i
dWlsZC9pbnN0YW5jZS0wL291dHB1dC0xL2J1aWxkL2RhaGRpLWxpbnV4LTMuMi4wL2RyaXZlcnMv
ZGFoZGkvd2N0NHh4cC9iYXNlLmM6Mzg2NDoxNzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9u
IG9mIGZ1bmN0aW9uIOKAmHBjaV9hbGxvY19jb25zaXN0ZW504oCZIFstV2Vycm9yPWltcGxpY2l0
LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAzODY0IHwgICAgICAgICBhbGxvYyA9IHBjaV9hbGxv
Y19jb25zaXN0ZW50KHdjLT5kZXYsIG51bWJ1ZnMgKiBUNF9CQVNFX1NJWkUod2MpICogMiwKPiAg
ICAgICB8ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fgo+IAo+IEZpeGVzOgo+
ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2RkYWNkODA3ZGRkZWIx
NjQ5ZTk1NzI2NGFjNTdiYmEyN2Q5YmI0NjMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZv
bnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiAtLS0KPiAgLi4ubGF0aW9uLWlz
c3Vlcy1vbi1saW51eC1rZXJuZWwtNS0xOC0wLnBhdGNoIHwgNTggKysrKysrKysrKysrKysrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9kYWhkaS1saW51eC8wMDAzLUZpeGVkLWNvbXBpbGF0aW9uLWlzc3Vlcy1vbi1s
aW51eC1rZXJuZWwtNS0xOC0wLnBhdGNoCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKVGhv
bWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
