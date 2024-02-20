Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E55C48BC4
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 21:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F44260666;
	Tue, 20 Feb 2024 21:18:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lFX0Pxr6Edsn; Tue, 20 Feb 2024 21:18:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95FCD60ADF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95FCD60ADF;
	Tue, 20 Feb 2024 21:18:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 795261BF475
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 948EE60C0E
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:18:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CdCKftJ0xpxA for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 21:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7339D60C07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7339D60C07
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7339D60C07
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 21:18:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9B6C713F8A2;
 Tue, 20 Feb 2024 22:18:16 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Feb 2024 22:18:16 +0100
Date: Tue, 20 Feb 2024 22:18:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Message-ID: <ZdUXGKMMnD2wrZmK@landeda>
References: <--in-reply-to> <20240219204054.57774-1-kadambini.nema@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240219204054.57774-1-kadambini.nema@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708463899;
 bh=tJkl2V1bfCOoNMoayUjNHyVrykrphMFyKMzzSlkP/rM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DWvKQipCG0iRu5ICPIMWKiPMM6qW73w3YKULDlGf9BGNt8t3eskgvSStiJvp/ffjy
 R9a85+KW/34YofN+4TXON9W9a0SSLLvmVNP0N/Jc/NUbpoHjHZLl6RpzuQhrulJjiB
 4HMwhyFdev5vCnEavbYDGbrxya9xWL/lns+1dEutO+4dIM9C4GvZzSxh1lQhUFQYoZ
 3OnNDOlR8vSS5l5k+mS4KkVkQxjvvZfG/jaQFwz4UDBVUycsQmrFiZD7cSqCoqFJXy
 1XaeWCqOebUq55Eb04+hHEkFGvNX5jmO1vYCb1h2Xc2trqYq4fSlGpUc9IeK6gCPxW
 murovXLU6YoPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DWvKQipC
