Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AE5CDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 20:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2A15612D3;
	Tue, 17 Oct 2023 20:21:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2A15612D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UmP08xJ0jw85; Tue, 17 Oct 2023 20:21:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31E6B6102E;
	Tue, 17 Oct 2023 20:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31E6B6102E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EFF41BF297
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 20:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06C8640128
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 20:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06C8640128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f7lGaW-rkSOp for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 20:21:01 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04B46400D1
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 20:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04B46400D1
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE255A4C0F4B;
 Tue, 17 Oct 2023 22:20:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42248)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qsqYj-00055N-1d;
 Tue, 17 Oct 2023 22:20:57 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 22:20:57 +0200
Message-Id: <20231017202057.3286813-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697574057;
 bh=YhGajGV8wGKgqtxRTAZVxEmnhs+BgKDD1YCn8dL3hoA=;
 h=From:To:Cc:Subject:Date:From;
 b=LrF7UsJC+oWneX516AcrfLtHqRRnntV/ZBH1brft07CyBrZzrTNs0RoXTXiIQLCiK
 RrufyX1/zr693rHk2lx2wTfHz4PfnXzTZAQJzRZMM42h1klHIVwBZGSd4NjqqrtK39
 Wqms+aSNqeYpgIIgDg1lC/YLpOYU9MrckV5CHvYPuB3v/L786ECcCz22KHVEPWPNSN
 Uy/boiT6arQcsAZexwCtutn8pufLHFkcMGihOGx54/7V3PFi2MoFEgOWWkG+K1ixUb
 Ejvc9ShvQto7lvDdC6n/JEiTo6mH+woo+P3BpqYWB0ToiUqamSxJc+kRs2wrdyd7/y
 2L6RhDnN8v0aQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=LrF7UsJC
