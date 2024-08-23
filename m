Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F60DC52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 10:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7127281EE4;
	Fri, 23 Aug 2024 10:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oP6Lp-1F8yg2; Fri, 23 Aug 2024 10:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BC9781EE5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BC9781EE5;
	Fri, 23 Aug 2024 10:53:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB4801BF304
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 10:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98B9581EE6
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 10:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLLoNaHCCnmN for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 10:53:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F293181EE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F293181EE4
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F293181EE4
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 10:53:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([176.6.60.93]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4QwW-1s18h22y8M-017t8H; Fri, 23
 Aug 2024 12:53:22 +0200
Date: Fri, 23 Aug 2024 12:53:22 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZshqIsG6ou9LzJ53@probook>
References: <20240811-aer-inject-v1-1-9cee7e3bd9b2@gmx.net>
 <20240812214124.2a7b520f@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240812214124.2a7b520f@windsurf>
X-Provags-ID: V03:K1:+dHwq1G0BkaJyLaBqAZ8VFzgrYoQ+xOtdeM8EJuIOUuttBYMpLC
 v7TD/yl5nBU/TJXlTIiro6iBwAmebW8Tc4G06DHwOMJFgyFONZIMVufZLzvp9jDMfhNHOV9
 uawxvujLZKwo1KT0TZt1sBcIPhWmgt2DZjniu0XCi8dnSYyO6anZUSwJdNw6YC+9dilXuUv
 +iduX78A3haN3QtX3Gr1w==
UI-OutboundReport: notjunk:1;M01:P0:YUAsufmO9Nw=;PMiH3aVGCSNEF50EtUXJyvblPum
 XMfNODYJpN6P+bOPAiaH4dt4tqn0ENpdOj72bnAkNpkmpDduuJfgztK1jhsBIHxDHrwA6BOYo
 6Fl5QbNjiQ12FXuoeeJpFobyk4A6H68giArdpWK9+oPNFqvQDaZWqiJj46rR3m1vjKVvBSdy8
 kk8YX5RS9eegudcim2l54Gq5fgGJibgxBt/Az5MGPNypKlrN33BZMsfxUJbD4k3ZGDzTtgXs0
 0XaZKpJCqDbhGrjDVPDRKo4FV8NKlvQCaxGtJ5gS0PSbeHZ1J29mebXjkDQ2Ei7J7E3QzAO3u
 oZpxZueR+VEI9v1ZKw61Ye0/2h/SmdPqoam09gJpWRXC3HgiSoxkRPi9WIo8GTl07aSIXcd6Z
 zEHqlYlhveVXNtUiCRyHjzd7C5kV7dSGwernN82/zwid+5ajSeZAC7KVkV+5TVp7yWbHTcq6K
 oWY52mU9sdShQTAqlKEvPg3186mGN8uyOvFYOwcYw0iu8wPg5AFurWSrJAEVH5Uic8klgd6QI
 jS/bKQ910rtHhAwoCO88sXjxe3urujidp6DWImbT/4LxCt9fU/0B798qtKPDzM8m6NC+FGsvH
 rpfcCfia5xQbrOzzy5ewQaA63TtB7roZNn17e8QrpaBL+B+j8Z9GqQhb3NK3xLQIWnhWLtxSj
 /NuN1gEB1NHD4lVIXPg1kmhjnVx0UO/pRuIvukBcXTJ3mWhSNizHYPK822kBIaQ8rCqWdHnEO
 t18Mc3r9ypfYimqxD7CuKY8KduoEna6iEqNfYx4zfQ7V/cZMjipFaXDAHfKxXsUGeDeI05aiK
 aQwGDr3bva4jcj1tuhhlR1ZQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1724410403; x=1725015203; i=j.neuschaefer@gmx.net;
 bh=tJDvgR4kKf286czvl+JVcjpAeaJL6rXa7CUf4Xf/RNY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ZJ0k054ZOCuOW8V/HzOBYDwrZn0mf49z77PYa8apVMZnXYsKSrO6MvBw9vLStUG2
 OCXpZTlZ279iSg21KxTNafNKMwyTBSmoX5BQftU9Os1A9yM5kHjmT2FnBgwFVEs9g
 YqpDUJkiNmjL3esfQKafilBgu+fOrKZfaC7IIz60hPuGwkbVGEyhNZXFJ4WrXVjoX
 SSzTbULv13MDb0HlDss3IOwbshOHZ0li7rNlxlWwbt4x/9P73WNnLVVFXq7Rzzhy4
 TO8hKnTwgaSHyXl6W4pzm5L+jsy0clRLWXUtmRbBgx9PZsV17akP4Zx7C6oo8UmWh
 TEGgr6Hp+x5rxGrqWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=ZJ0k054Z
Subject: Re: [Buildroot] [PATCH] package/aer-inject: Fix build error due to
 missing basename() prototype
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
 =?utf-8?Q?J=2E_Neusch=C3=A4fer?= via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBBdWcgMTIsIDIwMjQgYXQgMDk6NDE6MjRQTSArMDIwMCwgVGhvbWFzIFBldGF6em9u
aSB3cm90ZToKPiBIZWxsbyBKLAoKSGVsbG8gVGhvbWFzLAoKPiBUaGFua3MgYSBsb3QgZm9yIHlv
dXIgcGF0Y2gsIHdoaWNoIEkgaGF2ZSBhcHBsaWVkLiBJIGp1c3QgaGF2ZSBhIGZldwo+IHZlcnks
IHZlcnkgbWlub3Igc3VnZ2VzdGlvbnMgdG8gZnVydGhlciBpbXByb3ZlIHlvdXIgbmV4dCBwYXRj
aGVzLgo+Cj4gRmlyc3Qgb2YgYWxsLCBJIHBlcnNvbmFsbHkgbGlrZSB0aGF0IHRoZSBjb21taXQg
dGl0bGUgc3RhcnRzIHdpdGggYQo+IGxvd2VyLWNhc2UgbGV0dGVyLCBpLmU6ICJwYWNrYWdlL2Fl
ci1pbmplY3Q6IGZpeCAuLi4iIHJhdGhlciB0aGFuCj4gInBhY2thZ2UvYWVyLWluamVjdDogRml4
IC4uLiIuCgpBaCwgZm9yY2Ugb2YgaGFiaXTigKYKCj4KPiBPbiBTdW4sIDExIEF1ZyAyMDI0IDEy
OjM0OjI1ICswMjAwCj4gSi4gTmV1c2Now6RmZXIgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1
aWxkcm9vdC5vcmc+IHdyb3RlOgo+Cj4gPiBGaXhlcyBzZXZlcmFsIGJ1aWxkIGZhaWx1cmVzIHN1
Y2ggYXM6Cj4KPiBQbGVhc2Ugd3JpdGUganVzdCAiRml4ZXM6Ii4gVGhpcyB3YXksIHBhdGNod29y
ayBkZXRlY3RzIGl0J3MgYSBwYXRjaAo+IGZpeGVzIHNvbWV0aGluZywgYW5kIGl0IGZsYWdzIGl0
IGFzIHN1Y2guCj4gU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWls
ZHJvb3QvbGlzdC8sIHdoZXJlIHRoZSBjb2x1bW4gQS9GL1IvVCBmbGFncyB0aGUgcGF0Y2hlcyB0
aGF0IGhhdmUgYSBBY2tlZC1ieTosIGEgRml4ZXM6LCBhIFJldmlld2VkLWJ5OiBvciBhIFRlc3Rl
ZC1ieTouCj4KPiA+ICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvZTYx
L2U2MTNmYzc3NzA1MWJlNjMyNWQ3ZTNjMDg4ZDVmNzIzZmFiNTE4ZmEvYnVpbGQtZW5kLmxvZwo+
Cj4gV2UgbGlrZSB0byBoYXZlIGp1c3Q6Cj4KPiAgIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm5ldC9yZXN1bHRzL2U2MTNmYzc3NzA1MWJlNjMyNWQ3ZTNjMDg4ZDVmNzIzZmFiNTE4ZmEvCj4K
PiBpLmUgZG9uJ3QgcG9pbnQgdG8gYnVpbGQtZW5kLmxvZywgYnV0IHRvIHRoZSBidWlsZCByZXN1
bHQsIGFuZCBkcm9wIHRoZQo+IGV4dHJhIC9lNjEvIGluIHRoZSBVUkwuCgpOb3RlZCEKCj4gPiBU
aGlzIHBhdGNoIGlzIGZyb20gS3VwcHVzd2FteSBTYXRoeWFuYXJheWFuYW4ncyBmb3JrIG9mIGFl
ci1pbmplY3QuIEFuCj4gPiBhbHRlcm5hdGl2ZSB0byBpbmNsdWRpbmcgdGhlIHBhdGNoIHdvdWxk
IGJlIHRvIHN3aXRjaCB0byB0aGlzIGZvcmsgYXMKPiA+IEJ1aWxkcm9vdCdzIGlkZWEgb2YgdXBz
dHJlYW0uIEN1cnJlbnRseSwgaXQgaXMgdGhlIG9ubHkgY2hhbmdlIGluIHRoZQo+ID4gZm9yaywg
dGhvdWdoLgo+Cj4gSSBndWVzcyBhdCB0aGlzIHBvaW50LCBpdCdzIGZpbmUgdG8ga2VlcCB0aGlu
Z3MgYXMgdGhleSBhcmUuIEhvdwo+ICJvZmZpY2lhbCIgaXMgZWFjaCBvZiB0aG9zZSB0d28gYWVy
LWluamVjdCBHaXQgcmVwb3M/CgpJIHRvb2sgYSBkZWVwZXIgbG9vayByaWdodCBub3csIGFuZCBm
b3VuZCB0aGlzIG9uIHRoZSBsaW51eC1wY2kgbWFpbGluZyBsaXN0OgoKaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtcGNpLzIwMjQwNDE2MDU1MDM1LjIwMDA4NS0xLXNhdGh5YW5hcmF5YW5h
bi5rdXBwdXN3YW15QGxpbnV4LmludGVsLmNvbS8KCiBTdWJqZWN0OiBbUEFUQ0ggdjFdIFBDSS9B
RVI6IFVwZGF0ZSBhZXItaW5qZWN0IHRvb2wgc291cmNlIFVSTAogLQkgICAgIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvY2dpdC9saW51eC9rZXJuZWwvZ2l0L2dvbmcuY2hlbi9hZXItaW5qZWN0Lmdp
dC8KICsJICAgICBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvYWVyLWluamVjdC5naXQKClRoaXMg
cGF0Y2ggd2FzIG1lcmdlZCwgc28gSSB0aGluayB0aGUgZ2l0aHViLmNvbS9pbnRlbCBVUkwgY291
bnRzIGFzIG9mZmljaWFsLgoKCi0tIGpuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
