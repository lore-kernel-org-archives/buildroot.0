Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B21BC369C9
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 21:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D902782BEB;
	Thu, 17 Apr 2025 21:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3DC7-eqFzFGZ; Thu, 17 Apr 2025 21:55:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7637820D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7637820D4;
	Thu, 17 Apr 2025 21:55:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC51F22D
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 21:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D19B6412BB
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 21:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id twOiApT-W_Ql for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 21:55:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B385B40D09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B385B40D09
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B385B40D09
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 21:55:46 +0000 (UTC)
Received: from [91.116.116.48] (helo=momiji)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u5XCw-000yEz-Pg; Thu, 17 Apr 2025 23:55:43 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 24195ac5;
 Thu, 17 Apr 2025 21:55:41 +0000 (UTC)
Date: Thu, 17 Apr 2025 23:55:41 +0200
Message-ID: <20250417235541.GE3563203@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
In-Reply-To: <CACXRmJgW8m7jNxfo_n=QoLfMz-ROgc=N2Ms7GcWh=UQOsnUBQQ@mail.gmail.com>
References: <CACXRmJgW8m7jNxfo_n=QoLfMz-ROgc=N2Ms7GcWh=UQOsnUBQQ@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OJLkKuLsOmaDe1yvAiZOiCAjjmJzaUwo1W9WhSDJJGM=; b=QmYUaEANEE0w/2nhzs22VQzFI3
 umJ0Wkfu5f+zNBy4T1qjuTwUwIBuf5gJMRxtFk66i7dbh6q209aUxxwJPTeEEqxsQ8F7nTQdxMlES
 Z3UyyK0AfCRxPSKyw4HPvvNHxayKIWufjutvGatgPi19FyY/5s7HYQBJEOcx9IVfjnXEFAyaDtHss
 JnZ970LfxGsHwLs6lorsYe7qzmpSn4/IxTsDMltBUtdxGs80rdOM13QsmlmXq0meD97O2R+MPQ7qB
 zPAff2/SOLix1ZfevAJdoovLHe2rBtH0OJPkmer8qym590B1b0Yw7mDrWBx8qwHUDXEiYm1DV/Fgi
 1b7EAqCQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=QmYUaEAN