Subject: [Buildroot] [PATCH 1/1] package/vlc: bump version to 3.0.19
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmViYXNlZCBwYXRjaCAwMDA2IGR1ZSB0byB1cHN0cmVhbSBjb21taXQKaHR0cHM6Ly9jb2RlLnZp
ZGVvbGFuLm9yZy92aWRlb2xhbi92bGMvLS9jb21taXQvM2Y5ZmM0NDE3NmNjNTUwNTEzMjk3Nzg4
NTc5OWZhOTg4YzVlNzcwMQoKUmVsZWFzZSBub3RlczogaHR0cHM6Ly9jb2RlLnZpZGVvbGFuLm9y
Zy92aWRlb2xhbi92bGMvLS9ibG9iLzMuMC4xOS9ORVdTCgpTaWduZWQtb2ZmLWJ5OiBCZXJuZCBL
dWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIC4uLi1yZW1vdmUtYW5jaWVudC1ydW4tdGltZS1m
YWxsYmFjay10by1yZWFsLXRpbWUtLnBhdGNoIHwgOSArKysrKy0tLS0KIHBhY2thZ2UvdmxjL3Zs
Yy5oYXNoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgOCArKysrLS0tLQog
cGFja2FnZS92bGMvdmxjLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS92bGMvMDAwNi1wb3NpeC1yZW1vdmUtYW5jaWVudC1ydW4t
dGltZS1mYWxsYmFjay10by1yZWFsLXRpbWUtLnBhdGNoIGIvcGFja2FnZS92bGMvMDAwNi1wb3Np
eC1yZW1vdmUtYW5jaWVudC1ydW4tdGltZS1mYWxsYmFjay10by1yZWFsLXRpbWUtLnBhdGNoCmlu
ZGV4IDRmYzYzOWUyMjIuLjUyMTFlZjg4MmIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvdmxjLzAwMDYt
cG9zaXgtcmVtb3ZlLWFuY2llbnQtcnVuLXRpbWUtZmFsbGJhY2stdG8tcmVhbC10aW1lLS5wYXRj
aAorKysgYi9wYWNrYWdlL3ZsYy8wMDA2LXBvc2l4LXJlbW92ZS1hbmNpZW50LXJ1bi10aW1lLWZh
bGxiYWNrLXRvLXJlYWwtdGltZS0ucGF0Y2gKQEAgLTIzLDYgKzIzLDcgQEAgcG9zaXgvdGhyZWFk
LmM6IEluIGZ1bmN0aW9uIOKAmHZsY19jbG9ja19zZXR1cF9vbmNl4oCZOgogcG9zaXgvdGhyZWFk
LmM6ODg6MTg6IGVycm9yOiBsdmFsdWUgcmVxdWlyZWQgYXMgbGVmdCBvcGVyYW5kIG9mIGFzc2ln
bm1lbnQKICAgICAgdmxjX2Nsb2NrX2lkID0gKHZhbCA8IDApID8gQ0xPQ0tfUkVBTFRJTUUgOiBD
TE9DS19NT05PVE9OSUM7CiAKK1tCZXJuZDogcmViYXNlZCBmb3IgMy4wLjE5XQogU2lnbmVkLW9m
Zi1ieTogQmVybmQgS3VobHMgPGJlcm5kLmt1aGxzQHQtb25saW5lLmRlPgogLS0tCiAgc3JjL3Bv
c2l4L3RocmVhZC5jIHwgOTYgKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCkBAIC05Myw3ICs5NCw3IEBAIGluZGV4IGRhYjhiNzFmOTcuLjg4Nzg5
NDE5MTMgMTAwNjQ0CiAtIyB3YXJuaW5nIE1vbm90b25pYyBjbG9jayBub3QgYXZhaWxhYmxlLiBF
eHBlY3QgdGltaW5nIGlzc3Vlcy4KIC0jZW5kaWYgLyogX1BPU0lYX1RJTUVSUyAqLwogLQotIHN0
YXRpYyBzdHJ1Y3QgdGltZXNwZWMgbXRpbWVfdG9fdHMgKG10aW1lX3QgZGF0ZSkKKyBzdGF0aWMg
c3RydWN0IHRpbWVzcGVjIG10aW1lX3RvX3RzICh2bGNfdGlja190IGRhdGUpCiAgewogICAgICBs
bGRpdl90IGQgPSBsbGRpdiAoZGF0ZSwgQ0xPQ0tfRlJFUSk7CiBAQCAtMjMzLDE0ICsxODcsMTEg
QEAgdm9pZCB2bGNfY29uZF9pbml0ICh2bGNfY29uZF90ICpwX2NvbmR2YXIpCkBAIC0xMTcsNyAr
MTE4LDcgQEAgaW5kZXggZGFiOGI3MWY5Ny4uODg3ODk0MTkxMyAxMDA2NDQKICAKIEBAIC02MjUs
NDQgKzU3NiwyNyBAQCB2b2lkIHZsY19jb250cm9sX2NhbmNlbCAoaW50IGNtZCwgLi4uKQogIAot
IG10aW1lX3QgbWRhdGUgKHZvaWQpCisgdmxjX3RpY2tfdCBtZGF0ZSAodm9pZCkKICB7CiAtI2lm
IChfUE9TSVhfVElNRVJTID4gMCkKICAgICAgc3RydWN0IHRpbWVzcGVjIHRzOwpAQCAtMTQwLDcg
KzE0MSw3IEBAIGluZGV4IGRhYjhiNzFmOTcuLjg4Nzg5NDE5MTMgMTAwNjQ0CiAgfQogIAogICN1
bmRlZiBtd2FpdAotIHZvaWQgbXdhaXQgKG10aW1lX3QgZGVhZGxpbmUpCisgdm9pZCBtd2FpdCAo
dmxjX3RpY2tfdCBkZWFkbGluZSkKICB7CiAtI2lmIChfUE9TSVhfQ0xPQ0tfU0VMRUNUSU9OID4g
MCkKIC0gICAgdmxjX2Nsb2NrX3NldHVwICgpOwpAQCAtMTY1LDcgKzE2Niw3IEBAIGluZGV4IGRh
YjhiNzFmOTcuLjg4Nzg5NDE5MTMgMTAwNjQ0CiAgfQogIAogICN1bmRlZiBtc2xlZXAKLUBAIC02
NzAsMTUgKzYwNCw3IEBAIHZvaWQgbXNsZWVwIChtdGltZV90IGRlbGF5KQorQEAgLTY3MCwxNSAr
NjA0LDcgQEAgdm9pZCBtc2xlZXAgKHZsY190aWNrX3QgZGVsYXkpCiAgewogICAgICBzdHJ1Y3Qg
dGltZXNwZWMgdHMgPSBtdGltZV90b190cyAoZGVsYXkpOwogIApkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS92bGMvdmxjLmhhc2ggYi9wYWNrYWdlL3ZsYy92bGMuaGFzaAppbmRleCA0Yjk5NDBkZjMzLi5l
ZjM4MWU1OTM0IDEwMDY0NAotLS0gYS9wYWNrYWdlL3ZsYy92bGMuaGFzaAorKysgYi9wYWNrYWdl
L3ZsYy92bGMuaGFzaApAQCAtMSw3ICsxLDcgQEAKLSMgRnJvbSBodHRwczovL2dldC52aWRlb2xh
bi5vcmcvdmxjLzMuMC4xOC92bGMtMy4wLjE4LnRhci54ei5zaGEyNTYKLXNoYTI1NiAgNTcwOTQ0
MzljMzY1ZDhhYThiOWI0MWZhMzA4MGNjMGVlZjJiZWZlNjAyNWJiNWNlZjcyMmFjY2M2MjVhZWRl
YyAgdmxjLTMuMC4xOC50YXIueHoKLSMgRnJvbSBodHRwczovL2dldC52aWRlb2xhbi5vcmcvdmxj
LzMuMC4xOC92bGMtMy4wLjE4LnRhci54ei5zaGExCi1zaGExICBiMTFjY2FhMGY1ZWUxNWE1NTA1
NjQ4MTdkNjA0NThlYjA5NDZmODBlICB2bGMtMy4wLjE4LnRhci54egorIyBGcm9tIGh0dHBzOi8v
Z2V0LnZpZGVvbGFuLm9yZy92bGMvMy4wLjE5L3ZsYy0zLjAuMTkudGFyLnh6LnNoYTI1Ngorc2hh
MjU2ICA2NDNlMzI5NGJhZmU5MjIzMjQ2NjNjYTQ5OTUxNWI3NTY0ZjI3OTQ1NzVmZDdkMmI3OTky
ZDIwODk2MzgxNzQ1ICB2bGMtMy4wLjE5LnRhci54egorIyBGcm9tIGh0dHBzOi8vZ2V0LnZpZGVv
bGFuLm9yZy92bGMvMy4wLjE5L3ZsYy0zLjAuMTkudGFyLnh6LnNoYTEKK3NoYTEgIDZkMTYyMjQ4
YTI2ZmRkNzZhOWQ0ZTdlM2Q1MmY0MGQ0MzI2ZjcyYzEgIHZsYy0zLjAuMTkudGFyLnh6CiAjIExv
Y2FsbHkgY29tcHV0ZWQKIHNoYTI1NiAgODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZj
Njc1YWZiNTE0ZDRlNjhhNDA0MDEwNTIxYjg4MDY0MyAgQ09QWUlORwogc2hhMjU2ICBkYzYyNjUy
MGRjZDUzYTIyZjcyN2FmM2VlNDJjNzcwZTU2Yzk3YTY0ZmUzYWRiMDYzNzk5ZDhhYjAzMmZlNTUx
ICBDT1BZSU5HLkxJQgpkaWZmIC0tZ2l0IGEvcGFja2FnZS92bGMvdmxjLm1rIGIvcGFja2FnZS92
bGMvdmxjLm1rCmluZGV4IGM2YWU0NmY0NjkuLjcyOWU5MjhiNGQgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvdmxjL3ZsYy5taworKysgYi9wYWNrYWdlL3ZsYy92bGMubWsKQEAgLTQsNyArNCw3IEBACiAj
CiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1WTENfVkVSU0lPTiA9IDMuMC4xOAorVkxDX1ZF
UlNJT04gPSAzLjAuMTkKIFZMQ19TSVRFID0gaHR0cHM6Ly9nZXQudmlkZW9sYW4ub3JnL3ZsYy8k
KFZMQ19WRVJTSU9OKQogVkxDX1NPVVJDRSA9IHZsYy0kKFZMQ19WRVJTSU9OKS50YXIueHoKIFZM
Q19MSUNFTlNFID0gR1BMLTIuMCssIExHUEwtMi4xKwotLSAKMi4zOS4yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
