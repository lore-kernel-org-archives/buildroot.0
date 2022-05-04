Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13294C433EF
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 10:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6B17408E2;
	Wed,  4 May 2022 10:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VFKtAp81id_l; Wed,  4 May 2022 10:09:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0199400A6;
	Wed,  4 May 2022 10:09:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44C891BF423
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 10:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23B2F400A6
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 10:09:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nq43m8Xg9cqY for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 10:09:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 286A440004
 for <buildroot@buildroot.org>; Wed,  4 May 2022 10:09:39 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id E15CB4403F7;
 Wed,  4 May 2022 13:08:42 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1651658923;
 bh=L63g8KRpq0nVPfrdL8ijdbrBk1nWHvsXNeMFBE58D1U=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=dbrnjUmLFpcbrBtbi0JUlKzkZKfsjrD4Ci9SxvKHMCGtX6p11GzsifRikRaLsjfyg
 ok9phO3aNlsfCIcggogR6023f+Psp68jP75Z0aM05jbKUnOgl6SDRlP9a5/4qXN9jT
 ejEQ9Q/eTHykJPMGGS9ytkYeqt4c1fP0WYCHHVoZ+iALlENxMy31eVQgWRwDWIspZ8
 +2tdY5S4VM1VgxuvOV5mBbhAsp/yZNWkUzWaVKfYDUbe9CLr88lWvQSDSAyC3ZarNd
 qxn2zIeik7LESdmCA2Jdy/PAVc2yW8Bef4AgiqHhpNw0LTfeWnz8s+niY9WqLZ+oDO
 A5w4xaPlJ0kUQ==
References: <20220504094006.1541643-1-c.leger@borea-dental.com>
 <875ymly6js.fsf@tarshish>
 <b6b1cd4e-29d9-7a70-3c5c-cba4f272420f@borea-dental.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Charlie Leger <c.leger@borea-dental.com>
