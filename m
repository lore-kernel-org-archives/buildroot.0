Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF88C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 18:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30D9E826F5;
	Sat, 14 May 2022 18:58:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id esc1dAyA6AoF; Sat, 14 May 2022 18:58:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F43381D47;
	Sat, 14 May 2022 18:58:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28E081BF584
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 18:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17287606F5
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 18:58:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NLUQ6zf76K8q for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 18:58:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF7E860011
 for <buildroot@buildroot.org>; Sat, 14 May 2022 18:58:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1949:2e37:e3d5:26d2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C5E9E5FF7A;
 Sat, 14 May 2022 20:58:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652554718;
 bh=b3m0hkZLBRure/8yloHdjwn79q/5Yy4T+4+vhbrK7Gs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a+IxGq1xPLv4rib7omzbpRMGdqepKCm3nBc8RKeyXwNFUSQCdNfnucryQ1Yq7ggUV
 Gyi20vJPrJcAM2TXQHTdACOc0XvlVvmE2zzNuDg+XRIQ5iNcvWxfrtTNnuWOlw0aNz
 k+js6cTow/vrcawuIqNrmvoPJeyin8++gAO6XvPDgHkuS7CxFU7/3I/koZy9i3H310
 1XGQKMEku6djNemaAHBt3tHJHJGcL0dOO3IxtQI0vKIkONEtOJ+QOGnhsUF/rat7H1
 Okbv26l9OPXo6WDd+dyqB2JnWU9Bl1yUV3/qxjQ6wV7mZcGajnLRpyWNYku81uW+Hk
 RPqI4XBNdnUIA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 May 2022 20:58:34 +0200
Date: Sat, 14 May 2022 20:58:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220514185834.GA1597494@scaer>
References: <20220514092152.1625466-1-fontaine.fabrice@gmail.com>
 <20220514133641.GZ1597494@scaer>
 <CAPi7W83wx+D5gYHKUtdS5abrYh-z-5h8QBe41pDnPrnCFK_HOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W83wx+D5gYHKUtdS5abrYh-z-5h8QBe41pDnPrnCFK_HOQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/v4l2loopback: add
 V4L2LOOPBACK_LINUX_CONFIG_FIXUPS
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
Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmFicmljZSwgQWxsLAoKT24gMjAyMi0wNS0xNCAxNTo0NyArMDIwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gTGUgc2FtLiAxNCBtYWkgMjAyMiDDoCAxNTozNiwgWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IGEgw6ljcml0IDoKPiA+IE9uIDIwMjItMDUt
MTQgMTE6MjEgKzAyMDAsIEZhYnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5OgpbLS1TTklQLS1d
Cj4gPiA+ICsgICAgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX1ZJREVPX0RFVikK
PiA+IFRoYXQgb25lIGFsc28gZGVwZW5kcyBvbiBDT05GSUdfSTJDICh3aGljaCBoYXMgbm8gZGVw
ZW5kZW5jeSkuCj4gCj4gVGhhbmtzIGZvciB5b3VyIHJldmlldyBidXQgSSB3YXNuJ3QgYWJsZSB0
byBmaW5kIHRoZSBDT05GSUdfSTJDCj4gZGVwZW5kZW5jeSBpbiBrZXJuZWwgNS4xNy43Lgo+IEhl
cmUgaXMgYW4gZXh0cmFjdCBvZiBkcml2ZXJzL21lZGlhL0tjb25maWc6Cj4gCj4gY29uZmlnIFZJ
REVPX0RFVgo+ICAgICB0cmlzdGF0ZSAiVmlkZW80TGludXggY29yZSIKPiAgICAgZGVmYXVsdCBN
RURJQV9DQU1FUkFfU1VQUE9SVCB8fCBNRURJQV9BTkFMT0dfVFZfU1VQUE9SVCB8fAo+IE1FRElB
X1JBRElPX1NVUFBPUlQgfHwgTUVESUFfU0RSX1NVUFBPUlQgfHwgTUVESUFfUExBVEZPUk1fU1VQ
UE9SVCB8fAo+IE1FRElBX1RFU1RfU1VQUE9SVAoKQWgsIHRoYXQncyBjb21taXQgOTk1OGQzMGYz
OGI5NmYsIHdoaWNoIGlzIGdvaW5nIHRvIGJlIHBhcnQgb2YgNS4xOC4KClJlZ2FyZHMsCllhbm4g
RS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAg
fCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJh
Y3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJ
R04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0t
LS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBo
dHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwg
ICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
