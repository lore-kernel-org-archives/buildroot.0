Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC8FC43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 21:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C43441047;
	Wed, 20 Jul 2022 21:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C43441047
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7pTT_CBqwkBu; Wed, 20 Jul 2022 21:51:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E62841038;
	Wed, 20 Jul 2022 21:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E62841038
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 666441BF3A1
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F73441038
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F73441038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jYGO4lq1XHiA for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 21:51:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C17D41029
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C17D41029
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 21:51:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7A6E660002;
 Wed, 20 Jul 2022 21:50:58 +0000 (UTC)
Date: Wed, 20 Jul 2022 23:50:57 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <20220720235057.2aba2ffc@windsurf>
In-Reply-To: <20220615171218.1032413-1-raphael.melotte@mind.be>
References: <20220615171218.1032413-1-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658353858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qimYDOteHrREsN4OCZTbZhDi29n53G3AfE/zAvnX3Eo=;
 b=W64bOIgxbxBCbiZUlp5HsL0ujmYdPWv31l9Tza2e971Q3kTfkBKCNk0j6gZUhjPFxurbya
 kGmdj0fad+eyztN4Wz0dtXXUtu06VKkmCEVOo21AUAjAgZjY5qDPtNg37tROyNdBNhYbQ9
 SW20quWQF+DOZl+HKTfOAyvSxfsEVn0kWP8TCxXbwIHPZBqsTLKTycbNAuixPXNjuGDUvM
 GqOwauTqgkA4WV/R2JlBUQILVUn9nMwqV/HXJsCLDZ1euQYH33Nxychr4j11Wn/STVtTgl
 sPP/XYxOIHw6kdivNomF+Vh0+f0u/UYWAcfTr1+sCHmaIIRqgMk1Wszzqabi9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W64bOIgx
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: use aarch64 for
 TestPythonPy3Botocore
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmFwaGHDq2wsCgpPbiBXZWQsIDE1IEp1biAyMDIyIDE5OjEyOjE1ICswMjAwClJhcGhh
w6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4gd3JvdGU6Cgo+IFdpdGggbmV3
IHB5dGhvbi1ib3RvY29yZSB2ZXJzaW9ucywgdGhlIHNpemUgb2YgdGhlIHBhY2thZ2Ugd2lsbAo+
IGluY3JlYXNlIGFuZCB0aGUgMjU2TWlCIG1lbW9yeSBsaW1pdCBmcm9tIHRoZSBkZWZhdWx0IHZl
cnNhdGlsZXBiCj4gbWFjaGluZSB3aWxsIG5vIGxvbmdlciBiZSBzdWZmaWNpZW50IHRvIGRvIHJ1
bnRpbWUgdGVzdHMuCj4gCj4gU3dpdGNoIHRvIHVzaW5nIGFuIGFhcmNoNjQgbWFjaGluZSwgYW5k
IHVzZSA1MTJNaUIgbWVtb3J5Lgo+IAo+IFRoZSBjb25maWd1cmF0aW9uIGFuZCBsb2dpbiBtZXRo
b2QgYXJlIHRha2VuIGZyb20gVGVzdE9wZW5KZGsuCj4gCj4gV2hpbGUgYXQgaXQsIGFkZCB0aGUg
cHl0aG9uLWJvdG9jb3JlIHRlc3QgZmlsZXMgdG8gdGhlIERFVkVMT1BFUlMKPiBmaWxlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5i
ZT4KClRoYW5rcyBhIGxvdCBmb3IgdGhlIHByb3Bvc2FsLiBJIHVuZGVyc3RhbmQgdGhlIG5lZWQg
Zm9yIG1vcmUgbWVtb3J5LApidXQgSSdtIHdvbmRlcmluZyBpZiBidWlsZGluZyBhIGZ1bGwgYWFy
Y2g2NCBrZXJuZWwganVzdCBmb3IgdGhpcyBpcwpyZWFsbHkgdGhlIHJpZ2h0IHNvbHV0aW9uLgoK
V2hhdCBhYm91dCBpbnN0ZWFkIHRyeWluZyB0byBwYXNzIGEgY3VzdG9tIG9wdGlvbiB0byBRZW11
PwoKc3VwcG9ydC90ZXN0aW5nL2luZnJhL2VtdWxhdG9yLnB5IGdvZXMgbGlrZSB0aGlzOgoKICAg
IGRlZiBib290KHNlbGYsIGFyY2gsIGtlcm5lbD1Ob25lLCBrZXJuZWxfY21kbGluZT1Ob25lLCBv
cHRpb25zPU5vbmUpOgogICAgICAgIGlmIGFyY2ggaW4gWyJhcm12NyIsICJhcm12NSJdOgogICAg
ICAgICAgICBxZW11X2FyY2ggPSAiYXJtIgogICAgICAgIGVsc2U6CiAgICAgICAgICAgIHFlbXVf
YXJjaCA9IGFyY2gKCiAgICAgICAgcWVtdV9jbWQgPSBbInFlbXUtc3lzdGVtLXt9Ii5mb3JtYXQo
cWVtdV9hcmNoKSwKICAgICAgICAgICAgICAgICAgICAiLXNlcmlhbCIsICJzdGRpbyIsCiAgICAg
ICAgICAgICAgICAgICAgIi1kaXNwbGF5IiwgIm5vbmUiLAogICAgICAgICAgICAgICAgICAgICIt
bSIsICIyNTYiXQoKICAgICAgICBpZiBvcHRpb25zOgogICAgICAgICAgICBxZW11X2NtZCArPSBv
cHRpb25zCgpTbyBpZiB3ZSBwYXNzZSBvcHRpb25zPVsiLW0iLCAiNTEyIl0sIHRoaXMgc2hvdWxk
IG92ZXJyaWRlIHRoZSBkZWZhdWx0Ci1tIDI1Ni4KClRoZW4gdGhlIHF1ZXN0aW9uIGlzIGhvdyBj
YW4gdGhlIFB5dGhvbiB0ZXN0IGluZnJhc3RydWN0dXJlIHBhc3MgdGhpcwpkb3duIHRvIHNlbGYu
ZW11bGF0b3IuYm9vdCgpLgoKU29tZXRoaW5nIGxpa2UgdGhpcyBwZXJoYXBzOgoKZGlmZiAtLWdp
dCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uLnB5IGIvc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob24ucHkKaW5kZXggZjI5YWZmNjYyNC4u
YmQwYjIxZjE5MyAxMDA2NDQKLS0tIGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF9weXRob24ucHkKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRo
b24ucHkKQEAgLTExLDExICsxMSwxNCBAQCBjbGFzcyBUZXN0UHl0aG9uQmFzZShpbmZyYS5iYXNl
dGVzdC5CUlRlc3QpOgogICAgICAgICAiIiIKICAgICBpbnRlcnByZXRlciA9ICJweXRob24iCiAK
LSAgICBkZWYgbG9naW4oc2VsZik6CisgICAgZGVmIGxvZ2luKHNlbGYsIHFlbXVfZXh0cmFfb3B0
cz1Ob25lKToKICAgICAgICAgY3Bpb19maWxlID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIs
ICJpbWFnZXMiLCAicm9vdGZzLmNwaW8iKQorICAgICAgICBxZW11X29wdHMgPSBbIi1pbml0cmQi
LCBjcGlvX2ZpbGVdCisgICAgICAgIGlmIHFlbXVfZXh0cmFfb3B0czoKKyAgICAgICAgICAgIHFl
bXVfb3B0cyArPSBxZW11X2V4dHJhX29wdHMKICAgICAgICAgc2VsZi5lbXVsYXRvci5ib290KGFy
Y2g9ImFybXY1IiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGtlcm5lbD0iYnVpbHRpbiIs
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICBvcHRpb25zPVsiLWluaXRyZCIsIGNwaW9fZmls
ZV0pCisgICAgICAgICAgICAgICAgICAgICAgICAgICBvcHRpb25zPXFlbXVfb3B0cykKICAgICAg
ICAgc2VsZi5lbXVsYXRvci5sb2dpbigpCiAKICAgICBkZWYgdmVyc2lvbl90ZXN0KHNlbGYsIHZl
cnNpb24sIHRpbWVvdXQ9LTEpOgpAQCAtODAsNiArODMsNyBAQCBjbGFzcyBUZXN0UHl0aG9uUGFj
a2FnZUJhc2UoVGVzdFB5dGhvbkJhc2UpOgogICAgICAgICAgICAgICAgICAgICJ7c2FtcGxlX3Nj
cmlwdHN9IikKICAgICBzYW1wbGVfc2NyaXB0cyA9IE5vbmUKICAgICB0aW1lb3V0ID0gLTEKKyAg
ICBxZW11X2V4dHJhX29wdHMgPSBOb25lCiAKICAgICBkZWYgX19pbml0X18oc2VsZiwgbmFtZXMp
OgogICAgICAgICAiIiJBZGQgdGhlIHNjcmlwdHMgdG8gdGhlIHRhcmdldCBpbiBidWlsZCB0aW1l
LiIiIgpAQCAtMTAyLDYgKzEwNiw2IEBAIGNsYXNzIFRlc3RQeXRob25QYWNrYWdlQmFzZShUZXN0
UHl0aG9uQmFzZSk6CiAgICAgICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCwgdGltZW91dD1z
ZWxmLnRpbWVvdXQpCiAKICAgICBkZWYgdGVzdF9ydW4oc2VsZik6Ci0gICAgICAgIHNlbGYubG9n
aW4oKQorICAgICAgICBzZWxmLmxvZ2luKHFlbXVfZXh0cmFfb3B0cz1zZWxmLnFlbXVfZXh0cmFf
b3B0cykKICAgICAgICAgc2VsZi5jaGVja19zYW1wbGVfc2NyaXB0c19leGlzdCgpCiAgICAgICAg
IHNlbGYucnVuX3NhbXBsZV9zY3JpcHRzKCkKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2JvdG9jb3JlLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2UvdGVzdF9weXRob25fYm90b2NvcmUucHkKaW5kZXggNjMzNmM1NjU4Zi4uYTdj
MzVhNmVkNiAxMDA2NDQKLS0tIGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9w
eXRob25fYm90b2NvcmUucHkKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF9weXRob25fYm90b2NvcmUucHkKQEAgLTEwLDMgKzEwLDQgQEAgY2xhc3MgVGVzdFB5dGhvblB5
M0JvdG9jb3JlKFRlc3RQeXRob25QYWNrYWdlQmFzZSk6CiAgICAgICAgICIiIgogICAgIHNhbXBs
ZV9zY3JpcHRzID0gWyJ0ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fYm90b2NvcmUucHkiXQog
ICAgIHRpbWVvdXQgPSAxMAorICAgIHFlbXVfZXh0cmFfb3B0cyA9IFsiLW0iLCAiNTEyIl0KCihD
b21wbGV0ZWx5IHVudGVzdGVkLCBhbmQgYWxzbyBJJ20gbm90IHN1cmUgaWYgaXQncyB0aGUgbW9z
dCBQeXRob25pYwp3YXkgdG8gZG8gdGhhdCwgSSdtIG5vdCBhIFB5dGhvbiBkZXZlbG9wZXIpLgoK
V2hhdCBkbyB5b3UgdGhpbms/CgpCZXN0IHJlZ2FyZHMsCgpUaG9tYXMKLS0gClRob21hcyBQZXRh
enpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
