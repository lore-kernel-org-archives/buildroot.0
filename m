Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633F6C77B76
	for <buildroot@archiver.kernel.org>; Mon, 17 Apr 2023 18:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE23408A0;
	Mon, 17 Apr 2023 18:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBE23408A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lFQcDFQY-rvJ; Mon, 17 Apr 2023 18:03:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F32F408A3;
	Mon, 17 Apr 2023 18:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F32F408A3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C61E51C4212
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 18:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A571F83BA5
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 18:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A571F83BA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U-H5RNznLxIn for <buildroot@lists.busybox.net>;
 Mon, 17 Apr 2023 18:03:21 +0000 (UTC)
X-Greylist: delayed 00:07:40 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C05083BA3
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C05083BA3
 for <buildroot@buildroot.org>; Mon, 17 Apr 2023 18:03:20 +0000 (UTC)
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MUXd0-1pxMvd1iue-00QRmf; Mon, 17 Apr 2023 19:50:29 +0200
Message-ID: <30d503ff-4e83-3e77-2208-2a9c14f8e699@vivier.eu>
Date: Mon, 17 Apr 2023 19:50:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: fr
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20230201204848.2099336-1-laurent@vivier.eu>
 <20230201204848.2099336-2-laurent@vivier.eu>
 <52ab86d4-8008-9044-47e4-628c3da5ef7b@mind.be>
 <4c554ddf-38c1-ee71-826f-00e22f2cc180@vivier.eu>
 <194ac639-44e4-b267-7e8e-9739a15f12a4@vivier.eu>
 <a0a284d2-484c-cd50-d1a7-9278c1233c7b@mind.be>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <a0a284d2-484c-cd50-d1a7-9278c1233c7b@mind.be>
X-Provags-ID: V03:K1:gvPhYR6UrP9oBpf/KALgnRQE+8CDEkBONTIk+MXTIEWIdEuWq8/
 ezqmy+eiJqFjWF319qMt270jlgH5WAcePsxJzMT7zrdtDbTuydjx7H9g8fIdXDHpGsDHHoR
 I7yCZe08jmNmDth1w5Dt9hc5us4Kl+f+qWxhOSHyCiGxoI+1N2lKWxa3WxbQdXZm8oEPVon
 Rr6DG9ED7Bj9I5t46UoPA==
UI-OutboundReport: notjunk:1;M01:P0:4Bs8DKI4g0Y=;Ph+/wcJVaU6gIo5fvpujySAvGXh
 HFxETQnylUGOakYESPDBooMrpSn0SUSZtCXmZofb56NTVNKOTSBMupWtr5aIXxDbue/O+xY+0
 o/MSBnKgEWc6zNDi4Hs3WrS3dY2DYvY4ydGxeiwDdVLqzg5AcVRUTqslTC6X+tKEgITfLijS/
 +DRKo2LKqh4CXoWuX12U38hR1m0HQJmXlJnrRBm+/OmL9pVZpVIqVG4a8xlK0aFef0G/TuScu
 mgecrq3uJ7IJVdlaSHTNWhlrrGI45KNCmR1+VnTzH8TBT5b6TUvm5xALhU2g27YpLuUCQ6put
 Zk7EGOmB1rxCp37XYLp6uScYuMHcJrY++zvHu5ENM1leeuVdcpEOgyAYXEVz2BJWKYxK5rJxC
 TL61SWjhWJpqDyuQiOzSO/pC97sEFJq3lP/ckKex3MNvJ9GFhqKUO0dcjFCsumoXBMEC26njq
 8kqoxU4fnD09XbGkDDAy9k7i/SflgzCkADfkpJsbwfQZDw2RoHLbYFJqVH7NeifZD+jg9T2LF
 WaUCyweN8olHs465LYfMvKHKn7wQ16VwXJJHI0CKxnv/jeNEaTEE9GTzSWceKYuwRZRVQfODy
 P0q08yEXEpp3iYBet+VRGVqEMOTrMbo34godoZrnFcq4tPODg9GO/nsUYoH1m6UcYpNyvIpRz
 Jb92KEYgtTHf3NlkzmKsOezWs350vE51vo/q7rPPkQ==
Subject: Re: [Buildroot] [PATCH v10 1/3] package: add petitboot
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

