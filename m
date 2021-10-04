Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA89C4332F
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 07:00:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67EC56120F
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 07:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67EC56120F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09F1B42700;
	Mon,  4 Oct 2021 07:00:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LFbViPZU5rSO; Mon,  4 Oct 2021 07:00:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64F3F426FE;
	Mon,  4 Oct 2021 07:00:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4ED0E1BF3BD
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 07:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D0BA84A78
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 07:00:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cvWmbUVOuhEF for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 07:00:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C52684A72
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 07:00:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id AD9FB24000D;
 Mon,  4 Oct 2021 07:00:37 +0000 (UTC)
Date: Mon, 4 Oct 2021 09:00:36 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20211004090036.65722dda@windsurf>
In-Reply-To: <20211004064143.6281-1-jose.pekkarinen@unikie.com>
References: <20211004064143.6281-1-jose.pekkarinen@unikie.com>
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

SGVsbG8sCgpPbiBNb24sICA0IE9jdCAyMDIxIDA5OjQxOjQzICswMzAwCkpvc8OpIFBla2thcmlu
ZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKCj4gK2NvbmZpZyBCUjJfUk9P
VEZTX09WRVJMQVlfUFJFU0VSVkVEX1BFUk1JU1NJT04KPiArCXN0cmluZyAiUHJlc2VydmUgcGVy
bWlzc2lvbnMgb2Ygb3ZlcmxheSBkaXJlY3RvcmllcyIKPiArCWRlcGVuZHMgb24gQlIyX1JPT1RG
U19PVkVSTEFZCj4gKwlkZWZhdWx0ICJuIgo+ICsJaGVscAo+ICsJICBQcmVzZXJ2ZSBmaWxlIHBl
cm1pc3Npb25zIG9mIHNwZWNpZmllZCBvdmVybGF5LgoKSSdtIGFmcmFpZCB3ZSBwcm9iYWJseSB3
b24ndCB3YW50IGFuIG9wdGlvbiBsaWtlIHRoaXMuCgpUaGUgcXVlc3Rpb24gaXMgd2h5IGluIHRo
ZSBleGlzdGluZyBTWVNURU1fUlNZTkMgd2UgZG9uJ3QgcHJlc2VydmUKcGVybWlzc2lvbnM/IEkg
Y2FuIGltYWdpbmUgYmVjYXVzZSBzb21ldGltZXMgdGhleSBjYW4gYmUgd3JvbmcgaW4gdGhlCm9y
aWdpbmFsIG92ZXJsYXksIGZvciBleGFtcGxlIHdpdGggdmVyc2lvbiBjb250cm9sIHN5c3RlbXMg
dGhhdCBwdXQgYWxsCmZpbGVzIHJlYWQtb25seS4KCllhbm4sIEFybm91dDogZG8geW91IHJlbWVt
YmVyIHdoeSBTWVNURU1fUlNZTkMgaGFzIC0tY2htb2Q9dT1yd1gsZ289clggPwoKSm9zw6k6IGhh
dmUgeW91IGNvbnNpZGVyZWQgdXNpbmcgYSBwZXJtaXNzaW9uIHRhYmxlIHRvIGZpeHVwIHRoZQpw
ZXJtaXNzaW9ucyA/CgpCZXN0IHJlZ2FyZHMsCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmks
IGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
