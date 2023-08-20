Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43201EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 09:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0C6C60B2E;
	Sun, 20 Aug 2023 09:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0C6C60B2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nbUDIw5iqcEY; Sun, 20 Aug 2023 09:14:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4093C60AD0;
	Sun, 20 Aug 2023 09:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4093C60AD0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E72581BF5E6
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 09:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C062781E9C
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 09:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C062781E9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nbs4rZ5oO_1i for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 09:14:37 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B884281E92
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 09:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B884281E92
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:73e4:5f06:f514:c64d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id F2E2C19F59E;
 Sun, 20 Aug 2023 11:14:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Aug 2023 11:14:31 +0200
Date: Sun, 20 Aug 2023 11:14:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Clement Ramirez <ramirez.clement3@gmail.com>
Message-ID: <20230820091431.GG1778688@scaer>
References: <20230818200529.41913-1-ramirez.clement3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230818200529.41913-1-ramirez.clement3@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692522875;
 bh=F5tEkeT6j2h0V4hY74BP3cechfl6j842SakzUuoDK+A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f/bHkXwZhr9q+nBITSFN10X0pmgO7enYhN6Xgehxkiq25yvDu/zbcxJT29OM3D6we
 msDy8KVUyT7XGJcUoGDl9ORpfQ91YWCHvrlOfANMtVVatZiwoRz06txpOUNzNraIIh
 MlmHThGna+SoGtOvtG5TcKEUGuzbcSgzUYqBkMD4LHv9+/j4Vb0OO9nwomQdhGjusy
 ueCTPWlid6pRvgA7XicNMt3jDvPIDGmoWUluXmIxb54xPXvMxNJ3lLPRMNRKMoBC6g
 PV36LTmaU7qQqznv8DCoU9HpkNZcHLMUnsXoiIZhh/fASjqcnfgSpfnbUteuO/00JH
 W/Tx8JcGouryg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f/bHkXwZ
Subject: Re: [Buildroot] [PATCH 0/2] package/connman: fix CVE-2023-28488
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
Cc: Martin Bark <martin@barkynet.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2zDqW1lbnQsIEFsLAoKT24gMjAyMy0wOC0xOCAyMjowNSArMDIwMCwgQ2xlbWVudCBSYW1pcmV6
IHNwYWtlIHRodXNseToKPiBUaGlzIHBhdGNoIHNlcmllcyBpcyBkZXNpZ25lZCB0byBmaXggdGhl
IENWRS0yMDIzLTI4NDg4Ogo+IC0gVGhlIGZpcnN0IGNvbW1pdCBiYWNrcG9ydHMgdGhlIENWRS0y
MDIzLTI4NDg4IHBhdGNoIGZpeCBvbnRvIHRoZSAxLjQxCj4gICBjb25ubWFuIHZlcnNpb24uCj4g
LSBUaGUgc2Vjb25kIGNvbW1pdCBidW1wcyBjb25ubWFuIHRvIDEuNDIgYW5kIHJlbW92ZXMgdGhl
IHByZXZpb3VzCj4gICBkZXByZWNhdGVkIHBhdGNoZXMgdGhhdCBpbnRyb2R1Y2VkIGZpeGVzIG5v
dyBwcmVzZW50IGluIHRoZSAxLjQyLgo+IFRoaXMgd2F5IHRoZSBmaXJzdCBjb21taXQgY2FuIGJl
IHVzZWQgdG8gZml4IHRoZSBDVkUgaW4gTFRTIHJlbGVhc2VzLAo+IGFuZCB0aGUgc2Vjb25kIG9u
ZSBmb3IgZnV0dXJlIHJlbGVhc2VzIG9mIEJ1aWxkcm9vdC4KClNpbmNlIHRoZSBvbGRlc3QgbWFp
bnRlbmFuY2UgYnJhbmNoIHdlIGhhdmUgYWxyZWFkeSB1c2VzIGNvbm5tYW4gMS40MSwKd2UgY2Fu
IGp1c3QgYmFja3BvcnQgdGhlIHZlcnNpb24gYnVtcCB0byBnZXQgYWxsIHRoZSBzZWN1cml0eSBm
aXhlcy4KClNvIEkgc3F1YXNoZWQgdGhlIHR3byBjb21taXRzIG9nZXRoZXIsCgpBcHBsaWVkIHRv
IG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gQ2xlbWVudCBSYW1p
cmV6ICgyKToKPiAgIHBhY2thZ2UvY29ubm1hbjogZml4IENWRS0yMDIzLTI4NDg4Cj4gICBwYWNr
YWdlL2Nvbm5tYW46IHNlY3VyaXR5IGJ1bXAgdmVyc2lvbiB0byAxLjQyCj4gCj4gIC5jaGVja3Bh
Y2thZ2VpZ25vcmUgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyAtCj4gIC4uLi1nd2Vi
LUZpeC1PT0Itd3JpdGUtaW4tcmVjZWl2ZWRfZGF0YS5wYXRjaCB8ICAzNiAtLS0tCj4gIC4uLi1y
ZWZlcmVuY2UtY291bnRlci10by1wb3J0YWwtY29udGV4dC5wYXRjaCB8IDE0MiAtLS0tLS0tLS0t
LS0tLQo+ICAuLi5zcHItVXBkYXRlLXBvcnRhbC1jb250ZXh0LXJlZmVyZW5jZXMucGF0Y2ggfCAx
NzUgLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHBhY2thZ2UvY29ubm1hbi9jb25ubWFuLmhhc2ggICAg
ICAgICAgICAgICAgICB8ICAgMiArLQo+ICBwYWNrYWdlL2Nvbm5tYW4vY29ubm1hbi5tayAgICAg
ICAgICAgICAgICAgICAgfCAgIDkgKy0KPiAgNiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDM2NSBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvY29ubm1h
bi8wMDAxLWd3ZWItRml4LU9PQi13cml0ZS1pbi1yZWNlaXZlZF9kYXRhLnBhdGNoCj4gIGRlbGV0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Nvbm5tYW4vMDAwMi13aXNwci1BZGQtcmVmZXJlbmNlLWNv
dW50ZXItdG8tcG9ydGFsLWNvbnRleHQucGF0Y2gKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvY29ubm1hbi8wMDAzLXdpc3ByLVVwZGF0ZS1wb3J0YWwtY29udGV4dC1yZWZlcmVuY2VzLnBh
dGNoCj4gCj4gLS0gCj4gMi4zNC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklO
ICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3Bp
cmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1Q
QUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0t
LS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8
IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAg
fCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
