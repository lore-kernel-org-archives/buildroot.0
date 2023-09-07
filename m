Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FF4EE14D3
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 08:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E201B8218E;
	Thu,  7 Sep 2023 08:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E201B8218E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ylb--VYWsXbf; Thu,  7 Sep 2023 08:56:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DC9C82176;
	Thu,  7 Sep 2023 08:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DC9C82176
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB0CA1BF2E3
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 08:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9485E82176
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 08:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9485E82176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lCcuUBr-NStD for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 08:56:50 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61DF081D16
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 08:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61DF081D16
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N4hj5-1pfuU611nD-011iTk; Thu, 07 Sep 2023 10:51:33 +0200
Message-ID: <af489c0d-75cd-b7c0-53ba-cb4a187ec62c@vivier.eu>
Date: Thu, 7 Sep 2023 10:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: fr
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org
References: <20230906194609.74080-1-arbab@linux.ibm.com>
 <20230906194609.74080-3-arbab@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230906194609.74080-3-arbab@linux.ibm.com>
X-Provags-ID: V03:K1:pFMTQS1gvD+BcKodT27tWeTa0GsEoUTcqlo75k/XSqWqgrXIi/Z
 xfHuZB5ijPQNylAr+Mc+mq6E6ep8ghFSpcMvBkqqLzCz28Tgbr7ZhxyVqs7IkKxADD63uTN
 KiGZRY5IQXH1x05V4MawETsaWO3TLbygqE2LsrWH5sVTgZH+HPlhm/hFCdWa/2jQtT8zSNk
 rqQcUmy3DILAv/0vHRXlw==
UI-OutboundReport: notjunk:1;M01:P0:KcVxNNosB14=;NCnRPzm52pNZ14GC+g9q6h5aqc+
 GzEVzxSqUSryTau4uuiCsD2TeUJP6ygIhrUuwQT9QrE9QQJgav10KDHxgtYn6KPEpGdGbNEqe
 AQ0x6cus6xvij+cItvs4fxtRxEV4JU+1b6Vi3VKcXWSCLEnXVJMw7VpIJcys0ZeBabGzRDvuj
 dvq6JcGA4+w4V6OLPoRazznslwI07r+MDQP7jjP2ExT0Pyd9XFR5aWyDdY8b0QUQsXcRLrZFX
 gs3lrtTO/TrzjsVPvgqWlaDCpVBM4alInSXNkrbk9xRm8TP7OfyxVgzEOkH+zNVATuR6tFP9Z
 XZDV7YbdKZAnYK9GKkxHPMjIYtTfmUP+dfQuZDKxufjy9L2HKEaGpmfgm9NDI8cHgYLs8O39q
 r96wYRrctya9oZnnwX34YIVyusAsZ8DaOfF+kSnCEgargtBielroJxBkt1u+5bNoUSsGAnwRM
 uzUZjIp/L6rhHJpxgK+TaqaFUCFssTSX0ZoWbhOX/gcPm1HANdung+AdgbDDfRpKrQohpmr5V
 mHk9pmsiFjS4XwFYMQp1UZk8R/Nek1BeAlYJTUQyYu0BcYSBb1QDJUnxckRQiURsPLlEPBpSE
 4mFN3jO0fcYBr4YTIQuV06xlhH/5PJ1u45SuWO/ndyf04s0Ec9+8llD5lNSOmwoxzNBqP8x/V
 qUd3bljSdJ36nlAZxUrH7k0FXJQvhN1sUiO1P2IzhMDEpqb+dmIOKtvK94W/QP+Zx+Ak8VtAj
 YF/OMby8yTTuLU6wVfBmVcPI0Ri5mtwOb65XcoRR778AjwCESX1CGOhC2VNS4WZMVIumcuqLW
 WNyBZ29VRn98c4ld3Nw4GQUehBxCiqLfuojryUA/kDtvL6CAfoY7n4wpUIRmxOzIOzofzSzwf
 NKNjlto0Xs1nLUg==
