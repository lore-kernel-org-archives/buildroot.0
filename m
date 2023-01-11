Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4720C677F1
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 17:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18E6341994;
	Wed, 11 Jan 2023 17:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18E6341994
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JXPR00EVEn8l; Wed, 11 Jan 2023 17:41:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D78D418FF;
	Wed, 11 Jan 2023 17:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D78D418FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 159F11BF41D
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 17:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E33788210B
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 17:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E33788210B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GwzIOLjuxfpM for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 17:41:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB43381F89
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB43381F89
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 17:41:03 +0000 (UTC)
Received: from [192.168.0.203] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MFba4-1oyZRM3Hw6-00H6L4; Wed, 11 Jan 2023 18:35:46 +0100
Message-ID: <7e325d8a-4717-bb45-58b8-73a5d632ddc0@green-communications.fr>
Date: Wed, 11 Jan 2023 18:35:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: fr
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220728014402.142320-1-james.hilliard1@gmail.com>
 <c01c67cd-b4ce-a054-2b6b-47fbfcbf513a@smile.fr>
 <2ac975d4-3451-ec20-9987-a56be5ea36e4@green-communications.fr>
 <20230111164416.GQ151997@scaer>
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <20230111164416.GQ151997@scaer>
X-Provags-ID: V03:K1:5435FqBuDtEwkB64Wknbo/pj08DMrzhycZOMZ+tzAMmv3fQXJg1
 UMwOHXkBabC1aoh7VJIzGwEKL/H5/ukfCwBrJd6g0QG6t+r3hSd45M24Zor7Q691o4FFWLE
 c4PRN8j0kVAiMClrFolLd5L0CReHcSNNfIQXN23/rbnLp1pGIMf8oKg1Wfmih9HSAKpn3gg
 K+CFfAXvQ7+zkYXXDttFA==
UI-OutboundReport: notjunk:1;M01:P0:V2R6dRwyqBc=;8QeHDXKczCRDQV7lpcmn1ZAA5XD
 +mc9xAmdYwhz1o2PQxNhrfiu/1QgXYc4pW7tZA88XUt2XNt95cASbLZmSNptXdfSvSB4SbQe1
 9KCaIJwuXy2zmU0SNQToHqXJgtJwwTCnBcYhAcGRuoVmPoLPd/g6UvB3L3/1tbeeVaRGoJS8n
 d+FAOzvs9QiB5pKVgxJ64Em2078GwnI1tBNphrznyRkQReP9KiQ10kspzSv+gPG9jA018/Lhn
 +PVURRyYEi6CcEUdV/AGZ3uhYUk00oXRXzNtwBegSdPpwV/eUPbRXsNPjD4sANm+VPd2MGhgq
 FtWYKinN5qW4KmAzjWS68Nnk0LFOIdH/qpG0GVw/QH82m9GC4cy25OLiKeWiEnu+NI1B9hUBC
 CH1W34oD378MLbfq23o4hx+6QTs4dKIUrcembNDMO6wdmxd1P7vT764uNbvHaSC5bnJYq3Vl9
 rvtjH3tCt+sK5s6+H1WOBDXi7neGIVRSXao7sGlCE94jnbZIGAuzJBo3iYPNLBPZcvm1f/Evj
 Q1Iy+UoBsLQYRNRSaun8Vd3rF+5VB77KRqejkFGB12M2KMDdt4Qt12gXUfVHCYKhw22UTq/VI
 pubUyoXpFPxBCftHTcvK7pN8vMIszAmp7q/h3VwV+rapNNl5IvtQOzKuT5rGtyHjfv/BAJy0v
 RntcEZ8tPe9cWLWo1ksEG0hLhVVYkV+s9tZCyRc+eQ==
