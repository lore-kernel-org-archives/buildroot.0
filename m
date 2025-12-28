Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD3ED3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 18:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26FFC813F5;
	Sun, 28 Dec 2025 18:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPwCHIQTXvTi; Sun, 28 Dec 2025 18:58:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE100813ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766948314;
	bh=vcVg7WEeETYHzGCoorh7JfdvE0QNsdG2Yt9ONrA1LXc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Nbww4/sKiDRlGbM6MTqZLz9fNLBfFcJ+6kZliw2qKwI/nfImvhldjjgsFTzJvAbWB
	 mX4Qj4i4zpQ+ZVFQ7G3vIeCwck0LE7yhdaUtwj0N4TGmUdkkheOBCY/IfaQz0/OoXw
	 IWRWv29jvWqdIIGCgE3m6CEcXVBaD7xhZfvJNOyGbvFUEmv9A0dWKWaLh7+VaQO+gZ
	 BjyNKEfluXXR/YAYQ1QhQoxoNzBD09w/4Axn8VMED/rpzw9I8swGdrX/UexYCI48BW
	 5H3wwPQj/gr9LVaDOsjCBq8gckGzEQb1scmoFsDph5GXFbSjE/14GJrDfAl3b4VFnO
	 rnF5Ik0iuZJ7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE100813ED;
	Sun, 28 Dec 2025 18:58:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 85B22B9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B5B6608EF
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gUvcGTERMOF8 for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 18:58:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DEF6160702
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEF6160702
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEF6160702
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:58:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.100.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M72oH-1vZ54c2O3L-001rgp; Sun, 28
 Dec 2025 19:53:09 +0100
Date: Sun, 28 Dec 2025 19:53:09 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= via buildroot <buildroot@buildroot.org>, 
 =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>
Message-ID: <aVF8lcjpAKr1uOQa@probook>
References: <20251226-rgbmatrix-bump-v1-0-69c2aa62beaa@gmx.net>
 <20251226-rgbmatrix-bump-v1-1-69c2aa62beaa@gmx.net>
 <20251228001415.0335f4c0@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251228001415.0335f4c0@windsurf>
X-Provags-ID: V03:K1:JRXhWJ/P7k8iInkIqoq1RQCa3OzwZ4NOAe5hfDFsDSNvgtt9xlL
 NCQ004u9Fi+Og/1TUyKeyyIC5lAb1yyOqjZpnGMF90RAGSYvsZPUthFGSDfKstpRsYl5bAh
 7YvgNnBXCyDtpgfaJVpzjwbpxcBawS+V77Siy46+eMPm4rPksCYArGbk0yD/0XU5Mk7AeCI
 IlaPKVRruOqa1+Zdd4A1Q==
UI-OutboundReport: notjunk:1;M01:P0:ouvA98MH+Q0=;R0gM9m65r3RzSefr0+p3+k4vaID
 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
 IoGSp1eaNWQ1ZYJLE5VT95cb5uopsf1ioszOlx
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1766948308; x=1767553108; i=j.neuschaefer@gmx.net;
 bh=SehrgPRse9TvUvVBrNf9PJIm2U38FkrRhv/LiG6Be8Y=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=q66ilC32Ej/h7V061KY7KV4ICoBAJvIxoUN8NQDwIsXJdwIPuiiJmueiLKS6HlXW
 MBZ2lGC/gr6m54GPG5pR21r7b4NqGviomd3tlYG20ZZ8ag+ifdcpm34FABLfNFq7D
 Tt4KOYDxmSmDzLrinxmekVJrecVf3MdTG/jyc3jclQb2mThYJGj71a7XeeJfFx197
 KDcz/FROQeoViJIacdz6hXr5VhmFkKmNd4lcO1xbwmoAWf9CsTa4jh5vHC7Ycikio
 1r4MfaS6/qBi4G7F4O2fBaeekBvyOjGYhhZxQHqBMoET12NeoDtys7HzIIay6P2Sf
 0cH4xsan20pvid5gGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=q66ilC32
Subject: Re: [Buildroot] [PATCH RFC 1/2] package/python-pillow: install
 libImaging headers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBEZWMgMjgsIDIwMjUgYXQgMTI6MTQ6MTVBTSArMDEwMCwgVGhvbWFzIFBldGF6em9u