Subject: Re: [Buildroot] [PATCH v2] package/webkitgtk: bump to 2.48.1
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
Content-Type: multipart/mixed; boundary="===============1017297079363655676=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1017297079363655676==
Content-Type: multipart/signed; boundary="E8Zthx/NjZn/DwnD"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--E8Zthx/NjZn/DwnD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgVGhvbWFzLAoKUGF0Y2ggTEdUTS4KCk9uIFRodSwgMTAgQXByIDIwMjUgMTA6MjM6MDkgKzAy
MDAgVGhvbWFzIERldm9vZ2R0IDx0aG9tYXNAZGV2b29nZHQuY29tPiB3cm90ZToKPiBUaGlzIGJ1
bXBzIHdlYmtpdCB0byB0aGUgMi40OCBzdGFibGUgc2VyaWVzLgo+IAo+IFdlYktpdEdUSysgMi40
OCBoaWdobGlnaHRzOgo+IGh0dHBzOi8vd2Via2l0Z3RrLm9yZy8yMDI1LzA0LzA4L3dlYmtpdGd0
ay0yLjQ4Lmh0bWwKPiAKPiBOZXdzOgo+IC0gaHR0cHM6Ly93ZWJraXRndGsub3JnLzIwMjUvMDMv
MTQvd2Via2l0Z3RrMi40OC4wLXJlbGVhc2VkLmh0bWwKPiAtIGh0dHBzOi8vd2Via2l0Z3RrLm9y
Zy8yMDI1LzA0LzAyL3dlYmtpdGd0azIuNDguMS1yZWxlYXNlZC5odG1sCj4gCj4gQW5kIGJyaW5n
cyBzb21lIHNlY3VyaXR5IGZpeGVzOgo+IC0gaHR0cHM6Ly93ZWJraXRndGsub3JnL3NlY3VyaXR5
L1dTQS0yMDI1LTAwMDIuaHRtbAo+IC0gaHR0cHM6Ly93ZWJraXRndGsub3JnL3NlY3VyaXR5L1dT
QS0yMDI1LTAwMDMuaHRtbAo+IAo+IEFsc28sCj4gCj4gLSBSYWlzZSB0aGUgbWluaW1hbCBHQ0Mg
cmVxdWlyZW1lbnQgWzFdLAo+IHdoaWNoIHNob3VsZCBoYXZlIGJlZW4gcmFpc2VkIGJ5IHRoZSAy
LjQ2LjQgYnVtcC4KPiAKPiAtIEhhbmRsZSBTUEVFQ0hfU1lOVEhFU0lTLCB3aGljaCBoYXMgYmVl
biBlbmFibGVkCj4gYnkgZGVmYXVsdCBpbiBjb21taXQgWzJdLgo+IAo+IFsxXSBodHRwczovL2dp
dGh1Yi5jb20vV2ViS2l0L1dlYktpdC9jb21taXQvNjgyYWM0YmE3NGM1M2QwY2Q0ODhjN2E1OTUw
OTYyMjRhOWFiYjAzNgo+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vV2ViS2l0L1dlYktpdC9jb21t
aXQvMTAzODFhOGRlOTM4MDI0ZjMxOTM1MTg0YWY0NzBjY2JjZTBiMjJkOQo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhvbWFzQGRldm9vZ2R0LmNvbT4KClJldmlld2VkLWJ5
OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KCj4gLS0tCj4gdjI6
IGFkZGVkIGFkZGl0aW9uYWwgc2VjdXJpdHkgcmVwb3J0IGFuZCBhIGxpbmsgdG8gdGhlIHJlbGVh
c2UgaGlnaGxpZ2h0cwo+IC0tLQo+ICBwYWNrYWdlL3dlYmtpdGd0ay9Db25maWcuaW4gICAgICB8
IDYgKysrLS0tCj4gIHBhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5oYXNoIHwgNiArKystLS0K
PiAgcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rICAgfCA5ICsrKysrKysrLQo+ICAzIGZp
bGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2Uvd2Via2l0Z3RrL0NvbmZpZy5pbiBiL3BhY2thZ2Uvd2Via2l0Z3RrL0Nv
bmZpZy5pbgo+IGluZGV4IDM1OTQyOTkzMTQuLmJjYjRiMTJmYTMgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS93ZWJraXRndGsvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS93ZWJraXRndGsvQ29uZmln
LmluCj4gQEAgLTE2LDEyICsxNiwxMiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfV0VCS0lUR1RLX0FS
Q0hfU1VQUE9SVFMKPiAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfU1lOQ180Cj4gICBk
ZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xJQkdQR19FUlJPUl9BUkNIX1NVUFBPUlRTICMgbGliZ2Ny
eXB0Cj4gCj4gLWNvbW1lbnQgIndlYmtpdGd0ayBuZWVkcyBsaWJndGszIGFuZCBhIHRvb2xjaGFp
biB3LyBDKyssIHdjaGFyLCBOUFRMLAo+IGR5bmFtaWMgbGlicmFyeSwgZ2NjID49IDEwLCBob3N0
IGdjYyA+PSA0LjkiCj4gK2NvbW1lbnQgIndlYmtpdGd0ayBuZWVkcyBsaWJndGszIGFuZCBhIHRv
b2xjaGFpbiB3LyBDKyssIHdjaGFyLCBOUFRMLAo+IGR5bmFtaWMgbGlicmFyeSwgZ2NjID49IDEx
LCBob3N0IGdjYyA+PSA0LjkiCj4gICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1dFQktJVEdUS19B
UkNIX1NVUFBPUlRTCj4gICBkZXBlbmRzIG9uICFCUjJfQklORk1UX0ZMQVQKPiAgIGRlcGVuZHMg
b24gIUJSMl9QQUNLQUdFX0xJQkdUSzMgfHwgIUJSMl9JTlNUQUxMX0xJQlNURENQUCB8fCBcCj4g
ICAhQlIyX1VTRV9XQ0hBUiB8fCAhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEU19OUFRMIHx8IEJS
Ml9TVEFUSUNfTElCUyB8fCBcCj4gLSAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfMTAgfHwg
XAo+ICsgIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzExIHx8IFwKPiAgICFCUjJfSE9TVF9H
Q0NfQVRfTEVBU1RfNF85Cj4gICBkZXBlbmRzIG9uIEJSMl9VU0VfTU1VCj4gCj4gQEAgLTMzLDcg
KzMzLDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1dFQktJVEdUSwo+ICAgZGVwZW5kcyBvbiBCUjJf
SE9TVF9HQ0NfQVRfTEVBU1RfNF85ICMgaWN1LCBob3N0LXJ1YnkKPiAgIGRlcGVuZHMgb24gQlIy
X0lOU1RBTExfTElCU1REQ1BQCj4gICBkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVB
RFNfTlBUTAo+IC0gZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF8xMAo+ICsg
ZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF8xMQo+ICAgZGVwZW5kcyBvbiBC
UjJfVVNFX1dDSEFSICMgaWN1LCBsaWJzb3VwMwo+ICAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9M
SUJHVEszCj4gICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1dFQktJVEdUS19BUkNIX1NVUFBPUlRT
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5oYXNoIGIvcGFja2Fn
ZS93ZWJraXRndGsvd2Via2l0Z3RrLmhhc2gKPiBpbmRleCA5NjEwMGQ0YzdjLi5mZDk0MjBiYWQ5
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5oYXNoCj4gKysrIGIv
cGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLmhhc2gKPiBAQCAtMSw2ICsxLDYgQEAKPiAtIyBG
cm9tIGh0dHBzOi8vd3d3LndlYmtpdGd0ay5vcmcvcmVsZWFzZXMvd2Via2l0Z3RrLTIuNDYuNC50
YXIueHouc3Vtcwo+IC1zaGExICAxMGQ0ZGJkMjIyYWNlYzMwYjFkMjBlZTNiN2QwMmMwZDk3Mjdj
NWE5ICB3ZWJraXRndGstMi40Ni40LnRhci54ego+IC1zaGEyNTYgIDBlZmY1ZjBhYjBhMjg3MmVj
ODdkZjYyYmMzMmUzMjg5YzhhZjYyNTcxNmFjNzFlOTRiMjk4ZDc0ZTAzNzQxNzYKPiAgd2Via2l0
Z3RrLTIuNDYuNC50YXIueHoKPiArIyBGcm9tIGh0dHBzOi8vd3d3LndlYmtpdGd0ay5vcmcvcmVs
ZWFzZXMvd2Via2l0Z3RrLTIuNDguMS50YXIueHouc3Vtcwo+ICtzaGExICBmNzkzOWY5MjBmOTJm
NmIxMzk1Yjg1NzNmMDY5ZDNmYjljMDg1YjNmICB3ZWJraXRndGstMi40OC4xLnRhci54ego+ICtz
aGEyNTYgIDk4ZWZkZjIxYzRjZGNhMGZlMGI3M2FiNWE4Y2I1MjA5M2I1YWE1MmQ5YjFiMDE2YTkz
ZjcxZGJmYTFlYjI1OGYKPiAgd2Via2l0Z3RrLTIuNDguMS50YXIueHoKPiAKPiAgIyBIYXNoZXMg
Zm9yIGxpY2Vuc2UgZmlsZXM6Cj4gIHNoYTI1NiAgMGI1ZDNhN2NjMzI1OTQyNTY3MzczYjBlY2Q3
NTdkMDdjMTMyZTBlYmQ3Yzk3YmZjNjNmN2UxYTc2MDk0ZWRiNAo+ICBTb3VyY2UvV2ViQ29yZS9M
SUNFTlNFLUFQUExFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5t
ayBiL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tawo+IGluZGV4IGVjNjNkMDkzYjcuLjJj
MjJiZmI2MDcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rCj4g
KysrIGIvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rCj4gQEAgLTQsNyArNCw3IEBACj4g
ICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAKPiAtV0VCS0lUR1RLX1ZFUlNJT04gPSAy
LjQ2LjQKPiArV0VCS0lUR1RLX1ZFUlNJT04gPSAyLjQ4LjEKPiAgV0VCS0lUR1RLX1NJVEUgPSBo
dHRwczovL3d3dy53ZWJraXRndGsub3JnL3JlbGVhc2VzCj4gIFdFQktJVEdUS19TT1VSQ0UgPSB3
ZWJraXRndGstJChXRUJLSVRHVEtfVkVSU0lPTikudGFyLnh6Cj4gIFdFQktJVEdUS19JTlNUQUxM
X1NUQUdJTkcgPSBZRVMKPiBAQCAtNzMsNiArNzMsMTMgQEAgZWxzZQo+ICBXRUJLSVRHVEtfQ09O
Rl9PUFRTICs9IC1ERU5BQkxFX01JTklCUk9XU0VSPU9GRgo+ICBlbmRpZgo+IAo+ICtpZmVxICgk
KEJSMl9QQUNLQUdFX0ZMSVRFKSx5KQo+ICtXRUJLSVRHVEtfQ09ORl9PUFRTICs9IC1ERU5BQkxF
X1NQRUVDSF9TWU5USEVTSVM9T04KPiArV0VCS0lUR1RLX0RFUEVOREVOQ0lFUyArPSBmbGl0ZQo+
ICtlbHNlCj4gK1dFQktJVEdUS19DT05GX09QVFMgKz0gLURFTkFCTEVfU1BFRUNIX1NZTlRIRVNJ
Uz1PRkYKPiArZW5kaWYKPiArCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTENNUzIpLHkpCj4gIFdF
QktJVEdUS19DT05GX09QVFMgKz0gLURVU0VfTENNUz1PTgo+ICBXRUJLSVRHVEtfREVQRU5ERU5D
SUVTICs9IGxjbXMyCj4gLS0gCj4gMi40My4wCj4gCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--E8Zthx/NjZn/DwnD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaAF43QAKCRCRxVnb5MkS
O6oSAJ9Y2TM4y5v2wHMj1EpWys/bA0wYxwCfaRIWHiEWmXJwkA6J69udHT9URPE=
=pKIa
-----END PGP SIGNATURE-----

--E8Zthx/NjZn/DwnD--

--===============1017297079363655676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1017297079363655676==--
