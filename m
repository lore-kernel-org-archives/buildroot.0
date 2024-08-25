Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5578C5321E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 18:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66E5540021;
	Sun, 25 Aug 2024 18:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XTtalJXwcXk8; Sun, 25 Aug 2024 18:41:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34EB340169
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34EB340169;
	Sun, 25 Aug 2024 18:41:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41EC81BF2A6
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 18:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81B0A605D8
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 18:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_cB5QHFrzfU for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 18:41:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F3FE26058B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3FE26058B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3FE26058B
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 18:41:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([84.44.134.213]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGyxX-1suc7l41Hn-00ChXi; Sun, 25
 Aug 2024 20:41:15 +0200
Date: Sun, 25 Aug 2024 20:41:14 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zst6yjnaF8LVxGv0@probook>
References: <20240824-x264-textrel-v1-1-fbfcedc7179d@gmx.net>
 <20240825150652.09dcab72@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240825150652.09dcab72@windsurf>
X-Provags-ID: V03:K1:qEJLY1j/xQ77pPvHAJXJm8qfcvqThBnbUdzUbyZWyMuE9KqLFKJ
 09U27QT4WeHxl6Ugdo0WPcegUb9TDNKfDJcZrek8zplgl//b74t28sdcmSVq/ZID5Mn42Ag
 ABMfuotOB9QgL0oGub+QLNCeWLRora4HPqMud0dPB6j55gpZ3MLgjDJNJN3wYQ2uOFLgZF0
 6FMLoim0zuEV3CulkHYfg==
UI-OutboundReport: notjunk:1;M01:P0:YqKqWqu7gKE=;ck6yVJxeT2WxPryYSEnI+uzA36R
 r7WVZvtJ2Gu+qxxnj+Q8dZZMzzvAT7o2LlsJbi/04BfLSMy4L8wAYyTTxGk6DQkdVtRukTBdX
 GUUQisylGagfdO29SMzyFJlurZboG7vfHccfjzZ+fdzY0ekbUhJtZzfXa5wUyOwteTpbIrAwr
 O4EGAN+N2kjpi0S2HHu2R5tcZ2Zi1BwMpg+JCFCxPzhKResiA9wv+c1mziWRoPK3bhj47xOEI
 lJd7RrvUnyYFvQWgTumtQSf1y1uxqkCufTaQIfEcU7OyHnC5aIhN2UjgaROJjz+9JopP7USnT
 cnof19uPKNpZK1LaeJ8j9aRUNFxQXJk7sWvs4YPfIjTT1DgHSVUg88aQukuL8hdtLd7mSnOyF
 hAN3xm80sVF4sgEDtPyHp00yyIKlajp0jZWhLCldLYd7j6OM3nLuzJ4c4Jiax8N97ujijVYSK
 05w86XbG2/tVFdWSaLHapRao+Nd4rPDeSujPiFaPDptqQS9E1w78f3NfV8qndFO8Y+lpNavER
 Uh2RQJhw3znKT4RM9n0VdZ9HG7dAilghJBfX3irXQaSZk6L5xMBBmdraGpGoBs6iDJpIL0Y+d
 uqCkBJIuzcux6GsobTA76aPUFYTacEk1JGYkQeHlfswWWdHNcHgcsWh3GOvxHfOvNXGb50Ndx
 nHd4V4QDA2oxobmZl9qokIy0c1Cur6rIDi3gyHCEOO/GnWVwfH9cy8Bh9GXxZdpJXYpwzCr2s
 LdujwmtX4p9Rnp1UHahRYJLw8zKRlhluG36/IkGWPSk9Di4Uqf2FpG5JucWdrKzgSmxPuatZJ
 GI3PL3FxNlD2h2PzsVTL8cnw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1724611275; x=1725216075; i=j.neuschaefer@gmx.net;
 bh=AGTbjnPNLLxlZTl7/TD1Iyyyv8c9r+sTnMHxM33W430=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QMR9b9SV7otT4s/FcPw7aXdaPwiBxcdosUeiKj3MFMoL3dzetfMkpwtpivtfWL48
 tO5GciNd9hXC5xpVXgS+osxE6Y3rxYFsJ6QPLa6oh3Yxe+vcbYH8Xflxabxn7Wpky
 MUTqppbjCxjI0gjc3Ahu/1WKOIP4Y8rwy9u/Tplvf8KSDljFsmQpE1WH0cv3mTm9y
 427IWRU0evp7qYyanJici6OZIwOHbeGmkPsxoT0CAFCBUhuCwu5zTY2l2iBjZdDjV
 JX16P4lquoQBbhedddFEgggaa39Grl4jkKWc/09zg4XCLueArgygO+O5YmA15h2MU
 cRUamAuux69MADkTdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=QMR9b9SV
Subject: Re: [Buildroot] [PATCH] package/x264: disable assembly code on x86
 + musl + PIC/PIE
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Yann Morin <yann.morin@orange.com>,
 =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 David du Colombier <0intro@gmail.com>,
 =?utf-8?Q?J=2E_Neusch=C3=A4fer?= via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBBdWcgMjUsIDIwMjQgYXQgMDM6MDY6NTJQTSArMDIwMCwgVGhvbWFzIFBldGF6em9u
aSB3cm90ZToKPiBPbiBTYXQsIDI0IEF1ZyAyMDI0IDIyOjExOjAyICswMjAwCj4gSi4gTmV1c2No
w6RmZXIgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Cj4g
PiBUaGUgeDI2NCBwYWNrYWdlIHVzZXMgbGFyZ2UgYW1vdW50cyBvZiBub24tUElDIGFzc2VtYmx5
IGNvZGUKPiA+IChlLmcuIGNvbW1vbi94ODYvZGN0LWEuYXNtKSwgd2hpY2ggcmVzdWx0cyBpbiB0
ZXh0cmVscywgd2hpY2ggYXJlbid0Cj4gPiBzdXBwb3J0ZWQgYnkgbXVzbC1saWJjJ3MgZHluYW1p
YyBsaW5rZXIuCj4gPgo+ID4gRGlzYWJsZSB4MjY0J3MgYXNzZW1ibHkgY29kZSB3aGVuIGNvbXBp
bGluZyBmb3IgeDg2IHdpdGggUElDL1BJRSBhbmQKPiA+IG11c2wtbGliYyB0byBhdm9pZCB0aGlz
IHBhcnRpY3VsYXIgaW5jb21wYXRpYmlsaXR5Lgo+ID4KPiA+IFJlcG9ydGVkLWJ5OiBZYW5uIE1v
cmluIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+Cj4gPiBGaXhlczogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYnVpbGRyb290L1pyc2lybnJ2Z3NFSXBBSklAdGwtbG54LW55bWE3NDg2LTIvCj4gPiBT
aWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0Pgo+ID4g
LS0tCj4gPiAgcGFja2FnZS94MjY0L3gyNjQubWsgfCA2ICsrKysrKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykKPgo+IEkndmUgYXBwbGllZCB0byBtYXN0ZXIsIGJ1dCB0byBi
ZSBob25lc3QsIEknbSBub3QgcmVhbGx5IHRocmlsbGVkLiBIYXMKPiB0aGlzIGJlZW4gdGFrZW4g
dXAgdG8gdGhlIG11c2wncyBtYWludGFpbmVycz8gSXQncyByYXRoZXIgYW5ub3lpbmcgdGhhbgo+
IG9uIGEgbWFqb3IgYXJjaGl0ZWN0dXJlIGxpa2UgeDg2IHdlIGNhbid0IGdldCB0aGUgYXNzZW1i
bHkgb3B0aW1pemVkCj4geDI2NCBjb2RlLgoKSSd2ZSByYWlzZWQgdGhpcyB0b3BpYyBpbiB0aGUg
bXVzbCBJUkMgY2hhbm5lbCBhbmQgdGhlIGNvbnNlbnN1cyB3YXMKdGhhdCB4MjY0IHNob3VsZCBi
ZSBmaXhlZCBub3QgdG8gdXNlIHRleHRyZWxzLgoKCi0tIGpuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