aSB3cm90ZToKPiBIZWxsbyBKLAo+IAo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPiAKPiBPbiBG
cmksIDI2IERlYyAyMDI1IDE3OjA3OjEwICswMTAwCj4gSi4gTmV1c2Now6RmZXIgdmlhIGJ1aWxk
cm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+IAo+ID4gcHl0aG9uLXJnYm1h
dHJpeCBkZXBlbmRzWzFdIG9uIEltYWdpbmcuaCBzaW5jZSBjb21taXQgYmY0NTY3NiAoIlJlZmFj
dG9yCj4gPiBicm9rZW4gdW5zYWZlIFNldEltYWdlUGlsbG93KCkiKS4KPiAKPiBZb3Ugc2hvdWxk
IGNsYXJpZnkgaGVyZTogImFuZCB0aGVyZWZvcmUgY2hhbmdpbmcgcHl0aG9uLXBpbGxvdyB0bwo+
IGluc3RhbGwgdGhpcyBoZWFkZXIgaXMgbmVlZGVkIHByaW9yIHRvIGJ1bXBpbmcgcHl0aG9uLXJn
Ym1hdHJpeCIuCgpXaWxsIGRvCgo+IAo+ID4gRGViaWFuIG9ubHkgaW5zdGFsbHMgZm91ciBoZWFk
ZXJzWzJdLCBidXQgdGhpcyBzZWVtcyBpbnN1ZmZpY2llbnQsCj4gPiBiZWNhdXNlIEltYWdpbmcu
aCBpbmNsdWRlcyBhdCBsZWFzdCBvbmUgaGVhZGVyIHRoYXQgaXMgbm90IG9uIHRoaXMgbGlzdAo+
ID4gKEFycm93LmgpLgo+ID4gCj4gPiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9oemVsbGVyL3Jw
aS1yZ2ItbGVkLW1hdHJpeC9wdWxsLzE4MTgKPiAKPiBQbGVhc2UgcG9pbnQgdG8gdGhlIGNvbW1p
dCB0aGF0IGhhcyBiZWVuIG1lcmdlZCwgbm90IHNvbWUgInJhbmRvbSIgUFIuCgpXaWxsIGRvLCBp
dCdzCgpodHRwczovL2dpdGh1Yi5jb20vaHplbGxlci9ycGktcmdiLWxlZC1tYXRyaXgvY29tbWl0
L2JmNDU2NzZhY2I5YWFkM2U0NTM4MzNjM2ExMzAzM2FiMDY1MGFiYjMKCj4gCj4gPiBbMl06IGh0
dHBzOi8vc291cmNlcy5kZWJpYW4ub3JnL3NyYy9waWxsb3cvMTIuMC4wLTEvZGViaWFuL3J1bGVz
I0wxMDYKPiAKPiBQbGVhc2UgYWRkIHlvdXIgU2lnbmVkLW9mZi1ieSBsaW5lIGhlcmUuCgpJbmRl
ZWQsIEkgZm9yZ290IQoKPiBDdXJpb3VzOiBweXRob24tcGlsbG93IHdvdWxkIGZvciBtZSBiZSBh
Li4uIFB5dGhvbiBtb2R1bGUuIEFuZCBzbyB3b3VsZAo+IGJlIHB5dGhvbi1yZ2JtYXRyaXguIEJ1
dCB3aXRoIHlvdXIgcGF0Y2gsIHdlIGluc3RhbGwgc29tZSBDL0MrKwo+IGhlYWRlcnMuIFNvIHB5
dGhvbi1waWxsb3cgaW5jbHVkZXMgYSBuYXRpdmUgbGlicmFyeSwgYW5kCj4gcHl0aG9uLXJnYm1h
dHJpeCBkaXJlY3RseSBsaW5rcyBhZ2FpbnN0IHRoaXMgbGlicmFyeT8gSG93IHdhcyBpdAo+IHdv
cmtpbmcgcHJpb3IgdG8gdGhpcyBjaGFuZ2U/CgpQcmV0dHkgbXVjaC4gcHl0aG9uLXBpbGxvdyBp
cyBhIFB5dGhvbiBtb2R1bGUsIGJ1dCBpdCdzIHBhcnRpYWxseQppbXBsZW1lbnRlZCBpbiBDLiBw
eXRob24tcmdibWF0cml4ICh0aGUgUHl0aG9uIG1vZHVsZSBmb3IgdGhlCnJwaS1yZ2ItbGVkLW1h
dHJpeCBDKysgbGlicmFyeSkgYWNjZXNzZXMgaW50ZXJuYWwgc3RhdGUgb2Ygb2JqZWN0cwpjcmVh
dGVkIGJ5IHB5dGhvbi1waWxsb3cuIFRoZXJlIGlzIG5vIGRpcmVjdCBsaW5raW5nLCBib3RoIG5h
dGl2ZQpsaWJyYXJpZXMgZXhpc3QgaW4gdGhlIHNhbWUgcHJvY2VzcyBiZWNhdXNlIHRoZXkgYXJl
IGxvYWRlZCBhcyBwYXJ0IG9mCnRoZWlyIHJlc3BlY3RpdmUgUHl0aG9uIG1vZHVsZXMuIFByaW9y
IHRvIHRoaXMgY29tbWl0LCBweXRob24tcmdibWF0cml4CmluY2x1ZGVkIGl0cyBvd24gZGVmaW5p
dGlvbiBvZiBzdHJ1Y3QgSW1hZ2luZ01lbW9yeUluc3RhbmNlIChjYWxsZWQKUGlsbG93SW1hZ2lu
Z0luc3RhbmNlKS4gV2l0aCB0aGlzIGNvbW1pdCwgcGlsbG93J3MgSW1hZ2luZy5oIGlzIGluY2x1
ZGVkCnRvIGdldCB0aGUgc3RydWN0IGxheW91dCBhbmQgdWx0aW1hdGVseSB0aGUgb2Zmc2V0IG9m
IHRoZSAiaW1hZ2UzMiIKbWVtYmVyLgoKVGhhbmtzIQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
