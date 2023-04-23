Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1926C77B73
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 10:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34E9840B23;
	Sun, 23 Apr 2023 10:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34E9840B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y7568ujpezNa; Sun, 23 Apr 2023 10:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6548A4059F;
	Sun, 23 Apr 2023 10:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6548A4059F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B5B61C2B5C
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0236E60B65
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0236E60B65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-mD7KMQ-JYX for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 10:29:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F1E260B58
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F1E260B58
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 10:29:37 +0000 (UTC)
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mwwm5-1qFDpR3nHH-00ySgd; Sun, 23 Apr 2023 12:29:31 +0200
Message-ID: <251b5e93-8213-639d-d41f-b218736d0255@vivier.eu>
Date: Sun, 23 Apr 2023 12:29:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: fr
To: buildroot@buildroot.org
References: <20230421185003.1221000-1-laurent@vivier.eu>
 <20230421185003.1221000-2-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230421185003.1221000-2-laurent@vivier.eu>
X-Provags-ID: V03:K1:UNWzRf2OLakS6RDQsHpK9sm02vg65mbqH7e0ZbWLWk1N465ni0+
 qsgt5h5MeGbWH0xXHez1sGgVTzbZFvirzIaNY1QB8vUAyuZsBzfzxt+ISj3BWbDv8F3SsOS
 wDEI3bQOfMYncgJRgwgcF/OnP6brNXgnPx3NmDtyT/VjqnGKghyhnrW5n/K8AdsfEdjs0O3
 2BwsBvhy+xgXXQcv6o4jw==
UI-OutboundReport: notjunk:1;M01:P0:W7SRk3gwEFc=;SMph9HlH+mOVux7tEVBMLS8A3ZQ
 SGahXAwHE0GT8VQRJgJog8KzqRIjbAtfkU8v4nRkku4E9kLnpmI7bgU9Zs7KnJBGqREW4IIkv
 RYiR5SJydGZYjXZdjFWFnxC+vuyAL00sfJAvFeYfNI18YNNfTkV5RuOCdApZtl76iS1rdLzJc
 YIEnLVDpGoSu7tVs/MJFHATOQ5XXHHhYWFSfS7Yda7lwBWmHaz0730o7Z9vTg+KAjH34yzp9q
 4OFjE5BUybzpcFRVqykqIuCp9xWmbXavHDhf7DneKzJL9yRfEo3jP/3yrKRLUWrMplaZfHh5l
 TdLeJdhV3hB2ZJWe2+K9wISZGxGiZhXapxiKMcBtcOunydLb0nw1Zcm0U2/FGs6NA8d1jHtYz
 AwUERPS8xgg1qXGDuVZFJjRG74ZtsLxbzxTV93kp8gCsh8vBfIMd63+paey3tnscGcEQbe57i
 87IF5BRjU8xw0dVcwDIRMl70hIlb5XCXv9mH3wCXfqiZboywmLs3/BMjtkPz3LST/W/9oAATp
 shVECuArDjDDnTy82D/w+wWJ3567H5J+EC19/QCznDuzrAGibkoJHPSAJguktik8i2t/66Ogo
 wqqCSoHEVywV93sA3A9PzHclWPo93xPE7swZNUx+9pP2sKu1Oz6w5H5IIMN4XLsJ2TZU1FTns
 GYN68Y2k4p4wZrEb1+bwC5iDoHxJhrsLmfJVueCUlw==
