Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21105C77B61
	for <buildroot@archiver.kernel.org>; Thu, 13 Apr 2023 14:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E8648405D;
	Thu, 13 Apr 2023 14:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E8648405D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vSeimgGTV_sy; Thu, 13 Apr 2023 14:37:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B19DE84058;
	Thu, 13 Apr 2023 14:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B19DE84058
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E666D1C3C98
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 14:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE1BB84058
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 14:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE1BB84058
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPJs-3iU4DTf for <buildroot@lists.busybox.net>;
 Thu, 13 Apr 2023 14:37:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B58C484055
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B58C484055
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 14:37:35 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pmy4q-00HZWD-QP
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 16:37:32 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 6677027d
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 14:37:31 +0000 (UTC)
Date: Thu, 13 Apr 2023 17:37:28 +0300
Message-ID: <20230413173728.GD3097844@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
In-Reply-To: <20230413142927.3137190-1-aperez@igalia.com>
References: <20230413142927.3137190-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:To:
 From:Message-ID:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JbjjN4XWsUvvmrxns9nylGNMPVTRnDsiO3xyF0pI+bc=; b=N0jjKY7T11QWJ5lLpfFAXDglW6
 JMU7QpCom5WwDXE5rqd/Onwm2SKghi9ffLuxSzoxwF7nT9N5s7hb74YgN0/208dVOXwgPhBRgL0kG
 gJpS2iTXcvnVPb60bvflmMQL3floP1xrCXzHT4db1uYUN0L8X0iFP49j5ghR17neBixwXMcJIEMJm
 UJPy4arply5Mh6xFyQ+o5ETEKCRtkS0YJ2h5h7m9osWp/EF1KOkKIvQ5NxD4SNSHNu7lqiV/B0Pvi
 /mS1YBgpSWitQHu+GiproDX1ZJSmkKCd2uWoLi43vUT1Nlfjvf4wYrGQogXGFVBANH/T8sR5+7KkK
 9JATisqA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=N0jjKY7T
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
Content-Type: multipart/mixed; boundary="===============0784842069468636319=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0784842069468636319==
Content-Type: multipart/signed; boundary="aVn/zb+zx36qUjdB"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--aVn/zb+zx36qUjdB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgpBIGNvdXBsZSBvZiBleHRyYSBub3Rlcy4uLgoKT24gVGh1LCAxMyBBcHIgMjAyMyAxNzoy
OToyNyArMDMwMCBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4gd3Jv
dGU6Cgo+IEFsbG93IGVuYWJsaW5nIHN1cHBvcnQgZm9yIGJvdGggdGhlIFgxMSBhbmQgV2F5bGFu
ZCBiYWNrZW5kcy4KPiAKPiBUaGlzIGluIHR1cm4gbmVlZHMgcmVvcmdhbml6aW5nIGhvdyBkZXNr
dG9wIEdMIG9yIE9wZW5HTCBFUyBpcyBjaG9zZW4sCj4gYXMgaXQgbm8gbG9uZ2VyIGNhbiBkZXBl
bmQgb24gd2hldGhlciBXYXlsYW5kIHN1cHBvcnQgaXMgZW5hYmxlZDogdGhlCj4gQlIyX1BBQ0tB
R0VfSEFTX0xJQkdMIGFuZCBCUjJfUEFDS0FHRV9IQVNfTElCR0xFUyB2YXJpYWJsZXMgYXJlIGJv
dGgKPiBjaGVja2VkLCBhbmQgRU5BQkxFX0dMRVMyIGlzIHNldCBvbmx5IGlmIHRoZSBwYWNrYWdl
IHByb3ZpZGluZyBPcGVuR0wKPiBjbGFpbXMgb25seSBHTEVTIGlzIHN1cHBvcnRlZDsgb3RoZXJ3
aXNlIGRlc2t0b3AgR0wgaXMgcHJlZmVycmVkLiBUaGlzCj4gbWF0Y2hlcyB0aGUgZXhpc3Rpbmcg
bG9naWMuCgpOb3RlIHRoYXQgaXQgaXMgcG9zc2libGUgdG8gcGFzcyAtRFVTRV9PUEVOR0xfT1Jf
RVM9T0ZGIHRvIENNYWtlIHRvIG1ha2UKV2ViS2l0R1RLIHVzZSBvbmx5IENhaXJvLCBhbmQgc2tp
cCB1c2luZyBPcGVuR0wgYXQgYWxsLiBUaGlzIGlzIG5ldmVyIHVzZWQKaW4gQnVpbGRyb290IGJl
Y2F1c2UgdGhlIGxpYmd0azMgcGFja2FnZSBkZXBlbmRzIG9uIE9wZW5HTCBiZWluZyBhdmFpbGFi
bGUKYW55d2F5LCBzbyBJIGZpZ3VyZWQgdGhlcmUgaXMgbm8gcG9pbnQgaW4gYnVpbGRpbmcgV2Vi
S2l0R1RLIHdpdGggT3BlbkdMCmRpc2FibGVkLiBNb3Jlb3Zlciwgc29tZSBtb2Rlcm4gZmVhdHVy
ZXMgKGxpa2UgQ1NTIDNEIHRyYW5zZm9ybXMpIGRvbid0Cndvcmsgd2hlbiBPcGVuR0wgc3VwcG9y
dCBpcyBkaXNhYmxlZCwgc28gd2l0aCBteSBXZWJLaXQgZGV2ZWxvcGVyIGhhdCBvbgpJIGNhbm5v
dCByZWFsbHkgcmVjb21tZW5kIHVzaW5nIC1EVVNFX09QRU5HTF9PUl9FUz1PRkYgOy0pCgo+IFRo
ZSBleGlzdGluZyBjb21tZW50IGluZGljYXRpbmcgdGhhdCBvbmx5IG9uZSBvZiBib3RoIHdpbmRv
d2luZyBzeXN0ZW1zCj4gY2FuIGJlIGVuYWJsZWQgd2FzIHdyb25nOiB0aGUgc2FtZSBXZWJLaXRH
VEsgYnVpbGQgY2FuIHRhcmdldCBib3RoCj4gWDExIGFuZCBXYXlsYW5kIGF0IHRoZSBzYW1lIHRp
bWUsIGFzIGxvbmcgYXMgR1RLIGl0c2VsZiBoYXMgYmVlbiBidWlsdAo+IGFjY29yZGluZ2x5LiBF
bmFibGluZyBib3RoIGlzIHRoZSBhcHByb2FjaCB0YWtlbiBieSBtb3N0IExpbnV4Cj4gZGlzdHJp
YnV0aW9ucywgYW5kIGhhcyBiZWVuIHN1cHBvcnRlZCBmb3IgeWVhcnMuCgpUaGUgY29tbWVudCBj
YW4gYmUgdHJhY2VkIGFsbCB0aGUgd2F5IHRvIHRoZSBjb21taXQgdGhhdCBhZGRlZCB0aGUgV2Vi
S2l0R1RLCnBhY2thZ2UgKDFmNWJiNDQ1NDQ3NDg4NmEyZTMyMWFiNTlmNzFiZGM5MTk1MTYzMTIp
LiBJIG9ubHkgcmVjZW50bHkgbmVlZGVkIHRvCm1ha2UgYSBidWlsZCB3aXRoIGJvdGggZW5hYmxl
ZCBhbmQgbm90aWNlZCB0aGF0IG9ubHkgb25lIGJhY2tlbmQgd2FzIGJlaW5nCmFsbG93ZWQgYnkg
d2Via2l0Z3RrLm1rLS1hIGJpdCBlbWJhcnJhc2luZywgZ2l2ZW4gdGhhdCBJIGhhdmUgYmVlbiBt
YWludGFpbmluZwp0aGUgcGFja2FnZSBmb3IgYSBmZXcgeWVhcnMgbm93LgoKPiBTaWduZWQtb2Zm
LWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KPiAtLS0KPiAg
cGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rIHwgMzcgKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTggZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5t
ayBiL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tawo+IGluZGV4IDMyNjNmN2ZlYTAuLjhk
ODhkMDkxNGUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rCj4g
KysrIGIvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rCj4gQEAgLTc3LDMyICs3NywzMyBA
QCBlbHNlCj4gIFdFQktJVEdUS19DT05GX09QVFMgKz0gLURFTkFCTEVfR0FNRVBBRD1PRkYKPiAg
ZW5kaWYKPiAgCj4gLSMgT25seSBvbmUgdGFyZ2V0IHBsYXRmb3JtIGNhbiBiZSBidWlsdCwgYXNz
dW1lIFgxMSA+IFdheWxhbmQKPiAtCj4gLSMgR1RLMy1YMTEgdGFyZ2V0IGdpdmVzIE9wZW5HTCBm
cm9tIG5ld2VyIGxpYmd0azMgdmVyc2lvbnMKPiAtIyBDb25zaWRlciB0aGlzIGJldHRlciB0aGFu
IEVHTCArIG1heWJlIEdMRVN2MiBzaW5jZSBib3RoIGNhbid0IGJlIGJ1aWx0Cj4gLSMgMkQgQ0FO
VkFTIGFjY2VsZXJhdGlvbiByZXF1aXJlcyBPcGVuR0wgcHJvcGVyIHdpdGggY2Fpcm8tZ2wKPiAt
aWZlcSAoJChCUjJfUEFDS0FHRV9MSUJHVEszX1gxMSkseSkKPiAtV0VCS0lUR1RLX0NPTkZfT1BU
UyArPSBcCj4gLQktREVOQUJMRV9HTEVTMj1PRkYgXAo+IC0JLURFTkFCTEVfWDExX1RBUkdFVD1P
Tgo+IC1XRUJLSVRHVEtfREVQRU5ERU5DSUVTICs9IGxpYmdsIFwKPiAtCXhsaWJfbGliWGNvbXBv
c2l0ZSB4bGliX2xpYlhkYW1hZ2UgeGxpYl9saWJYcmVuZGVyIHhsaWJfbGliWHQKPiAtZWxzZSAj
ICFYMTEKPiAtIyBHVEszLUJST0FEV0FZL1dBWUxBTkQgbmVlZHMgYXQgbGVhc3QgRUdMCj4gLVdF
QktJVEdUS19ERVBFTkRFTkNJRVMgKz0gbGliZWdsCj4gLSMgR0xFU3YyIHN1cHBvcnQgaXMgb3B0
aW9uYWwgdGhvdWdoCj4gLWlmZXEgKCQoQlIyX1BBQ0tBR0VfSEFTX0xJQkdMRVMpLHkpCj4gKyMg
VXNlIEdMRVMgaWYgYXZhaWxhYmxlIGFuZCBkZXNrdG9wIEdMIGlzIG5vdC4KPiArJChpbmZvICQo
QlIyX1BBQ0tBR0VfSEFTX0xJQkdMKTokKEJSMl9QQUNLQUdFX0hBU19MSUJHTEVTKSkKPiAraWZl
cSAoJChCUjJfUEFDS0FHRV9IQVNfTElCR0wpOiQoQlIyX1BBQ0tBR0VfSEFTX0xJQkdMRVMpLDp5
KQo+ICBXRUJLSVRHVEtfQ09ORl9PUFRTICs9IC1ERU5BQkxFX0dMRVMyPU9OCj4gIFdFQktJVEdU
S19ERVBFTkRFTkNJRVMgKz0gbGliZ2xlcwo+ICBlbHNlCj4gLSMgRGlzYWJsZSBnZW5lcmFsIE9w
ZW5HTCAoc2hhZGluZykgaWYgdGhlcmUncyBubyBHTEVTdjIKPiAgV0VCS0lUR1RLX0NPTkZfT1BU
UyArPSAtREVOQUJMRV9HTEVTMj1PRkYKPiAgZW5kaWYKPiAtIyBXZSBtdXN0IGV4cGxpY2l0bHkg
c3RhdGUgdGhlIHdheWxhbmQgdGFyZ2V0Cj4gKwo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0xJQkdU
SzNfWDExKSx5KQo+ICtXRUJLSVRHVEtfQ09ORl9PUFRTICs9IC1ERU5BQkxFX1gxMV9UQVJHRVQ9
T04KPiArV0VCS0lUR1RLX0RFUEVOREVOQ0lFUyArPSBsaWJnbCBcCj4gKwl4bGliX2xpYlhjb21w
b3NpdGUgeGxpYl9saWJYZGFtYWdlIHhsaWJfbGliWHJlbmRlciB4bGliX2xpYlh0Cj4gK2Vsc2UK
PiArV0VCS0lUR1RLX0NPTkZfT1BUUyArPSAtREVOQUJMRV9YMTFfVEFSR0VUPU9GRgo+ICtlbmRp
Zgo+ICsKPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJHVEszX1dBWUxBTkQpLHkpCj4gIFdFQktJ
VEdUS19DT05GX09QVFMgKz0gLURFTkFCTEVfV0FZTEFORF9UQVJHRVQ9T04KPiArV0VCS0lUR1RL
X0RFUEVOREVOQ0lFUyArPSBsaWJlZ2wKPiArZWxzZQo+ICtXRUJLSVRHVEtfQ09ORl9PUFRTICs9
IC1ERU5BQkxFX1dBWUxBTkRfVEFSR0VUPU9GRgo+ICBlbmRpZgo+ICsKPiArIyBJZiBvbmx5IHRo
ZSBHVEsgQnJvYWR3YXkgYmFja2VuZCBpcyBlbmFibGVkLCBFR0wgaXMgc3RpbGwgbmVlZGVkLgo+
ICtpZmVxICgkKEJSMl9QQUNLQUdFX0xJQkdUSzNfWDExKTokKEJSMl9QQUNLQUdFX0xJQkdUSzNf
V0FZTEFORCk6JChCUjJfUEFDS0FHRV9MSUJHVEszX0JST0FEV0FZKSw6OnkpCj4gK1dFQktJVEdU
S19ERVBFTkRFTkNJRVMgKz0gbGliZWdsCj4gIGVuZGlmCj4gIAo+ICBpZmVxICgkKEJSMl9QQUNL
QUdFX0xJQkdUSzNfV0FZTEFORCkkKEJSMl9QQUNLQUdFX1dQRUJBQ0tFTkRfRkRPKSx5eSkKPiAt
LSAKPiAyLjQwLjAKPiAKPiAKCkNoZWVycywK4oCUQWRyacOhbgo=

--aVn/zb+zx36qUjdB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZDgTqAAKCRCRxVnb5MkS
O5FxAJ4oz7t+iLIfRp2+3i1Smt30BLNe3ACeP/IKLAWrykJ2cD42bGj29z9gh9w=
=FEDW
-----END PGP SIGNATURE-----

--aVn/zb+zx36qUjdB--

--===============0784842069468636319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0784842069468636319==--
