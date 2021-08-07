Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECF5C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:13:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ECF060F50
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0ECF060F50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF79E403D0;
	Sat,  7 Aug 2021 17:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1qswKvDNoqN2; Sat,  7 Aug 2021 17:12:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AAC7403CE;
	Sat,  7 Aug 2021 17:12:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA58E1BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA17C403CE
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wePkftKRJ2qY for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:12:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9803E403CA
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:12:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6435:5a60:3dd3:9849])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 88F9F780310;
 Sat,  7 Aug 2021 19:12:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628356373;
 bh=ZvTLXLenYj8U/faAtPqraVFlT7s3Oe/sv/7y8BNQWTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rWWEl5jyEgTEZW+Z8VSrWsJHScOxr8AUwkil1N/3aHiam+yAIWLTggaZjYrRmSAV+
 ePB/VCJyqFhkqk+PnBeS6qB9NqppNvxGkS2Uqx0A/9sSHyNTFHeJRyZlj33tnzuTgR
 w1vS8Jk1WdBLtNGBTH7+oK2IpXaBMTa5uQ44uOlBy7MFxtIWWBMaOeJnB6wG7NzaS2
 Ju1sNq2x9mC3I3fMLWSGi6BnERRqkNcWRhRDS3CBl2bfUa/95sbZCgZdpiDm52gM8M
 Z4qmHbI4iOHeGL7IOy6tsI70G3Df3r1D+UVGOpqwpOSKaWbVXAfdfGCt44y7C1MteJ
 zpwE5/8dlV1KQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Aug 2021 19:12:49 +0200
Date: Sat, 7 Aug 2021 19:12:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210807171249.GE27036@scaer>
References: <20210806184411.4062961-1-fontaine.fabrice@gmail.com>
 <20210807085303.GU27036@scaer>
 <CAPi7W81cMuZYxxLKYW22N6-htbfCaXYkHoJCmnV-izpjCvSMew@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W81cMuZYxxLKYW22N6-htbfCaXYkHoJCmnV-izpjCvSMew@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/guile: fix build on riscv32
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

RmFicmljZSwgQWxsLAoKT24gMjAyMS0wOC0wNyAxNzowOCArMDIwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gTGUgc2FtLiA3IGFvw7t0IDIwMjEgw6AgMTA6NTMsIFlhbm4gRS4g
TU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4gPiBPbiAyMDIxLTA4
LTA2IDIwOjQ0ICswMjAwLCBGYWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToKPiA+ID4gRml4
IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSBvbiByaXNjdjMyOgo+ID4gPiBzeXN0ZW0vYmFz
ZS90YXJnZXQuc2NtOjEzMjoxNjogSW4gcHJvY2VkdXJlIHRyaXBsZXQtcG9pbnRlci1zaXplOgo+
ID4gPiB1bmtub3duIENQVSB3b3JkIHNpemUgInJpc2N2MzIiClstLVNOSVAtLV0KPiA+ID4gKysg
ICAgICAgICAgKChzdHJpbmctbWF0Y2ggIl5yaXNjdi4qIiBjcHUpIDgpCj4gPiBBcmUgeW91IHN1
cmUgdGhhdCBhIDMyLWJpdCBDUFUgd2lsbCBoYXZlIDgtYnl0ZSB3aWRlIHdvcmRzPyBJIHdvdWxk
Cj4gPiBoYXZlIG5hdHVycmFsbHkgZXhwZWN0ZWQgdGhlbSB0byBiZSBqdXN0IDQtYnl0ZSB3aWRl
Li4uCj4gQXMgSSdtIG5vdCBhbiBleHBlcnQgaW4gcmlzY3YsIEkgc2VhcmNoZWQgb24gd2lraXBl
ZGlhIGFuZCBoZXJlIGlzIGFuCj4gZXh0cmFjdCBvZiBodHRwczovL2VuLndpa2lwZWRpYS5vcmcv
d2lraS9SSVNDLVY6Cj4gIk1lbW9yeSBpcyBhZGRyZXNzZWQgYXMgOC1iaXQgYnl0ZXMsIHdpdGgg
d29yZHMgYmVpbmcgaW4gbGl0dGxlLWVuZGlhbiBvcmRlciIKPiBJdCB3b3VsZCBiZSBncmVhdCBp
ZiBhIHJpc2N2IGV4cGVydCBjb3VsZCBjb25maXJtIG9yIG5vdCB0aGlzIGluZm9ybWF0aW9uLgoK
U28sIHllcy4gUmUtcmVhZCB0aGF0IGNhcmVmdWxseToKCiAgLSA4LWJpdCBieXRlcy4gSS5lLiBh
IGJ5dGUgaXMgOCBiaXRzCgogIC0gd29yZHMgYmVpbmcgaW4gbGl0dGxlLWVuZGlhbiBvcmRlcgoK
VGhhdCBpbmRlZWQgc2F5cyBub3RoaW5nIGFib3V0IHdvcmQgc2l6ZSBpbiBieXRlcyAobm90IGlu
IGJpdHMhKS4KCkkgbWlnaHQgYmUgd3JvbmcsIGJ1dCBvbiBhIDMyLWJpdCBhcmNoLCB3b3JkcyBh
cmUgYWx3YXlzIDQtYnl0ZXMgd2lkZXMsCmkuZS4gMzIgYml0cywgd2hpbGUgb24gYSA2NC1iaXQg
YXJjaGl0ZWN1dHJlLCB3b3JkcyBhcmUgOC1ieXRlIHdpZGUsCmkuZS4gNjQgYml0cy4KClNvLCBJ
IHdvdWxkIHdhZ2VyIHRoYXQgcmlzY3YzMiBoYXMgNC1ieXRlIHdpZGUsIGllIDMyLWJpdCB3aWRl
LCB3b3Jkcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ID4gSWYgaHRpcyBpcyBpbmRlZWQg
dGhlIGNhc2UsIHRoZW4gcGxlYXNlIGV4cGxhaW4gdGhhdCBpbiB0aGUgcGF0Y2ggY29tbWl0Cj4g
PiBsb2cuLi4KPiA+Cj4gPiBSZWdhcmRzLAo+ID4gWWFubiBFLiBNT1JJTi4KPiA+Cj4gPiA+ICsg
ICAgICAgICAgIChlbHNlIChlcnJvciAidW5rbm93biBDUFUgd29yZCBzaXplIiBjcHUpKSkpKQo+
ID4gPiArCj4gPiA+ICsgKGRlZmluZSAodHJpcGxldC1jcHUgdCkKPiA+ID4gKy0tCj4gPiA+ICsy
LjMwLjIKPiA+ID4gKwo+ID4gPiAtLQo+ID4gPiAyLjMwLjIKPiA+ID4KPiA+ID4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+ID4gPiBidWlsZHJvb3RAYnVzeWJveC5uZXQKPiA+ID4gaHR0cDovL2xpc3Rz
LmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gPgo+ID4gLS0KPiA+IC4t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBF
bWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+ID4gfCAr
MzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwg
IF9fXyAgICAgICAgICAgICAgIHwKPiA+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0u
LS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gPiB8IGh0
dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAg
IHYgICBjb25zcGlyYWN5LiAgfAo+ID4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKPiBCZXN0IFJl
Z2FyZHMsCj4gCj4gRmFicmljZQoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNz
JyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwg
XCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3
IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlz
IG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5l
dC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
