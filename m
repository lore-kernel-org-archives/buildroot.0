Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF137C5320E
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 19:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C6AC810A4;
	Sat, 24 Aug 2024 19:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lx8kVaHZZo6w; Sat, 24 Aug 2024 19:36:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0614810BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0614810BF;
	Sat, 24 Aug 2024 19:36:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C72B41BF30A
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 19:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B650B60614
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 19:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gIeeP1UYPHVT for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 19:36:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE262605E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE262605E8
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE262605E8
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 19:36:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([84.44.134.213]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRTNF-1sWAT80gB3-00JszB; Sat, 24
 Aug 2024 21:36:03 +0200
Date: Sat, 24 Aug 2024 21:36:02 +0200
To: yann.morin@orange.com
Message-ID: <Zso2IgOZqYUyDE7W@probook>
References: <20240719-ztext-v5-1-ec46696d4ed9@gmx.net>
 <ZrsirnrvgsEIpAJI@tl-lnx-nyma7486-2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZrsirnrvgsEIpAJI@tl-lnx-nyma7486-2>
X-Provags-ID: V03:K1:GF5u1Bi46idL7BUZc0yaroFFMoHolx9Png2wdBTsssnYqAL4OXs
 4AMs3A2BckmtuRTVvZlZUWhN+6ehiG0Rokgj0++a4Nd9A5kbNCdIxjBYR9gxJyW67d+2upI
 Iu77NDDwOYLlptEGLdTy7JlPXar5Imrh0yreTJ6Sy/ASSCGUh6cw174QGj+CHzUc4t8v+wA
 N3ojls3SZuTwfLe7gy2rw==
UI-OutboundReport: notjunk:1;M01:P0:oKvYhQNjrH0=;95vsD6vm31aPMiHD8FXu0hUzbFf
 v+t1bqdIx5wIGT5b/FSgmwDOvCK+ue6HSEjNXUzazOWgIebtvMhg9yQy/1TYxZX3tijgbTn7U
 ppF70dOWzyYBHPCi+2h+B4+DkndPsGIbVGu+vZA56tSU05a03vkZFyRDG0kFwy0d4C5WBlCrM
 us6t6YYyAxsV/e8fbai5TsU/84ReZbjsCIQh4EexyxH2PusjmLzNS2G3pVVPz0A41dRLYD6oX
 f0wfOTNVfE01LPWWWLrSoGq414ySyxeY4JdbtlVrILX462JklhW1K1B3ajUcb0xJD1SqrAZ+/
 +SnsrEuykCHuaugPco8wtSUstE9Dy2XAmKK/buwgV6/Dyz1Zm6MXJUW6Alv9rgZgeCxsHZisy
 a7BY0oKFweodtRzvP/IvUSL43P+eV+uj8wgY2q1t5pw6EnEW+/HG3rFTJLERvYPKiJ+9rYBrv
 WoSBf9wzdVQ7WQi831/n//ZU71vtTAPcISl121eCdgDAD08nNIcqu460NEDGa2gN8H9EvlUTI
 zb0HPLnNXgOnRzVrBWXcUMHGX4cRp+ySbIC0gB+w4oQC7QsGbZ2veuegRtoB9fVgUjor2KC0R
 tPcoGwNyhMoRM0D+Jv3yybLWyPa1qd9AispAbSrTZIU4kPZVhl06U7X+4Vpxwz8BlPAVvrRz+
 tHwlvupG8SpqukMawJc+ZjT4bC71GqZ9fjosZ9nh7KS+GTKCfRMXRxHr4JheYXm/+v+671s3D
 gLnlmxPiuHR45kxNzeHJqBc7pWgN7/Xt49XU2U9ozgCmJKDITqMUYcdzifxs10TqTxAB6FBXz
 c4/5YRA/SzZsrMMSEsKM2mng==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1724528163; x=1725132963; i=j.neuschaefer@gmx.net;
 bh=zsSuO6DH+FRbbWXGRG1NoNlC9r57xjC7S7VMy9qytF4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=gCQerYr52NLLf/sQJdQT/9M5arHvPny1dj8PdbXlCWFrF97OCQHuTmBxYJq8ZZKQ
 3vBJYfVYrm14E/kg0gp8GAaQpnvD5SKi6vsvqf96xE9eiTOnvgIFZeJC6w4UuAAp2
 pZLXe5f4QQ03Kjgan3sr6TmiAg0FNw543s8ZES1ttasyE9EpHbVq43Nfm+rWAWXi5
 U4idiuqntKYHdCUHjNmTUXQKAgOrKFSh3Ecrt5D/ncN90O3pOZE8IBqyPtD8NpcHX
 +AK7ykOdUk4IacNwmxU7Dzl7IF8TtMtJJR7tGux2mwmHXn+71EFSX41zujT/0x2Wg
 KUJzX2/pLKiJvgoNWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=gCQerYr5
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
ZCB5b3UgaGF2ZSBhIGxvb2ssIHBsZWFzZT8KPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4K
CkkgdG9vayBhIGxvb2ssIHRoZSBpc3N1ZSBpcyB0aGF0IGxpYngyNjQncyB4ODYgYXNzZW1ibHkg
aXMgcG9zaXRpb24KZGVwZW5kZW50IChwYXRjaCBjb21pbmcgaW4gYSBzZXBhcmF0ZSBlbWFpbCku
IEZvciBleGFtcGxlOgoKClNFQ1RJT04gLnRleHQKCmNleHRlcm4gcHdfMzIKWy4uLl0KCklOSVRf
TU1YIG1teApjZ2xvYmFsIGFkZDR4NF9pZGN0LCAyLDIKICAgIHB4b3IgbTcsIG03Ci5za2lwX3By
b2xvZ3VlOgogICAgbW92cSAgbTEsIFtyMSsgOF0KICAgIG1vdnEgIG0zLCBbcjErMjRdCiAgICBt
b3ZxICBtMiwgW3IxKzE2XQogICAgbW92cSAgbTAsIFtyMSsgMF0KICAgIElEQ1Q0XzFEIHcsMCwx
LDIsMyw0LDUKICAgIFRSQU5TUE9TRTR4NFcgMCwxLDIsMyw0CiAgICBwYWRkdyBtMCwgW3B3XzMy
XSAgICAgICAgICAgPC0tLSBoZXJlCiAgICBJRENUNF8xRCB3LDAsMSwyLDMsNCw1CiAgICBTVE9S
RV9ESUZGICBtMCwgbTQsIG03LCBbcjArMCpGREVDX1NUUklERV0KICAgIFNUT1JFX0RJRkYgIG0x
LCBtNCwgbTcsIFtyMCsxKkZERUNfU1RSSURFXQogICAgU1RPUkVfRElGRiAgbTIsIG00LCBtNywg
W3IwKzIqRkRFQ19TVFJJREVdCiAgICBTVE9SRV9ESUZGICBtMywgbTQsIG03LCBbcjArMypGREVD
X1NUUklERV0KICAgIFJFVAoKCkluIG15IGV4cGVyaWVuY2UsIGhhbmQtd3JpdHRlbiBhc3NlbWJs
eSBjb2RlIGlzIHVzdWFsbHkgdGhlIGN1bHByaXQsIGJ1dApvZiBjb3Vyc2Ugbm90IGFsbCBoYW5k
LXdyaXR0ZW4gYXNzZW1ibHkgY29kZSBoYXMgdGhlc2UgaXNzdWVzLgoKCi0tIGpuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