Subject: Re: [Buildroot] [PATCH 1/1] package/google-breakpad: fix missing
 include error
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
Cc: Pascal Huerst <pascal.huerst@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S2FkYW1iaW5pLCBBbGwsCgpPbiAyMDI0LTAyLTE5IDEyOjQwIC0wODAwLCBLYWRhbWJpbmkgTmVt
YSBzcGFrZSB0aHVzbHk6Cj4gc3JjL2NvbW1vbi9tb2R1bGUuY2M6IEluIG1lbWJlciBmdW5jdGlv
biDigJhib29sIGdvb2dsZV9icmVha3BhZDo6TW9kdWxlOjpBZGRGdW5jdGlvbihGdW5jdGlvbiop
4oCZOgo+IHNyYy9jb21tb24vbW9kdWxlLmNjOjE5NDo1MjogZXJyb3I6IOKAmGZpbmRfaWbigJkg
aXMgbm90IGEgbWVtYmVyIG9mIOKAmHN0ZOKAmTsgZGlkIHlvdSBtZWFuIOKAmGZpbmTigJk/Cj4g
ICAxOTQgfCAgICAgRnVuY3Rpb25TZXQ6Oml0ZXJhdG9yIGV4aXN0aW5nX2Z1bmN0aW9uID0gc3Rk
OjpmaW5kX2lmKAo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXn5+fn5+fgo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmluZAo+IE1ha2VmaWxlOjgzMDk6IHJlY2lwZSBm
b3IgdGFyZ2V0ICdzcmMvY29tbW9uL3Rvb2xzX21hY19kdW1wX3N5bXNfZHVtcF9zeW1zX21hYy1t
b2R1bGUubycgZmFpbGVkCj4gCj4gVGhpcyBlcnJvciBpcyBzZWVuIG9uIGdjYy0xNC4KPiAKPiBo
dHRwczovL2Nocm9taXVtLXJldmlldy5nb29nbGVzb3VyY2UuY29tL2MvYnJlYWtwYWQvYnJlYWtw
YWQvKy81MTM3NjU4Cj4gaHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9tZXRhLW9wZW5lbWJl
ZGRlZC90cmVlL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9icmVha3BhZC9icmVha3BhZC8wMDAx
LUZpeGVkLW1pc3NpbmctaW5jbHVkZS1mb3Itc3RkLWZpbmRfaWYucGF0Y2gKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBLYWRhbWJpbmkgTmVtYSA8a2FkYW1iaW5pLm5lbWFAZ21haWwuY29tPgoKQXBwbGll
ZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICAu
Li5peGVkLW1pc3NpbmctaW5jbHVkZS1mb3Itc3RkLWZpbmRfaWYucGF0Y2ggfCAyNiArKysrKysr
KysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2dvb2dsZS1icmVha3BhZC8wMDAxLUZpeGVkLW1pc3Npbmct
aW5jbHVkZS1mb3Itc3RkLWZpbmRfaWYucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9n
b29nbGUtYnJlYWtwYWQvMDAwMS1GaXhlZC1taXNzaW5nLWluY2x1ZGUtZm9yLXN0ZC1maW5kX2lm
LnBhdGNoIGIvcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvMDAwMS1GaXhlZC1taXNzaW5nLWluY2x1
ZGUtZm9yLXN0ZC1maW5kX2lmLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwLi4xNDFlMTJiNjEzCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvZ29v
Z2xlLWJyZWFrcGFkLzAwMDEtRml4ZWQtbWlzc2luZy1pbmNsdWRlLWZvci1zdGQtZmluZF9pZi5w
YXRjaAo+IEBAIC0wLDAgKzEsMjYgQEAKPiArRnJvbSA4OThhOTk3ODU1MTY4YzBlNmE2ODkwNzJm
ZWZiYTg5MjQ2MjcxYTVkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBOYXRoYW4g
TW9pbnZhemlyaSA8bmF0aGFuQG5hdGhhbm0uY29tPgo+ICtEYXRlOiBUdWUsIDE5IERlYyAyMDIz
IDE0OjM1OjA1IC0wODAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gRml4ZWQgbWlzc2luZyBpbmNsdWRl
IGZvciBzdGQ6OmZpbmRfaWYuCj4gKwo+ICtUaHJvd3MgYW4gZXJyb3Igd2hlbiBjb21waWxpbmcg
b24gV2luZG93cy4KPiArCj4gK0NoYW5nZS1JZDogSWViMzRjMDBjZjE5OWFhYTFiNDVhNDQwMDg2
YzQ4YjhlZDM2M2IzYzcKPiArUmV2aWV3ZWQtb246IGh0dHBzOi8vY2hyb21pdW0tcmV2aWV3Lmdv
b2dsZXNvdXJjZS5jb20vYy9icmVha3BhZC9icmVha3BhZC8rLzUxMzc2NTgKPiArUmV2aWV3ZWQt
Ynk6IEl2YW4gUGVua292IDxpdmFucGVAY2hyb21pdW0ub3JnPgo+ICtVcHN0cmVhbTogaHR0cHM6
Ly9naXRodWIuY29tL2dvb2dsZS9icmVha3BhZC9jb21taXQvODk4YTk5Nzg1NTE2OGMwZTZhNjg5
MDcyZmVmYmE4OTI0NjI3MWE1ZAo+ICtTaWduZWQtb2ZmLWJ5OiBLYWRhbWJpbmkgTmVtYSA8a2Fk
YW1iaW5pLm5lbWFAZ21haWwuY29tPgo+ICstLS0KPiArCj4gK2RpZmYgLS1naXQgYS9zcmMvY29t
bW9uL21vZHVsZS5jYyBiL3NyYy9jb21tb24vbW9kdWxlLmNjCj4gK2luZGV4IDBlYjVhYWQuLmI2
ZjVkYTcgMTAwNjQ0Cj4gKy0tLSBhL3NyYy9jb21tb24vbW9kdWxlLmNjCj4gKysrKyBiL3NyYy9j
b21tb24vbW9kdWxlLmNjCj4gK0BAIC00Miw2ICs0Miw3IEBACj4gKyAjaW5jbHVkZSA8c3RkaW8u
aD4KPiArICNpbmNsdWRlIDxzdHJpbmcuaD4KPiArIAo+ICsrI2luY2x1ZGUgPGFsZ29yaXRobT4K
PiArICNpbmNsdWRlIDxmdW5jdGlvbmFsPgo+ICsgI2luY2x1ZGUgPGlvc3RyZWFtPgo+ICsgI2lu
Y2x1ZGUgPG1lbW9yeT4KPiAtLSAKPiAyLjI1LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNz
JyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwg
XCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3
IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlz
IG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
