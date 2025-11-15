Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59ACCEB2E4
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 16:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 821EA40FCA;
	Sat, 15 Nov 2025 16:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IvozeyqevwnN; Sat, 15 Nov 2025 16:48:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01B3F40FB7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01B3F40FB7;
	Sat, 15 Nov 2025 16:48:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B80E158
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 16:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A8A9403DF
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 16:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtldmeiaA7X8 for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 16:48:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3F63400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3F63400C4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3F63400C4
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 16:48:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4EAC2A4C6C77;
 Sat, 15 Nov 2025 17:48:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34800)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKJRt-000000002XJ-417l;
 Sat, 15 Nov 2025 16:48:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Devin Steffler <devin.buildroot@gmail.com>
Date: Sat, 15 Nov 2025 17:48:25 +0100
Message-ID: <20251115164828.1519438-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251115164828.1519438-1-bernd@kuhls.net>
References: <20251115164828.1519438-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763225310;
 bh=JnFMRVR/HTWM7i1VIiaBFlAd8vMcDmRRKZvSvCaKgZw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=zD6MvkMvMbnnF+EoGbLbgu2xqsWcBcoNDdRcm0V7AuQMdVMIrtns4WkLXq2cvGsAo
 Z3P9fxscVdqMsNSiswS+qE2/pKxcyqcTOwNrJxzK1fcP0ZtJ+7QIoUXBblDl+KsMQ/
 76o0kUYdbA3Epl33mYy6/6wBw+u4T5elpzoiPKvAf2L9XHWmPd4BYz7jygG2AyN8BH
 lHXZdQISm+bKcn2zJaUIroM9HUnSLL2vVPbvDznsj2pFOiTm2xTOYEfFTZJQROmaln
 G1YT6K7u0X/hSiwJpCOBRpptBtg3tYB3zbQWY1arf0p4YacmVJmu5qjcwKvBdAnpFE
 Ze1xbbIcpbSbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=zD6MvkMv
Subject: [Buildroot] [PATCH 2/4] package/lttng-modules: bump to version
 2.14.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogRGV2aW4gU3RlZmZsZXIgPGRldmluLmJ1aWxkcm9vdEBnbWFpbC5jb20+CgpUaGUgY3Vy
