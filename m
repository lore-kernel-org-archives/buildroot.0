Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF33C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 12:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EAD54087A;
	Sun, 21 Jan 2024 12:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EAD54087A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UKJjsTgaisDp; Sun, 21 Jan 2024 12:52:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 626534030B;
	Sun, 21 Jan 2024 12:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 626534030B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26EC21BF3DF
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 12:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F029960AE2
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 12:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F029960AE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rd-Xe9lEkKNy for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 12:52:53 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74FE860AE1
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 12:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74FE860AE1
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.208.14]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MjjCL-1qhnDE1nOV-00lG4N; Sun, 21
 Jan 2024 13:47:39 +0100
Date: Sun, 21 Jan 2024 13:47:38 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240121134738.6f0d953b@gmx.net>
In-Reply-To: <7E2BA7C4-0A2C-40FF-AF48-25BD637CFB7A@benettiengineering.com>
References: <PH0PR19MB540925F1A9987E1D7F58BB0DD0762@PH0PR19MB5409.namprd19.prod.outlook.com>
 <7E2BA7C4-0A2C-40FF-AF48-25BD637CFB7A@benettiengineering.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:nvrQ5vbdVgW5bETWYn4f1RD3WUaUK/eGwOUucdor27b1EN2RKk0
 9EpnpUhFcXHiH7uLdRr4aA92GTXNTpJ49UUhsYiLFK0g2MzoZssUMBqoF+ffuM+YglDmmtk
 Si5wmdCJQ3W4kx1/LTvZQ3Ny8J97ggxjWQC4yhO34DrDAafDoeEKIh0UbpZiULwt5IivRd+
 dHl4rcWeljIPl+uC65eEg==
UI-OutboundReport: notjunk:1;M01:P0:Hf+fZnUvKEs=;nalM2gX8DltMoIDGvpER+WHugJP
 Ao0p9YR/XXLBecS11SnEsOwkJ+NlxB1G4+0nqCrvVSUXHsTk1bdCYoQkx47x8xzrtZkQoY5yT
 Vxu7i6+HVJ+QMCW9tbyPPbWsxK+2gfbli1hiH+WoT7chZyxq+SR/Yh5UV27wYkPLSTTyNAK+f
 HokjLH8cdj/a4P7xIOKZs+0oL0NyjaNHiTAC6bPgWttOE3CeXSDtsy/b1HhUzyRuc/qioLMJ5
 IDJG0cjmULeZnWeXISkJQdKTq1a/5+UMidGU/5h0BP1x1BHnSccdqmVPUCvd0yKkpbuK4KELh
 XHr2Kdc/uN/66FibXpUAYO2S0JI54S90nYr8jUW04LQiif9Y48LclF1Swxi4PqvlFw48vROCZ
 PGgqVFxw47vDkE616Rkg3EZEYLWOn2wl8GOy7Ygwo3qh+5iK7aXYu4QYhlpeJf6ENz78yyAiP
 vq/Kz5XnBsUwYmC+orOOytRowE/2YBy1Fa01YRiKeujlJbVbN51EsacYkBpapT274abWaN2se
 l4Ki+XI286K2l1X6DhdRmAfbV7YUbM3fpnsm3fjgQx/cVhaJ1nfuRpbtKQ1K6LcKX6bqafp1u
 eeDjIxAbAS/yItujdlwo0k9Xstymex3+XsXOZhA/IKa/1C2PlfK36JZS96CCVw+o8joF/Jh00
 gpERePgQ3nhDyRmuqAHvKOQgv2RdUgwuBge9HHLesLtkUaOp3kzVmM1Q9PBgkWmkx2NGHfliJ
 DD4yb8ticvSt3cjHFpDeCDqPyZDDOZCzfyRsaT95JJm9rmxUgWQgBUKuevdli5/hTSQR/G7yV
 +AS8ygdLbm9EalnX92abVaswHgIIPLBDRG10NFh74sUOncTkKdxXREvJ1+ewljXPF6taKQFn6
 NOycb1aRnvq9xwAAsSpDGISeyhe01eVOhKBdldBDSja2exMxFw0leGofHlKzWbK+XVrMRZASG
 +QRh4g+ahr5aLTNf4v5Sg+pmlWs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1705841570; x=1706446370; i=ps.report@gmx.net;
 bh=RxjtH+g1+Ojjdo6/Ayz48QAAAjTkPiFgdRzyWdhrJqQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:
 References;
 b=mOktzmPD1/wgW3EFNu7mzD8FSTpcw6YWy7c1BUVGFVkYzbmjkJvCeaUMKvu8HRon
 IYq6w9N2sIgQUS8TBhJA+uwB/C9tUDYkMLXQxPaKf2cnSrEp8Uqd0e6EQVKZXroOg
 Zo3+FJN2p+kCaMF9UstJHoa6KQAYpS6ZHiYk8qUFCALgOXg2nvKThmf+EoIORXLwp
 jLAPtwvl+5OgwqkKveqXx5hHvdoql0XVS+QieWNU6IMqI/gAg5Obby/kVzVtW/lu6
 W7AfvsuMmRRxkNcgLZm8sRtK6wpbfnU2M5HsvwW0kX7DkYvm28EIYVLXEX7q7Tccp
 IVhkjzg3pglVpGdCYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=mOktzmPD
