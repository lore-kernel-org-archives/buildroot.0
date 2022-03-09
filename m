Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BE4C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 22:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D41984353;
	Wed,  9 Mar 2022 22:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZHh21bkiDqM; Wed,  9 Mar 2022 22:08:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5947584341;
	Wed,  9 Mar 2022 22:08:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 203101BF41F
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 22:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B23E40143
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 22:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PlgM2K7qcGqe for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 22:08:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A876240142
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 22:08:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:959:4871:d6cd:4ee3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8056B13F854;
 Wed,  9 Mar 2022 23:08:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1646863685;
 bh=+5OgW+igW6ifbov3G+S/WHVOcyac3kPCDCLui9N1atM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ic6zuZJQ5mO9YNTlE8kNOv19QRKHYr4LBY/FjCg9DXfZgvRmnk/np3YQSib1D6Jax
 uxfZt+vz3F7U7C7/RxrP9jzbNrEziwSQWwK9k3S0grjYK2um8g7Zepy59wZT1lqDqa
 YVXCArOrS9MsI0aRIScoQLSs77fu7PCHgdjFcK6F3p3B/VyM2Iclww13P0cxkGvVfq
 hGht0nyRDcvYBLc8bd1MsKyxFxKGrGVq9sjHSObpKe136cTFn6qp9wXhQ0/YPGYzcm
 lGCg8nhSrmw+RuXXeyWJM7/dm75WXdxnhCTSEVWd+BmAP/lcA1kckVkxIWzZXn8Yql
 OekYCB5UKkEbA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 09 Mar 2022 23:08:00 +0100
