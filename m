Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92076C4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 18:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C5AB81382;
	Mon, 27 Nov 2023 18:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C5AB81382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H10BmCKcKb0S; Mon, 27 Nov 2023 18:40:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 676AB81386;
	Mon, 27 Nov 2023 18:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 676AB81386
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 093D31BF348
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D620740937
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D620740937
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vuLFFTIL4Y2Y for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 18:40:46 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B518540922
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 18:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B518540922
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:7618:50d5:c153:9a40])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 67A57B00571;
 Mon, 27 Nov 2023 19:40:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Nov 2023 19:40:40 +0100
Date: Mon, 27 Nov 2023 19:40:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>
Message-ID: <20231127184040.GB3177259@scaer>
References: <20231120214150.671145-1-gael.portay@rtone.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231120214150.671145-1-gael.portay@rtone.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701110444;
 bh=EDuXa3QmgEmmB2gb2ntm+XDxhVWpL5YgRdlgg9Kadv4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eplf0d23C71Ik1JsbQs/bbi9eJyHWT6SswHlxwiDG0wJHGRpGj5OedVwPL9zW3nPk
 QcFmtyNgHDGBL/amzdGbl35GXSth28lS88M2qAdn67NMQKXe00fhTvO7O2FoqJ5BYv
 IpoWhI/g+QRR70gS5/azdoeI10aaBq48njaqh9dhBmroQ8v6ajZ9Ir3Zca17bNE5pJ
 oqsaU1LGV4bUoAO1VeMbEmgvmahKj6RsdeH1Wp0czQltUcQhLsW4RfmShKTtKUM3vr
 C/zmPWYDTPRTWhuhM8lsIPscZQfx17J6lYcuv73moNAjO49l4Ro6XJpcntxkHz6Fiu
 sltHJQ8zl1P6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Eplf0d23
