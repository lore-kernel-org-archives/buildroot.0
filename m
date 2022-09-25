Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB031C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 13:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1526F404DD;
	Sun, 25 Sep 2022 13:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1526F404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9KbNgE2UNzF; Sun, 25 Sep 2022 13:58:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13DCE404C1;
	Sun, 25 Sep 2022 13:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13DCE404C1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF2CF1BF2AA
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 13:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AF25606CB
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 13:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AF25606CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qj2Zds6XxM8x for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 13:58:01 +0000 (UTC)
X-Greylist: delayed 00:37:46 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F4F16068A
Received: from 10.mo548.mail-out.ovh.net (10.mo548.mail-out.ovh.net
 [46.105.77.235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F4F16068A
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 13:58:01 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.206])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0DB33208B8;
 Sun, 25 Sep 2022 13:20:12 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Sun, 25 Sep
 2022 15:20:11 +0200
X-OVh-ClientIp: 82.64.250.170
Message-ID: <eec913f5-2209-546e-5956-1cafd73bea7e@kaod.org>
Date: Sun, 25 Sep 2022 15:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220924214110.3490682-1-clg@kaod.org>
 <20220925124055.GY1419013@scaer>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220925124055.GY1419013@scaer>
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d5686898-49a5-4838-b4ad-5f87a43aaf5d
X-Ovh-Tracer-Id: 6164020517560421341
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegtddgieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehvdduffdtjeefteetheelgfeuieejteejveefuedtheeluddtteduveehueeutdenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdfovfetjfhoshhtpehmohehgeek
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00465c5b867-f953-4af8-a736-c42a49c9e6d2,
 F2BAAC272AACDAE9383B0CB74E4F720F3B7CB042) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH] Revert "configs/qemu_ppc64*: downgrade
 binutils to 2.36.1"
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
Cc: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gOS8yNS8yMiAxNDo0MCwgWWFubiBFLiBNT1JJTiB3cm90ZToKPiBDw6lkcmljLCBBbGwsCj4g
Cj4gT24gMjAyMi0wOS0yNCAyMzo0MSArMDIwMCwgQ8OpZHJpYyBMZSBHb2F0ZXIgc3Bha2UgdGh1
c2x5Ogo+PiBUaGlzIHJldmVydHMgY29tbWl0IDFlMmZlODYwZjNhMjYxZmM4Nzc1OTFjMDU2ODA4
ZDZmYjMwZTI1ZDQuCj4gCj4gVGhpcyBpcyBub3QgcmVhbGx5IGEgcmV2ZXJ0LAoKVGhpcyBpcyB0
aGUgcmVzdWx0IG9mIHRoZSBjb21tYW5kIDoKCiAgIGdpdCByZXZlcnQgLXMgMWUyZmU4NjBmM2Ey
CgpTbyBpdCBpcyAicmVhbGx5IiBhIHJldmVydCA6KQoKPiBzbyBJIGRpZCBzb21lIGNoYW5nZXM6
Cj4gCj4gICAgLSBleHBsaWN0aWx5IGZvcmNlIGJpbnV0aWxzIDIuMzgKCkkgZ3Vlc3MgdGhpcyBp
cyB0byBtYWtlIHN1cmUgdGhhdCAyLjM3IGlzIG5vdCBzZWxlY3RlZCBidXQgd2hlbgp0aGUgY3Vy
cmVudCAyLjM4IGlzIGRlcHJlY2F0ZWQsIGFsbCBkZWZjb25maWdzIHdpbGwgcmVxdWlyZSBhbgp1
cGRhdGUuIFNpbmNlIHRoZSBkZWZhdWx0IHdvcmtzIGZpbmUsIEkgZG9uJ3QgdGhpbmsgaXQgaXMg
d29ydGgKYWRkaW5nIGFuIGV4dHJhIGRlcGVuZGVuY3kgKHVudGlsIG5leHQgYnJlYWthZ2UpIG9y
IHdlIGNvdWxkIHVzZQphICEyLjM3IGRlcGVuZGVuY3kgaW5zdGVhZC4gSSBhbSBub3Qgc3VyZSBp
ZiB0aGlzIGlzIHBvc3NpYmxlCnRob3VnaC4KCj4gICAgLSByZXdvcmQgY29tbWl0IGxvZyB0byBl
eHBsYWluIHdoeQoKb2sgYnV0IHRoYXQncyBpbiBjb21taXQgMWUyZmU4NjBmM2EyIGFscmVhZHku
IEFzIHlvdSB3aXNoLgoKPiAgICAtIHJld29yZCBjb21taXQgbG9nOiBpdCdzIG5vdCByZWFsbHkg
YSByZXZlcnQKPgo+IAo+PiBUaGUgZGVmYXVsdCAyLjM4LnggaGFzIHRoZSByZXF1aXJlZCBmaXhl
cy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4K
PiAKPiBBcHBsaWVkIHRvIG1hc3RlciB3aXRoIHRoZSBhYm92ZSBjaGFuZ2VzLCB0aGFua3MuCgpU
aGFua3MsCgpDLgoKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4gCj4+IC0tLQo+Pgo+PiAg
IGh0dHBzOi8vZ2l0bGFiLmNvbS9sZWdvYXRlci9idWlsZHJvb3QvLS9waXBlbGluZXMvNjQ5NzIz
NTk4Cj4+ICAgCj4+ICAgY29uZmlncy9xZW11X3BwYzY0X2U1NTAwX2RlZmNvbmZpZyAgICAgIHwg
MSAtCj4+ICAgY29uZmlncy9xZW11X3BwYzY0X3BzZXJpZXNfZGVmY29uZmlnICAgIHwgMSAtCj4+
ICAgY29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmlnIHwgMSAtCj4+ICAgY29u
Zmlncy9xZW11X3BwYzY0bGVfcHNlcmllc19kZWZjb25maWcgIHwgMSAtCj4+ICAgNCBmaWxlcyBj
aGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X3Bw
YzY0X2U1NTAwX2RlZmNvbmZpZyBiL2NvbmZpZ3MvcWVtdV9wcGM2NF9lNTUwMF9kZWZjb25maWcK
Pj4gaW5kZXggODQ1OGYyNzM5YTY2Li4wODI1ZDBhYjliMzAgMTAwNjQ0Cj4+IC0tLSBhL2NvbmZp
Z3MvcWVtdV9wcGM2NF9lNTUwMF9kZWZjb25maWcKPj4gKysrIGIvY29uZmlncy9xZW11X3BwYzY0
X2U1NTAwX2RlZmNvbmZpZwo+PiBAQCAtMyw3ICszLDYgQEAgQlIyX3Bvd2VycGM2ND15Cj4+ICAg
QlIyX3Bvd2VycGNfZTU1MDA9eQo+PiAgIAo+PiAgICMgU3lzdGVtCj4+IC1CUjJfQklOVVRJTFNf
VkVSU0lPTl8yXzM2X1g9eQo+PiAgIEJSMl9TWVNURU1fREhDUD0iZXRoMCIKPj4gICBCUjJfVEFS
R0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0idHR5UzAiCj4+ICAgCj4+IGRpZmYgLS1naXQgYS9jb25m
aWdzL3FlbXVfcHBjNjRfcHNlcmllc19kZWZjb25maWcgYi9jb25maWdzL3FlbXVfcHBjNjRfcHNl
cmllc19kZWZjb25maWcKPj4gaW5kZXggNDgwZWJlYTI5ZDcwLi5jNDUwMTRmMmFjM2YgMTAwNjQ0
Cj4+IC0tLSBhL2NvbmZpZ3MvcWVtdV9wcGM2NF9wc2VyaWVzX2RlZmNvbmZpZwo+PiArKysgYi9j
b25maWdzL3FlbXVfcHBjNjRfcHNlcmllc19kZWZjb25maWcKPj4gQEAgLTMsNyArMyw2IEBAIEJS
Ml9wb3dlcnBjNjQ9eQo+PiAgIEJSMl9wb3dlcnBjX3Bvd2VyNz15Cj4+ICAgCj4+ICAgIyBTeXN0
ZW0KPj4gLUJSMl9CSU5VVElMU19WRVJTSU9OXzJfMzZfWD15Cj4+ICAgQlIyX1NZU1RFTV9ESENQ
PSJldGgwIgo+PiAgIEJSMl9UQVJHRVRfR0VORVJJQ19HRVRUWV9QT1JUPSJodmMwIgo+PiAgIAo+
PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmlnIGIv
Y29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmlnCj4+IGluZGV4IDhkZTRjZjUx
ODliNS4uODIyMTQ1ZTkyN2ExIDEwMDY0NAo+PiAtLS0gYS9jb25maWdzL3FlbXVfcHBjNjRsZV9w
b3dlcm52OF9kZWZjb25maWcKPj4gKysrIGIvY29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJudjhf
ZGVmY29uZmlnCj4+IEBAIC0zLDcgKzMsNiBAQCBCUjJfcG93ZXJwYzY0bGU9eQo+PiAgIEJSMl9w
b3dlcnBjX3Bvd2VyOD15Cj4+ICAgCj4+ICAgIyBTeXN0ZW0KPj4gLUJSMl9CSU5VVElMU19WRVJT
SU9OXzJfMzZfWD15Cj4+ICAgQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZX1BPUlQ9Imh2YzAiCj4+
ICAgQlIyX1NZU1RFTV9ESENQPSJldGgwIgo+PiAgIAo+PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9x
ZW11X3BwYzY0bGVfcHNlcmllc19kZWZjb25maWcgYi9jb25maWdzL3FlbXVfcHBjNjRsZV9wc2Vy
aWVzX2RlZmNvbmZpZwo+PiBpbmRleCA5OGM2YWZkZjkzOTkuLjVlYWEzZTk1M2Y3OCAxMDA2NDQK
Pj4gLS0tIGEvY29uZmlncy9xZW11X3BwYzY0bGVfcHNlcmllc19kZWZjb25maWcKPj4gKysrIGIv
Y29uZmlncy9xZW11X3BwYzY0bGVfcHNlcmllc19kZWZjb25maWcKPj4gQEAgLTMsNyArMyw2IEBA
IEJSMl9wb3dlcnBjNjRsZT15Cj4+ICAgQlIyX3Bvd2VycGNfcG93ZXI4PXkKPj4gICAKPj4gICAj
IFN5c3RlbQo+PiAtQlIyX0JJTlVUSUxTX1ZFUlNJT05fMl8zNl9YPXkKPj4gICBCUjJfVEFSR0VU
X0dFTkVSSUNfR0VUVFlfUE9SVD0iaHZjMCIKPj4gICBCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCj4+
ICAgCj4+IC0tIAo+PiAyLjM3LjMKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