Date: Wed, 9 Mar 2022 23:08:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <20220309220800.GF23050@scaer>
References: <20220308183527.17639-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220308183527.17639-1-zajec5@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH V2] package/lzma-alone: new package
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
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmFmYcWCLCBBbGwsCgpPbiAyMDIyLTAzLTA4IDE5OjM1ICswMTAwLCBSYWZhxYIgTWnFgmVja2kg
c3Bha2UgdGh1c2x5Ogo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4K
PiAKPiBUaGlzIG5ldyBwYWNrYWdlIHByb3ZpZGVzICJsem1hX2Fsb25lIiBob3N0IGJpbmFyeSBi
YXNlZCBvbiB0aGUgb3JpZ2luYWwKPiBMWk1BIFNESy4gSXQgcHJvdmlkZXMgZmV3IGV4dHJhIG9w
dGlvbnMgd2hlbiBjb21wYXJlZCB0byB0aGUgTFpNQSBVdGlscwo+IC8gWFogVXRpbHMgcHJvamVj
dCAibHptYSIgYmluYXJ5IChhbHJlYWR5IHBhY2thZ2VkIGFzIHRoZSAibHptYSIpLgo+IAo+IFRo
aXMgcGFja2FnaW5nIHNjaGVtYSAoTFpNQSBTREsgd2l0aCBsem1hIC0+IGx6bWFfYWxvbmUgcmVu
YW1lKSBmb2xsb3dzCj4gRGViaWFuJ3Mgc29sdXRpb24uIFBsZWFzZSBub3RlIHRoYXQgRGViaWFu
IGFsc28gdXNlcyBMWk1BIFNESyBmb3IgdGhlCj4gYmFzZSAibHptYSIgdG9vbCB3aGljaCBtYXkg
YmUgY29uc2lkZXJlZCBmb3IgQnVpbGRyb290IHRvbyAtIGFzIGFuCj4gaW5kZXBlbmRlbnQgY2hh
bmdlLiBTaW1pbGFyIHBhY2thZ2luZyBpcyBhbHNvIHVzZWQgYnkgVWJ1bnR1ICYgQXJjaC4KPiAK
PiBsem1hX2Fsb25lIGlzIGEgcmVxdWlyZW1lbnQgZm9yIHByZXBhcmluZyBmaXJtd2FyZSBpbWFn
ZXMgZm9yIHNvbWUKPiBCcm9hZGNvbSBiYXNlZCBob21lIHJvdXRlcnMgd2l0aCBhIHBpY2t5IENG
RSBib290bG9hZGVyLiBJdCBoYXMgbGltaXRlZAo+IExaTUEgc3VwcG9ydCBhbmQgYnVpbGRpbmcg
Y29tcGF0aWJsZSBpbWFnZXMgcmVxdWlyZXMgc3BlY2lmeWluZwo+IGRpY3Rpb25hcnkgc2l6ZSBh
bmQgbGMvbHAvcGIgTFpNQSB2YWx1ZXMgbWFudWFsbHkuCj4gCj4gVmVyc2lvbiA5LjIyIGlzIHVz
ZWQgYXMgaXQncyB0aGUgbGFzdCByZWxlYXNlIHVzaW5nIC50YXIuYnoyIGZvcm1hdC4KCldlIGNv
dWxkIGludHJvZHVjZSBhIGhvc3QgdmFyaWFudCBvZiBwN3ppcCwgc28gdGhhdCB3ZSBjb3VsZAph
dXRvbWF0aWNhbGx5IGFkZCB0aGF0IHRvIEZPT19FWFRSQUNUX0RFUEVOREVOQ0lFUyBpZiB0aGUg
aG9zdCBkb2VzIG5vdAphbHJlYWR5IGhhdmUgN3phIChvciA3enIpLCBsaWtlIHdlIGRvIGZvciBs
emlwIGFyY2hpdmVzIGZvciBleGFtcGxlLgoKPiBUaGUKPiBzYW1lIHZlcnNpb24gaXMgdXNlZCBi
eSBEZWJpYW4uCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxl
Y2tpLnBsPgo+IC0tLQpbLS1TTklQLS1dCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHptYS1hbG9u
ZS9sem1hLWFsb25lLmhhc2ggYi9wYWNrYWdlL2x6bWEtYWxvbmUvbHptYS1hbG9uZS5oYXNoCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4zOTc1OWM0ZTNiCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbHptYS1hbG9uZS9sem1hLWFsb25lLmhhc2gKPiBA
QCAtMCwwICsxIEBACj4gK3NoYTI1Ngk5YWFkZTg0ZjIyOWZiMjVmN2FlZjM5ZDg4NjZiMzc1ZmU2
ZDM1YTllMTgwOThkN2NkODZhOTllMjk0OTAyOTQ0CWx6bWE5MjIudGFyLmJ6MgoKRmllbGRzIG11
c3QgYmUgc2VwYXJhdGVkIGJ5IHR3byBzcGFjZXM7IGZpeGVkLgoKSSBhbHNvIGFkZGVkIHRoZSBz
aGExIHRoYXQgaXMgcHJvdmlkZWQgaW50IGhlIFNGIHBhZ2UsIGFuZCBhcHByb2lwcmlhdGUKY29t
bWVudHMuCgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x6bWEtYWxvbmUvbHptYS1hbG9uZS5tayBi
L3BhY2thZ2UvbHptYS1hbG9uZS9sem1hLWFsb25lLm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiBpbmRleCAwMDAwMDAwMDAwLi42MjU4YmI0YTk1Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Bh
Y2thZ2UvbHptYS1hbG9uZS9sem1hLWFsb25lLm1rCj4gQEAgLTAsMCArMSwyMiBAQAo+ICsjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgbHptYS1hbG9uZQo+ICsjCj4gKyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtMWk1BX0FMT05FX1ZFUlNJT04gPSA5LjIyCj4gK0xaTUFf
QUxPTkVfU0lURSA9IGh0dHBzOi8vc291cmNlZm9yZ2UubmV0L3Byb2plY3RzL3NldmVuemlwL2Zp
bGVzL0xaTUElMjBTREsKPiArTFpNQV9BTE9ORV9TT1VSQ0UgPSBsem1hOTIyLnRhci5iejIKPiAr
TFpNQV9BTE9ORV9TVFJJUF9DT01QT05FTlRTID0gMAo+ICtMWk1BX0FMT05FX0xJQ0VOU0UgPSBM
R1BMLTIuMS1vci1sYXRlciwgQlNELTMtQ2xhdXNlCgpUaGUgbGljZW5zZSBzdGF0ZWQgaW4gbHpt
YS50eHQgKGF0IHRoZSByb290IG9mIHRoZSBzb3VyY2UgdHJlZSkgc3RhdGVzCnRoZSAiTFpNQSBT
REsgaXMgd3JpdHRlbiBhbmQgcGxhY2VkIGluIHRoZSBwdWJsaWMgZG9tYWluIGJ5IElnb3IKUGF2
bG92LiIKClRoZSAnR1BMJyB0ZXJtIG9ubHkgYXBwZWFycyBpbiB0aGF0IGZpbGUsIGFuZCBCU0Qg
YXBwZWFycyBub3doZXJlLiBBbHNvLAp0aGUgdXN1YWwgd29yZHMgaW4gdGhlIEJTRCBvciBHUEwg
bGljZW5zZXMgZG8gbm90IGFwcGVhciBpbiB0aGUgc291cmNlCmF0IGFsbDogJ3JlZGlzdHJpYnV0
aW9uJywgJ3Byb3ZpZGVkJywgJ2Rpc2NsYWltZXInLgoKV2lraVBlZGlhIHNlZW1zIHRvIGFncmVl
IHRoYXQgaXQgaXMgUHVibGljIERvbWFpbiBzaW5jZSAyMDA4IGFuZCB2ZXJzaW9uCjQuNjI6CiAg
ICBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9MZW1wZWwlRTIlODAlOTNaaXYlRTIlODAl
OTNNYXJrb3ZfY2hhaW5fYWxnb3JpdGhtIzctWmlwX3JlZmVyZW5jZV9pbXBsZW1lbnRhdGlvbgoK
Rml4ZWQuCgo+ICtkZWZpbmUgSE9TVF9MWk1BX0FMT05FX0JVSUxEX0NNRFMKPiArCSQoSE9TVF9N
QUtFX0VOVikgJChIT1NUX0NPTkZJR1VSRV9PUFRTKSAkKE1BS0UpIC1DICQoQEQpL0MvVXRpbC9M
em1hIC1mIG1ha2VmaWxlLmdjYwo+ICsJJChIT1NUX01BS0VfRU5WKSAkKEhPU1RfQ09ORklHVVJF
X09QVFMpICQoTUFLRSkgLUMgJChARCkvQ1BQLzd6aXAvQnVuZGxlcy9Mem1hQ29uIC1mIG1ha2Vm
aWxlLmdjYwoKTGluZXMgdG9vIGxvbmcsIEkndmUgc3BsaXQgdGhlbS4KCj4gK2VuZGVmCj4gKwo+
ICtkZWZpbmUgSE9TVF9MWk1BX0FMT05FX0lOU1RBTExfQ01EUwo+ICsJJChJTlNUQUxMKSAtRCAt
bSAwNzU1ICQoQEQpL0NQUC83emlwL0J1bmRsZXMvTHptYUNvbi9sem1hICQoSE9TVF9ESVIpL2Jp
bi9sem1hX2Fsb25lCgpEaXR0by4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpDb3VsZCB5
b3Ugc2VlIGF0IHVzaW5nIGEgbW9yZSByZWNlbnQgdmVyc2lvbiwgd2l0aCB0aGUgcDd6aXAgaG9z
dAp2YXJpYW50IEkgc3VnZ2VzdGVkIGFib3ZlLCBwbGVhc2U/CgpSZWdhcmRzLApZYW5uIEUuIE1P
UklOLgoKPiArZW5kZWYKPiArCj4gKyQoZXZhbCAkKGhvc3QtZ2VuZXJpYy1wYWNrYWdlKSkKPiAt
LSAKPiAyLjM0LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1U
aW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cnwg
KzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8
ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0t
LS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3lt
b3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNv
bnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