Subject: Re: [Buildroot] [PATCH 1/1] board/raspberrypi: fix autoprobing of
 bluetooth driver
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2HDq2wsIEFsbCwKCk9uIDIwMjMtMTEtMjAgMjI6NDEgKzAxMDAsIEdhw6tsIFBPUlRBWSBzcGFr
ZSB0aHVzbHk6Cj4gVGhlIGNvbW1pdCA2ODliOWFjNDM5IChwYWNrYWdlL3JwaS1maXJtd2FyZTog
cmV3b3JrIGJvb3QvY29uZmlnIGZpbGUKPiBoYW5kbGluZykgaGFzIHNwbGl0IGluIHR3byB0aGUg
cHJvcGVydHk6Cj4gCj4gCWR0b3ZlcmxheT1taW5pdWFydC1idCxrcm5idD1vbgo+IAo+IEludG86
Cj4gCj4gCWR0b3ZlcmxheT1taW5pdWFydC1idAo+IAlkdG92ZXJsYXk9a3JuYnQ9b24KPiAKPiBU
aGUgaW5pdGlhbCBwcm9wZXJ0eSBjb250YWluZWQgdGhlIGR0Ym8gZmlsZSBtaW5pdWFydC1idFsx
XSBhbmQgaXRzCj4gcGFyYW1ldGVyIGtybmJ0PW9uWzJdWzNdLgo+IAo+IFRoZSBmaXJzdCBzeW50
YXggaXMgY29ycmVjdCB3aGlsZSB0aGUgc2Vjb25kIGlzIG5vdC4gVGhlIGtybmJ0PW9uIGlzIG5v
dAo+IGEgZHRvdmVybGF5WzRdIGJ1dCBhIGR0cGFyYW1bNV0uIFRoZXJlZm9yZSB0aGUgcHJvcGVy
dHkgZHRwYXJhbSBtdXN0IGJlCj4gdXNlZCBpbnN0ZWFkLgo+IAo+IFRoaXMgZml4ZXM6Cj4gCj4g
CSMgY2F0IC9zeXMvZmlybXdhcmUvZGV2aWNldHJlZS9iYXNlL2Nob3Nlbi91c2VyLXdhcm5pbmdz
Cj4gCUZhaWxlZCB0byBsb2FkIG92ZXJsYXkgJ2tybmJ0PW9uJwo+IAo+IFsxXTogaHR0cHM6Ly9n
aXRodWIuY29tL3Jhc3BiZXJyeXBpL2xpbnV4L2Jsb2IvcnBpLTUuMTAueS9hcmNoL2FybS9ib290
L2R0cy9vdmVybGF5cy9taW5pdWFydC1idC1vdmVybGF5LmR0cwo+IFsyXTogaHR0cHM6Ly9naXRo
dWIuY29tL3Jhc3BiZXJyeXBpL2xpbnV4L2Jsb2IvcnBpLTUuMTAueS9hcmNoL2FybS9ib290L2R0
cy9vdmVybGF5cy9taW5pdWFydC1idC1vdmVybGF5LmR0cyNMOTEKPiBbM106IGh0dHBzOi8vZ2l0
aHViLmNvbS9yYXNwYmVycnlwaS9saW51eC9ibG9iL3JwaS01LjEwLnkvYXJjaC9hcm0vYm9vdC9k
dHMvb3ZlcmxheXMvUkVBRE1FI0wyMTMtTDIxNQo+IFs0XTogaHR0cHM6Ly93d3cucmFzcGJlcnJ5
cGkuY29tL2RvY3VtZW50YXRpb24vY29tcHV0ZXJzL2NvbmZpZ190eHQuaHRtbCNkdG92ZXJsYXkK
PiBbNV06IGh0dHBzOi8vd3d3LnJhc3BiZXJyeXBpLmNvbS9kb2N1bWVudGF0aW9uL2NvbXB1dGVy
cy9jb25maWdfdHh0Lmh0bWwjZHRwYXJhbQo+IAo+IFNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRB
WSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVn
YXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18w
dy50eHQgICAgICB8IDIgKy0KPiAgYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzMudHh0ICAgICAg
IHwgMiArLQo+ICBib2FyZC9yYXNwYmVycnlwaS9jb25maWdfM182NGJpdC50eHQgfCAyICstCj4g
IGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ180LnR4dCAgICAgICB8IDIgKy0KPiAgYm9hcmQvcmFz
cGJlcnJ5cGkvY29uZmlnXzRfNjRiaXQudHh0IHwgMiArLQo+ICBib2FyZC9yYXNwYmVycnlwaS9j
b25maWdfemVybzJ3LnR4dCAgfCAyICstCj4gIDYgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9j
b25maWdfMHcudHh0IGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzB3LnR4dAo+IGluZGV4IDE5
NWJhZDQ0OWUuLmJjNTlkNWZhZDIgMTAwNjQ0Cj4gLS0tIGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29u
ZmlnXzB3LnR4dAo+ICsrKyBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18wdy50eHQKPiBAQCAt
MjYsNCArMjYsNCBAQCBncHVfbWVtXzEwMjQ9MTAwCj4gIGR0b3ZlcmxheT1taW5pdWFydC1idAo+
IAo+ICAjIGVuYWJsZSBhdXRvcHJvYmluZyBvZiBCbHVldG9vdGggZHJpdmVyIHdpdGhvdXQgbmVl
ZCBvZiBoY2lhdHRhY2gvYnRhdHRhY2gKPiAtZHRvdmVybGF5PWtybmJ0PW9uCj4gK2R0cGFyYW09
a3JuYnQ9b24KPiBkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzMudHh0IGIv
Ym9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzMudHh0Cj4gaW5kZXggMTk1YmFkNDQ5ZS4uYmM1OWQ1
ZmFkMiAxMDA2NDQKPiAtLS0gYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfMy50eHQKPiArKysg
Yi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfMy50eHQKPiBAQCAtMjYsNCArMjYsNCBAQCBncHVf
bWVtXzEwMjQ9MTAwCj4gIGR0b3ZlcmxheT1taW5pdWFydC1idAo+IAo+ICAjIGVuYWJsZSBhdXRv
cHJvYmluZyBvZiBCbHVldG9vdGggZHJpdmVyIHdpdGhvdXQgbmVlZCBvZiBoY2lhdHRhY2gvYnRh
dHRhY2gKPiAtZHRvdmVybGF5PWtybmJ0PW9uCj4gK2R0cGFyYW09a3JuYnQ9b24KPiBkaWZmIC0t
Z2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzNfNjRiaXQudHh0IGIvYm9hcmQvcmFzcGJl
cnJ5cGkvY29uZmlnXzNfNjRiaXQudHh0Cj4gaW5kZXggMzQ0MTJmYTllOC4uNjY3Mjg3MTEyNSAx
MDA2NDQKPiAtLS0gYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfM182NGJpdC50eHQKPiArKysg
Yi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfM182NGJpdC50eHQKPiBAQCAtMjYsNyArMjYsNyBA
QCBncHVfbWVtXzEwMjQ9MTAwCj4gIGR0b3ZlcmxheT1taW5pdWFydC1idAo+IAo+ICAjIGVuYWJs
ZSBhdXRvcHJvYmluZyBvZiBCbHVldG9vdGggZHJpdmVyIHdpdGhvdXQgbmVlZCBvZiBoY2lhdHRh
Y2gvYnRhdHRhY2gKPiAtZHRvdmVybGF5PWtybmJ0PW9uCj4gK2R0cGFyYW09a3JuYnQ9b24KPiAK
PiAgIyBlbmFibGUgNjRiaXRzIHN1cHBvcnQKPiAgYXJtXzY0Yml0PTEKPiBkaWZmIC0tZ2l0IGEv
Ym9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzQudHh0IGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmln
XzQudHh0Cj4gaW5kZXggZWEwMmQzZjA3MS4uNzRhN2IyNzBjZCAxMDA2NDQKPiAtLS0gYS9ib2Fy
ZC9yYXNwYmVycnlwaS9jb25maWdfNC50eHQKPiArKysgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25m
aWdfNC50eHQKPiBAQCAtMjYsNCArMjYsNCBAQCBncHVfbWVtXzEwMjQ9MTAwCj4gIGR0b3Zlcmxh
eT1taW5pdWFydC1idAo+IAo+ICAjIGVuYWJsZSBhdXRvcHJvYmluZyBvZiBCbHVldG9vdGggZHJp
dmVyIHdpdGhvdXQgbmVlZCBvZiBoY2lhdHRhY2gvYnRhdHRhY2gKPiAtZHRvdmVybGF5PWtybmJ0
PW9uCj4gK2R0cGFyYW09a3JuYnQ9b24KPiBkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkv
Y29uZmlnXzRfNjRiaXQudHh0IGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzRfNjRiaXQudHh0
Cj4gaW5kZXggNDFjN2U5N2U5OS4uMmE5ODE0Mjc0ZiAxMDA2NDQKPiAtLS0gYS9ib2FyZC9yYXNw
YmVycnlwaS9jb25maWdfNF82NGJpdC50eHQKPiArKysgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25m
aWdfNF82NGJpdC50eHQKPiBAQCAtMjYsNyArMjYsNyBAQCBncHVfbWVtXzEwMjQ9MTAwCj4gIGR0
b3ZlcmxheT1taW5pdWFydC1idAo+IAo+ICAjIGVuYWJsZSBhdXRvcHJvYmluZyBvZiBCbHVldG9v
dGggZHJpdmVyIHdpdGhvdXQgbmVlZCBvZiBoY2lhdHRhY2gvYnRhdHRhY2gKPiAtZHRvdmVybGF5
PWtybmJ0PW9uCj4gK2R0cGFyYW09a3JuYnQ9b24KPiAKPiAgZHRvdmVybGF5PXZjNC1rbXMtdjNk
LXBpNAo+ICBkdG92ZXJsYXk9aW14MjE5Cj4gZGlmZiAtLWdpdCBhL2JvYXJkL3Jhc3BiZXJyeXBp
L2NvbmZpZ196ZXJvMncudHh0IGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX3plcm8ydy50eHQK
PiBpbmRleCA5ZTZiN2Y1Y2NmLi41NTA5NWY2NGE3IDEwMDY0NAo+IC0tLSBhL2JvYXJkL3Jhc3Bi
ZXJyeXBpL2NvbmZpZ196ZXJvMncudHh0Cj4gKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmln
X3plcm8ydy50eHQKPiBAQCAtMjYsNCArMjYsNCBAQCBncHVfbWVtXzEwMjQ9MTAwCj4gIGR0b3Zl
cmxheT1taW5pdWFydC1idAo+IAo+ICAjIGVuYWJsZSBhdXRvcHJvYmluZyBvZiBCbHVldG9vdGgg
ZHJpdmVyIHdpdGhvdXQgbmVlZCBvZiBoY2lhdHRhY2gvYnRhdHRhY2gKPiAtZHRvdmVybGF5PWty
bmJ0PW9uCj4gK2R0cGFyYW09a3JuYnQ9b24KPiAtLQo+IDIuNDIuMQo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklC
Qk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAg
RGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMg
NTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxl
LyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8g
fCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
