Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B2FC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 21:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6745060B16;
	Fri, 29 Jul 2022 21:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6745060B16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GKCMvWfXb4Mu; Fri, 29 Jul 2022 21:37:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6428B60AED;
	Fri, 29 Jul 2022 21:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6428B60AED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7160F1BF31D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4906C4055F
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4906C4055F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eAYH0PmRY19J for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 21:37:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 327D84038B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 327D84038B
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 21:37:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d054:eb09:eac4:da7e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1D3AA13FA39;
 Fri, 29 Jul 2022 23:37:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Jul 2022 23:37:21 +0200
Date: Fri, 29 Jul 2022 23:37:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Message-ID: <20220729213721.GH1554632@scaer>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-4-joel@jms.id.au>
 <b1b0b11a-6c49-9d7c-5d1b-b6ec8e6a2966@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1b0b11a-6c49-9d7c-5d1b-b6ec8e6a2966@kaod.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659130649;
 bh=SuAJ/mid3Y2lLpg8FJdxNrHH9qzL3NANe/2AhtbF2Mg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C3vQ4/ZBwfgAb2juk2IcJ4T7gOMJJkK4jGpXQQZdMG7qi7zEmYUOe9d72xthI9FaQ
 A8pF6huIlnsyZ/HhqhZr39aAcziuV+cyeuFhvVHp3wFRMrg/b3fyYdhAyrj9X9DcCg
 wzPmIKsHzgHyrZXGR2kp0wz9b2aovLcqdR26Y6BdVnOxCNs516THjOLFch+RZtpnXl
 OmW9C6UWaTUjRb7qNfkUVQGScWFvsEuoyor2WYgwlk7O55sY21HDzG7k8kt6dPZNyY
 ZtfXqrSv6aV7hwVwzNm78Cdbs5Jj45aaQbMnDRftWr/qo/KINmLm26ZaZMheNL53Z5
 OCQXZUylkj9eA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C3vQ4/ZB
