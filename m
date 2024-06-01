Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C1AC25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 08:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 456A6401F1;
	Sat,  1 Jun 2024 08:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPcJP4FAz4YO; Sat,  1 Jun 2024 08:50:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 307934045B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 307934045B;
	Sat,  1 Jun 2024 08:50:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B58431BF2F4
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 08:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1ED24045B
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 08:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8MDhOMtA9A0 for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 08:50:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B509401F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B509401F1
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B509401F1
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 08:50:46 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([176.6.21.119]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7K3i-1s7rL60gA8-007hSM; Sat, 01
 Jun 2024 10:50:44 +0200
Date: Sat, 1 Jun 2024 10:50:40 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <Zlrg4EmybRStvk85@probook>
References: <20240530-s6-update-v1-1-8088e16a1cf4@gmx.net>
 <ZlmZ9uQdSgv36LaK@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZlmZ9uQdSgv36LaK@landeda>
X-Provags-ID: V03:K1:Pdfnmvks3UDN6narxwEAu82fSccTrbG1WGFDYk/6bhByD7nUlZe
 iIQTljkJ3C+NCBZ8QqJhetlEkgr0kIrKEwk7es3stBnugUsl42d2oz9uAsKR8tO4hO0Lkei
 243+1GpMEv6hdWaOcs/k9eFvHiDFtx2+Kp7X5P0oj86z7dB/oUli35aqTB3WtzyTsTqpJep
 CIVbfZnvXm9rdIEIxFCpw==
UI-OutboundReport: notjunk:1;M01:P0:+yPgsC3LGPY=;mW6R9uNJOaMSbyxscFJ7qvGx7Dl
 ea1MnnwymhnIMLLp1jGYW4CrxrSXuV/esRAHpcjgyhdB4nE25BbIh6mIjO98edS52Rpf/4x3Q
 8u653nL67ga1kAXdsSA28Iu5xl/CJHLFlIwXWaBaGO2PH/Yebhk2dnwmZlrPhghoGWaFscESH
 dXtYlVhZ4zUtDEWSYP/NNzcEv/qtfOwDzgJT3+z3g5djEh44+kv7Jypl/pEvwSFY7wknZpiMb
 tcxSMbd/hs7f8t2hvWLYml/3bANwWvWihpbQHuspfwpMIKdiEE3kcMDrwdPw1ATSqoZH97E/W
 CmuBc4xHWNmY5rJUza0wiGa9HUXA+UcJT2IUw1C9L2XPJMu5kuzI2Pq7MyZyP3zZNPZXoctjk
 JL4buUO8Sk6hMDMwys8HAYtUaIaFsb+9DQjcmLrFZzgwfa7rlb7sK3kgHVhdRlNs6JJZEg5KO
 fg8S7W78BwDvhm6YwT1OKLwwTbQjj1TFVFsV6yrvoFWosYJmqTgYKjVt0I6uqrpcOh3y6h+JN
 XLPoSJq5szLpJsyjUG1l8KM9dJ41l4IJsc24C/wi01nFHCnHxoVV9IvsWc/SfCPEucMB9uL5q
 UAzEj+G/mspxwQroFmeX4Wp7A/ZVBjYDQ6DZ4vGXMBrh3U1ARkZqlTHWZphxORxjumvoGbMPG
 /LoyTk3tpVfwR+MkE5ZK30p/TdO8oyn2hfuelxWAgrHAUoIjB1GFYt06lm3XDgiwYA+v7mr//
 D27lKFdzqi6BUWuHpRuGOJxd46vU6C9VczwB/gxeCR/+fTKoEKEZpDfZdQQDz4/pLRD4PDEDd
 EYEn39fEQLhrn7poTjo3dA+6NUTWFUeaktROiCk7CYCOU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1717231844; x=1717836644; i=j.neuschaefer@gmx.net;
 bh=17jzmbzoa9N1BqzVtmx+EhQpMR00SoOcJq5hNtPde50=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Z6v0CsLuekwmXD/1m1egGpI1m4EqdTvTsB5sd00+lGzeZ+uBdNP2kK34dcCnGZSU
 quO6tVlkk/olbmeNSQjDZBdLofD6RpCgH1epNy6fy4yuZ5haAG/N9ZHR997S2ffUE
 cf4WUOEso6VSl6HLzwprsBJa8/6NguQJJ+z2vhvAs+jpKiLaIw6IIzu0ByhP9AUsg
 6OgYy8f/O6FgpEew2f1C1MzLCZN6d24+r/rR6VMgPo2UQRedmECs3kBaVKjZxRAw9
 P9y3mMqVipgvKohJPiY0eV9GqXwM9j6zjvXEgW2bT2GdUTBkezzMfNqw3p9Bz4eY8
 gU+2ngATHEL1lPPn/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Z6v0CsLu
Subject: Re: [Buildroot] [PATCH] {skalibs, execline, mdevd, s6, s6-{rc,
 linux-init, {linux, portable}-utils, networking}}: bump
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
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBNYXkgMzEsIDIwMjQgYXQgMTE6MzU6NTBBTSArMDIwMCwgWWFubiBFLiBNT1JJTiB3
cm90ZToKPiBKLiwgQWxsLAo+Cj4gVGhhbmtzIGZvciB0aGlzIHBhdGNoLgo+Cj4gT24gMjAyNC0w
NS0zMCAyMjozMiArMDIwMCwgSi4gTmV1c2Now6RmZXIgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVz
bHk6Cj4gPiBVcGRhdGUgYWxsIHNrYXJuZXQub3JnIHBhY2thZ2VzIHRvIHRoZWlyIGN1cnJlbnQg
dXBzdHJlYW0gdmVyc2lvbi4KPiA+Cj4gPiBkaWZmIENPUFlJTkcgKHNsaWdodGx5IGRpZmZlcmVu
dCBiZXR3ZWVuIHBhY2thZ2VzKToKPiA+IC1Db3B5cmlnaHQgKGMpIDIwMTEtMjAyMiBMYXVyZW50
IEJlcmNvdCA8c2thLXNrYXdhcmVAc2thcm5ldC5vcmc+Cj4gPiArQ29weXJpZ2h0IChjKSAyMDEx
LTIwMjQgTGF1cmVudCBCZXJjb3QgPHNrYS1za2F3YXJlQHNrYXJuZXQub3JnPgo+Cj4gSW4gYSBj
b21taXQgbG9nLCB3ZSB3YW50IGh1bWFuLXJlYWRhYmxlIGV4cGxhbmFsdGlvbnMsIG5vdCBhCj4g
KHBzZXVkby0pZGlmZjsgc28ganVzdCBzdGF0ZSBzb21ldGhpbmcgbGlrZToKPiAgICAgVXBkYXRl
IGhhc2hlcyBvZiBsaWNlbnNlIGZpbGVzIGZvciBhbiB1cGRhdGUgaW4gY29weXJpZ2h0IHllYXJz
LgoKSSB0aGluayBJIHNhdyBzb21ldGhpbmcgbGlrZSB0aGUgZGlmZiBmb3JtYXQgaW4gZXhpc3Rp
bmcgY29tbWl0LCBidXQKSSdsbCByZXdyaXRlIGl0IGluIHBsYWluIHRleHQsIGl0IG1ha2VzIHNl
bnNlLgoKPiA+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdt
eC5uZXQ+Cj4gPiAtLS0KPiA+IFRoaXMgcGF0Y2goc2V0KSB1cGRhdGVzIHRoZSBwYWNrYWdlcyBm
cm9tIHNrYXJuZXQub3JnLiBJdCBpcyBvbmUgY29tbWl0Cj4gPiB0byBhdm9pZCBidWlsZCBmYWls
dXJlcyBkdWUgdG8gaW5jb21wYXRpYmxlIHZlcnNpb25zOgo+Cj4gVGhhbmtzIGZvciB0aGUgZXhw
bGFuYXRpb25zLiBJdCBzaG91bGQgYmUgaW4gdGhlIGNvbW1pdCBsb2csIHNvIHRoYXQKPiB3aGVu
IHdlIGVlZmVyIHRvIHRoYXQgY29tbWl0IGluIHRoZSBmdXR1cmUsIHdlIGltbWVkaWF0ZWx5IHVu
ZGVyc3RhbmQKPiB3aHkgdGhleSB3ZXJlIGFsbCBidW1wZWQgdG9nZXRoZXIuCgpBbHJpZ2h0LCBJ
J2xsIG1vdmUgaXQgdG8gdGhlIG1haW4gc2VjdGlvbi4KCj4gPiBGb3IgZXhhbXBsZSwgd2hlbgo+
ID4gSSBvbmx5IHVwZGF0ZSBza2FsaWJzIHRvIDIuMTQuMS4xIGFuZCBsZWF2ZSB0aGUgcmVzdCBh
cyBpcywgZXhlY2xpbmUKPiA+IGZhaWxzIHRvIGJ1aWxkLgo+Cj4gSXMgaXQgcG9zc2libGUgdG8g
ZG8gdGhlIHJldmVyc2U6IGJ1bXAgc2thbGlicyBsYXN0PyBJLmUuIHdvdWxkIHRoZQo+IG5ld2Vy
IGV4ZWNsaW5lIChhbmQgb3RoZXIgcGFja2FnZXMpIHN0aWxsIGJ1aWxkIGFuZCBydW4gT0sgd2l0
aCB0aGUKPiBjdXJyZW50IHNrYWxpYnMgdmVyc2lvbiwgb3IgYXJlIHRoZXkgcmVhbGx5IHNvIHRp
Z2h0bHkgY291cGxlZD8KCldpdGggdGhlIHZlcnNpb24gYnVtcCBJJ20gYWltaW5nIGZvciwgaXQg
ZmFpbHMgdG8gYnVpbGQgdGhhdCB3YXkgdG9vLgpGb3IgZXhhbXBsZSBpZiBJIGJ1bXAgZXhlY2xp
bmUgdG8gMi45LjUuMToKCnNyYy9saWJleGVjbGluZS9lbF9zcGF3bjAuYzozOjEwOiBmYXRhbCBl
cnJvcjogc2thbGlicy9jc3Bhd24uaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQogICAgMyB8
ICNpbmNsdWRlIDxza2FsaWJzL2NzcGF3bi5oPgogICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fgpjb21waWxhdGlvbiB0ZXJtaW5hdGVkLgoKVG8gc3BsaXQgaXQgaW50byBtdWx0aXBs
ZSBjb21taXRzLCBJJ2QgcHJvYmFibHkgaGF2ZSB0byBtYWtlIHNob3J0ZXIgYnVtcHMsCmFuZCBi
dW1wIHBhY2thZ2VzIG11bHRpcGxlIHRpbWVzLgoKClRoYW5rcyBmb3IgeW91ciByZXZpZXcsCkou
IE5ldXNjaMOkZmVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
