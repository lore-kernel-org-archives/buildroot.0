Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656D5D2444F
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 20:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC2A160BDB;
	Thu, 10 Oct 2024 20:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D15oNfWMbjrA; Thu, 10 Oct 2024 20:35:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7B1360A4B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7B1360A4B;
	Thu, 10 Oct 2024 20:35:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2815A1BF307
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 20:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15DB7412A8
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 20:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhMTXvwlRCwz for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 20:35:17 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=81.169.146.216; helo=mo4-p00-ob.smtp.rzone.de;
 envelope-from=nerv@dawncrow.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2CE0E4121C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CE0E4121C
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.216])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CE0E4121C
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 20:35:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728592512; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=YtF4crLrVs5LqWqTsMlpX/WJZb98gGnkKP6YoT+l/HfKRPlhq+RNW4EppvxCsom2gh
 3363QDHbYIxSkbSVRBxo5MlEz9wN0lyRzz9mijPiTPtz9rGaW6iF19ppdNn912FD7WL6
 bJt4I6U7bCwAraANRtTkioRo3qBTDRILQI8Qt4QyB0bVJCq77VCDX/1pFjYXhz/4u8mc
 ptRPg/BwAfdLsgFQQdJdSsyq+5spbFIFrrWr/ZV2LJvgtNGMJc+8DmRuC0pX8wQ9lU4q
 XsVJxRRt/QOxi5REmam42+hPcd406nsHWqEMbq7Gl9S/oRbtZiKLrS9wxMvuUHgN/rWL
 NHVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728592512;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Cc:From:References:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=fc8GLIdo2Ye/zYcBoQ61wk33a12wDXuADHrXSuvJhhA=;
 b=shmxQTWCkKsk92Yu72tLQYWVD7u4WwSHDUJhvp4/9hopoAgMeyNYDoVffjjKKhnRL/
 gMA4bmItA97vLT2J2BqIns422e+0QRVd2waWS1m/jZSNgBQdgmkrbJWRAbXibEXO5Rgo
 FScheTmQnBN5avNMDsvkV0BtDFYB8qNhxEttqPeJLQeucLSA0e5adSCHBih68K2SSGvm
 vGq5CNWa50FVPGoZ9zHcUqzh69JqaMxT/JPz6yYP+mF57L9KRYGerxhA5OmMpKe3enYG
 x3n67+IzGf6A+NN4GxJ1JCKYwRtdJgFWzOCAzeXfdiBGv4jWGd/jvSnaEK8Mr1geYRZO
 4Gwg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzY2Fi46ptduc1rEC09lTNV2vVUqpUaM="
Received: from [192.168.178.46] by smtp.strato.de (RZmta 51.2.11 DYNA|AUTH)
 with ESMTPSA id jd20c009AKZC1RF
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 10 Oct 2024 22:35:12 +0200 (CEST)
Message-ID: <140e6e19-1203-44bc-acef-30413fc65a22@dawncrow.de>
Date: Thu, 10 Oct 2024 22:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241009213719.49469-1-ju.o@free.fr>
 <ff5c88fb-c745-483c-9f8e-8aa49164e76b@dawncrow.de>
 <7600b20432d4e3749dca9f5300bc8df4@free.fr>
Content-Language: en-US
In-Reply-To: <7600b20432d4e3749dca9f5300bc8df4@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1728592512; 
 s=strato-dkim-0002; d=dawncrow.de;
 h=In-Reply-To:Cc:From:References:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=fc8GLIdo2Ye/zYcBoQ61wk33a12wDXuADHrXSuvJhhA=;
 b=JcF0FfiND94hip7sRvI4SBwm4kggvNbq9x/LHGMj9xmYlG27xx6GfdD/67zwhWeQW1
 IAtjO22Csgnv6pc7I6EWa9lK2WUYg55uFzMXz2aq5O3lWDxg8jCvPwKOO+b1n+Ea3Ats
 pm+1ohfCukc55FVwiS5kjMptfXyfD00iqI9DONHm84DPv51ZGNNpDYWTYGtyz7hCoXlv
 oROKu/cSl2pK7WQ0XyHWPVFzKTp6HLX+ZVKLiV3dx6nFYEACdcY6ui7Wgc3quYxMP8aL
 UUNUEuiCr6rJcGH/dN+ioG3Ju9gS9Ild72gGSroaY0Fuj+dZOKzTXYRsfNmj56rzsqpF
 Okpg==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1728592512; 
 s=strato-dkim-0003; d=dawncrow.de;
 h=In-Reply-To:Cc:From:References:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=fc8GLIdo2Ye/zYcBoQ61wk33a12wDXuADHrXSuvJhhA=;
 b=vqjE+1yORpTphN7U3wQNbyAHCjXpg9dtPsY40f0s7LSDbhU3VlNo+aZabz65CegUsc
 3fcfZD94D6n36aNeWBDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=dawncrow.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=dawncrow.de
 header.i=@dawncrow.de header.a=rsa-sha256 header.s=strato-dkim-0002
 header.b=JcF0FfiN; 
 dkim=pass header.d=dawncrow.de header.i=@dawncrow.de header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=vqjE+1yO
