Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D56C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 18:17:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DC91617E1
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 18:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DC91617E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBD33844AA;
	Fri,  1 Oct 2021 18:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3O6wJLFcUqPf; Fri,  1 Oct 2021 18:17:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3022B8444F;
	Fri,  1 Oct 2021 18:17:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1D8F1BF2B0
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 18:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91C0C4261B
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 18:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id egwzDwc73_Wn for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 18:17:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC8F24261A
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 18:17:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8d50:f2f3:e895:2016])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 14BB05FFA3;
 Fri,  1 Oct 2021 20:17:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633112240;
 bh=g83L24oyoJzvXA2aH09Xx6UImonwOMEVTaJnBble+Qc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PfK9rTdQD7Ba7UCXKuRb0WlMljttxfMZLVQ8ek9SxTOy5hdkF6waOF30rCgz4Ano8
 8sceVG97oeKySwfBcGP1CJtykWas0Pvbf9wPIU0zRkhEbMnLUZW7Y9SaGrqBDO0NXS
 zW5i1XxoTTQCUnZ/sB3UVIp0xg9MpXJahgXLUi9QvovXSNUT1x88UfuwnypbnaF4gS
 u8XBrrelAuGfroiGhOp3PClown89b5kANU5fPg3IpwP0BZ9hIB5GTQNrDZnKum8blT
 0BXYk3xfnoO24Rn3GpZb/H5kRabyt313//P753Cnox33D8uBmyM+NQfZUK1AigQG9V
 lP9sRMGsTg7nQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 01 Oct 2021 20:17:10 +0200
Date: Fri, 1 Oct 2021 20:17:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Markus Mayer <mmayer@broadcom.com>
Message-ID: <20211001181710.GW1504958@scaer>
References: <20210928195533.1736944-1-mmayer@broadcom.com>
 <a87c586e-1e73-a3e3-7722-c56e48809d76@mind.be>
 <YVTIghzHs82uFBIe@pevik>
 <20211001175329.GA1973888@lbrmn-mmayer.ric.broadcom.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211001175329.GA1973888@lbrmn-mmayer.ric.broadcom.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 0/1] Build issue related to "command -v"
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
Cc: David Laight <David.Laight@aculab.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWFya3VzLCBBbGwsCgpPbiAyMDIxLTEwLTAxIDEwOjUzIC0wNzAwLCBNYXJrdXMgTWF5ZXIgdmlh
IGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gT24gV2VkLCBTZXAgMjksIDIwMjEgYXQgMTA6MTE6
NDZQTSArMDIwMCwgUGV0ciBWb3JlbCB3cm90ZToKPiA+IEhpIE1hcmt1cywgQXJub3V0LCBhbGws
Cj4gPiA+ICBUaGFuayB5b3UgZm9yIHRoaXMgZXh0ZW5zaXZlIGludmVzdGlnYXRpb24hCgpZZXMs
IHRoYW5rcyBmb3IgdGhlIGludmVzdGlnYXRpb24gYW5kIHRoZSBleHRlbnNpdmUgZmVlZGJhY2su
IPCfkY0KCj4gWW91IGFyZSB3ZWxjb21lLiBJdCB3YXMgYW4gaW50ZXJlc3Rpbmcgb25lIGFzIHlv
dSBjYW4gcHJvYmFibHkKPiBpbWFnaW5lLiA6LSkKClllcywgSSBjYW4gLiA7LSkKCj4gPiA+IE9u
IDI4LzA5LzIwMjEgMjE6NTUsIE1hcmt1cyBNYXllciB3cm90ZToKPiA+ID4gPiBBZnRlciBjb21t
aXQgY2E2YTI5MDdjMjdjWzFdLCBvdXIgYXV0b21hdGVkIG5pZ2h0bHkgYnVpbGRzCj4gPiA+ID4g
c3RhcnRlZCBleHBlcmllbmNpbmcgYnVpbGQgZmFpbHVyZXMuCgpJJ3ZlIGp1c3QgcmV2ZXJ0ZWQg
dGhlIHR3byBjb21taXRzLCBiZWNhdXNlIHRoZSBjaGFuZ2Ugd2FzIHJhaXNpbmcgYSBmZXcKb3Ro
ZXIgaXNzdWVzOgogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjExMDAx
MTgwMzA0LkdWMTUwNDk1OEBzY2Flci9ULyNtM2E4ZjM2YmQ3NmVjN2Q4ZTUwMzhhNmM4OTMyYmI2
ZmZlMjNlYTI2OAoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJ
SSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3
YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8
ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAg
fCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBf
LypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
