Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5C7C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 09:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C48DB60797;
	Sat,  1 Jun 2024 09:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0186s796yOAF; Sat,  1 Jun 2024 09:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B11376079C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B11376079C;
	Sat,  1 Jun 2024 09:13:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C2CD41BF841
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 09:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE8F2402BD
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 09:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynkaJCluoJrj for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 09:13:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E934940281
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E934940281
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E934940281
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 09:13:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A788F13F8CE;
 Sat,  1 Jun 2024 11:13:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 11:13:37 +0200
Date: Sat, 1 Jun 2024 11:13:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Message-ID: <ZlrmQXd1DpKjS8KI@landeda>
References: <20240530-s6-update-v1-1-8088e16a1cf4@gmx.net>
 <ZlmZ9uQdSgv36LaK@landeda> <Zlrg4EmybRStvk85@probook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zlrg4EmybRStvk85@probook>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717233219;
 bh=GFO1Q2SUJCub8QkLhk5t3O9EqumO/r1EHFK+qqYnypM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BgfX0aZSFWXM4Bw459bdUyRsjI69anJKRP5tMmOCzjTLwfHmgdGoio9mq9d7oj8kv
 bei3GFrr2PjHYgVDrEfP2J7t93kPCCZg7jOLM7yqd0iVubDwBb2sAYU27w5ob1MIIB
 /O3YadmGszAgTvPeghVh1KA4yZvLKINI7RgB8VRlIxwW8pOEQJgl/1VHF3oCVFYU0k
 5Lqt39J/ayk/h0IpGLa8rrJUnGNm6L0LJKsYcdBmfFMlALCOYPwyyM/Fx7OZUO1Pv9
 vixXZuKxVfPlZ9Sic+SWwmxiD99R+z9YJlIMI/UivCs6VY256HEbS8LKGPaziVVKUN
 E9qQzVSe0ZbWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BgfX0aZS
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Si4sIEFsbCwKCk9uIDIwMjQtMDYtMDEgMTA6NTAgKzAyMDAsIEouIE5ldXNjaMOkZmVyIHZpYSBi
dWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IE9uIEZyaSwgTWF5IDMxLCAyMDI0IGF0IDExOjM1OjUw
QU0gKzAyMDAsIFlhbm4gRS4gTU9SSU4gd3JvdGU6Cj4gPiBPbiAyMDI0LTA1LTMwIDIyOjMyICsw
MjAwLCBKLiBOZXVzY2jDpGZlciB2aWEgYnVpbGRyb290IHNwYWtlIHRodXNseToKPiA+ID4gVXBk
YXRlIGFsbCBza2FybmV0Lm9yZyBwYWNrYWdlcyB0byB0aGVpciBjdXJyZW50IHVwc3RyZWFtIHZl
cnNpb24uCj4gPiA+Cj4gPiA+IGRpZmYgQ09QWUlORyAoc2xpZ2h0bHkgZGlmZmVyZW50IGJldHdl
ZW4gcGFja2FnZXMpOgo+ID4gPiAtQ29weXJpZ2h0IChjKSAyMDExLTIwMjIgTGF1cmVudCBCZXJj
b3QgPHNrYS1za2F3YXJlQHNrYXJuZXQub3JnPgo+ID4gPiArQ29weXJpZ2h0IChjKSAyMDExLTIw
MjQgTGF1cmVudCBCZXJjb3QgPHNrYS1za2F3YXJlQHNrYXJuZXQub3JnPgo+ID4gSW4gYSBjb21t
aXQgbG9nLCB3ZSB3YW50IGh1bWFuLXJlYWRhYmxlIGV4cGxhbmFsdGlvbnMsIG5vdCBhCj4gPiAo
cHNldWRvLSlkaWZmOyBzbyBqdXN0IHN0YXRlIHNvbWV0aGluZyBsaWtlOgo+ID4gICAgIFVwZGF0
ZSBoYXNoZXMgb2YgbGljZW5zZSBmaWxlcyBmb3IgYW4gdXBkYXRlIGluIGNvcHlyaWdodCB5ZWFy
cy4KPiBJIHRoaW5rIEkgc2F3IHNvbWV0aGluZyBsaWtlIHRoZSBkaWZmIGZvcm1hdCBpbiBleGlz
dGluZyBjb21taXQsIGJ1dAo+IEknbGwgcmV3cml0ZSBpdCBpbiBwbGFpbiB0ZXh0LCBpdCBtYWtl
cyBzZW5zZS4KClllcywgdGhlcmUgYXJlIGNvbW1pdCBsb2dzIHdpdGggZGlmZi1saWtlIGNvbnRl
bnQ7IHRoYXQgZG9lcyBub3QgbWVhbgp0aGF0IHRoZXkgd2VyZSB0aGUgYmVzdCBjb21taXQgbG9n
cy4uLgoKPiA+ID4gU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJA
Z214Lm5ldD4KPiA+ID4gLS0tCj4gPiA+IFRoaXMgcGF0Y2goc2V0KSB1cGRhdGVzIHRoZSBwYWNr
YWdlcyBmcm9tIHNrYXJuZXQub3JnLiBJdCBpcyBvbmUgY29tbWl0Cj4gPiA+IHRvIGF2b2lkIGJ1
aWxkIGZhaWx1cmVzIGR1ZSB0byBpbmNvbXBhdGlibGUgdmVyc2lvbnM6Cj4gPgo+ID4gVGhhbmtz
IGZvciB0aGUgZXhwbGFuYXRpb25zLiBJdCBzaG91bGQgYmUgaW4gdGhlIGNvbW1pdCBsb2csIHNv
IHRoYXQKPiA+IHdoZW4gd2UgZWVmZXIgdG8gdGhhdCBjb21taXQgaW4gdGhlIGZ1dHVyZSwgd2Ug
aW1tZWRpYXRlbHkgdW5kZXJzdGFuZAo+ID4gd2h5IHRoZXkgd2VyZSBhbGwgYnVtcGVkIHRvZ2V0
aGVyLgo+IAo+IEFscmlnaHQsIEknbGwgbW92ZSBpdCB0byB0aGUgbWFpbiBzZWN0aW9uLgo+IAo+
ID4gPiBGb3IgZXhhbXBsZSwgd2hlbgo+ID4gPiBJIG9ubHkgdXBkYXRlIHNrYWxpYnMgdG8gMi4x
NC4xLjEgYW5kIGxlYXZlIHRoZSByZXN0IGFzIGlzLCBleGVjbGluZQo+ID4gPiBmYWlscyB0byBi
dWlsZC4KPiA+Cj4gPiBJcyBpdCBwb3NzaWJsZSB0byBkbyB0aGUgcmV2ZXJzZTogYnVtcCBza2Fs
aWJzIGxhc3Q/IEkuZS4gd291bGQgdGhlCj4gPiBuZXdlciBleGVjbGluZSAoYW5kIG90aGVyIHBh
Y2thZ2VzKSBzdGlsbCBidWlsZCBhbmQgcnVuIE9LIHdpdGggdGhlCj4gPiBjdXJyZW50IHNrYWxp
YnMgdmVyc2lvbiwgb3IgYXJlIHRoZXkgcmVhbGx5IHNvIHRpZ2h0bHkgY291cGxlZD8KPiAKPiBX
aXRoIHRoZSB2ZXJzaW9uIGJ1bXAgSSdtIGFpbWluZyBmb3IsIGl0IGZhaWxzIHRvIGJ1aWxkIHRo
YXQgd2F5IHRvby4KPiBGb3IgZXhhbXBsZSBpZiBJIGJ1bXAgZXhlY2xpbmUgdG8gMi45LjUuMToK
PiAKPiBzcmMvbGliZXhlY2xpbmUvZWxfc3Bhd24wLmM6MzoxMDogZmF0YWwgZXJyb3I6IHNrYWxp
YnMvY3NwYXduLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiAgICAgMyB8ICNpbmNsdWRl
IDxza2FsaWJzL2NzcGF3bi5oPgo+ICAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
Cj4gY29tcGlsYXRpb24gdGVybWluYXRlZC4KPiAKPiBUbyBzcGxpdCBpdCBpbnRvIG11bHRpcGxl
IGNvbW1pdHMsIEknZCBwcm9iYWJseSBoYXZlIHRvIG1ha2Ugc2hvcnRlciBidW1wcywKPiBhbmQg
YnVtcCBwYWNrYWdlcyBtdWx0aXBsZSB0aW1lcy4KCk9LLCB0aGVuIG5vIG5lZWQgdG8gcmVwc2lu
LCBJIGNhbiBhcHBseSB0aGUgcGF0Y2ggYXMtaXMgKEknbGwganVzdCBhcHBseQp0aGUgbGl0dGxl
IHR3ZWFrcyBJIG1lbnRpb25lZCBlYXJsaWVyKS4KClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrIQoK
UmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZ
YW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBF
cmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25l
ciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5
IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVy
ZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBI
VE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0t
JwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