Subject: Re: [Buildroot] [PATCH 3/9] arch/powerpc: Enable powerpc64le only
 on CPUs that support it
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Joel Stanley <joel@jms.id.au>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q8OpZHJpYywgSm9lbCwgQWxsLAoKT24gMjAyMi0wNy0yOSAwODo1MiArMDIwMCwgQ8OpZHJpYyBM
ZSBHb2F0ZXIgc3Bha2UgdGh1c2x5Ogo+IE9uIDcvMjkvMjIgMDI6MDgsIEpvZWwgU3RhbmxleSB3
cm90ZToKPiA+SW52YWxpZCBjb25maWd1cmF0aW9ucyBsZWFkIHRvIGJ1aWxkIGZhaWx1cmVzLCBz
dWNoIGFzIHRyeWluZyB0byBlbmFibGUKPiA+cHBjNjRsZSBmb3IgdGhlIHBwYzk3MDoKPiA+Cj4g
PiAgIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2ZkYTg4Njc2OGZjZTI1
Y2NkOWI1MmI2MzVmZjViMTNkYTdiYTJkMGMvCj4gPgo+ID5JbiBvcmRlciB0byBydW4gYSBwcGM2
NGxlIHVzZXJzcGFjZSBhIGtlcm5lbCB0aGF0IHJ1bnMgaW4gdGhpcyBtb2RlIGlzCj4gPnJlcXVp
cmVkLiBUaGUgb25seSBDUFUgc3VwcG9ydGVkIGluIGJ1aWxkcm9vdCB0aGF0IGNhbiBib290IGEg
cHBjNjRsZQo+ID5rZXJuZWwgaXMgUG93ZXI4LCBzbyBtYXJrIGFsbCBvZiB0aGUgb3RoZXIgNjQt
Yml0IGNhcGFibGUgQ1BVcyBhcyBub3QKPiA+c3VwcG9ydGluZyBwcGM2NGxlLgo+IEkgZG9uJ3Qg
dGhpbmsgd2UgY2FyZSBtdWNoIGJ1dCBQb3dlcjcgY291bGQgcnVuIGFsc28gaW4gTEUuCgpKb2Vs
IHNlZW1lZCB0byBzdGF0ZSB0aGF0IG9ubHkgdGhlIHBvd2VyOCBjYW4gYmUgTEUsIHNvIHdobydz
IHJpZ2h0PyA7LSkKCkluIGFueSBjYXNlLCBpZiBtYW9yZSB2YXJpYW50cyB0dXJuIG91dCB0byBi
ZSBMRS1jb21wYXRpYmxlLCBpdCBpcyBzdGlsbApwb3NzaWJsZSB0byBlbmFibGUgaHRlbSBpbiBm
b2xsb3d1cCBwYXRjaGVzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gUmV2aWV3ZWQtYnk6
IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Cj4gCj4gVGhhbmtzLAo+IAo+IEMuCj4g
Cj4gPgo+ID5UaGlzIGRyb3BzIHRoZSBjb21tZW50IGFib3V0IGxpYmMsIHdoaWNoIGlzIHRydWUg
YnV0IGRvZXNuJ3QgdGVsbCB0aGUKPiA+d2hvbGUgc3RvcnkuCj4gPgo+ID5TaWduZWQtb2ZmLWJ5
OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pgo+ID4tLS0KPiA+ICBhcmNoL0NvbmZpZy5p
bi5wb3dlcnBjIHwgMTEgKysrKysrKy0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+ZGlmZiAtLWdpdCBhL2FyY2gvQ29uZmlnLmlu
LnBvd2VycGMgYi9hcmNoL0NvbmZpZy5pbi5wb3dlcnBjCj4gPmluZGV4IDhkMzkyYmZkZTgxNC4u
N2M2YWU4NDM0OGU5IDEwMDY0NAo+ID4tLS0gYS9hcmNoL0NvbmZpZy5pbi5wb3dlcnBjCj4gPisr
KyBiL2FyY2gvQ29uZmlnLmluLnBvd2VycGMKPiA+QEAgLTcxLDExICs3MSw5IEBAIGNvbmZpZyBC
UjJfcG93ZXJwY182MDRlCj4gPiAgCWRlcGVuZHMgb24gIUJSMl9BUkNIX0lTXzY0Cj4gPiAgY29u
ZmlnIEJSMl9wb3dlcnBjXzYyMAo+ID4gIAlib29sICI2MjAiCj4gPi0JIyBObyBDIGxpYnJhcnkg
c3VwcG9ydHMgdGhpcyB2YXJpYW50IG9uIHBwYzY0bGUKPiA+ICAJZGVwZW5kcyBvbiAhQlIyX3Bv
d2VycGM2NGxlCj4gPiAgY29uZmlnIEJSMl9wb3dlcnBjXzYzMAo+ID4gIAlib29sICI2MzAiCj4g
Pi0JIyBObyBDIGxpYnJhcnkgc3VwcG9ydHMgdGhpcyB2YXJpYW50IG9uIHBwYzY0bGUKPiA+ICAJ
ZGVwZW5kcyBvbiAhQlIyX3Bvd2VycGM2NGxlCj4gPiAgY29uZmlnIEJSMl9wb3dlcnBjXzc0MAo+
ID4gIAlib29sICI3NDAiCj4gPkBAIC0xMDIsNiArMTAwLDcgQEAgY29uZmlnIEJSMl9wb3dlcnBj
Xzg2MAo+ID4gIAlkZXBlbmRzIG9uICFCUjJfQVJDSF9JU182NAo+ID4gIGNvbmZpZyBCUjJfcG93
ZXJwY185NzAKPiA+ICAJYm9vbCAiOTcwIgo+ID4rCWRlcGVuZHMgb24gIUJSMl9wb3dlcnBjNjRs
ZQo+ID4gIAlzZWxlY3QgQlIyX1BPV0VSUENfQ1BVX0hBU19BTFRJVkVDCj4gPiAgY29uZmlnIEJS
Ml9wb3dlcnBjXzg1NDAKPiA+ICAJYm9vbCAiODU0MCAvIGU1MDB2MSIKPiA+QEAgLTEyOSwyMSAr
MTI4LDI1IEBAIGNvbmZpZyBCUjJfcG93ZXJwY19lNjUwMAo+ID4gIAlzZWxlY3QgQlIyX1BPV0VS
UENfQ1BVX0hBU19BTFRJVkVDCj4gPiAgY29uZmlnIEJSMl9wb3dlcnBjX3Bvd2VyNAo+ID4gIAli
b29sICJwb3dlcjQiCj4gPi0JIyBObyBDIGxpYnJhcnkgc3VwcG9ydHMgdGhpcyB2YXJpYW50IG9u
IHBwYzY0bGUKPiA+ICAJZGVwZW5kcyBvbiAhQlIyX3Bvd2VycGM2NGxlCj4gPiAgY29uZmlnIEJS
Ml9wb3dlcnBjX3Bvd2VyNQo+ID4gIAlib29sICJwb3dlcjUiCj4gPi0JIyBObyBDIGxpYnJhcnkg
c3VwcG9ydHMgdGhpcyB2YXJpYW50IG9uIHBwYzY0bGUKPiA+ICAJZGVwZW5kcyBvbiAhQlIyX3Bv
d2VycGM2NGxlCj4gPisJZGVwZW5kcyBvbiBCUjJfQVJDSF9JU182NAo+ID4gIGNvbmZpZyBCUjJf
cG93ZXJwY19wb3dlcjYKPiA+ICAJYm9vbCAicG93ZXI2Igo+ID4rCWRlcGVuZHMgb24gIUJSMl9w
b3dlcnBjNjRsZQo+ID4rCWRlcGVuZHMgb24gQlIyX0FSQ0hfSVNfNjQKPiA+ICAJc2VsZWN0IEJS
Ml9QT1dFUlBDX0NQVV9IQVNfQUxUSVZFQwo+ID4gIGNvbmZpZyBCUjJfcG93ZXJwY19wb3dlcjcK
PiA+ICAJYm9vbCAicG93ZXI3Igo+ID4rCWRlcGVuZHMgb24gIUJSMl9wb3dlcnBjNjRsZQo+ID4r
CWRlcGVuZHMgb24gQlIyX0FSQ0hfSVNfNjQ+Cj4gPiAgCXNlbGVjdCBCUjJfUE9XRVJQQ19DUFVf
SEFTX0FMVElWRUMKPiA+ICAJc2VsZWN0IEJSMl9QT1dFUlBDX0NQVV9IQVNfVlNYCj4gPiAgY29u
ZmlnIEJSMl9wb3dlcnBjX3Bvd2VyOAo+ID4gIAlib29sICJwb3dlcjgiCj4gPisJZGVwZW5kcyBv
biBCUjJfQVJDSF9JU182NAo+ID4gIAlzZWxlY3QgQlIyX1BPV0VSUENfQ1BVX0hBU19BTFRJVkVD
Cj4gPiAgCXNlbGVjdCBCUjJfUE9XRVJQQ19DUFVfSEFTX1ZTWAo+ID4gIGVuZGNob2ljZQo+IAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAv
IlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYg
fCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAg
ICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5T
VCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5v
cmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
