Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F42C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 10:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D6C581EBC;
	Fri, 23 Aug 2024 10:21:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7-N7ERGjOeJ; Fri, 23 Aug 2024 10:21:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67DFA81EBF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67DFA81EBF;
	Fri, 23 Aug 2024 10:21:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24A001BF304
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 10:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB10581EC4
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 10:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n6fLHXRA2DXW for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 10:21:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5623381EC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5623381EC1
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5623381EC1
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 10:21:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([176.6.60.93]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnakX-1sIWfW0Vfx-00olzY; Fri, 23
 Aug 2024 12:21:15 +0200
Date: Fri, 23 Aug 2024 12:21:14 +0200
To: yann.morin@orange.com
Message-ID: <ZshimpK2XIe1RIb6@probook>
References: <20240719-ztext-v5-1-ec46696d4ed9@gmx.net>
 <ZrsirnrvgsEIpAJI@tl-lnx-nyma7486-2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZrsirnrvgsEIpAJI@tl-lnx-nyma7486-2>
X-Provags-ID: V03:K1:vRhDhQoXhbcH+IQXZq3hfRShPnPkxV+HMOJUQxD5bsXo9KqzeeM
 Y/NfIjml/cdBbmlTJQy4GeG4qF6lhIW+OYOIiLwfsi0bjFuo8+1+IgK+wnuqagTemwjM6R5
 LfSTeo9wLFbb5BctfkDdJfXQofrsrSyqU46kG24FFVz6O2pnUOC1O6n7Ev+R7BkRjReFQfb
 +dnbL7xRRLueZpXpRjOag==
UI-OutboundReport: notjunk:1;M01:P0:oMTQbKKU6ak=;UnNjygoW7vDo2uGN4o+g9TTjmMU
 UJ92SQbEOpur4yacZDx/X6Oe4WtqLbVjcO548WZ8vLb+RDX30pjDUINWSgquhANqKVZu5k/db
 VezAb9t/rAqXlrjVop41j365TFi+woEJbRnNTQvopy+oCji0XUFYISxTV+tZAi5e8CysmqCM5
 gOjLOWQQam9JKWQ9Sv1Nonrcd+dDfav8KTEF9BLmi4U+2jAwXmz0ucMLxjQ4jTsQOXuen3NgI
 o96mCUi7I0fZOD2H1pWrZDoNMPeWAlR9nEJDZszg3C6v3IP3PKVzhZPgVBOE0XhSFrCN65cMO
 zh+q9/R5S3LO348F++V5+p8ivUqFsoVGfFlJCi0uKU2O2xZ9JrSplSxwE6G6X95JBwZN/MegO
 CgpTejyWhq7xP7xR9VFHfsGMG0cf34HyCRo09MRGSP/8cH+nvLQbBazUmg4rM5O5FPfjxgC4z
 4+E8ES6vTG3TQ+eCWYwiVoXr/+7kxvehl8WU5FOYBz//5vc1K0zRN/gskEQnxHDl+CsiBKPjW
 qYNgESyXdicTXsTaixoNS2tI0amcvdVNdBxm+8b6xG1wT8Y19Qn+IKJCYgAMwi+5WCv3rPWej
 q8KeZS3FGAx/itcHuPC1sjHUdjRDbfpP6JFwXtU027Q0F+2hr1HgabdrfMyW6UVcM1mlJr4DZ
 s6cGgM3Qn622FTmFUDNIGiu/M41zSycM5IiJkmHA9AveX/UvP6ufiteRT/X2vASrMqNRkWj8a
 b2Gf9DN5ynt09mkgPwlaiEyvG1Hecv8cMjrMh2iZkTocaojAm/YjqRJBGDkkB8Pjogx+b+Lt2
 V6P8duMtpncXKQElm3PEBBOQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1724408475; x=1725013275; i=j.neuschaefer@gmx.net;
 bh=LrXwvAQSKjg/2yk4TvTqYv2YEdy7eLsl51BYxcuqXe8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=iNr/ElgjsaEkdh2JSZZY/f+y2O1ofSBIuDHWhBbJCJrJCVMeNtnAodRTeAjwFs8f
 J51Q+pp1UBN7mODoCRVPV5A2SfbFm7ZD92j9ooAdac6Gn7nMhQ50L2PAnVP2b4ApE
 mBddA6drwL35MlCyglNShdrp3IOjUqgXaRLscSUcH+31MSG5q9hQ/mHal6lSNZvH7
 gcZYsGnVGwbotnL6KHHGX6MVMONi3hDc2UurhGO2IwPfWuZiog18Fy7xs7wWIPuyM
 xV0CllDxRxi/4fQMeOkoDAh0i8v0vjpvjEiERa/Q6ae+WpWDdGRgwdM5bKDy+VSYL
 yodLXBLsePsNSTqu7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=iNr/Elgj
Subject: Re: [Buildroot] [PATCH v5] Config.in: ban textrels on musl
 toolchains
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Bernd Kuhls <bernd@kuhls.net>,
 =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 David du Colombier <0intro@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBBdWcgMTMsIDIwMjQgYXQgMTE6MDk6MDJBTSArMDIwMCwgeWFubi5tb3JpbkBvcmFu
Z2UuY29tIHdyb3RlOgo+IEouLCBBbGwsCj4KPiArQmVybmQgYW5kICtEYXZpZCBmb3IgeDI2NDoK
Pgo+IE9uIDIwMjQtMDctMTkgMTc6MjcgKzAyMDAsIEouIE5ldXNjaMOkZmVyIHZpYSBidWlsZHJv
b3Qgc3Bha2UgdGh1c2x5Ogo+ID4gVGhpcyBwYXRjaCBmb3JiaWRzIHRoZSB1c2Ugb2YgVEVYVFJF
THMgb24gbXVzbCB0b29sY2hhaW5zIHdpdGggZHluYW1pYwo+ID4gbGlua2luZy4KPgo+IEFub3Ro
ZXIgYnVpbGQgZmFpbHVyZSBkdWUgdG8gdGhpcyBjaGFuZ2U6Cj4KPiAgICAgWy4uLl0vYnVpbGRy
b290L291dHB1dC9wZXItcGFja2FnZS94MjY0L2hvc3QvYmluLy4uL2xpYi9nY2MvaTU4Ni1idWls
ZHJvb3QtbGludXgtbXVzbC8xMi40LjAvLi4vLi4vLi4vLi4vaTU4Ni1idWlsZHJvb3QtbGludXgt
bXVzbC9iaW4vbGQ6IGNvbW1vbi94ODYvZGN0LWEtOC5vOiB3YXJuaW5nOiByZWxvY2F0aW9uIGlu
IHJlYWQtb25seSBzZWN0aW9uIGAudGV4dCcKPiAgICAgWy4uLl0vYnVpbGRyb290L291dHB1dC9w
ZXItcGFja2FnZS94MjY0L2hvc3QvYmluL2k1ODYtYnVpbGRyb290LWxpbnV4LW11c2wtZ2NjLXJh
bmxpYiBsaWJ4MjY0LmEKPiAgICAgWy4uLl0vYnVpbGRyb290L291dHB1dC9wZXItcGFja2FnZS94
MjY0L2hvc3QvYmluLy4uL2xpYi9nY2MvaTU4Ni1idWlsZHJvb3QtbGludXgtbXVzbC8xMi40LjAv
Li4vLi4vLi4vLi4vaTU4Ni1idWlsZHJvb3QtbGludXgtbXVzbC9iaW4vbGQ6IHJlYWQtb25seSBz
ZWdtZW50IGhhcyBkeW5hbWljIHJlbG9jYXRpb25zCj4gICAgIGNvbGxlY3QyOiBlcnJvcjogbGQg
cmV0dXJuZWQgMSBleGl0IHN0YXR1cwo+ICAgICBtYWtlWzJdOiAqKiogW01ha2VmaWxlOjI1MTog
bGlieDI2NC5zby4xNjRdIEVycm9yIDEKPiAgICAgbWFrZVsyXTogKioqIFdhaXRpbmcgZm9yIHVu
ZmluaXNoZWQgam9icy4uLi4KPiAgICAgbWFrZVsxXTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmlj
Lm1rOjI4OTogWy4uLl0vYnVpbGRyb290L291dHB1dC9idWlsZC94MjY0LWJhZWU0MDBmYTljZWQ2
ZjU0ODFhNzI4MTM4ZmVkNmU4NjdiMGZmN2YvLnN0YW1wX2J1aWx0XSBFcnJvciAyCj4gICAgIG1h
a2U6ICoqKiBbTWFrZWZpbGU6ODM6IF9hbGxdIEVycm9yIDIKPgo+IFRoZXJlIGlzIHN0aWxsIG5v
IGZhaWx1cmUgaW4gdGhlIGF1dG9idWlsZGVycywgYXMgeDI2NCBpcyBxdWl0ZSBsYXRlCj4gaW4g
dGhlIGFscGhhYmV0aWNhbCBvcmRlciwgc28gaXQgcHJvYmFibHkgaXMganVzdCBoaWRkZW4gYnkg
ZWFybGllcgo+IGZhaWx1cmVzLi4uCj4KPiBJIGhhdmUgbm8gaWRlYSB3aGF0IHRvIGxvb2sgZm9y
IHRvIGF2b2lkIHRob3NlIHJlbG9jYXRpb25zIGluIHRoZSBmaXJzdAo+IHBsYWNlLCBzbyBjb3Vs
ZCB5b3UgaGF2ZSBhIGxvb2ssIHBsZWFzZT8KCkhpIFlhbm4sCgpzb3JyeSBmb3IgdGhlIGRlbGF5
LCBJIHdhcyBidXN5IHdpdGggb3RoZXIgc3R1ZmYgZm9yIHRoZSBwYXN0IHdlZWtzLgoKSSdsbCB0
YWtlIGEgbG9vayBhdCB0aGUgbGlieDI2NCB0ZXh0cmVsIGlzc3VlLgoKCi0tIGpuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
