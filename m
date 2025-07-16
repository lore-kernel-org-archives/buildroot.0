Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC5BC83F22
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 18:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08B3E40EEE;
	Wed, 16 Jul 2025 18:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAQYyo4NKZHg; Wed, 16 Jul 2025 18:19:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F32140694
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F32140694;
	Wed, 16 Jul 2025 18:19:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B9AF11AA
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CEF660DC7
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4GuEXcc94Gz for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 18:19:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7DBA7610A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DBA7610A8
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DBA7610A8
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:19:14 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:3cb9:e8a6:c6c7:308b] (unknown
 [IPv6:2a01:e0a:12:eba0:3cb9:e8a6:c6c7:308b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 5CF05C00ED;
 Wed, 16 Jul 2025 20:19:12 +0200 (CEST)
Message-ID: <c8467198-efc1-45f9-86ef-0726d06df295@grenoble.cnrs.fr>
Date: Wed, 16 Jul 2025 20:19:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Buildroot development <buildroot@buildroot.org>
Cc: Petr Vorel <petr.vorel@gmail.com>, Julien Olivain <ju.o@free.fr>
References: <af8e78be-f4ad-4543-a166-b2527c0e9c3a@grenoble.cnrs.fr>
Content-Language: en-US, fr
In-Reply-To: <af8e78be-f4ad-4543-a166-b2527c0e9c3a@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1752689952;
 bh=nnkwMEDfpqyinvXP4PmzbMntHlY23FPxvGoiQHLwoo4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GUGlrb3DZFpZ+J1edHPSxx83gxr1ETRVx5M2gv/3PIU0mUI8EQftuhAxAnQzmiz+8
 V3xTyrcnafs31zVuxZMn/pEpxDBxg7DN8F4u4N7go5rnWKSofw/Q4rOfg2t9lXX3mw
 1h7VdexQKumHNH66ek6QXNn0DCZASFv1LduD6zrAe/MZczwcgDfhaUfDAPzKjB5zg0
 ixMt89SZ54zNs3pKRu3Gi/bYOYRSZ4MVN3O4ocqhz9qbOFFfF0dlf68W/nTSPc4DfZ
 zwhF3dK/8JzeRxrPwcoAyboYFza+9cGTmcM/Fn9J6sYeHTVbuFvVeii4UhmM6m2ZYU
 qLajIVc9sU3Cw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=GUGlrb3D
Subject: [Buildroot] [PATCH v2 3/4] support/kconfig: fix compiler warning in
 util.c
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U29tZSBtYWtlIHRhcmdldHMgc3VjaCBhcyBtZW51Y29uZmlnIG9yICpfZGVmY29uZmlnIGJ1aWxk
IGNvZGUgZnJvbQpzdXBwb3J0L2tjb25maWcuIElmIHRoaXMgaXMgZG9uZSB3aXRoIGhvc3QgR0ND
IDEzLCB3ZSBnZXQgdGhlIGZvbGxvd2luZwpjb21waWxlciB3YXJuaW5nOgoKICAgIC4vdXRpbC5j
OiBJbiBmdW5jdGlvbiDigJhmaWxlX3dyaXRlX2RlcOKAmToKICAgIC4vdXRpbC5jOjg2OjI2OiB3
YXJuaW5nOiDigJglc+KAmSBkaXJlY3RpdmUgd3JpdGluZyAxMCBvciBtb3JlIGJ5dGVzIGludG8g
YSByZWdpb24gb2Ygc2l6ZSBiZXR3ZWVuIDEgYW5kIDQwOTcgWy1XZm9ybWF0LW92ZXJmbG93PV0K
ICAgICAgIDg2IHwgICAgICAgICBzcHJpbnRmKGJ1ZjIsICIlcyVzIiwgZGlyLCBuYW1lKTsKICAg
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgIF5+CiAgICAuL3V0aWwuYzo4Njo5OiBu
b3RlOiDigJhzcHJpbnRm4oCZIG91dHB1dCAxMSBvciBtb3JlIGJ5dGVzIChhc3N1bWluZyA0MTA3
KSBpbnRvIGEgZGVzdGluYXRpb24gb2Ygc2l6ZSA0MDk3CiAgICAgICA4NiB8ICAgICAgICAgc3By
aW50ZihidWYyLCAiJXMlcyIsIGRpciwgbmFtZSk7CiAgICAgICAgICB8ICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KClRoaXMgaXMgc2ltaWxhciB0byB0aGUgd2Fybmlu
Z3MgZ2VuZXJhdGVkIGJ5IEdDQyA5LjQgYW5kIGZpeGVkIGluCjMyNDYxMmQ2OGUwOSAoInN1cHBv
cnQva2NvbmZpZzogZml4IGNvbXBpbGVyIHdhcm5pbmdzIikuCgpBdm9pZCB0aGUgd2FybmluZyBi
eSBlbmxhcmdpbmcgdGhlIGRlc3RpbmF0aW9uIGJ1ZmZlciBvZiBmcHJpbnRmKCkuCkFsc28sIHVw
ZGF0ZSBwYXRjaGVzLzI0LWZpeC0tV2Zvcm1hdC13YXJuaW5ncy5wYXRjaCB0byBzdGF5IGluIHN5
bmMgd2l0aAp0aGUgY29kZS4KClNpZ25lZC1vZmYtYnk6IEVkZ2FyIEJvbmV0IDxib25ldEBncmVu
b2JsZS5jbnJzLmZyPgotLS0KIHN1cHBvcnQva2NvbmZpZy9wYXRjaGVzLzI0LWZpeC0tV2Zvcm1h
dC13YXJuaW5ncy5wYXRjaCB8IDIgKy0KIHN1cHBvcnQva2NvbmZpZy91dGlsLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3N1cHBvcnQva2NvbmZpZy9wYXRj
aGVzLzI0LWZpeC0tV2Zvcm1hdC13YXJuaW5ncy5wYXRjaCBiL3N1cHBvcnQva2NvbmZpZy9wYXRj
aGVzLzI0LWZpeC0tV2Zvcm1hdC13YXJuaW5ncy5wYXRjaAppbmRleCA0YjYzMWU1NTRmLi4wZThh
ODgzZWRmIDEwMDY0NAotLS0gYS9zdXBwb3J0L2tjb25maWcvcGF0Y2hlcy8yNC1maXgtLVdmb3Jt
YXQtd2FybmluZ3MucGF0Y2gKKysrIGIvc3VwcG9ydC9rY29uZmlnL3BhdGNoZXMvMjQtZml4LS1X
Zm9ybWF0LXdhcm5pbmdzLnBhdGNoCkBAIC0zMSw3ICszMSw3IEBAIEluZGV4OiBrY29uZmlnL3V0
aWwuYwogIHsKICAJY2hhciAqc3RyOwogLQljaGFyIGJ1ZltQQVRIX01BWCsxXSwgYnVmMltQQVRI
X01BWCsxXSwgZGlyW1BBVEhfTUFYKzFdOwotKwljaGFyIGJ1ZltQQVRIX01BWCsyMF0sIGJ1ZjJb
UEFUSF9NQVgrMV0sIGRpcltQQVRIX01BWCsxXTsKKysJY2hhciBidWZbUEFUSF9NQVgrMjBdLCBi
dWYyW1BBVEhfTUFYKzExXSwgZGlyW1BBVEhfTUFYKzFdOwogIAlzdHJ1Y3Qgc3ltYm9sICpzeW0s
ICplbnZfc3ltOwogIAlzdHJ1Y3QgZXhwciAqZTsKICAJc3RydWN0IGZpbGUgKmZpbGU7CmRpZmYg
LS1naXQgYS9zdXBwb3J0L2tjb25maWcvdXRpbC5jIGIvc3VwcG9ydC9rY29uZmlnL3V0aWwuYwpp
bmRleCA4NjY1ZjViYjg5Li44NmNlOTk0MzY3IDEwMDY0NAotLS0gYS9zdXBwb3J0L2tjb25maWcv
dXRpbC5jCisrKyBiL3N1cHBvcnQva2NvbmZpZy91dGlsLmMKQEAgLTM1LDcgKzM1LDcgQEAgc3Ry
dWN0IGZpbGUgKmZpbGVfbG9va3VwKGNvbnN0IGNoYXIgKm5hbWUpCiBpbnQgZmlsZV93cml0ZV9k
ZXAoY29uc3QgY2hhciAqbmFtZSkKIHsKIAljaGFyICpzdHI7Ci0JY2hhciBidWZbUEFUSF9NQVgr
MjBdLCBidWYyW1BBVEhfTUFYKzFdLCBkaXJbUEFUSF9NQVgrMV07CisJY2hhciBidWZbUEFUSF9N
QVgrMjBdLCBidWYyW1BBVEhfTUFYKzExXSwgZGlyW1BBVEhfTUFYKzFdOwogCXN0cnVjdCBzeW1i
b2wgKnN5bSwgKmVudl9zeW07CiAJc3RydWN0IGV4cHIgKmU7CiAJc3RydWN0IGZpbGUgKmZpbGU7
Ci0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