Subject: Re: [Buildroot] [PATCH v11 1/5] kexec: fix sys/random.h with uclibc
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMjEvMDQvMjAyMyDDoCAyMDo0OSwgTGF1cmVudCBWaXZpZXIgYSDDqWNyaXTCoDoKPiBTaWdu
ZWQtb2ZmLWJ5OiBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+Cj4gLS0tCj4gICAu
Li4xLW02OGstZml4LWdldHJhbmRvbS11c2Utd2l0aC11Y2xpYmMucGF0Y2ggfCAzNSArKysrKysr
KysrKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQo+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uva2V4ZWMvMDAwMS1tNjhrLWZpeC1nZXRyYW5kb20tdXNl
LXdpdGgtdWNsaWJjLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uva2V4ZWMvMDAwMS1t
NjhrLWZpeC1nZXRyYW5kb20tdXNlLXdpdGgtdWNsaWJjLnBhdGNoIGIvcGFja2FnZS9rZXhlYy8w
MDAxLW02OGstZml4LWdldHJhbmRvbS11c2Utd2l0aC11Y2xpYmMucGF0Y2gKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZDJmYzNiYzg4NjQxCj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL3BhY2thZ2Uva2V4ZWMvMDAwMS1tNjhrLWZpeC1nZXRyYW5kb20tdXNlLXdp
dGgtdWNsaWJjLnBhdGNoCj4gQEAgLTAsMCArMSwzNSBAQAo+ICtGcm9tIDQ5MTQzOWE1YzU1YjE4
ZGNlOTZiNTIyZjNhNjAzZmFhZjE5MDhlZGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zy
b206IExhdXJlbnQgVml2aWVyIDxsYXVyZW50QHZpdmllci5ldT4KPiArRGF0ZTogRnJpLCAyMSBB
cHIgMjAyMyAxODoyMjowNyArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIG02OGs6IGZpeCBnZXRy
YW5kb20oKSB1c2Ugd2l0aCB1Y2xpYmMKPiArCj4gK1dpdGggdWNsaWJjLCBnZXRyYW5kb20oKSBp
cyBvbmx5IGRlZmluZWQgd2l0aCBfR05VX1NPVVJDRSwgZml4IHRoYXQ6Cj4gKwo+ICtrZXhlYy9h
cmNoL202OGsvYm9vdGluZm8uYzogSW4gZnVuY3Rpb24gJ2Jvb3RpbmZvX2FkZF9ybmdfc2VlZCc6
Cj4gK2tleGVjL2FyY2gvbTY4ay9ib290aW5mby5jOjIzMToxMzogd2FybmluZzogaW1wbGljaXQg
ZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ2dldHJhbmRvbSc7IGRpZCB5b3UgbWVhbiAnc3JhbmRv
bSc/IFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICsgIDIzMSB8ICAgICAgICAg
aWYgKGdldHJhbmRvbShiaS0+cm5nX3NlZWQuZGF0YSwgUk5HX1NFRURfTEVOLCBHUk5EX05PTkJM
T0NLKSAhPSBSTkdfU0VFRF9MRU4pIHsKPiArICAgICAgfCAgICAgICAgICAgICBefn5+fn5+fn4K
PiArICAgICAgfCAgICAgICAgICAgICBzcmFuZG9tCj4gK2tleGVjL2FyY2gvbTY4ay9ib290aW5m
by5jOjIzMTo1NjogZXJyb3I6ICdHUk5EX05PTkJMT0NLJyB1bmRlY2xhcmVkIChmaXJzdCB1c2Ug
aW4gdGhpcyBmdW5jdGlvbikKPiArICAyMzEgfCAgICAgICAgIGlmIChnZXRyYW5kb20oYmktPnJu
Z19zZWVkLmRhdGEsIFJOR19TRUVEX0xFTiwgR1JORF9OT05CTE9DSykgIT0gUk5HX1NFRURfTEVO
KSB7Cj4gKyAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn4KPiArCj4gK0ZpeGVzOiAgYjlkZTA1MTg0ODE2ICgi
bTY4azogcGFzcyBybmcgc2VlZCB2aWEgQklfUk5HX1NFRUQiKQo+ICtDYzogSmFzb25AengyYzQu
Y29tCj4gK1NpZ25lZC1vZmYtYnk6IExhdXJlbnQgVml2aWVyIDxsYXVyZW50QHZpdmllci5ldT4K
PiArLS0tCj4gKyBrZXhlYy9hcmNoL202OGsvYm9vdGluZm8uYyB8IDEgKwo+ICsgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gKwo+ICtkaWZmIC0tZ2l0IGEva2V4ZWMvYXJjaC9tNjhr
L2Jvb3RpbmZvLmMgYi9rZXhlYy9hcmNoL202OGsvYm9vdGluZm8uYwo+ICtpbmRleCAwODZhMzRi
ZGZkZWIuLjVhZmQyMTJkOWQzNCAxMDA2NDQKPiArLS0tIGEva2V4ZWMvYXJjaC9tNjhrL2Jvb3Rp
bmZvLmMKPiArKysrIGIva2V4ZWMvYXJjaC9tNjhrL2Jvb3RpbmZvLmMKPiArQEAgLTEsMyArMSw0
IEBACj4gKysjZGVmaW5lIF9HTlVfU09VUkNFCj4gKwo+ICsgI2luY2x1ZGUgPHN0ZGlvLmg+Cj4g
KyAjaW5jbHVkZSA8c3RkbGliLmg+Cj4gKy0tCj4gKzIuNDAuMAo+ICsKCmtleGVjIHBhdGNoIHNl
bnQgdG8ga2V4ZWMgTUw6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9rZXhlYy8yMDIzMDQyMjA5
NTkwNC4xMzAzNDM0LTEtbGF1cmVudEB2aXZpZXIuZXUvVC8jdQoKVGhhbmtzLApMYXVyZW50Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
