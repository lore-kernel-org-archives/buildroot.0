Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B5EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A617408DE;
	Sat,  8 Jan 2022 18:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M66s32-Q8jm4; Sat,  8 Jan 2022 18:20:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D030408DA;
	Sat,  8 Jan 2022 18:20:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09BD91BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0399C81319
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CxZ2lb3KmOkQ for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:20:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C89D981307
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:20:37 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id m21so35831846edc.0
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 10:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9HnAAJu5GtyjGrnlA75I1rZr87Awnyac4QNSm/qLVtw=;
 b=aye9TZczX54dlD63JaO7ljjyMFnfcZ/V1hvYZKIxY+bdSItveewEbfgNT8Qy/4km/u
 KnW9UM6mhoy+fFNOmmS+mLR6e+dRMlBDW1IlWMIwcipS5S13AYiuoiStWrn3hLDXndni
 DcgorGqr93KnCizOhiomfXqSlMnCIssL0iBuj9VjGebKHDC3p5ITrOGRx7/EJruBv691
 Q+FfP7WKfATWyEe9NEtXUzx8zd2OxA19anarkkCKp8tcXdEy3R/sGzmqqYNSy7Xk44jP
 snTzXdQCBQX4r1mQ+seVR84gFCQUEf3yKCUYTI+50MLtzVDr2BaV77awchUdR9iaX8cE
 I32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9HnAAJu5GtyjGrnlA75I1rZr87Awnyac4QNSm/qLVtw=;
 b=CFNwYwjYhU/OhCww/p5NxiCGtQz+IgcpMkqwdotWKfSpm+r7ENaj83mxaFAktarvnS
 UD2FHLf/Dek0mtx3wyU9DQSuNva1c9Hf3mI5cL97vJlRC4kEd69L1QoJJ/uwUSoWdEu0
 4bavEU9M934hqxV5YyHBxLutSSlHjH8/MJFXCGo4lR/CDwnlE+fg61j5qSJB/5pawTT7
 oc0iErYK5jg9xHEyfRwPmI8tr5GTS55ykKgjLE8ucZd0W1e4zi2Zxe8MJ6F0OTzQ5xRl
 BcQzLwA9mpeV45+1CchVhaIlw1BrIHC20gthQ2WGbO6x39YWttKF7yx56bb1QcAMXQ8f
 a2vw==
X-Gm-Message-State: AOAM531gBq1mfYxvY0FuhRqPO0hQEGwCKZMiVx/m0fGoH+Mr9za4R9fe
 Nbblgv0gII4WcUiCpk2cLQeDcUpBo7OpcHgXF6KTDLII
X-Google-Smtp-Source: ABdhPJw0doMRUnBHU+QycPi6Xq/fpOANAVXUNvBSA7EpBaqkc/OZNeF/YQFddtFo/69qJEJfxFZH+icG6raVPcLwDr8=
X-Received: by 2002:a17:906:6a23:: with SMTP id
 qw35mr1933666ejc.117.1641666035456; 
 Sat, 08 Jan 2022 10:20:35 -0800 (PST)
MIME-Version: 1.0
References: <20220108164646.2737567-1-fontaine.fabrice@gmail.com>
 <20220108181037.GC1881783@scaer> <20220108181251.GD1881783@scaer>