Subject: Re: [Buildroot] [Help] Run Chocolate-doom
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: franco ariel <fran.millocs@live.com.ar>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAyMSBKYW4gMjAyNCAxMjoyMjo0NiArMDEwMCwgR2l1bGlvIEJlbmV0dGkgPGdpdWxp
by5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgoKPiBIaSBGcmFuY28sCj4g
Cj4gPiBJbCBnaW9ybm8gMjEgZ2VuIDIwMjQsIGFsbGUgb3JlIDA3OjQ4LCBmcmFuY28gYXJpZWwg
PGZyYW4ubWlsbG9jc0BsaXZlLmNvbS5hcj4gaGEgc2NyaXR0bzoKPiA+IAo+ID4g77u/Cj4gPiBI
ZWxsbywKPiA+IEknbSB0cnlpbmcgdG8gdGFrZSBteSBmaXJzdCBzdGVwcyBvbiBidWlsZHJvb3Qg
dXNpbmcgbXkgUmFzcGJlcnJ5IHBpIDQgYW5kIEknbSBqdXN0IHRyeWluZyB0byBmaWd1cmUgb3V0
IGhvdyB0byBydW4gdGhlIENob2NvbGF0ZS1Eb29tLCBJIGFscmVhZHkgaW5zdGFsbGVkIGFuZCB3
aGVuIEkgdHJ5IHRvIHJ1biBpdCwgaXQgdGhyb3dzIHRoZSBmb2xsb3dpbmcgZXJyb3I6Cj4gPiBG
YWlsZWQgdG8gaW5pdGlhbGl6ZSB2aWRlbzogTm8gYXZhaWxhYmxlIHZpZGVvIGRldmljZS4gIAo+
IAo+IEkgdGhpbmsgeW91IGhhdmUgbm8gcmVnaXN0ZXJlZCB2aWRlbyBvdXRwdXQuCj4gWW91IGNh
biBjaGVjayB0aGlzIGJ5IGNoZWNraW5nIGRtZXNnLgo+IFRoaXMgY291bGQgaGFwcGVuIGlmIHlv
dSBkb27igJl0IGJ1aWxkIGV1ZGV2IG9yIG1kZXYgdG8gbGV0IGJ1c3lib3ggdG8gYXV0b21hdGlj
YWxseSByZWdpc3RlciBkZXZpY2UgZHJpdmVycyB3aGVuIGRldmljZXMgYXJlIGZvdW5kLgo+IFNv
IHlvdSBjb3VsZCB0cnkgdG8gcmVidWlsZCBmcm9tIHNjcmF0Y2ggdXNpbmcgYSBkeW5hbWljIGRl
dmljZSBoYW5kbGluZyhldWRldikuCgpBZGQgYWRkCgpkdG92ZXJsYXk9dmM0LWttcy12M2QtcGk0
Cgp0byB5b3VyIGJvby1wYXRpdGlvbiBjb25maWcudHh0IGZpbGUKClJlZ2FyZHMsClBldGVyCgoK
PiAKPiBPdGhlcndpc2UgY2FuIHlvdSBwYXN0ZWJpbiB5b3VyIGRlZmNvbmZpZz8KPiAKPiBCZXN0
IHJlZ2FyZHMKPiBHaXVsaW8KPiAKPiA+IAo+ID4gSSBhbHJlYWR5IGluc3RhbGxlZCBhbGwgdGhl
IEdyYXBoaWNzIGxpYnJhcmllcywgU0RMMiwgZGlyZWN0ZmIsIGV0Yy4KPiA+IE1heWJlIEkgYW0g
bWlzc2luZyBzb21ldGhpbmcuCj4gPiAKPiA+IFRoYW5rIHlvdSwKPiA+IEZyYW5jby4gCj4gPiAK
PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290ICAKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
