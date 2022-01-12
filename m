Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A80C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 11:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E0FA84B33;
	Wed, 12 Jan 2022 11:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hN7KxSdHhjnb; Wed, 12 Jan 2022 11:04:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE9BD84B32;
	Wed, 12 Jan 2022 11:04:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7B291BF82F
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 11:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1E03605EA
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 11:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n6p414zmgcgk for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 11:04:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D0556FB8B
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 11:04:43 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id h23so3011849iol.11
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 03:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eA3s381t5BAZUmNbMLS+jVA2MJjb4F0lX2P2O1TW+p8=;
 b=cKnhNVE3Sp8EMOI9qvR955kHNZ35uhIROk7mB0Ay/c9nXuXmn9vkrwoZx4UVPca6Uc
 xdn9LCm0EfLUHYWEihwRrLmnrU9K7t8oh0yWIfwjTZkblX8vjyOdLVCcEBh504VOPt2M
 I6/IuS0qUmZrOH2C41NaXxcdGw8rUGUyDguWm89qFJShgVBor9J7KTm9hsGwwtiYBCE6
 yfx3e1xuUSM6EVsZKXe/JX2AGNy/Xc7h6RMfG4pcoYXCFIV2bzQpr5nEwhcZEangzMrd
 pZXN/jt13m7fpv677GjFh+AFiUPkVGvzkpkmBKvWOlD9Dp5Bx9XxP3hyQ0LP1zFRwaQQ
 RVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eA3s381t5BAZUmNbMLS+jVA2MJjb4F0lX2P2O1TW+p8=;
 b=uinJ+fMGDh0+FL/8lDPx4E7rtdFex7Ox3doJxVLamIJ6QZyXPFnS6tLVdOuz9PdQs4
 gn/9VxlggMVIpFjfki9H9B4GzPvcojdhYhpFuMIT+4Qpk2dRvyJt+GYZkD+NTiggpybI
 1OwoTdv2a+/LHpdZ4SXOWNLXoyIWeZ9qdr9bZjelp1IiwGAlOGyKGeQD5ESfiqKMG5+m
 Fz38Vqpgby4u7WAv4OnB+8GwpxZqw1UMuj5TdCSb836ig0tu3mJz7m22K2Y7saduAJlA
 PhW1LOtX0QEQIWLVBk+BDhZkBrCK6Ry++wo3BsqbbUziQOT+3hZXtSxsYcfZwDa/8uN4
 ZNPQ==
X-Gm-Message-State: AOAM532vpam1vY3LMGrfx2S2hzzWK+ejgUqcxAWw7aEE1hzZP0+0xyGE
 +wqaHW/cal7qVsBQGmZzFVhJ5M3PFC1Jdkxza/sDx3WQLSI=
X-Google-Smtp-Source: ABdhPJzLtMVCLOpgmMczgAu7pCByy4Jq15oHHaRuosBKqP5cv9dikJ97uNX1SsZWYhS96+A71Jvn5KeSiGdMwddyb+k=
X-Received: by 2002:a6b:1545:: with SMTP id 66mr2595823iov.62.1641985482567;
 Wed, 12 Jan 2022 03:04:42 -0800 (PST)
MIME-Version: 1.0
References: <20210518113652.29609-1-patrickdepinguin@gmail.com>
 <20210518113652.29609-4-patrickdepinguin@gmail.com>
 <5269b781-3bed-9b6c-9a4f-2d077964a16e@smile.fr>
In-Reply-To: <5269b781-3bed-9b6c-9a4f-2d077964a16e@smile.fr>
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 12 Jan 2022 12:04:31 +0100
Message-ID: <CAAXf6LVZ38y=7X2YzN9WoC-0N940D2WGUFP54aRhT4FebTkfnA@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 3/4] core: introduce BR2_KERNEL_ARCH_OVERRIDE
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKRWwgbHVuLCAxMCBlbmUgMjAyMiBhIGxhcyAwOjI3LCBSb21haW4gTmFvdXIg
KDxyb21haW4ubmFvdXJAc21pbGUuZnI+KSBlc2NyaWJpw7M6Cj4KPiBIZWxsbyBUaG9tYXMsCj4K
PiBMZSAxOC8wNS8yMDIxIMOgIDEzOjM2LCBUaG9tYXMgRGUgU2NoYW1waGVsZWlyZSBhIMOpY3Jp
dCA6Cj4gPiBGcm9tOiBUaG9tYXMgRGUgU2NoYW1waGVsZWlyZSA8dGhvbWFzLmRlX3NjaGFtcGhl
bGVpcmVAbm9raWEuY29tPgo+ID4KPiA+IFRoZXJlIGFyZSBjYXNlcyB3aGVyZSBhIDY0LWJpdCBh
cmNoaXRlY3R1cmUgaXMgcnVubmluZyBhIDY0LWJpdCBrZXJuZWwgYnV0Cj4gPiAzMi1iaXQgdXNl
cnNwYWNlLiBFeGFtcGxlcyBpbmNsdWRlOgo+ID4gICAgICogYWFyY2g2NCBhcmNoaXRlY3R1cmUs
IHdpdGggYWFyY2g2NCBrZXJuZWwgYW5kIDMyLWJpdCAoQVJNKSB1c2Vyc3BhY2UKPiA+ICAgICAq
IHg4Nl82NCBhcmNoaXRlY3R1cmUsIHdpdGggeDg2XzY0IGtlcm5lbCBhbmQgMzItYml0IChpMzg2
KSB1c2Vyc3BhY2UKPgo+IENhbiB5b3UgcHJvdmlkZSBhIG5ldyBxZW11IGRlZmNvbmZpZyB0aGF0
IGNvdmVyIHRoaXMgdXNlIGNhc2U/Cj4gVGhpcyBpcyBmb3IgZ2l0bGFiLWNpIHJ1bnRpbWUgdGVz
dGluZy4KPgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPgo+IFBTOiAoVGhpcyBlbWFpbCBkb2Vz
bid0IGNvdW50IGFzIGEgcmV2aWV3IG9mIHRoaXMgc2VyaWVzIDopKQoKClRoYW5rcyBmb3IgeW91
ciBpbnRlcmVzdCBpbiB0aGlzIHNlcmllcyA6LSkKCkN1cnJlbnRseSB0aGUgcWVtdSBkZWZjb25m
aWcgdGhhdCBJIHVzZSB1c2VzIGFuIGV4dGVybmFsIHRvb2xjaGFpbgpidWlsdCB2aWEgY3Jvc3N0
b29sLW5nLiBDcm9zc3Rvb2wtbmcgaXMgY2FwYWJsZSBvZiBjcmVhdGluZyBhIG11bHRpbGliCnRv
b2xjaGFpbiBzdXBwb3J0aW5nIDMyLWJpdCBhbmQgNjQtYml0IGJpbmFyaWVzLgpIb3dldmVyLCBC
dWlsZHJvb3QgZG9lcyBub3QgY3VycmVudGx5IHN1cHBvcnQgdGhpcyBmb3IgaW50ZXJuYWwKdG9v
bGNoYWlucy4gSG93IGRvIHlvdSBzdWdnZXN0IHRvIHByb2NlZWQgaGVyZT8KQ291bGQgd2UgcGVy
aGFwcyBhZGQgYSBjcm9zc3Rvb2wtbmctYnVpbHQgbXVsdGlsaWIgdG9vbGNoYWluIHRvIHRoZQpC
b290bGluIHRvb2xjaGFpbnM/CgpUaGFua3MsClRob21hcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
