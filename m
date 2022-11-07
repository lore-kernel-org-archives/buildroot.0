Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F04C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 17:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC17781412;
	Mon,  7 Nov 2022 17:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC17781412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J68EAnxG-qY7; Mon,  7 Nov 2022 17:01:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE4A1813E2;
	Mon,  7 Nov 2022 17:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE4A1813E2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28F291BF2B4
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 17:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F1204031C
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 17:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F1204031C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t8jIUk_BEfuy for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 17:01:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDF904030D
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDF904030D
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 17:01:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (1)
Received: from zm (pub-52.182.29.194.multiplay.pl [194.29.182.52])
 by server220076.nazwa.pl (Postfix) with ESMTP id 803A61BD8C6;
 Mon,  7 Nov 2022 18:01:05 +0100 (CET)
References: <20221107091658.25974-1-marek.metelski@grinn-global.com>
User-agent: mu4e 1.8.11; emacs 28.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: Marek Metelski <marek.metelski@grinn-global.com>
Date: Mon, 07 Nov 2022 17:58:37 +0100
In-reply-to: <20221107091658.25974-1-marek.metelski@grinn-global.com>
Message-ID: <878rkmsnqm.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gitlab-runner: fix
 inconsistency of systemd and sysv daemons
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWFyZWsgTWV0ZWxza2kgPG1hcmVrLm1ldGVsc2tpQGdyaW5uLWdsb2JhbC5jb20+IHdyaXRlczoK
Cj4gQ29weSBkZWZhdWx0ICRERUFNT05fQVJHUyBmcm9tIHN5c3RlbWQgc2VydmljZSB0byBzeXN2
IGluaXQgc2NyaXB0Lgo+Cj4gTWFrZSBHSVRMQUJfUlVOTkVSX1VTRVIgaG9tZSBkaXJlY3Rvcnkg
dGhlIHNhbWUgYXMgZGVmYXVsdAo+IC0td29yay1kaXJlY3RvcnkgKC1kKSBmbGFnLgo+Cj4gUnVu
IHN5c3YgZGFlbW9uIHByb2Nlc3MgdXNpbmcgcm9vdCB1c2VyIChyZW1vdmUgLWMgb3B0aW9uKQo+
IFRoaXMgaXMgbmVlZGVkIHRvIGNvcnJlY3RseSBhY2Nlc3MgY29uZmlnIGZpbGVzIGFzIHNwZWNp
ZmllZC4KPiBTeXN0ZW0gYWNjZXNzIGNhbiBzdGlsbCBiZSBsaW1pdGVkIHdpdGggZ2l0bGFiLXJ1
bm5lciBgLS11c2VyYCBmbGFnLgo+Cj4gVXNlIHNhbWUgJERBRU1PTl9BUkdTIHZhcmlhYmxlIG5h
bWUgc28gaXQgY2FuIGJlIG92ZXJ3cml0dGVuIGluCj4gL2V0Yy9kZWZhdWx0L2dpdGxhYi1ydW5u
ZXIgZW52aXJvbm1lbnQgZmlsZSBpbiBib3RoIGNhc2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFy
ZWsgTWV0ZWxza2kgPG1hcmVrLm1ldGVsc2tpQGdyaW5uLWdsb2JhbC5jb20+CgpSZXZpZXdlZC1i
eTogTWFyY2luIE5pZXN0cm9qIDxtLm5pZXN0cm9qQGdyaW5uLWdsb2JhbC5jb20+Cgo+IC0tLQo+
ICBwYWNrYWdlL2dpdGxhYi1ydW5uZXIvUzk1Z2l0bGFiLXJ1bm5lciB8IDYgKysrLS0tCj4gIHBh
Y2thZ2UvZ2l0bGFiLXJ1bm5lci9naXRsYWItcnVubmVyLm1rIHwgMyArLS0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9naXRsYWItcnVubmVyL1M5NWdpdGxhYi1ydW5uZXIgYi9wYWNrYWdlL2dpdGxhYi1y
dW5uZXIvUzk1Z2l0bGFiLXJ1bm5lcgo+IGluZGV4IDJhNTBlNzE1MWEuLjczOWFkZjE3ODMgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9naXRsYWItcnVubmVyL1M5NWdpdGxhYi1ydW5uZXIKPiArKysg
Yi9wYWNrYWdlL2dpdGxhYi1ydW5uZXIvUzk1Z2l0bGFiLXJ1bm5lcgo+IEBAIC0zLDcgKzMsNyBA
QAo+ICBEQUVNT049ImdpdGxhYi1ydW5uZXIiCj4gIFBJREZJTEU9Ii92YXIvcnVuLyREQUVNT04u
cGlkIgo+Cj4gLUdJVExBQl9SVU5ORVJfQVJHUz0icnVuIgo+ICtEQUVNT05fQVJHUz0icnVuIC0t
c3lzbG9nIC0tdXNlciBnaXRsYWItcnVubmVyIC1kIC92YXIvbGliL2dpdGxhYi1ydW5uZXIgLWMg
L2V0Yy9naXRsYWItcnVubmVyL2NvbmZpZy50b21sIgo+Cj4gICMgc2hlbGxjaGVjayBzb3VyY2U9
L2Rldi9udWxsCj4gIFsgLXIgIi9ldGMvZGVmYXVsdC8kREFFTU9OIiBdICYmIC4gIi9ldGMvZGVm
YXVsdC8kREFFTU9OIgo+IEBAIC0xMSw4ICsxMSw4IEBAIEdJVExBQl9SVU5ORVJfQVJHUz0icnVu
Igo+ICBzdGFydCgpIHsKPiAgCXByaW50ZiAnU3RhcnRpbmcgJXM6ICcgIiREQUVNT04iCj4gIAkj
IHNoZWxsY2hlY2sgZGlzYWJsZT1TQzIwODYgIyB3ZSBuZWVkIHRoZSB3b3JkIHNwbGl0dGluZwo+
IC0Jc3RhcnQtc3RvcC1kYWVtb24gLVMgLXEgLW0gLWIgLXAgIiRQSURGSUxFIiAtYyAiJERBRU1P
TjokREFFTU9OIiAteCAiL3Vzci9iaW4vJERBRU1PTiIgXAo+IC0JCS0tICRHSVRMQUJfUlVOTkVS
X0FSR1MKPiArCXN0YXJ0LXN0b3AtZGFlbW9uIC1TIC1xIC1tIC1iIC1wICIkUElERklMRSIgLXgg
Ii91c3IvYmluLyREQUVNT04iIFwKPiArCQktLSAkREFFTU9OX0FSR1MKPiAgCXN0YXR1cz0kPwo+
ICAJaWYgWyAiJHN0YXR1cyIgLWVxIDAgXTsgdGhlbgo+ICAJCWVjaG8gIk9LIgo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2dpdGxhYi1ydW5uZXIvZ2l0bGFiLXJ1bm5lci5tayBiL3BhY2thZ2UvZ2l0
bGFiLXJ1bm5lci9naXRsYWItcnVubmVyLm1rCj4gaW5kZXggZmRlNzc2ZTYzMS4uOTU0MjI3NTEz
NSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2dpdGxhYi1ydW5uZXIvZ2l0bGFiLXJ1bm5lci5tawo+
ICsrKyBiL3BhY2thZ2UvZ2l0bGFiLXJ1bm5lci9naXRsYWItcnVubmVyLm1rCj4gQEAgLTEyLDkg
KzEyLDggQEAgR0lUTEFCX1JVTk5FUl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+ICBHSVRMQUJf
UlVOTkVSX0xERkxBR1MgPSBcCj4gIAktWCBnaXRsYWIuY29tL2dpdGxhYi1vcmcvZ2l0bGFiLXJ1
bm5lci9jb21tb24uVkVSU0lPTj0kKEdJVExBQl9SVU5ORVJfVkVSU0lPTikKPgo+IC0jIERvbid0
IHJ1biBnaXRsYWIgcnVubmVyIGFzIHJvb3QuCj4gIGRlZmluZSBHSVRMQUJfUlVOTkVSX1VTRVJT
Cj4gLQlnaXRsYWItcnVubmVyIC0xIGdpdGxhYi1ydW5uZXIgLTEgKiAvdmFyL3J1bi9kYnVzIC9i
aW4vZmFsc2UgLSBHaXRsYWIgUnVubmVyCj4gKwlnaXRsYWItcnVubmVyIC0xIGdpdGxhYi1ydW5u
ZXIgLTEgKiAvdmFyL2xpYi9naXRsYWItcnVubmVyIC9iaW4vZmFsc2UgLSBHaXRsYWIgUnVubmVy
Cj4gIGVuZGVmCj4KPiAgZGVmaW5lIEdJVExBQl9SVU5ORVJfSU5TVEFMTF9JTklUX1NZU1YKCgot
LQpNYXJjaW4gTmllc3Ryw7NqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