Date: Wed, 04 May 2022 13:06:08 +0300
In-reply-to: <b6b1cd4e-29d9-7a70-3c5c-cba4f272420f@borea-dental.com>
Message-ID: <871qx9y5gg.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] linux:linux.mk: Add "firmware-imx"
 dependency if needed
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQ2hhcmxpZSwKCk9uIFdlZCwgTWF5IDA0IDIwMjIsIENoYXJsaWUgTGVnZXIgd3JvdGU6Cj4g
VGhhbmsgeW91IGZvciB5b3VyIHJldmlldwo+Cj4gTGUgMDQvMDUvMjAyMiDDoCAxMTo0MywgQmFy
dWNoIFNpYWNoIGEgw6ljcml0IDoKPiBPbiBXZWQsIE1heSAwNCAyMDIyLCBMZWdlciBDaGFybGll
IHdyb3RlOgo+Cj4gIFNpbmNlIFNETUEgZmlybXdhcmVzIGZvciBpbXhbNiw3LDhdIGFyZSBub3cg
cHJvdmlkZWQgb25seSBieSBmaXJtd2FyZS1pbXggcGFja2FnZSBhbmQgbm90IGxpbnV4LWZpcm13
YXJlCj4gIHBhY2thZ2UgWzFdLgo+IExpbnV4IGJ1aWxkIGNhbiBmYWlsZWQgaWYgZGVwZW5kaW5n
IG9uIGZpcm13YXJlIGlteCwgc28gYWRkIGZpcm13YXJlLWlteCBkZXBlbmRlbmN5IG9uIGxpbnV4
IGlmIHBhY2thZ2UgaXMgY2hlY2tlZC4KPgo+Cj4gV2hhdCBidWlsZCBmYWlsdXJlIGRvIHlvdSBz
ZWUgd2hlbiBmaXJtd2FyZS1pbXggZG9lcyBub3QgaW5zdGFsbCBiZWZvcmUKPiBrZXJuZWwgYnVp
bGQ/IEFzIGZhciBhcyBJIGNhbiBzZWUgZmlybXdhcmUgZmlsZXMgYXJlIG9ubHkgdXNlZCBhdAo+
IHJ1bi10aW1lLgo+Cj4gRmFpbHVyZSB3aWxsIGhhcHBlbnMgb25seSBmb3Igc3BlY2lmaWMga2Vy
bmVsIGNvbmZpZ3VyYXRpb24gd2hpY2ggdXNlZCAiQ09ORklHX0VYVFJBX0ZJUk1XQVJFIiBvcHRp
b24gWzFdLCB3aGljaCBhbGxvdyB0byBidWlsdC1pbiBmaXJtd2FyZS4KPiBJZiBmaXJtd2FyZSBu
ZWVkZWQgYmVsb25ncyB0byAiZmlybXdhcmUtaW14IiBwYWNrYWdlLCBsaW51eCBidWlsZCB3aWxs
IGZhaWxlZC4KClRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uIFRoZSBjb21taXQgbG9nIHNo
b3VsZCBtZW50aW9uIHRoYXQKZmlybXdhcmUtaW14IGlzIG5lZWRlZCBhdCBidWlsZCB0aW1lIGZv
ciBDT05GSUdfRVhUUkFfRklSTVdBUkUuCgpiYXJ1Y2gKCj4gQ2hhcmxpZSwKPgo+IGh0dHBzOi8v
Y2F0ZWVlLm5ldC9sa2RkYi93ZWItbGtkZGIvRVhUUkFfRklSTVdBUkUuaHRtbAo+Cj4gYmFydWNo
Cj4KPiAgWzFdIGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIw
MjEtSmFudWFyeS82MDM4MDcuaHRtbAo+Cj4gU2lnbmVkLW9mZi1ieTogTGVnZXIgQ2hhcmxpZSA8
Yy5sZWdlckBib3JlYS1kZW50YWwuY29tPgo+IC0tLQo+ICBsaW51eC9saW51eC5tayB8IDEgKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9saW51eC9s
aW51eC5tayBiL2xpbnV4L2xpbnV4Lm1rCj4gaW5kZXggN2ZmN2IwNTA0Mi4uZTQwNjcyY2VjYSAx
MDA2NDQKPiAtLS0gYS9saW51eC9saW51eC5tawo+ICsrKyBiL2xpbnV4L2xpbnV4Lm1rCj4gQEAg
LTczLDYgKzczLDcgQEAgTElOVVhfSU5TVEFMTF9JTUFHRVMgPSBZRVMKPiAgTElOVVhfREVQRU5E
RU5DSUVTID0gaG9zdC1rbW9kIFwKPiAgCSQoaWYgJChCUjJfUEFDS0FHRV9JTlRFTF9NSUNST0NP
REUpLGludGVsLW1pY3JvY29kZSkgXAo+ICAJJChpZiAkKEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1X
QVJFKSxsaW51eC1maXJtd2FyZSkgXAo+ICsJJChpZiAkKEJSMl9QQUNLQUdFX0ZSRUVTQ0FMRV9J
TVgpLGZpcm13YXJlLWlteCkgXAo+ICAJJChpZiAkKEJSMl9QQUNLQUdFX1dJUkVMRVNTX1JFR0RC
KSx3aXJlbGVzcy1yZWdkYikKPiAgCj4gICMgU3RhcnRpbmcgd2l0aCA0LjE2LCB0aGUgZ2VuZXJh
dGVkIGtjb25maWcgcGFzZXIgY29kZSBpcyBubyBsb25nZXIKCgotLSAKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+LiAufiAgIFRrIE9wZW4gU3lz
dGVtcwo9fS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLW9v
Ty0tVS0tT29vLS0tLS0tLS0tLS0tez0KICAgLSBiYXJ1Y2hAdGtvcy5jby5pbCAtIHRlbDogKzk3
Mi41Mi4zNjguNDY1NiwgaHR0cDovL3d3dy50a29zLmNvLmlsIC0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
