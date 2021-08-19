Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60562C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:41:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 137866108F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 137866108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D65CF60639;
	Thu, 19 Aug 2021 21:41:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZcnGYWXy7B2; Thu, 19 Aug 2021 21:41:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A02F60775;
	Thu, 19 Aug 2021 21:41:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A5BF1BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59CDB60775
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bPXbvnzw-ZXj for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:41:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B00E60639
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:41:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B91FE1C0004;
 Thu, 19 Aug 2021 21:41:43 +0000 (UTC)
Date: Thu, 19 Aug 2021 23:41:42 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <20210819234142.7ea85d89@windsurf>
In-Reply-To: <20210812105258.21582-1-zajec5@gmail.com>
References: <20210812105258.21582-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] board/broadcom: add support for BCM4908
 platform devices
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
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gUmFmYcWCLAoKT24gVGh1LCAxMiBBdWcgMjAyMSAxMjo1Mjo1OCArMDIwMApSYWZhxYIg
TWnFgmVja2kgPHphamVjNUBnbWFpbC5jb20+IHdyb3RlOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVj
a2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gQkNNNDkwOCBpcyBCcm9hZGNvbSdzIDY0LWJpdCBw
bGF0Zm9ybSB3aXRoIEJyb2FkY29tJ3Mgb3duIEJyYWhtYS1CNTMKPiBDUFUocykuIEl0J3MgbW9z
dGx5IHVzZWQgZm9yIGhvbWUgcm91dGVycy4KPiAKPiBLZXJuZWwgY29uZmlnIGlzIGEgbWluaW1h
bCBzZXR1cCByZXF1aXJlZCB0byBzdXBwb3J0IG9uLVNvQyBibG9ja3MgbGlrZQo+IE5BTkQgY29u
dHJvbGxlciwgRXRoZXJuZXQsIHN3aXRjaCwgVVNCLgo+IAo+IFRvIG1ha2Uga2VybmVscyA1LjEy
KyBib290IHRob3NlIGJvYXJkcyByZXF1aXJlIGEgaGFja3kgcGF0Y2ggbW9kaWZ5aW5nCj4gaHlw
LXN0dWIuUy4gVGhhdCBib290aW5nIHByb2JsZW0gd2lsbCBob3BlZnVsbHkgZ2V0IGZpeGVzIG9u
IGRheSBpbgo+IHVwc3RyZWFtIGtlcm5lbCBjb2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KCkhlcmUgYWdhaW4gdGhpcyBkZWZjb25maWcg
ZG9lcyBub3QgYnVpbGQgYW55IGJvb3Rsb2FkZXIuIE1vc3QgQnVpbGRyb290CmRlZmNvbmZpZ3Mg
bm9ybWFsbHkgdHJ5IHRvIGJ1aWxkIHRoZSB3aG9sZSBzb2Z0d2FyZSBzdGFjaywgaW5jbHVkaW5n
CnRoZSBib290bG9hZGVyL2Zpcm13YXJlLiBBbnkgcmVhc29uIG5vdCB0byBkbyBzbyBoZXJlPyBB
bHNvIHdoeSBpcyBhbgppbml0cmFtZnMgdXNlZD8KCj4gLS0tCj4gIGJvYXJkL2Jyb2FkY29tL2Jj
bTQ5MDgvbGludXguY29uZmlnICAgICAgICAgICB8IDQyICsrKysrKysrKysrKysrKysrKysKPiAg
Li4uLzAwMDEtYXJtNjQtZG9uLXQtaXNzdWUtSFZDLW9uLWJvb3QucGF0Y2ggIHwgMzIgKysrKysr
KysrKysrKysKPiAgY29uZmlncy9icm9hZGNvbV9iY200OTA4X2RlZmNvbmZpZyAgICAgICAgICAg
IHwgMTIgKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKQoKYm9hcmQv
YnJvYWRjb20vYmNtNDkwOC9yZWFkbWUudHh0IG5lZWRlZCwgYXMgd2VsbCBhcyBhbiB1cGRhdGUg
dG8gdGhlCkRFVkVMT1BFUlMgZmlsZS4KCgo+ICsrKyBiL2JvYXJkL2Jyb2FkY29tL2JjbTQ5MDgv
bGludXguY29uZmlnCj4gQEAgLTAsMCArMSw0MiBAQAo+ICtDT05GSUdfQkxLX0RFVl9JTklUUkQ9
eQo+ICtDT05GSUdfSU5JVFJBTUZTX1NPVVJDRT0iJHtCUl9CSU5BUklFU19ESVJ9L3Jvb3Rmcy5j
cGlvIgoKTm90IG5lZWRlZCwgd2lsbCBiZSBhZGRlZCBieSBCdWlsZHJvb3QuCgoKPiBkaWZmIC0t
Z2l0IGEvY29uZmlncy9icm9hZGNvbV9iY200OTA4X2RlZmNvbmZpZyBiL2NvbmZpZ3MvYnJvYWRj
b21fYmNtNDkwOF9kZWZjb25maWcKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAuLmM2MzEwZGUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvY29uZmlncy9icm9hZGNvbV9iY200
OTA4X2RlZmNvbmZpZwo+IEBAIC0wLDAgKzEsMTIgQEAKPiArQlIyX2FhcmNoNjQ9eQo+ICtCUjJf
TElOVVhfS0VSTkVMPXkKPiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Cj4gK0JS
Ml9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjUuMTMuOSIKPiArQlIyX0xJTlVY
X0tFUk5FTF9VU0VfQ1VTVE9NX0NPTkZJRz15Cj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0NP
TkZJR19GSUxFPSJib2FyZC9icm9hZGNvbS9iY200OTA4L2xpbnV4LmNvbmZpZyIKPiArQlIyX0xJ
TlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4gK0JSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19O
QU1FPSJicm9hZGNvbS9iY200OTA4L2JjbTQ5MDYtbmV0Z2Vhci1yODAwMHAgYnJvYWRjb20vYmNt
NDkwOC9iY200OTA2LXRwbGluay1hcmNoZXItYzIzMDAtdjEgYnJvYWRjb20vYmNtNDkwOC9iY200
OTA4LWFzdXMtZ3QtYWM1MzAwIgo+ICtCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRT15CgpBZGRl
ZCwgYnV0IG5vIGZpcm13YXJlIGVuYWJsZWQ/Cgo+ICtCUjJfUEFDS0FHRV9CUklER0VfVVRJTFM9
eQoKTm90IG5lZWRlZC4KCj4gK0JSMl9UQVJHRVRfUk9PVEZTX0lOSVRSQU1GUz15Cj4gKyMgQlIy
X1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKCkJlc3QgcmVnYXJkcywKClRob21hcwotLSAK
VGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