TGUgMDkvMDQvMjAyMyDDoCAxNToyNiwgQXJub3V0IFZhbmRlY2FwcGVsbGUgYSDDqWNyaXTCoDoK
PiAKPiAKPiBPbiAwNi8wNC8yMDIzIDE4OjEwLCBMYXVyZW50IFZpdmllciB3cm90ZToKPj4gTGUg
MDYvMDQvMjAyMyDDoCAxNToyNCwgTGF1cmVudCBWaXZpZXIgYSDDqWNyaXTCoDoKPj4+IEhpIEFy
bm91dCwKPj4+Cj4+PiB0aGFuayB5b3UgZm9yIHlvdXIgd29yay4KPj4+Cj4+PiBUaGUgdXBkYXRl
IHRvIGtleGVjIDIuMC4yNiBoYXMgYnJva2VuIHRoZSBidWlsZCB3aXRoIG02OGs6Cj4+Pgo+Pj4g
Y29tbWl0IDY5MDUzMTg2YzlmMTU2MTg1NTM1N2JlNTc0YzcwYzBiM2FkMGRkY2IKPj4+IEF1dGhv
cjogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPj4+IERhdGU6wqDCoCBXZWQgTWFyIDEg
MjM6MDE6NTggMjAyMyArMDEwMAo+Pj4KPj4+IMKgwqDCoMKgwqAgcGFja2FnZS9rZXhlYzogYnVt
cCB0byB2ZXJzaW9uIDIuMC4yNgo+Pj4KPj4+IMKgwqDCoMKgwqAgU2VlIHJlbGVhc2UgYW5ub3Vu
Y2U6Cj4+PiDCoMKgwqDCoMKgIGh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwv
a2V4ZWMvMjAyMi1EZWNlbWJlci8wMjYzOTkuaHRtbAo+Pj4KPj4+IMKgwqDCoMKgwqAgU2lnbmVk
LW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPj4+IMKgwqDCoMKgwqAgU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNv
bT4KPj4+Cj4+Pgo+Pj4ga2V4ZWMvYXJjaC9tNjhrL2Jvb3RpbmZvLmM6IEluIGZ1bmN0aW9uICdi
b290aW5mb19hZGRfcm5nX3NlZWQnOgo+Pj4ga2V4ZWMvYXJjaC9tNjhrL2Jvb3RpbmZvLmM6MjMx
OjEzOiB3YXJuaW5nOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnZ2V0cmFuZG9t
JzsgZGlkIHlvdSAKPj4+IG1lYW4gJ3NyYW5kb20nPyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNs
YXJhdGlvbl0KPj4+IMKgwqDCoCAyMzEgfMKgwqDCoMKgwqDCoMKgwqAgaWYgKGdldHJhbmRvbShi
aS0+cm5nX3NlZWQuZGF0YSwgUk5HX1NFRURfTEVOLCBHUk5EX05PTkJMT0NLKSAhPSBSTkdfU0VF
RF9MRU4pIHsKPj4+IMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+
fn5+fn5+Cj4+PiDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNyYW5k
b20KPj4+IGtleGVjL2FyY2gvbTY4ay9ib290aW5mby5jOjIzMTo1NjogZXJyb3I6ICdHUk5EX05P
TkJMT0NLJyB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKPj4+IMKgwqDC
oCAyMzEgfMKgwqDCoMKgwqDCoMKgwqAgaWYgKGdldHJhbmRvbShiaS0+cm5nX3NlZWQuZGF0YSwg
Uk5HX1NFRURfTEVOLCBHUk5EX05PTkJMT0NLKSAhPSBSTkdfU0VFRF9MRU4pIHsKPj4+Cj4+PiBJ
dCdzIHN0cmFuZ2UgYmVjYXVzZSBzeXMvcmFuZG9tLmggaXMgY29ycmVjdGx5IGluY2x1ZGVkLgo+
Pj4KPj4+IFRoaXMgY29tZXMgZnJvbToKPj4+Cj4+PiBodHRwczovL2dpdGh1Yi5jb20vaG9ybXMv
a2V4ZWMtdG9vbHMvY29tbWl0L2I5ZGUwNTE4NDgxNmYxNWYwZDYxNWZlMTljNDA2N2MxMzg3MjU5
OGIKPj4+Cj4+PiDCoMKgwqAgbTY4azogcGFzcyBybmcgc2VlZCB2aWEgQklfUk5HX1NFRUQKPj4+
IMKgwqDCoCBJbiBvcmRlciB0byBwYXNzIGZyZXNoIGVudHJvcHkgdG8ga2V4ZWMnZCBrZXJuZWxz
LCB1c2UgQklfUk5HX1NFRUQKPj4+IMKgwqDCoCBmb3IgcGFzc2luZyBhIHNlZWQsIHdpdGggdGhl
IHNhbWUgc2VtYW50aWNzIHRoYXQga2V4ZWMtdG9vbHMgY3VycmVudGx5Cj4+PiDCoMKgwqAgdXNl
cyBmb3IgaTM4NidzIHNldHVwX2RhdGEuCj4+Pgo+Pj4gwqDCoMKgIExpbms6IGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvdG9ydmFsZHMvYy9kYzYzYTA4NmRhZWU5MmM2M2UzCj4+PiDCoMKgwqAgU2ln
bmVkLW9mZi1ieTogSmFzb24gQS4gRG9uZW5mZWxkIDxKYXNvbkB6eDJjNC5jb20+Cj4+PiDCoMKg
wqAgU2lnbmVkLW9mZi1ieTogU2ltb24gSG9ybWFuIDxob3Jtc0BrZXJuZWwub3JnPgo+Pj4KPj4+
IERvIHdlIG5lZWQgc29tZXRoaW5nIHNwZWNpYWwgaW4gYnVpbGRyb290Pwo+Pgo+PiBUaGUgcHJv
YmxlbSBzZWVtcyB0byBjb21lIGZyb20gdWNsaWJjLTEuMC40MywgaW4gaW5jbHVkZS9zeXMvcmFu
ZG9tLmggdGhhdCBjb25kaXRpb25hbGx5IGRlZmluZXMgCj4+IHRoZW06Cj4+Cj4+ICNpZiBkZWZp
bmVkIF9fVUNMSUJDX0xJTlVYX1NQRUNJRklDX18gJiYgZGVmaW5lZCBfX1VTRV9HTlUKPj4gIyBp
ZiAwIC8qZGVmIF9fQVNTVU1FX0dFVFJBTkRPTV9TWVNDQUxMICovCj4+ICPCoCBpbmNsdWRlIDxs
aW51eC9yYW5kb20uaD4KPj4gIyBlbHNlCj4+ICPCoCB1bmRlZiBHUk5EX05PTkJMT0NLCj4+ICPC
oCB1bmRlZiBHUk5EX1JBTkRPTQo+PiAvKgo+PiDCoMKgKiBGbGFncyBmb3IgZ2V0cmFuZG9tKDIp
Cj4+IMKgwqAqCj4+IMKgwqAqIEdSTkRfTk9OQkxPQ0vCoMKgwqDCoMKgwqDCoCBEb24ndCBibG9j
ayBhbmQgcmV0dXJuIEVBR0FJTiBpbnN0ZWFkCj4+IMKgwqAqIEdSTkRfUkFORE9NwqDCoMKgwqDC
oMKgwqDCoMKgIFVzZSB0aGUgL2Rldi9yYW5kb20gcG9vbCBpbnN0ZWFkIG9mIC9kZXYvdXJhbmRv
bQo+PiDCoMKgKi8KPj4gI8KgIGRlZmluZSBHUk5EX05PTkJMT0NLIDB4MDAwMQo+PiAjwqAgZGVm
aW5lIEdSTkRfUkFORE9NwqDCoCAweDAwMDIKPj4gIyBlbmRpZgo+PiAvKiBGSVhNRTogYXJlbid0
IHRoZXJlIGEgY291cGxlIG9mIF9fcmVzdHJpY3QgYW5kIGNvbnN0IG1pc3NpbmcgPyAqLwo+PiBl
eHRlcm4gaW50IGdldHJhbmRvbSh2b2lkICpfX2J1Ziwgc2l6ZV90IGNvdW50LCB1bnNpZ25lZCBp
bnQgZmxhZ3MpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19ub25udWxsICgoMSkpIF9fd3Vy
Owo+PiAjZW5kaWYKPj4KPj4gVGhpcyBmaXhlcyB0aGUgcHJvYmxlbToKPj4KPj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2Uva2V4ZWMva2V4ZWMubWsgYi9wYWNrYWdlL2tleGVjL2tleGVjLm1rCj4+IGlu
ZGV4IDU2MmIwOTAxMmI2My4uZTRlYzRlY2UxMzMyIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL2tl
eGVjL2tleGVjLm1rCj4+ICsrKyBiL3BhY2thZ2Uva2V4ZWMva2V4ZWMubWsKPj4gQEAgLTEzLDYg
KzEzLDkgQEAgS0VYRUNfQ1BFX0lEX1BST0RVQ1QgPSBrZXhlYy10b29scwo+PiDCoMKgS0VYRUNf
Q1BFX0lEX1ZFTkRPUiA9IGtleGVjLXRvb2xzX3Byb2plY3QKPj4gwqDCoEtFWEVDX1NFTElOVVhf
TU9EVUxFUyA9IGtkdW1wCj4+Cj4+ICsjIF9HTlVfU09VUkNFIGlzIG5lZWRlZCB0byBoYXZlIGRl
ZmluaXRpb24gb2YgZ2V0cmFuZG9tKCkgd2l0aCB1Y2xpYmMKPj4gK0tFWEVDX0NPTkZfRU5WICs9
IENGTEFHUz0iJChUQVJHRVRfQ0ZMQUdTKSAtRF9HTlVfU09VUkNFIgo+IAo+ICDCoEFzIHN1Y2gg
dGhpcyBwYXRjaCBsb29rcyBPSywgYnV0IGl0J3Mgc3VycHJpc2luZyB0aGF0IHRoZSBzYW1lIHBy
b2JsZW0gZG9lc24ndCBvY2N1ciB3aXRoIHRoZSAKPiBkb3plbnMgb2Ygb3RoZXIgcGFja2FnZXMg
dGhhdCB1c2UgZ2V0cmFuZG9tKCkuLi4gSSBjYW4ndCBpbWFnZSB0aGF0IGFsbCBvZiB0aGUgZGVm
aW5lIF9HTlVfU09VUkNFLi4uCgpCdXQgd2l0aG91dCBzZWFyY2hpbmcgaW4gdGhlIHBhY2thZ2Ug
c291cmNlcyB0aGVtc2VsZiB3ZSBoYXZlIGEgbG90IG9mIGRlZmluaXRpb25zIGluICoubWs6Cgok
IGZpbmQgcGFja2FnZSAtbmFtZSBcKi5tayAtZXhlYyBncmVwIC1xIERfR05VX1NPVVJDRSB7fSBc
OyAtcHJpbnQKcGFja2FnZS9hcHIvYXByLm1rCnBhY2thZ2UvY2xvb3AvY2xvb3AubWsKcGFja2Fn
ZS9kaGNwZHVtcC9kaGNwZHVtcC5tawpwYWNrYWdlL2R0L2R0Lm1rCnBhY2thZ2UvZ3N0cmVhbWVy
MS9nc3QxLXBsdWdpbnMtYmFkL2dzdDEtcGx1Z2lucy1iYWQubWsKcGFja2FnZS9pcGVyZjMvaXBl
cmYzLm1rCnBhY2thZ2UvanEvanEubWsKcGFja2FnZS9saWJ3cGUvbGlid3BlLm1rCnBhY2thZ2Uv
bWluaXNzZHBkL21pbmlzc2RwZC5tawpwYWNrYWdlL29mb25vL29mb25vLm1rCnBhY2thZ2UvczM5
MC10b29scy9zMzkwLXRvb2xzLm1rCnBhY2thZ2UvdHJhY2Vyb3V0ZS90cmFjZXJvdXRlLm1rCnBh
Y2thZ2UvdmJvb3QtdXRpbHMvdmJvb3QtdXRpbHMubWsKcGFja2FnZS94MTFyNy94ZHJpdmVyX3hm
ODYtdmlkZW8tYW1kZ3B1L3hkcml2ZXJfeGY4Ni12aWRlby1hbWRncHUubWsKcGFja2FnZS94MTFy
Ny94ZHJpdmVyX3hmODYtdmlkZW8tYXRpL3hkcml2ZXJfeGY4Ni12aWRlby1hdGkubWsKcGFja2Fn
ZS94MTFyNy94ZHJpdmVyX3hmODYtdmlkZW8taW50ZWwveGRyaXZlcl94Zjg2LXZpZGVvLWludGVs
Lm1rCnBhY2thZ2UveDExcjcveGRyaXZlcl94Zjg2LXZpZGVvLW5vdXZlYXUveGRyaXZlcl94Zjg2
LXZpZGVvLW5vdXZlYXUubWsKcGFja2FnZS9jcHVsaW1pdC9jcHVsaW1pdC5tawoKKGFuZCBhbHNv
IGluIHNvbWUgKi5wYXRjaCkKCkknbSBzdXByaXNlZCBubyBvbmUgZW5jb3VudGVycyB0aGlzIHBy
b2JsZW0gd2l0aCBrZXhlYyBhbmQgdWNsaWJjLgoKVGhhbmtzLApMYXVyZW50Cj4gCj4gIMKgUmVn
YXJkcywKPiAgwqBBcm5vdXQKPiAKPj4gKwo+PiDCoMKgIyBNYWtlZmlsZSBleHBlY3RzICRTVFJJ
UCAtbyB0byB3b3JrLCBzbyBuZWVkZWQgZm9yICFCUjJfU1RSSVBfc3RyaXAKPj4gwqDCoEtFWEVD
X01BS0VfT1BUUyA9IFNUUklQPSIkKFRBUkdFVF9DUk9TUylzdHJpcCIKPj4KPj4gVGhhbmtzLAo+
PiBMYXVyZW50Cj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