Subject: Re: [Buildroot] [PATCH 1/1] package/wine: bump to version 9.19
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
From: =?utf-8?q?Andr=C3=A9_Zwing_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?Q?Andr=C3=A9_Zwing?= <nerv@dawncrow.de>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMTAuMTAuMjQgdW0gMjE6Mjcgc2NocmllYiBKdWxpZW4gT2xpdmFpbjoKPiBIaSBBbmRyw6ks
IFRob21hcywKPiAKPiBPbiAxMC8xMC8yMDI0IDE3OjM5LCBBbmRyw6kgWndpbmcgd3JvdGU6Cj4+
Cj4+IEhpIEp1bGllbiwKPj4KPj4gSUlSQyB3ZSBhZ3JlZWQgYXQgc29tZSBwb2ludCB0byBvbmx5
IHVzZSBzdGFibGUgdmVyc2lvbnMgKGUuZy4gOS4wKSBpbiBidWlsZHJvb3QuIEFuZCB5ZXMsIEkg
aGF2ZW4ndCBkb25lIHRoYXQgeWV0IHRoaXMgeWVhci4KPj4gU28sIHBsZWFzZSBjb25zaWRlciBh
ZGRpbmcgOS4wIGluc3RlYWQuCj4gCj4gU29ycnksIEkgd2FzIG5vdCBhd2FyZSBvZiB0aGlzIHJl
Y29tbWVuZGF0aW9uLgo+IAo+IEkgdGhpbmsgd2Ugc2hvdWxkIGFkZCBhIGNvbW1lbnQgdG8gcHJl
ZmVyIHN0YWJsZSByZWxlYXNlcyBiZWZvcmUKPiBXSU5FX1ZFUlNJT04uIElkZWFsbHksIHdpdGgg
YSBsaW5rIHRvIHRoZSBkaXNjdXNzaW9uLiBUaGUgbmVhcmVzdAo+IHJlZmVyZW5jZSBJIGNvdWxk
IGZpbmQgbm93IGlzOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWls
ZHJvb3QvcGF0Y2gvMjAyMDA3MTMyMDI3NTguMTQwODEtMS1oZWlrby50aGllcnlAZ21haWwuY29t
LyMyNTY1MjU5Cj4gCj4gRG8geW91IGhhdmUgYSBiZXR0ZXIgcmVmZXJlbmNlPwo+IAo+IFNpbmNl
IFRob21hcyBoYXMgYWxyZWFkeSBtZXJnZWQgdGhpcyBjb21taXQgaW4KPiBodHRwczovL2dpdGxh
Yi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvN2NiNDllNzcxMjcwYTBlY2Jl
NjUxZTQwYWRjNGI5NjYwZWE4YWU4Ygo+IHdlIGNhbiBlaXRoZXI6Cj4gCj4gMS4gd2FpdCBhIGJp
dCB1bnRpbCB0aGUgbmV4dCBzdGFibGUgMTAuMCBpcyByZWxlYXNlZD8gU2luY2UgdGhpcwo+IGJ1
bXAgaXMgOS4xOSwgd2Ugc2hvdWxkIG5vdCBiZSB0aGF0IGZhciBmcm9tIGl0LiBJdCBtaWdodCBo
YXBwZW4KPiBhZnRlciB0aGUgbmV4dCBCdWlsZHJvb3QgMjAyNC4xMSB0YWcsIHRob3VnaC4KPiAK
PiAyLiBJIGNhbiBzZW5kIGEgcGF0Y2ggbm93IGRvd25ncmFkaW5nIHRvIDkuMC4KPiAKPiB3aGF0
IGRvIHlvdSByZWNvbW1lbmQgdG8gZG8/Cj4gCj4gVW5sZXNzIHRoZXJlIGlzIG1ham9yIGlzc3Vl
cyB3aXRoIHRoaXMgdGhpcyA5LjE5LCBJJ20gbGVhbmluZyB0b3dhcmQgb3B0aW9uICMxLgoKSSdk
IGFsc28gc2F5IE9wdGlvbiAxLiBBbmQgZm9yIG1lIHRoZXJlJ3Mgbm8gcG9pbnQgaW4gc3RpY2tp
bmcgdG8gdGhlIHN0YWJsZSByZWxlYXNlLiBPVE9IIHdpdGggdGhlIGRldmVsb3BtZW50IHJlbGVh
c2VzIGl0IHdvdWxkIHRoZW4gYmUgYmVzdCB0byB1cGRhdGUgZXZlcnkgMiB3ZWVrcywgd2hpY2gg
c2VlbXMgbGlrZSBhIGJpdCB0b28gbXVjaCBlZmZvcnQgZm9yIGEgcGFja2FnZSB0aGF0IGlzbid0
IHdpZGVseSB1c2VkLgpXb3VsZCBiZSBuaWNlIHRvIHJhdGhlciBoYXZlIFsxXSBpbiBidWlsZHJv
b3QsIGF0IGxlYXN0IGZvciBBUk02NCAoYW5kIG1heWJlIFJJU0NWKSB0YXJnZXRzLCBidXQgaXQg
cmVxdWlyZXMgbGx2bS1taW5ndyB0b29sY2hhaW4gYW5kIEknbSBub3Qgc3VyZSB3ZSB3YW50IHRv
IHN1cHBvcnQgdGhpcyBpbiBidWlsZHJvb3QuCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL0FuZHJl
UkgvaGFuZ292ZXIvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