Subject: Re: [Buildroot] [PATCH 1/2] support/misc/toolchainfile.cmake.in:
 set PKG_CONFIG/CMAKE prefix paths
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@smile.fr>, Samuel Martin <s.martin49@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTEvMDEvMjAyMyAxNzo0NCwgWWFubiBFLiBNT1JJTiB3cm90ZToKPiBOaWNvbGFzLCBKYW1l
cywgQWxsLAo+IAo+IE9uIDIwMjMtMDEtMTEgMTc6MDEgKzAxMDAsIE5pY29sYXMgQ2F2YWxsYXJp
IHNwYWtlIHRodXNseToKPj4gT24gMTEvMDEvMjAyMyAxNjoxOSwgUm9tYWluIE5hb3VyIHdyb3Rl
Ogo+Pj4gTGUgMjgvMDcvMjAyMiDDoCAwMzo0NCwgSmFtZXMgSGlsbGlhcmQgYSDDqWNyaXTCoDoK
Pj4+PiBUaGVzZSBhcHBlYXIgdG8gbm90IGJlIGdldHRpbmcgc2V0IGNvcnJlY3RseSBhbmQgYXJl
IG5lZWRlZCB3aGVuIHVzaW5nCj4+Pj4gbWVzb24ncyByZWxvY2F0YWJsZSBwa2djb25maWcgZm9y
bWF0Lgo+Pj4gSG93IHRoaXMgY21ha2UgZmlsZSAodG9vbGNoYWluZmlsZS5jbWFrZS5pbikgaXMg
dXNlZCBieSBhIG1lc29uIHBhY2thZ2UgPwo+PiBJIHVuZGVyc3RhbmQgaXQgYXMgImEgY21ha2Ug
cGFja2FnZSBuZWVkcyB0aGlzIHRvIHVzZSBhIHBrZ2NvbmZpZyBmaWxlCj4+IGdlbmVyYXRlZCBi
eSBhIG1lc29uIHBhY2thZ2Ugd2hlbiBtZXNvbiBpcyBjb25maWd1cmVkIHRvIGdlbmVyYXRlCj4+
IHJlbG9jYXRhYmxlIHBrZ2NvbmZpZyBmaWxlcyIuCj4gCj4gT0ssIGJ1dCB0aGVuIEkgaGF2ZSBh
IGZldyBxdWVzdGlvbnM6Cj4gCj4gICAgLSB3aGF0IGFyZSAicmVsb2NhdGFibGUgcGtnY29uZmln
IGZpbGVzIiwgYW5kIGhvdyBkbyB0aGV5IGZpdCBpbiB0aGUKPiAgICAgIHBrZ2NvbmZpZyBzcGVj
PyA+Cj4gICAgLSBob3cgZG8gdGhleSBkaWZmZXIgZnJvbSBzdGFuZGFyZCBwa2djb25maWcgZmls
ZXM/IEJ5ICJzdGFuZGFyZCIsIEkKPiAgICAgIG1lYW4gYWxsIHRoZSBwa2djb25maWcgZmlsZXMg
d2UgY3VycmVudGx5IGluc3RhbGwgYW5kIHVzZSBmcm9tIHRoZQo+ICAgICAgaHVuZHJlZHMsIGlm
IG5vdCB0aG91c2FuZHMsIG9mIHBhY2thZ2VzIHRoYXQgcHJvdmlkZWQgdGhlbS4KClJlYWRpbmcg
dGhlIG1lc29uJ3Mgc291cmNlLCB0aGV5IGFyZSBtZXJlbHkgc3RhbmRhcmQgcGtnY29uZmlnIGZp
bGVzIAp0aGF0IHVzZSB0aGUgJHtwY2ZpbGVkaXJ9IHZhcmlhYmxlIHRvIGRlZmluZSBwYXRocyBp
bnN0ZWFkIG9mIGhhcmRjb2RpbmcgCmEgcHJlZml4LiBUaGVzZSBhcmUgbm90IHNwZWNpZmljIHRv
IG1lc29uIGFuZCBhcmUgc3VwcG9ydGVkIGJ5IApwa2ctY29uZmlnLiAoSXQgaGFwcGVuIHRoYXQg
c29tZSBvZiBvdXIgcHJpdmF0ZSBwYWNrYWdlcyB1c2VzIHRoYXQgdHJpY2sgCnRvbywgYW5kIHRo
ZXkgYXJlIG5vdCBtZXNvbiBwYWNrYWdlcykKCj4gICAgLSB3aHkgaXMgbWVzb24gZ2VuZXJhdGlu
ZyB0aG9zZSBwa2djb25maWcgZmlsZXMsIHJhdGhlciB0aGFuIHN0YW5kYXJkCj4gICAgICBvbmVz
PwoKQmVjYXVzZSBwYXRjaCAyLzIgdGVsbHMgaXQgdG8uCgo+ICAgIC0gYW5kIGZpbmFsbHksIGlm
IHRoZSAicmVsb2NhdGFibGUgcGtnY29uZmlnIGZpbGVzIiBnZW5lcmF0ZWQgYnkgbWVzb24KPiAg
ICAgIGFyZSBpbmNvcnJlY3Qgd3J0IHRoZSBwa2djb25maWcgc3BlYywgY2FuIHdlIHRlbGwgbWVz
b24gbm90IHRvIGRvCj4gICAgICB0aGF0PwoKVGhleSBhcmUgbm90IGluY29ycmVjdC4gIEZyb20g
ZXhwZXJpZW5jZSwgYXV0b3Rvb2xzIGFuZCBtZXNvbiBwYWNrYWdlcyAKaGFuZGxlcyB0aGVtIGZp
bmUuIGNtYWtlIGhvd2V2ZXIsIGFjY29yZGluZyB0byB0aGUgY29tbWl0IG1lc3NhZ2UsIGRvZXMg
Cm5vdCBhbmQgbmVlZHMgc29tZSBleHRyYSB2YXJpYWJsZXMuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
