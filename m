Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CAFC25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 11:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBB6B6064C;
	Sat,  1 Jun 2024 11:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nKMAjaM-nMb6; Sat,  1 Jun 2024 11:15:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1EC16086E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1EC16086E;
	Sat,  1 Jun 2024 11:15:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 19CAC1BF842
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 11:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0499440340
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 11:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XDs7FJ2hgRvR for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 11:15:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35FAE4007C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35FAE4007C
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35FAE4007C
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 11:15:46 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([176.7.170.191]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbAgq-1skVbc0KLY-00bYcB; Sat, 01
 Jun 2024 13:15:44 +0200
Date: Sat, 1 Jun 2024 13:15:41 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <ZlsC3XS9b85UmmjB@probook>
References: <20240530-s6-update-v1-1-8088e16a1cf4@gmx.net>
 <ZlmZ9uQdSgv36LaK@landeda> <Zlrg4EmybRStvk85@probook>
 <ZlrmQXd1DpKjS8KI@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZlrmQXd1DpKjS8KI@landeda>
X-Provags-ID: V03:K1:/+/VkDhUT5/E/94iLHoBUrRK7LIhcbxrT3gDc97XTBse/Bdr8iP
 LSfRWJI7q6IU9Gb9784iWbcJg6wwN3fGQuoLfKZZfupnvEizIHqPX5SALOMdyHc9mKQmxjP
 o6gxncmMF9W4u4q5dFrBP659OKy7Tv842KNLA/IzUqZM67gG1I8QYbw6LuYBTmfnPeKw2Of
 WqPARd9FXvvgaQUmM3GUw==
UI-OutboundReport: notjunk:1;M01:P0:zb5zyqffY4E=;imxOiP5rcFbmf4Qz6SsRum2gPN3
 g5eDK9WhtQ+JPOrsoOJsabsgdnrrP7PPsnBtGEsHBume+yNm7/Q5Nz/HnFLqb9B0j6LbB/Ms3
 r4pY8LO5dLEQOcs4t4mF6y4PX28F0m6TCfjnfAe09505lYlMvQBw5Ye6n4TXQxfpseS8NjPCU
 9Bcx5EIJw+u8JqriauD/b6uyNs02JYXT4yNynAfxtnHu6Os1tKJ7AUqUGn4OX3BBBpl2TcCeR
 DUtzVoaHXd+AYgVdtcIGPR/8b202gMIeQ0Ts9LzJS++UotSV88hEbuEcTBTuJTrm6Xj5HsmmD
 FcNACHyamHn/Sj7UgGhmwEUUdjfjyrnmqh1a26GMZ6EjarN+BY05uJsPaXYdxQkSIMEX2mqMw
 VvOYljl4bCGGXQT+Bmshw3rLY0ONY55AEbDN3S7CcdoNMot0BUCyCWd+bSxOco6MggoFDDzSa
 FDb07RApYqe2xvxbRgy2s/eQZggvrE50UsG2XCChXPZHQgdYlMpuGn6X9sIwVB1j2M2eg/49A
 AHcov2YgXWCEHAT5QAxNH1lJyIHe7d5kkQSkeAUPpaPHsRncP5u8cCT/zkD0YlwUbaLUTlY2q
 HXghLXR6s2/6KWSncqe8eEgnTOhQKl7VsgK9lStof7bP7Nww3cchVVI2gbFokYNQ7a34vClWb
 NjhWATTkXDyFeRMeSUlXP6MlYKoYn1z1nsRHNgx/9OkG8zblNLUcdV2Mxl7ELWgxIinWH+B4+
 Hbx5SE2HkXKoE6Qtk0Kj6ID2FtrbI4hWGF/Pp32ACzq/U2A1ndp0mnerGGbcPl8Z3ow5gVzEi
 qcV2LBOr550jcRv9g0g0WiSyTgkpydHp2W+ux2lTMYjKQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1717240544; x=1717845344; i=j.neuschaefer@gmx.net;
 bh=zACqPVJtgwnPTo3oy7E1JJflyCEHD0uJ4tD9rSt+FsA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=nDr8jblRLIOWc7/f1NsKgK9eHvjvr+pCxKiUhfMaesDKhsBx/6SVrKdxltMsPxYg
 FKf8AoW4qWa6cHeKxMjfG4mVvEXo7eT4Vt+2ac1lUFVzw0yjahQXopVGgtF+drFSg
 uwM7OT5M/X2AFKLpoI/harFcnyoEjAvz8dk4J94VCX1K2pLPUAgZ2Ifrrw7iVeLwE
 1qiYV6CYzgCsNl13cttg66aWzM4BPwEQySkaV2L+QlLcKwhXDxoVGhCgZV963PsGs
 kw+rmp/HQVA956hB6tw65tqChrhocTAr9QaGHbJj9K83OapdXT1DSruxoBdXF3Ezo
 EVco+fiZgxnCcx0cDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=nDr8jblR
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

T24gU2F0LCBKdW4gMDEsIDIwMjQgYXQgMTE6MTM6MzdBTSArMDIwMCwgWWFubiBFLiBNT1JJTiB3
cm90ZToKPiBKLiwgQWxsLAo+Cj4gT24gMjAyNC0wNi0wMSAxMDo1MCArMDIwMCwgSi4gTmV1c2No
w6RmZXIgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gPiBPbiBGcmksIE1heSAzMSwgMjAy
NCBhdCAxMTozNTo1MEFNICswMjAwLCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+ID4gPiBPbiAyMDI0
LTA1LTMwIDIyOjMyICswMjAwLCBKLiBOZXVzY2jDpGZlciB2aWEgYnVpbGRyb290IHNwYWtlIHRo
dXNseToKPiA+ID4gPiBVcGRhdGUgYWxsIHNrYXJuZXQub3JnIHBhY2thZ2VzIHRvIHRoZWlyIGN1
cnJlbnQgdXBzdHJlYW0gdmVyc2lvbi4KPiA+ID4gPgo+ID4gPiA+IGRpZmYgQ09QWUlORyAoc2xp
Z2h0bHkgZGlmZmVyZW50IGJldHdlZW4gcGFja2FnZXMpOgo+ID4gPiA+IC1Db3B5cmlnaHQgKGMp
IDIwMTEtMjAyMiBMYXVyZW50IEJlcmNvdCA8c2thLXNrYXdhcmVAc2thcm5ldC5vcmc+Cj4gPiA+
ID4gK0NvcHlyaWdodCAoYykgMjAxMS0yMDI0IExhdXJlbnQgQmVyY290IDxza2Etc2thd2FyZUBz
a2FybmV0Lm9yZz4KPiA+ID4gSW4gYSBjb21taXQgbG9nLCB3ZSB3YW50IGh1bWFuLXJlYWRhYmxl
IGV4cGxhbmFsdGlvbnMsIG5vdCBhCj4gPiA+IChwc2V1ZG8tKWRpZmY7IHNvIGp1c3Qgc3RhdGUg
c29tZXRoaW5nIGxpa2U6Cj4gPiA+ICAgICBVcGRhdGUgaGFzaGVzIG9mIGxpY2Vuc2UgZmlsZXMg
Zm9yIGFuIHVwZGF0ZSBpbiBjb3B5cmlnaHQgeWVhcnMuCj4gPiBJIHRoaW5rIEkgc2F3IHNvbWV0
aGluZyBsaWtlIHRoZSBkaWZmIGZvcm1hdCBpbiBleGlzdGluZyBjb21taXQsIGJ1dAo+ID4gSSds
bCByZXdyaXRlIGl0IGluIHBsYWluIHRleHQsIGl0IG1ha2VzIHNlbnNlLgo+Cj4gWWVzLCB0aGVy
ZSBhcmUgY29tbWl0IGxvZ3Mgd2l0aCBkaWZmLWxpa2UgY29udGVudDsgdGhhdCBkb2VzIG5vdCBt
ZWFuCj4gdGhhdCB0aGV5IHdlcmUgdGhlIGJlc3QgY29tbWl0IGxvZ3MuLi4KPgo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Cj4gPiA+
ID4gLS0tCj4gPiA+ID4gVGhpcyBwYXRjaChzZXQpIHVwZGF0ZXMgdGhlIHBhY2thZ2VzIGZyb20g
c2thcm5ldC5vcmcuIEl0IGlzIG9uZSBjb21taXQKPiA+ID4gPiB0byBhdm9pZCBidWlsZCBmYWls
dXJlcyBkdWUgdG8gaW5jb21wYXRpYmxlIHZlcnNpb25zOgo+ID4gPgo+ID4gPiBUaGFua3MgZm9y
IHRoZSBleHBsYW5hdGlvbnMuIEl0IHNob3VsZCBiZSBpbiB0aGUgY29tbWl0IGxvZywgc28gdGhh
dAo+ID4gPiB3aGVuIHdlIGVlZmVyIHRvIHRoYXQgY29tbWl0IGluIHRoZSBmdXR1cmUsIHdlIGlt
bWVkaWF0ZWx5IHVuZGVyc3RhbmQKPiA+ID4gd2h5IHRoZXkgd2VyZSBhbGwgYnVtcGVkIHRvZ2V0
aGVyLgo+ID4KPiA+IEFscmlnaHQsIEknbGwgbW92ZSBpdCB0byB0aGUgbWFpbiBzZWN0aW9uLgo+
ID4KPiA+ID4gPiBGb3IgZXhhbXBsZSwgd2hlbgo+ID4gPiA+IEkgb25seSB1cGRhdGUgc2thbGli
cyB0byAyLjE0LjEuMSBhbmQgbGVhdmUgdGhlIHJlc3QgYXMgaXMsIGV4ZWNsaW5lCj4gPiA+ID4g
ZmFpbHMgdG8gYnVpbGQuCj4gPiA+Cj4gPiA+IElzIGl0IHBvc3NpYmxlIHRvIGRvIHRoZSByZXZl
cnNlOiBidW1wIHNrYWxpYnMgbGFzdD8gSS5lLiB3b3VsZCB0aGUKPiA+ID4gbmV3ZXIgZXhlY2xp
bmUgKGFuZCBvdGhlciBwYWNrYWdlcykgc3RpbGwgYnVpbGQgYW5kIHJ1biBPSyB3aXRoIHRoZQo+
ID4gPiBjdXJyZW50IHNrYWxpYnMgdmVyc2lvbiwgb3IgYXJlIHRoZXkgcmVhbGx5IHNvIHRpZ2h0
bHkgY291cGxlZD8KPiA+Cj4gPiBXaXRoIHRoZSB2ZXJzaW9uIGJ1bXAgSSdtIGFpbWluZyBmb3Is
IGl0IGZhaWxzIHRvIGJ1aWxkIHRoYXQgd2F5IHRvby4KPiA+IEZvciBleGFtcGxlIGlmIEkgYnVt
cCBleGVjbGluZSB0byAyLjkuNS4xOgo+ID4KPiA+IHNyYy9saWJleGVjbGluZS9lbF9zcGF3bjAu
YzozOjEwOiBmYXRhbCBlcnJvcjogc2thbGlicy9jc3Bhd24uaDogTm8gc3VjaCBmaWxlIG9yIGRp
cmVjdG9yeQo+ID4gICAgIDMgfCAjaW5jbHVkZSA8c2thbGlicy9jc3Bhd24uaD4KPiA+ICAgICAg
IHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiBjb21waWxhdGlvbiB0ZXJtaW5hdGVk
Lgo+ID4KPiA+IFRvIHNwbGl0IGl0IGludG8gbXVsdGlwbGUgY29tbWl0cywgSSdkIHByb2JhYmx5
IGhhdmUgdG8gbWFrZSBzaG9ydGVyIGJ1bXBzLAo+ID4gYW5kIGJ1bXAgcGFja2FnZXMgbXVsdGlw
bGUgdGltZXMuCj4KPiBPSywgdGhlbiBubyBuZWVkIHRvIHJlcHNpbiwgSSBjYW4gYXBwbHkgdGhl
IHBhdGNoIGFzLWlzIChJJ2xsIGp1c3QgYXBwbHkKPiB0aGUgbGl0dGxlIHR3ZWFrcyBJIG1lbnRp
b25lZCBlYXJsaWVyKS4KCkFscmlnaHQsIHRoYW5rcyEKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
