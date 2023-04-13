Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D92C77B61
	for <buildroot@archiver.kernel.org>; Thu, 13 Apr 2023 14:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ED1881452;
	Thu, 13 Apr 2023 14:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ED1881452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C4uhF3exqKRn; Thu, 13 Apr 2023 14:39:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B0D281426;
	Thu, 13 Apr 2023 14:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B0D281426
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF1121BF46D
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 14:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A664041FA4
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 14:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A664041FA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mu6mxfTsvtPz for <buildroot@lists.busybox.net>;
 Thu, 13 Apr 2023 14:39:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49AC341FA3
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49AC341FA3
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 14:39:04 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pmy6I-00HZa8-3V
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 16:39:01 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id f3a1a6b4
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 14:39:01 +0000 (UTC)
Date: Thu, 13 Apr 2023 17:39:00 +0300
Message-ID: <20230413173900.GF3097844@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
In-Reply-To: <20230413173728.GD3097844@igalia.com>
References: <20230413142927.3137190-1-aperez@igalia.com>
 <20230413173728.GD3097844@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:To:
 From:Message-ID:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H6F4ik3wnenxtappuLvKRVtxgwVsOV+S9qzaeA0Fxjk=; b=Izj7guus4rfW+TBMDJEz7BKvnJ
 YFaFsTOskvcIZWKMgQtzAaKuEMKeZgvEPAuq+wvvqQVZkn1eYM9fqbgnDp5MAyUkHW5U9DnDXjI+E
 MWftCdLxY0gF/MKkhjefMPo+0WH9PeFxfw/Ing9GuVmIO2To9sSNw3Svf5P2woc+krBp4x1X0SIG7
 /xLImIzvfr8Oqk8eC4BjHccTKRpG3lVYwpvAfjNRwvHUnz4zHWth4vCnPblOMcJuoFzUUCW/K0WJ4
 o3JMNyF7lLIBre1trdh8+zfs5BQn/dAUK17zGZ0kjhzEGYvJ2SIRJxFckxi2WsfYc2tuVxUAurb8u
 XcnOUj/Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=Izj7guus
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: allow both X11 and
 Wayland
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
Content-Type: multipart/mixed; boundary="===============4543616715009178840=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4543616715009178840==
Content-Type: multipart/signed; boundary="MQoajecZWdIhxdnx"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--MQoajecZWdIhxdnx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T25lIG1vcmUgdGhpbmcuLi4KCk9uIFRodSwgMTMgQXByIDIwMjMgMTc6Mzc6MjggKzAzMDAgQWRy
aWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+IHdyb3RlOgogCj4gQSBjb3Vw
bGUgb2YgZXh0cmEgbm90ZXMuLi4KPiAKPiBPbiBUaHUsIDEzIEFwciAyMDIzIDE3OjI5OjI3ICsw
MzAwIEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiB3cm90ZToKPiAK
PiA+IEFsbG93IGVuYWJsaW5nIHN1cHBvcnQgZm9yIGJvdGggdGhlIFgxMSBhbmQgV2F5bGFuZCBi
YWNrZW5kcy4KPiA+IAo+ID4gVGhpcyBpbiB0dXJuIG5lZWRzIHJlb3JnYW5pemluZyBob3cgZGVz
a3RvcCBHTCBvciBPcGVuR0wgRVMgaXMgY2hvc2VuLAo+ID4gYXMgaXQgbm8gbG9uZ2VyIGNhbiBk
ZXBlbmQgb24gd2hldGhlciBXYXlsYW5kIHN1cHBvcnQgaXMgZW5hYmxlZDogdGhlCj4gPiBCUjJf
UEFDS0FHRV9IQVNfTElCR0wgYW5kIEJSMl9QQUNLQUdFX0hBU19MSUJHTEVTIHZhcmlhYmxlcyBh
cmUgYm90aAo+ID4gY2hlY2tlZCwgYW5kIEVOQUJMRV9HTEVTMiBpcyBzZXQgb25seSBpZiB0aGUg
cGFja2FnZSBwcm92aWRpbmcgT3BlbkdMCj4gPiBjbGFpbXMgb25seSBHTEVTIGlzIHN1cHBvcnRl
ZDsgb3RoZXJ3aXNlIGRlc2t0b3AgR0wgaXMgcHJlZmVycmVkLiBUaGlzCj4gPiBtYXRjaGVzIHRo
ZSBleGlzdGluZyBsb2dpYy4KPiAKPiBOb3RlIHRoYXQgaXQgaXMgcG9zc2libGUgdG8gcGFzcyAt
RFVTRV9PUEVOR0xfT1JfRVM9T0ZGIHRvIENNYWtlIHRvIG1ha2UKPiBXZWJLaXRHVEsgdXNlIG9u
bHkgQ2Fpcm8sIGFuZCBza2lwIHVzaW5nIE9wZW5HTCBhdCBhbGwuIFRoaXMgaXMgbmV2ZXIgdXNl
ZAo+IGluIEJ1aWxkcm9vdCBiZWNhdXNlIHRoZSBsaWJndGszIHBhY2thZ2UgZGVwZW5kcyBvbiBP
cGVuR0wgYmVpbmcgYXZhaWxhYmxlCj4gYW55d2F5LCBzbyBJIGZpZ3VyZWQgdGhlcmUgaXMgbm8g
cG9pbnQgaW4gYnVpbGRpbmcgV2ViS2l0R1RLIHdpdGggT3BlbkdMCj4gZGlzYWJsZWQuIE1vcmVv
dmVyLCBzb21lIG1vZGVybiBmZWF0dXJlcyAobGlrZSBDU1MgM0QgdHJhbnNmb3JtcykgZG9uJ3QK
PiB3b3JrIHdoZW4gT3BlbkdMIHN1cHBvcnQgaXMgZGlzYWJsZWQsIHNvIHdpdGggbXkgV2ViS2l0
IGRldmVsb3BlciBoYXQgb24KPiBJIGNhbm5vdCByZWFsbHkgcmVjb21tZW5kIHVzaW5nIC1EVVNF
X09QRU5HTF9PUl9FUz1PRkYgOy0pCj4gCj4gPiBUaGUgZXhpc3RpbmcgY29tbWVudCBpbmRpY2F0
aW5nIHRoYXQgb25seSBvbmUgb2YgYm90aCB3aW5kb3dpbmcgc3lzdGVtcwo+ID4gY2FuIGJlIGVu
YWJsZWQgd2FzIHdyb25nOiB0aGUgc2FtZSBXZWJLaXRHVEsgYnVpbGQgY2FuIHRhcmdldCBib3Ro
Cj4gPiBYMTEgYW5kIFdheWxhbmQgYXQgdGhlIHNhbWUgdGltZSwgYXMgbG9uZyBhcyBHVEsgaXRz
ZWxmIGhhcyBiZWVuIGJ1aWx0Cj4gPiBhY2NvcmRpbmdseS4gRW5hYmxpbmcgYm90aCBpcyB0aGUg
YXBwcm9hY2ggdGFrZW4gYnkgbW9zdCBMaW51eAo+ID4gZGlzdHJpYnV0aW9ucywgYW5kIGhhcyBi
ZWVuIHN1cHBvcnRlZCBmb3IgeWVhcnMuCj4gCj4gVGhlIGNvbW1lbnQgY2FuIGJlIHRyYWNlZCBh
bGwgdGhlIHdheSB0byB0aGUgY29tbWl0IHRoYXQgYWRkZWQgdGhlIFdlYktpdEdUSwo+IHBhY2th
Z2UgKDFmNWJiNDQ1NDQ3NDg4NmEyZTMyMWFiNTlmNzFiZGM5MTk1MTYzMTIpLiBJIG9ubHkgcmVj
ZW50bHkgbmVlZGVkIHRvCj4gbWFrZSBhIGJ1aWxkIHdpdGggYm90aCBlbmFibGVkIGFuZCBub3Rp
Y2VkIHRoYXQgb25seSBvbmUgYmFja2VuZCB3YXMgYmVpbmcKPiBhbGxvd2VkIGJ5IHdlYmtpdGd0
ay5tay0tYSBiaXQgZW1iYXJyYXNpbmcsIGdpdmVuIHRoYXQgSSBoYXZlIGJlZW4gbWFpbnRhaW5p
bmcKPiB0aGUgcGFja2FnZSBmb3IgYSBmZXcgeWVhcnMgbm93LgoKWW91IHdpbGwgbmVlZCB0aGlz
IHBhdGNoIHRvIHN1Y2Nlc3NmdWxseSBidWlsZCBXZWJLaXRHVEsgd2l0aCBYMTEgc3VwcG9ydDoK
CiAgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8y
MDIzMDQxMjIyMjY0MC4xMDkzNDUtMS1zdGVmYW5Ab3R0Lm5ldC8KCj4gPiBTaWduZWQtb2ZmLWJ5
OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KPiA+IC0tLQo+ID4g
IHBhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tayB8IDM3ICsrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTgg
ZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dlYmtpdGd0ay93ZWJr
aXRndGsubWsgYi9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsKPiA+IGluZGV4IDMyNjNm
N2ZlYTAuLjhkODhkMDkxNGUgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3dlYmtpdGd0ay93ZWJr
aXRndGsubWsKPiA+ICsrKyBiL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tawo+ID4gQEAg
LTc3LDMyICs3NywzMyBAQCBlbHNlCj4gPiAgV0VCS0lUR1RLX0NPTkZfT1BUUyArPSAtREVOQUJM
RV9HQU1FUEFEPU9GRgo+ID4gIGVuZGlmCj4gPiAgCj4gPiAtIyBPbmx5IG9uZSB0YXJnZXQgcGxh
dGZvcm0gY2FuIGJlIGJ1aWx0LCBhc3N1bWUgWDExID4gV2F5bGFuZAo+ID4gLQo+ID4gLSMgR1RL
My1YMTEgdGFyZ2V0IGdpdmVzIE9wZW5HTCBmcm9tIG5ld2VyIGxpYmd0azMgdmVyc2lvbnMKPiA+
IC0jIENvbnNpZGVyIHRoaXMgYmV0dGVyIHRoYW4gRUdMICsgbWF5YmUgR0xFU3YyIHNpbmNlIGJv
dGggY2FuJ3QgYmUgYnVpbHQKPiA+IC0jIDJEIENBTlZBUyBhY2NlbGVyYXRpb24gcmVxdWlyZXMg
T3BlbkdMIHByb3BlciB3aXRoIGNhaXJvLWdsCj4gPiAtaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJH
VEszX1gxMSkseSkKPiA+IC1XRUJLSVRHVEtfQ09ORl9PUFRTICs9IFwKPiA+IC0JLURFTkFCTEVf
R0xFUzI9T0ZGIFwKPiA+IC0JLURFTkFCTEVfWDExX1RBUkdFVD1PTgo+ID4gLVdFQktJVEdUS19E
RVBFTkRFTkNJRVMgKz0gbGliZ2wgXAo+ID4gLQl4bGliX2xpYlhjb21wb3NpdGUgeGxpYl9saWJY
ZGFtYWdlIHhsaWJfbGliWHJlbmRlciB4bGliX2xpYlh0Cj4gPiAtZWxzZSAjICFYMTEKPiA+IC0j
IEdUSzMtQlJPQURXQVkvV0FZTEFORCBuZWVkcyBhdCBsZWFzdCBFR0wKPiA+IC1XRUJLSVRHVEtf
REVQRU5ERU5DSUVTICs9IGxpYmVnbAo+ID4gLSMgR0xFU3YyIHN1cHBvcnQgaXMgb3B0aW9uYWwg
dGhvdWdoCj4gPiAtaWZlcSAoJChCUjJfUEFDS0FHRV9IQVNfTElCR0xFUykseSkKPiA+ICsjIFVz
ZSBHTEVTIGlmIGF2YWlsYWJsZSBhbmQgZGVza3RvcCBHTCBpcyBub3QuCj4gPiArJChpbmZvICQo
QlIyX1BBQ0tBR0VfSEFTX0xJQkdMKTokKEJSMl9QQUNLQUdFX0hBU19MSUJHTEVTKSkKPiA+ICtp
ZmVxICgkKEJSMl9QQUNLQUdFX0hBU19MSUJHTCk6JChCUjJfUEFDS0FHRV9IQVNfTElCR0xFUyks
OnkpCj4gPiAgV0VCS0lUR1RLX0NPTkZfT1BUUyArPSAtREVOQUJMRV9HTEVTMj1PTgo+ID4gIFdF
QktJVEdUS19ERVBFTkRFTkNJRVMgKz0gbGliZ2xlcwo+ID4gIGVsc2UKPiA+IC0jIERpc2FibGUg
Z2VuZXJhbCBPcGVuR0wgKHNoYWRpbmcpIGlmIHRoZXJlJ3Mgbm8gR0xFU3YyCj4gPiAgV0VCS0lU
R1RLX0NPTkZfT1BUUyArPSAtREVOQUJMRV9HTEVTMj1PRkYKPiA+ICBlbmRpZgo+ID4gLSMgV2Ug
bXVzdCBleHBsaWNpdGx5IHN0YXRlIHRoZSB3YXlsYW5kIHRhcmdldAo+ID4gKwo+ID4gK2lmZXEg
KCQoQlIyX1BBQ0tBR0VfTElCR1RLM19YMTEpLHkpCj4gPiArV0VCS0lUR1RLX0NPTkZfT1BUUyAr
PSAtREVOQUJMRV9YMTFfVEFSR0VUPU9OCj4gPiArV0VCS0lUR1RLX0RFUEVOREVOQ0lFUyArPSBs
aWJnbCBcCj4gPiArCXhsaWJfbGliWGNvbXBvc2l0ZSB4bGliX2xpYlhkYW1hZ2UgeGxpYl9saWJY
cmVuZGVyIHhsaWJfbGliWHQKPiA+ICtlbHNlCj4gPiArV0VCS0lUR1RLX0NPTkZfT1BUUyArPSAt
REVOQUJMRV9YMTFfVEFSR0VUPU9GRgo+ID4gK2VuZGlmCj4gPiArCj4gPiAgaWZlcSAoJChCUjJf
UEFDS0FHRV9MSUJHVEszX1dBWUxBTkQpLHkpCj4gPiAgV0VCS0lUR1RLX0NPTkZfT1BUUyArPSAt
REVOQUJMRV9XQVlMQU5EX1RBUkdFVD1PTgo+ID4gK1dFQktJVEdUS19ERVBFTkRFTkNJRVMgKz0g
bGliZWdsCj4gPiArZWxzZQo+ID4gK1dFQktJVEdUS19DT05GX09QVFMgKz0gLURFTkFCTEVfV0FZ
TEFORF9UQVJHRVQ9T0ZGCj4gPiAgZW5kaWYKPiA+ICsKPiA+ICsjIElmIG9ubHkgdGhlIEdUSyBC
cm9hZHdheSBiYWNrZW5kIGlzIGVuYWJsZWQsIEVHTCBpcyBzdGlsbCBuZWVkZWQuCj4gPiAraWZl
cSAoJChCUjJfUEFDS0FHRV9MSUJHVEszX1gxMSk6JChCUjJfUEFDS0FHRV9MSUJHVEszX1dBWUxB
TkQpOiQoQlIyX1BBQ0tBR0VfTElCR1RLM19CUk9BRFdBWSksOjp5KQo+ID4gK1dFQktJVEdUS19E
RVBFTkRFTkNJRVMgKz0gbGliZWdsCj4gPiAgZW5kaWYKPiA+ICAKPiA+ICBpZmVxICgkKEJSMl9Q
QUNLQUdFX0xJQkdUSzNfV0FZTEFORCkkKEJSMl9QQUNLQUdFX1dQRUJBQ0tFTkRfRkRPKSx5eSkK
PiA+IC0tIAo+ID4gMi40MC4wCj4gPiAKPiA+IAo+IAo+IENoZWVycywKPiDigJRBZHJpw6FuCgpD
aGVlcnMsCuKAlEFkcmnDoW4K

--MQoajecZWdIhxdnx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZDgUBAAKCRCRxVnb5MkS
O4wtAJ9bIf4IRDXmrVa/1crfkbpUPk3MdACeIGaWYQRUd4bV+gp84je2AvoBbw4=
=sVoD
-----END PGP SIGNATURE-----

--MQoajecZWdIhxdnx--

--===============4543616715009178840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4543616715009178840==--