cmVudCBsdHRuZy1tb2R1bGVzIHRoYXQgYnVpbGRyb290IHVzZXMgaXMgMi4xMy4xMC4KVGhhdCB2
ZXJzaW9uIG9mIGx0dG5nLW1vZHVsZXMgZG9lcyBub3QgY29tcGlsZSB3aXRoIGFueSByZWNlbnQg
dmVyc2lvbiBvZiBidWlsZHJvb3QsIGluY2x1ZGluZyB0aGUgZm9sbG93aW5nOgotIGxhdGVzdCBz
dGFibGUgcmVsZWFzZTogMjAyNC4xMS4yCi0gbGF0ZXN0IGxvbmcgdGVybSByZWxlYXNlOiAyMDI0
LjAyLjExCi0gbWFzdGVyIGJyYW5jaCBvbiBnaXRodWIKClRoZXJlIGFyZSBtYW55IGNvbXBpbGVy
IGVycm9ycywgdGhlIGZpcnN0IGNvbXBpbGVyIGVycm9yIGZyb20gdGhlIG1hc3RlciBicmFuY2gg
aXMgYXMgZm9sbG93czoKCi9ob21lL2RldmluL2J1aWxkcm9vdF90ZXN0L2J1aWxkcm9vdC9vdXRw
dXQvYnVpbGQvbHR0bmctbW9kdWxlcy0yLjEzLjEwLy4vc3JjLy4uL2luY2x1ZGUvd3JhcHBlci91
cHJvYmVzLmg6Mjg6MTY6IGVycm9yOiB0b28gZmV3IGFyZ3VtZW50cyB0byBmdW5jdGlvbiDigJh1
cHJvYmVfcmVnaXN0ZXLigJkKICAgMjggfCAgICAgICAgIHJldHVybiB1cHJvYmVfcmVnaXN0ZXIo
aW5vZGUsIG9mZnNldCwgdWMpOwogICAgICB8ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fgoKV2hlbiBpbnZlc3RpZ2F0aW5nIGEgcG90ZW50aWFsIGZpeCB0byBtYWtlIGx0dG5nLW1vZHVs
ZXMgYnVpbGQgYWdhaW4sIGl0IHdhcyBkaXNjb3ZlcmVkIHRoYXQKdGhlIGNvbXBpbGVyIGVycm9y
cyB3ZXJlIGFscmVhZHkgZml4ZWQgaW4gbmV3ZXIgdmVyc2lvbnMgb2YgbHR0bmctbW9kdWxlcy4K
CkEgY2hhbmdlbG9nIGZvciBsdHRuZy1tb2R1bGVzIDIuMTQuMyBjYW4gYmUgZm91bmQgaGVyZToK
aHR0cHM6Ly9naXQubHR0bmcub3JnLz9wPWx0dG5nLW1vZHVsZXMuZ2l0O2E9YmxvYjtmPUNoYW5n
ZUxvZztoPWJlNjE0ODAyMmVjYTUwODRkMDVkOTU5YmNjZjI3ZDg4ZTJlZDIwNzM7aGI9cmVmcy9o
ZWFkcy9zdGFibGUtMi4xNAoKSSB0ZXN0ZWQgbHR0bmctbW9kdWxlcyAyLjEzLjE3IHdpdGggdGhl
IG1hc3RlciBicmFuY2ggb25seSBhbmQgaXQgY29tcGlsZXMgZmluZS4KCkFzIGEgc2lkZSBub3Rl
LCB0aGVyZSBhcmUgbmV3ZXIgdmVyc2lvbnMgb2YgbHR0bmctdG9vbHMgKDIuMTMuMTQpIGFuZCBs
dHRuZy11c3QgKDIuMTMuOCkgYXMgd2VsbC4KSSBiZWxpZXZlIHRoYXQgdGhlc2Ugc2hvdWxkIGJl
IHVwZGF0ZWQgdG9nZXRoZXIgYXMgdGhleSBhcmUgbGlzdGVkIG9uIHRoZSBsdHRuZy5vcmcgd2Vi
c2l0ZSB0b2dldGhlci4KSG93ZXZlciwgdGhlIGJ1aWxkcm9vdCBtYW51YWwgcmVjb21tZW5kcyBh
IHNpbmdsZSBwYXRjaCBmb3IgZWFjaCBwYWNrYWdlIHRoYXQncyB1cGRhdGVkLgpTbyBJJ20gcGxh
bm5pbmcgdG8gc3VibWl0IHR3byBtb3JlIHBhdGNoZXMgbGF0ZXIgb24gZm9yIGx0dG5nLXRvb2xz
IGFuZCBsdHRuZy11c3QuCgpUaGlzIGlzIG15IGZpcnN0IHRpbWUgc3VibWl0dGluZyBhIHBhdGNo
IGZvciBidWlsZHJvb3QuCgpTaWduZWQtb2ZmLWJ5OiBEZXZpbiBTdGVmZmxlciA8ZGV2aW4uYnVp
bGRyb290QGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxz
Lm5ldD4KW0Jlcm5kOgogLSBidW1wZWQgdG8gMi4xNC4zLCB1cGRhdGVkIGNoYW5nZWxvZyBsaW5r
CiAtIFVwZGF0ZWQgbGljZW5zZSBmaWxlcyBhbmQgaGFzaGVzIGR1ZSB0byB1cHN0cmVhbSBjb21t
aXQ6CiAgIGh0dHBzOi8vZ2l0Lmx0dG5nLm9yZy8/cD1sdHRuZy1tb2R1bGVzLmdpdDthPWNvbW1p
dDtoPTYxYmFmZjZlOGRlMjQ2MmY0NTAwNjY2MmJjMzRiY2JmNWY2NDViYTBdCi0tLQogcGFja2Fn
ZS9sdHRuZy1tb2R1bGVzL2x0dG5nLW1vZHVsZXMuaGFzaCB8IDEyICsrKysrKy0tLS0tLQogcGFj
a2FnZS9sdHRuZy1tb2R1bGVzL2x0dG5nLW1vZHVsZXMubWsgICB8ICA3ICsrKysrLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9wYWNrYWdlL2x0dG5nLW1vZHVsZXMvbHR0bmctbW9kdWxlcy5oYXNoIGIvcGFja2FnZS9sdHRu
Zy1tb2R1bGVzL2x0dG5nLW1vZHVsZXMuaGFzaAppbmRleCBiMTRiNDg4ODM3Li4zY2YxMWRhZTMy
IDEwMDY0NAotLS0gYS9wYWNrYWdlL2x0dG5nLW1vZHVsZXMvbHR0bmctbW9kdWxlcy5oYXNoCisr
KyBiL3BhY2thZ2UvbHR0bmctbW9kdWxlcy9sdHRuZy1tb2R1bGVzLmhhc2gKQEAgLTEsOCArMSw4
IEBACi0jIEZyb20gaHR0cHM6Ly9sdHRuZy5vcmcvZmlsZXMvbHR0bmctbW9kdWxlcy9sdHRuZy1t
b2R1bGVzLTIuMTMuMTAudGFyLmJ6Mi5zaGEyNTYKLXNoYTI1NiAgMTNhYmZiMWFjODcwNzExZjBk
MGFkZmE4OGU1M2IxN2RlYjJlMzA1MjE3MzcxNWEyNjBhNmVmMTRhYTQ1YjBhNyAgbHR0bmctbW9k
dWxlcy0yLjEzLjEwLnRhci5iejIKKyMgRnJvbSBodHRwczovL2x0dG5nLm9yZy9maWxlcy9sdHRu
Zy1tb2R1bGVzL2x0dG5nLW1vZHVsZXMtMi4xNC4zLnRhci5iejIuc2hhMjU2CitzaGEyNTYgIDM1
YTE4NzVhZDk2ZThiNGI2YWE4NzI5ZjU5YWYzNTBiZmM3ODhiYTY1YzY4NTZkZWFhODRkMzNhY2Mw
ZjI4YzIgIGx0dG5nLW1vZHVsZXMtMi4xNC4zLnRhci5iejIKIAogIyBIYXNoIGZvciBsaWNlbnNl
IGZpbGVzCi1zaGEyNTYgIGQ3MjkyMTI2NmJjODQ1MmE4Nzg5ZjhhMDRhODI3NTUzNzM5OTBkMDBi
N2UwYjBmMWE4ZWRiOGY4NTRlOTRkMWMgIExJQ0VOU0VTL0xHUEwtMi4xCi1zaGEyNTYgIDY4NDFj
ODViOTRmOWRhYjMxOTM1NmUzYWFmOWU5NjlmY2VkYWQ1MWQzYWFhZGY2NjViZjg2ZjM0ZjQxODZi
NjIgIExJQ0VOU0VTL0dQTC0yLjAKLXNoYTI1NiAgMzIzYzU4N2QwY2NmMTBlMzc2ZjhiZjlhN2Yz
MWZiNGNhNjA3ODEwNTE5NGI0MmUwYjFlMGVlMmJjOWJkZTcxZiAgTElDRU5TRVMvTUlUCi1zaGEy
NTYgIDAxMzNkM2M1MDVmMTc2ODQ1ZDdhOGI0ZGNmZTAwNmFjNjE1ODMyYzQzYzQxZTc2ZmUzYjM2
NTE5MWJhZmNhOTIgIExJQ0VOU0UKK3NoYTI1NiAgZmE2ZjM2NjMwYmIxZTBjNTcxZDM0YjJiYmRm
MTg4ZDA4NDk1YzlkYmY1OGYyOGNhYzExMmYzMDNmYzFmNThmYiAgTElDRU5TRVMvTEdQTC0yLjEt
b25seS50eHQKK3NoYTI1NiAgYWFmMTM1NDcyZjgxYzViNGEwZGNhOTM2N2U1YmI1ZTk3NTAwMzJi
NWJlYmU1NDQyYjM2ZTRjMGE0NzQzMGRmMyAgTElDRU5TRVMvR1BMLTIuMC1vbmx5LnR4dAorc2hh
MjU2ICBiODVkY2QzZTQ1M2QwNTk4MjU1MmM1MmI1ZmM5ZTBiZGQ2ZDIzYzZmOGU4NDRiOTg0YTg4
YWYzMjU3MGIwY2MwICBMSUNFTlNFUy9NSVQudHh0CitzaGEyNTYgIDA0YzBmNjJmNTA4OGI5Zjc5
NGY4MDM3MzA4NzhkYTlmZTFkZGM5YTkxZjFiODNiMDQ1YjcyMGUwNWFkY2Y3YWYgIExJQ0VOU0UK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHR0bmctbW9kdWxlcy9sdHRuZy1tb2R1bGVzLm1rIGIvcGFj
a2FnZS9sdHRuZy1tb2R1bGVzL2x0dG5nLW1vZHVsZXMubWsKaW5kZXggZDZmMWU0MTE0ZC4uYjUx
ZmI1ZGQ5NiAxMDA2NDQKLS0tIGEvcGFja2FnZS9sdHRuZy1tb2R1bGVzL2x0dG5nLW1vZHVsZXMu
bWsKKysrIGIvcGFja2FnZS9sdHRuZy1tb2R1bGVzL2x0dG5nLW1vZHVsZXMubWsKQEAgLTQsMTIg
KzQsMTUgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUxUVE5HX01PRFVMRVNfVkVS
U0lPTiA9IDIuMTMuMTAKK0xUVE5HX01PRFVMRVNfVkVSU0lPTiA9IDIuMTQuMwogTFRUTkdfTU9E
VUxFU19TSVRFID0gaHR0cDovL2x0dG5nLm9yZy9maWxlcy9sdHRuZy1tb2R1bGVzCiBMVFROR19N
T0RVTEVTX1NPVVJDRSA9IGx0dG5nLW1vZHVsZXMtJChMVFROR19NT0RVTEVTX1ZFUlNJT04pLnRh
ci5iejIKIExUVE5HX01PRFVMRVNfTElDRU5TRSA9IExHUEwtMi4xL0dQTC0yLjAgKGtlcm5lbCBt
b2R1bGVzKSwgTUlUIChsaWIvYml0ZmllbGQuaCwgbGliL3ByaW9faGVhcC8qKQogTFRUTkdfTU9E
VUxFU19MSUNFTlNFX0ZJTEVTID0gXAotCUxJQ0VOU0VTL0xHUEwtMi4xIExJQ0VOU0VTL0dQTC0y
LjAgTElDRU5TRVMvTUlUIExJQ0VOU0UKKwlMSUNFTlNFUy9HUEwtMi4wLW9ubHkudHh0IFwKKwlM
SUNFTlNFUy9MR1BMLTIuMS1vbmx5LnR4dCBcCisJTElDRU5TRVMvTUlULnR4dCBcCisJTElDRU5T
RQogTFRUTkdfTU9EVUxFU19NT0RVTEVfTUFLRV9PUFRTID0gQ09ORklHX0xUVE5HPW0gQ09ORklH
X0xUVE5HX0NMT0NLX1BMVUdJTl9URVNUPW0KIAogZGVmaW5lIExUVE5HX01PRFVMRVNfTElOVVhf
Q09ORklHX0ZJWFVQUwotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