In-Reply-To: <20220108181251.GD1881783@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 8 Jan 2022 19:19:20 +0100
Message-ID: <CAPi7W81QeeiFHOoP_W6S5gCDmSfirPfPNbTG0GUMjseAnAfVvA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] drop .defconfig
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCkxlIHNhbS4gOCBqYW52LiAyMDIyIMOgIDE5OjEyLCBZYW5uIEUuIE1PUklOIDx5YW5u
Lm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgo+Cj4gRmFicmljZSwgQWxsLAo+Cj4gT24g
MjAyMi0wMS0wOCAxOToxMCArMDEwMCwgWWFubiBFLiBNT1JJTiBzcGFrZSB0aHVzbHk6Cj4gPiBG
YWJyaWNlLCBBbGwsCj4gPgo+ID4gT24gMjAyMi0wMS0wOCAxNzo0NiArMDEwMCwgRmFicmljZSBG
b250YWluZSBzcGFrZSB0aHVzbHk6Cj4gPiA+IC5kZWZjb25maWcgaGFzIG5vdCBiZWVuIHVwZGF0
ZWQgc2luY2UgMjAxNiB3aXRoIGNvbW1pdAo+ID4gPiA0MzM4YTMxOWI3MjU3MGU0MzNmZDc0ODRm
OGE5NWUxZTBlOTc4OTQxIHNvIGRyb3AgdGhpcyBmaWxlIHdoaWNoIGRvZXNuJ3QKPiA+ID4gc2Vl
bSB0byBiZSB1c2VkCj4gPiBUaGlzIGJyZWFrcyBvdXQtb2YtdHJlZSBidWlsZHM6Cj4KPiBXZWxs
LCB0aGlzIGlzIGFsc28gYnJva2VuIGZvciBpbi10cmVlIGJ1aWxkczoKPgo+ICAgICAkIGdpdCBj
bGVhbiAtZFgKPiAgICAgJCBtYWtlIGRlZmNvbmZpZwo+ICAgICBbLi4uXQo+ICAgICAqKioKPiAg
ICAgKioqIENhbid0IGZpbmQgZGVmYXVsdCBjb25maWd1cmF0aW9uICIuZGVmY29uZmlnIiEKPiAg
ICAgKioqCj4gICAgIG1ha2VbMV06ICoqKiBbTWFrZWZpbGU6MTAyNDogZGVmY29uZmlnXSBFcnJv
ciAxCj4gICAgIG1ha2U6ICoqKiBbTWFrZWZpbGU6ODQ6IF9hbGxdIEVycm9yIDIKPgo+IFNvLCBt
ZWguLi4KT0sgc28gdGhpcyBmaWxlIGlzIG5lZWRlZCBmb3IgIm1ha2UgZGVmY29uZmlnIi4KSSdt
IGFsd2F5cyBydW5uaW5nICJtYWtlIHh4eF9kZWZjb25maWciIGFuZCAibWFrZSBtZW51Y29uZmln
IgpIb3dldmVyLCBwZXJoYXBzIGl0IHdvdWxkIGJlIGJldHRlciB0byB1c2UgYSBzeW1saW5rIGZv
ciAuZGVmY29uZmlnPwpXZSBjb3VsZCBzeW1saW5rIGl0IHRvIHJhc3BiZXJyeXBpNF9kZWZjb25m
aWcgb3IgYW55IG90aGVyIGNvbmZpZy4KSSBmb3VuZCBpdCBzdHJhbmdlIHRoYXQgdGhpcyBmaWxl
IHdhc24ndCB1cGRhdGVkIGZvciBzbyBsb25nLgo+Cj4gVGhpcyBmaWxlIHNob3VsZCBpbmRlZWQg
bm90IGJlIG5lZWRlZC4uLgo+Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+Cj4gPiBSZWdh
cmRzLAo+ID4gWWFubiBFLiBNT1JJTi4KPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2Ug
Rm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIC5k
ZWZjb25maWcgfCA1MSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1MSBkZWxldGlvbnMoLSkKPiA+ID4gIGRl
bGV0ZSBtb2RlIDEwMDY0NCAuZGVmY29uZmlnCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS8uZGVm
Y29uZmlnIGIvLmRlZmNvbmZpZwo+ID4gPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4g
aW5kZXggN2FiMGMzZmJmMC4uMDAwMDAwMDAwMAo+ID4gPiAtLS0gYS8uZGVmY29uZmlnCj4gPiA+
ICsrKyAvZGV2L251bGwKPiA+ID4gQEAgLTEsNTEgKzAsMCBAQAo+ID4gPiAtIwo+ID4gPiAtIyBB
dXRvbWF0aWNhbGx5IGdlbmVyYXRlZCBtYWtlIGNvbmZpZzogZG9uJ3QgZWRpdAo+ID4gPiAtIyBN
b24gRmViIDE4IDA5OjExOjU2IDIwMDgKPiA+ID4gLSMKPiA+ID4gLUJSMl9IQVZFX0RPVF9DT05G
SUc9eQo+ID4gPiAtIyBCUjJfYWxwaGEgaXMgbm90IHNldAo+ID4gPiAtIyBCUjJfYXJtIGlzIG5v
dCBzZXQKPiA+ID4gLSMgQlIyX2FybWViIGlzIG5vdCBzZXQKPiA+ID4gLSMgQlIyX2NyaXMgaXMg
bm90IHNldAo+ID4gPiAtIyBCUjJfaWE2NCBpcyBub3Qgc2V0Cj4gPiA+IC1CUjJfaTM4Nj15Cj4g
PiA+IC0jIEJSMl9tNjhrIGlzIG5vdCBzZXQKPiA+ID4gLSMgQlIyX21pcHMgaXMgbm90IHNldAo+
ID4gPiAtIyBCUjJfbWlwc2VsIGlzIG5vdCBzZXQKPiA+ID4gLSMgQlIyX25pb3MyIGlzIG5vdCBz
ZXQKPiA+ID4gLSMgQlIyX3Bvd2VycGMgaXMgbm90IHNldAo+ID4gPiAtIyBCUjJfc2ggaXMgbm90
IHNldAo+ID4gPiAtIyBCUjJfc3BhcmMgaXMgbm90IHNldAo+ID4gPiAtIyBCUjJfc3BhcmM2NCBp
cyBub3Qgc2V0Cj4gPiA+IC0jIEJSMl94ODZfNjQgaXMgbm90IHNldAo+ID4gPiAtIyBCUjJfeDg2
X2k0ODYgaXMgbm90IHNldAo+ID4gPiAtIyBCUjJfeDg2X2k1ODYgaXMgbm90IHNldAo+ID4gPiAt
QlIyX3g4Nl9pNjg2PXkKPiA+ID4gLSMgQlIyX3g4Nl9wZW50aXVtcHJvIGlzIG5vdCBzZXQKPiA+
ID4gLSMgQlIyX3g4Nl9wZW50aXVtX21teCBpcyBub3Qgc2V0Cj4gPiA+IC0jIEJSMl94ODZfcGVu
dGl1bV9tIGlzIG5vdCBzZXQKPiA+ID4gLSMgQlIyX3g4Nl9wZW50aXVtMiBpcyBub3Qgc2V0Cj4g
PiA+IC0jIEJSMl94ODZfcGVudGl1bTMgaXMgbm90IHNldAo+ID4gPiAtIyBCUjJfeDg2X3BlbnRp
dW00IGlzIG5vdCBzZXQKPiA+ID4gLSMgQlIyX3g4Nl9wcmVzY290dCBpcyBub3Qgc2V0Cj4gPiA+
IC0jIEJSMl94ODZfbm9jb25hIGlzIG5vdCBzZXQKPiA+ID4gLSMgQlIyX3g4Nl9jb3JlMiBpcyBu
b3Qgc2V0Cj4gPiA+IC0jIEJSMl94ODZfazYgaXMgbm90IHNldAo+ID4gPiAtIyBCUjJfeDg2X2s2
XzIgaXMgbm90IHNldAo+ID4gPiAtIyBCUjJfeDg2X2F0aGxvbiBpcyBub3Qgc2V0Cj4gPiA+IC0j
IEJSMl94ODZfYXRobG9uXzQgaXMgbm90IHNldAo+ID4gPiAtIyBCUjJfeDg2X29wdGVyb24gaXMg
bm90IHNldAo+ID4gPiAtIyBCUjJfeDg2X29wdGVyb25fc3NlMyBpcyBub3Qgc2V0Cj4gPiA+IC0j
IEJSMl94ODZfYmFyY2Vsb25hIGlzIG5vdCBzZXQKPiA+ID4gLSMgQlIyX3g4Nl9nZW9kZSBpcyBu
b3Qgc2V0Cj4gPiA+IC0jIEJSMl94ODZfYzMgaXMgbm90IHNldAo+ID4gPiAtIyBCUjJfeDg2X3dp
bmNoaXBfYzYgaXMgbm90IHNldAo+ID4gPiAtIyBCUjJfeDg2X3dpbmNoaXAyIGlzIG5vdCBzZXQK
PiA+ID4gLUJSMl9BUkNIPSJpNjg2Igo+ID4gPiAtQlIyX0VORElBTj0iTElUVExFIgo+ID4gPiAt
QlIyX0dDQ19UQVJHRVRfVFVORT0iaTY4NiIKPiA+ID4gLUJSMl9HQ0NfVEFSR0VUX0FSQ0g9Imk2
ODYiCj4gPiA+IC0KPiA+ID4gLSMKPiA+ID4gLSMgVGFyZ2V0IG9wdGlvbnMKPiA+ID4gLSMKPiA+
ID4gLS0KPiA+ID4gMi4zNC4xCj4gPiA+Cj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+ID4g
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gPgo+ID4gLS0KPiA+IC4tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uCj4gPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8i
XCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+ID4gfCArMzMgNjYyIDM3NiAw
NTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAg
ICAgICAgIHwKPiA+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFgg
IEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gPiB8IGh0dHA6Ly95bW9yaW4u
aXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGly
YWN5LiAgfAo+ID4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKPiA+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4KPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVND
SUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNv
ZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAg
fAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1Qg
ICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5v
cmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAn
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
