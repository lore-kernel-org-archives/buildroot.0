Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A56C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 27 Sep 2022 11:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78CEC82F57;
	Tue, 27 Sep 2022 11:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78CEC82F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2OVEG__V3snb; Tue, 27 Sep 2022 11:17:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA7D382F40;
	Tue, 27 Sep 2022 11:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA7D382F40
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3574A1BF860
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 11:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A44582F40
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 11:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A44582F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RQrWCZFk78OV for <buildroot@lists.busybox.net>;
 Tue, 27 Sep 2022 11:17:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82C3B82F31
Received: from mail.aibs.ru (aibs.ru [176.107.241.33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82C3B82F31
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 11:17:30 +0000 (UTC)
Received: from mail.aibs.ru (localhost.localdomain [127.0.0.1])
 by mail.aibs.ru (Postfix) with ESMTPA id C7FBC340069
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 11:17:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_061757a53af42b845b3304cb54b35584"
Date: Tue, 27 Sep 2022 14:17:27 +0300
From: kk <kk@aibs.ru>
To: buildroot@buildroot.org
Message-ID: <ff6b01776879d74878e8e1733e2a8e07@aibs.ru>
X-Sender: kk@aibs.ru
User-Agent: Roundcube Webmail/1.3.6
Subject: [Buildroot] [1/1] package/sleef: add new package
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--=_061757a53af42b845b3304cb54b35584
Content-Transfer-Encoding: base64
Content-Type: text/x-diff;
 name=0001-Add-sleef-library.patch
Content-Disposition: attachment;
 filename=0001-Add-sleef-library.patch;
 size=4220

cGFja2FnZS9zbGVlZjogYWRkIG5ldyBwYWNrYWdlCgpTTEVFRiBpcyBhIGxpYnJhcnkgdGhhdCBp
bXBsZW1lbnRzIHZlY3Rvcml6ZWQgdmVyc2lvbnMKb2YgQyBzdGFuZGFyZCBtYXRoIGZ1bmN0aW9u
cy4gVGhpcyBsaWJyYXJ5IGFsc28KaW5jbHVkZXMgREZUIHN1YnJvdXRpbmVzLgoKaHR0cHM6Ly9z
bGVlZi5vcmcvCgpTaWduZWQtb2ZmLWJ5OiBLaXJpbGwgS3JhbmtlIDxra0BhaWJzLnJ1PgoKLS0t
CiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgfCAgMSArCiBwYWNrYWdlL3NsZWVmL0NvbmZpZy5p
biAgfCA1MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBwYWNrYWdl
L3NsZWVmL3NsZWVmLmhhc2ggfCAgMyArKysKIHBhY2thZ2Uvc2xlZWYvc2xlZWYubWsgICB8IDQ5
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2Vk
LCAxMDMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc2xlZWYvQ29u
ZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zbGVlZi9zbGVlZi5oYXNoCiBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zbGVlZi9zbGVlZi5tawoKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5kZXggYjkxMWM1OWE5Mi4uYWY5YjBi
NzM5OCAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9Db25maWcu
aW4KQEAgLTIwNDEsNiArMjA0MSw3IEBAIGVuZGlmCiAJc291cmNlICJwYWNrYWdlL3JpZW1hbm4t
Yy1jbGllbnQvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9zaGFwZWxpYi9Db25maWcuaW4i
CiAJc291cmNlICJwYWNrYWdlL3NrYWxpYnMvQ29uZmlnLmluIgorCXNvdXJjZSAicGFja2FnZS9z
bGVlZi9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3NwaGlueGJhc2UvQ29uZmlnLmluIgog
CXNvdXJjZSAicGFja2FnZS9zdGFydHVwLW5vdGlmaWNhdGlvbi9Db25maWcuaW4iCiAJc291cmNl
ICJwYWNrYWdlL3RpbnljYm9yL0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc2xlZWYv
Q29uZmlnLmluIGIvcGFja2FnZS9zbGVlZi9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uODVmOTNkMzg0ZQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uv
c2xlZWYvQ29uZmlnLmluCkBAIC0wLDAgKzEsNTAgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9TTEVF
Rl9BUkNIX1NVUFBPUlRTCisJYm9vbAorCWRlZmF1bHQgeSBpZiBCUjJfYXJtCisJZGVmYXVsdCB5
IGlmIEJSMl9hYXJjaDY0CisJZGVmYXVsdCB5IGlmIEJSMl9pMzg2CisJZGVmYXVsdCB5IGlmIEJS
Ml94ODZfNjQKKwlkZWZhdWx0IHkgaWYgQlIyX3Bvd2VycGM2NAorCitjb25maWcgQlIyX1BBQ0tB
R0VfU0xFRUYKKwlib29sICJzbGVlZiIKKwloZWxwCisgICAgICAgICAgU0xFRUYgaXMgYSBsaWJy
YXJ5IHRoYXQgaW1wbGVtZW50cyB2ZWN0b3JpemVkIHZlcnNpb25zCisgICAgICAgICAgb2YgQyBz
dGFuZGFyZCBtYXRoIGZ1bmN0aW9ucy4gVGhpcyBsaWJyYXJ5IGFsc28KKyAgICAgICAgICBpbmNs
dWRlcyBERlQgc3Vicm91dGluZXMuCisKKyAgICAgICAgICBodHRwczovL3NsZWVmLm9yZy8KKwor
aWYgQlIyX1BBQ0tBR0VfU0xFRUYKKworY29uZmlnIEJSMl9QQUNLQUdFX1NMRUVGX0RGVAorICAg
ICAgICBib29sICJjb21waWxlIGRmdCIKKyAgICAgICAgZGVmYXVsdCBuCisgICAgICAgIGhlbHAK
KyAgICAgICAgICBsaWJzbGVlZmRmdCB3aWxsIGJlIGJ1aWx0CisKK2NvbmZpZyBCUjJfUEFDS0FH
RV9TTEVFRl9RVUFECisgICAgICAgIGJvb2wgImNvbXBpbGUgcXVhZCIKKyAgICAgICAgZGVmYXVs
dCBuCisgICAgICAgIGhlbHAKKyAgICAgICAgICBsaWJzbGVlZnF1YWQgd2lsbCBiZSBidWlsdAor
Citjb25maWcgQlIyX1BBQ0tBR0VfU0xFRUZfR05VQUJJX0xJQlMKKyAgICAgICAgYm9vbCAiY29t
cGlsZSBnbnVhYmkiCisgICAgICAgIGRlZmF1bHQgeQorICAgICAgICBoZWxwCisgICAgICAgICAg
bGlic2xlZWZnbnVhYmkgd2lsbCBiZSBidWlsdAorCitjb25maWcgQlIyX1BBQ0tBR0VfU0xFRUZf
U0NBTEFSX0xJQgorICAgICAgICBib29sICJjb21waWxlIHNjYWxhciIKKyAgICAgICAgZGVmYXVs
dCBuCisgICAgICAgIGhlbHAKKyAgICAgICAgICBsaWJzbGVlZnNjYWxhciB3aWxsIGJlIGJ1aWx0
CisKK2NvbmZpZyBCUjJfUEFDS0FHRV9TTEVFRl9URVNUUworICAgICAgICBib29sICJjb21waWxl
IHRlc3RzIgorICAgICAgICBkZWZhdWx0IG4KKyAgICAgICAgaGVscAorICAgICAgICAgIFRlc3Rz
IHdpbGwgYmUgYnVpbHQKKworZW5kaWYKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc2xlZWYvc2xlZWYu
aGFzaCBiL3BhY2thZ2Uvc2xlZWYvc2xlZWYuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwLi41MTU3MGE1MTc2Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9zbGVl
Zi9zbGVlZi5oYXNoCkBAIC0wLDAgKzEsMyBAQAorIyBMb2NhbGx5IGNhbGN1bGF0ZWQKK3NoYTI1
NiAgYzliZmY3NTczODkyMjE5M2U2N2ZhNzI2ZmEyMjU1MzU4NzBkMmFhMTA1OWY5MTQ1MmM0MTE3
MzYyODRhZDU2NiAgTElDRU5TRS50eHQKK3NoYTI1NiAgNDE1ZWU5YjFiY2M1ODE2OTg5ZDNkNGQ5
MmFmZDBjZDNmOWVlODljYmQ1YTMzZWIwMDhlNjk3NTFlNDA0MzhhYiAgc2xlZWYtMy41LjEudGFy
Lmd6CmRpZmYgLS1naXQgYS9wYWNrYWdlL3NsZWVmL3NsZWVmLm1rIGIvcGFja2FnZS9zbGVlZi9z
bGVlZi5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi40NmJlZjY5ZjVm
Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9zbGVlZi9zbGVlZi5tawpAQCAtMCwwICsxLDQ5
IEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyBzbGVlZgorIworIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKKworU0xFRUZfVkVSU0lPTiA9IDMuNS4xCitTTEVFRl9TSVRFID0gJChjYWxs
IGdpdGh1YixzaGliYXRjaCxzbGVlZiwkKFNMRUVGX1ZFUlNJT04pKQorU0xFRUZfTElDRU5TRSA9
IEJTTC0xLjAKK1NMRUVGX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLnR4dAorU0xFRUZfU1VQUE9S
VFNfSU5fU09VUkNFX0JVSUxEID0gTk8KK1NMRUVGX0lOU1RBTExfU1RBR0lORyA9IFlFUworCisj
IE4uQi4gTmVlZCB0byB1c2UgaG9zdCBzbGVlZiBkdXJpbmcgY3Jvc3MgY29tcGlsYXRpb24uCitT
TEVFRl9ERVBFTkRFTkNJRVMgPSBob3N0LXNsZWVmCitTTEVFRl9DT05GX09QVFMgKz0gLUROQVRJ
VkVfQlVJTERfRElSPSQoQlVJTERfRElSKS9ob3N0LXNsZWVmLSQoU0xFRUZfVkVSU0lPTikvYnVp
bGRyb290LWJ1aWxkCisKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfU0xFRUZfREZUKSx5KQorU0xFRUZf
Q09ORl9PUFRTICs9IC1EQlVJTERfREZUPU9OCitlbHNlCitTTEVFRl9DT05GX09QVFMgKz0gLURC
VUlMRF9ERlQ9T0ZGCitlbmRpZgorCitpZmVxICgkKEJSMl9QQUNLQUdFX1NMRUVGX1FVQUQpLHkp
CitTTEVFRl9DT05GX09QVFMgKz0gLURCVUlMRF9RVUFEPU9OCitlbHNlCitTTEVFRl9DT05GX09Q
VFMgKz0gLURCVUlMRF9RVUFEPU9GRgorZW5kaWYKKworaWZlcSAoJChCUjJfUEFDS0FHRV9TTEVF
Rl9HTlVBQklfTElCUykseSkKK1NMRUVGX0NPTkZfT1BUUyArPSAtREJVSUxEX0dOVUFCSV9MSUJT
PU9OCitlbHNlCitTTEVFRl9DT05GX09QVFMgKz0gLURCVUlMRF9HTlVBQklfTElCUz1PRkYKK2Vu
ZGlmCisKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfU0xFRUZfU0NBTEFSX0xJQikseSkKK1NMRUVGX0NP
TkZfT1BUUyArPSAtREJVSUxEX1NDQUxBUl9MSUI9T04KK2Vsc2UKK1NMRUVGX0NPTkZfT1BUUyAr
PSAtREJVSUxEX1NDQUxBUl9MSUI9T0ZGCitlbmRpZgorCitpZmVxICgkKEJSMl9QQUNLQUdFX1NM
RUVGX1RFU1RTKSx5KQorU0xFRUZfQ09ORl9PUFRTICs9IC1EQlVJTERfVEVTVFM9T04KK2Vsc2UK
K1NMRUVGX0NPTkZfT1BUUyArPSAtREJVSUxEX1RFU1RTPU9GRgorZW5kaWYKKworJChldmFsICQo
Y21ha2UtcGFja2FnZSkpCiskKGV2YWwgJChob3N0LWNtYWtlLXBhY2thZ2UpKQotLSAKMi4yMC4x
Cgo=
--=_061757a53af42b845b3304cb54b35584
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--=_061757a53af42b845b3304cb54b35584--