Subject: Re: [Buildroot] [PATCH 2/5] package/petitboot: run pb-console at
 boot
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
Cc: Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDYvMDkvMjAyMyDDoCAyMTo0NiwgUmV6YSBBcmJhYiBhIMOpY3JpdMKgOgo+IEluc3RhbGwg
YSB1ZGV2IHJ1bGUgdG8gcnVuIHRoZSBwZXRpdGJvb3QgVUkgb24gY29tbW9ubHkta25vd24gY29u
c29sZXMuCj4gVG8gcHJldmVudCB0aGUga2VybmVsJ3MgY29uc29sZSBvdXRwdXQgZnJvbSB0cmFt
cGxpbmcgdGhlIFVJLCBhbHNvIGFkZAo+IGEgc3lzY3RsIGZpbGUgdG8gcmVkdWNlIHRoZSBrZXJu
ZWwgbG9nIGxldmVscyB0byBLRVJOX0FMRVJULgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJlemEgQXJi
YWIgPGFyYmFiQGxpbnV4LmlibS5jb20+Cj4gLS0tCj4gICBwYWNrYWdlL3BldGl0Ym9vdC9wZXRp
dGJvb3QtY29uc29sZS11aS5ydWxlcyB8IDQgKysrKwo+ICAgcGFja2FnZS9wZXRpdGJvb3QvcGV0
aXRib290Lm1rICAgICAgICAgICAgICAgfCA0ICsrKysKPiAgIHBhY2thZ2UvcGV0aXRib290L3N5
c2N0bC5jb25mICAgICAgICAgICAgICAgIHwgMSArCj4gICAzIGZpbGVzIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcGV0aXRib290L3BldGl0
Ym9vdC1jb25zb2xlLXVpLnJ1bGVzCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9wZXRp
dGJvb3Qvc3lzY3RsLmNvbmYKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wZXRpdGJvb3QvcGV0
aXRib290LWNvbnNvbGUtdWkucnVsZXMgYi9wYWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QtY29u
c29sZS11aS5ydWxlcwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAw
Li5kZTNiNGIxYzAzNWYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9wZXRpdGJvb3Qv
cGV0aXRib290LWNvbnNvbGUtdWkucnVsZXMKPiBAQCAtMCwwICsxLDQgQEAKPiArIyBzcGF3biBh
IHBldGl0Ym9vdCBVSSBvbiBjb21tb24gdXNlci12aXNpYmxlIGludGVyZmFjZSBkZXZpY2VzCj4g
K1NVQlNZU1RFTT09InR0eSIsIEtFUk5FTD09Imh2YyoiLCBSVU4rPSIvdXNyL2xpYmV4ZWMvcGV0
aXRib290L3BiLWNvbnNvbGUgLS1nZXR0eSAtLWRldGFjaCAtLSAtbiAtaSAwICRuYW1lIGxpbnV4
Igo+ICtTVUJTWVNURU09PSJ0dHkiLCBLRVJORUw9PSJ0dHkwIiwgUlVOKz0iL3Vzci9saWJleGVj
L3BldGl0Ym9vdC9wYi1jb25zb2xlIC0tZ2V0dHkgLS1kZXRhY2ggLS0gLW4gLWkgMCAkbmFtZSBs
aW51eCIKPiArU1VCU1lTVEVNPT0idHR5IiwgS0VSTkVMPT0idHR5UyoiLCBSVU4rPSIvdXNyL2xp
YmV4ZWMvcGV0aXRib290L3BiLWNvbnNvbGUgLS1nZXR0eSAtLWRldGFjaCAtLSAtbiAtaSAwICRu
YW1lIGxpbnV4Igo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QubWsg
Yi9wYWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QubWsKCkNvdWxkIHlvdSBhZGQ6CgpTVUJTWVNU
RU09PSJ0dHkiLCBLRVJORUw9PSJ0dHlHRioiLCBSVU4rPSIvdXNyL2xpYmV4ZWMvcGV0aXRib290
L3BiLWNvbnNvbGUgLS1nZXR0eT0vc2Jpbi9nZXR0eSAKLS1kZXRhY2ggLS0gLW4gLWkgJG5hbWUg
MCBsaW51eCIKCkl0J3MgbmVlZGVkIGZvciBteSB3b3JrIG9uIHZpcnQtbTY4ayBwZXRpdGJvb3Qu
Cgo+IGluZGV4IDhkMjIwZjg4ZjQ1YS4uNTU2ZDQxMjMwMjM3IDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvcGV0aXRib290L3BldGl0Ym9vdC5tawo+ICsrKyBiL3BhY2thZ2UvcGV0aXRib290L3BldGl0
Ym9vdC5tawo+IEBAIC01NSw2ICs1NSwxMCBAQCBkZWZpbmUgUEVUSVRCT09UX1BPU1RfSU5TVEFM
TAo+ICAgCQkkKFRBUkdFVF9ESVIpL2V0Yy9wZXRpdGJvb3QvYm9vdC5kLzkwLXNvcnQtZHRiCj4g
ICAJJChJTlNUQUxMKSAtbSAwNzU1IC1EICQoUEVUSVRCT09UX1BLR0RJUikvUzE1cGItZGlzY292
ZXIgXAo+ICAgCQkkKFRBUkdFVF9ESVIpL2V0Yy9pbml0LmQvUzE1cGItZGlzY292ZXIKPiArCSQo
SU5TVEFMTCkgLUQgLW0gMDc1NSAkKFBFVElUQk9PVF9QS0dESVIpL3BldGl0Ym9vdC1jb25zb2xl
LXVpLnJ1bGVzIFwKPiArCQkkKFRBUkdFVF9ESVIpL2V0Yy91ZGV2L3J1bGVzLmQvcGV0aXRib290
LWNvbnNvbGUtdWkucnVsZXMKPiArCSQoSU5TVEFMTCkgLUQgLW0gMDc1NSAkKFBFVElUQk9PVF9Q
S0dESVIpL3N5c2N0bC5jb25mIFwKPiArCQkkKFRBUkdFVF9ESVIpL2V0Yy9zeXNjdGwuZC9wZXRp
dGJvb3QuY29uZgo+ICAgCW1rZGlyIC1wICQoVEFSR0VUX0RJUikvdXNyL3NoYXJlL3VkaGNwYy9k
ZWZhdWx0LnNjcmlwdC5kLwo+ICAgCWxuIC1zZiAvdXNyL3NiaW4vcGItdWRoY3BjIFwKPiAgIAkJ
JChUQVJHRVRfRElSKS91c3Ivc2hhcmUvdWRoY3BjL2RlZmF1bHQuc2NyaXB0LmQvCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcGV0aXRib290L3N5c2N0bC5jb25mIGIvcGFja2FnZS9wZXRpdGJvb3Qv
c3lzY3RsLmNvbmYKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4u
MDJhYjhlMzI3NWI1Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcGV0aXRib290L3N5
c2N0bC5jb25mCj4gQEAgLTAsMCArMSBAQAo+ICtrZXJuZWwucHJpbnRrID0gMSAxIDEgMQoKSSB0
aGluayB5b3UgYWxzbyBuZWVkOgoKZGlmZiAtLWdpdCBhL3N5c3RlbS9Db25maWcuaW4gYi9zeXN0
ZW0vQ29uZmlnLmluCmluZGV4IDFjYTc2OTBlYTNiYS4uNzg2ZWM5YTFjNmIzIDEwMDY0NAotLS0g
YS9zeXN0ZW0vQ29uZmlnLmluCisrKyBiL3N5c3RlbS9Db25maWcuaW4KQEAgLTM3NSw3ICszNzUs
NyBAQCBjb25maWcgQlIyX1NZU1RFTV9CSU5fU0gKCiAgbWVudWNvbmZpZyBCUjJfVEFSR0VUX0dF
TkVSSUNfR0VUVFkKICAgICAgICAgYm9vbCAiUnVuIGEgZ2V0dHkgKGxvZ2luIHByb21wdCkgYWZ0
ZXIgYm9vdCIKLSAgICAgICBkZWZhdWx0IHkKKyAgICAgICBkZWZhdWx0IHkgICAgICAgICBpZiAh
QlIyX1BBQ0tBR0VfUEVUSVRCT09UCgogIGlmIEJSMl9UQVJHRVRfR0VORVJJQ19HRVRUWQogIGNv
bmZpZyBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVAoKT3RoZXJ3aXNlIHRoZSBwZXRpdGJv
b3QgcHJvbXB0IHdpbGwgYmUgbWl4ZWQgd2l0aCBnZXR0eSBwcm9tcHQuCgpUaGFua3MsCkxhdXJl
bnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
