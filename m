Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CA7C83F1B
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 18:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EB4F6124B;
	Wed, 16 Jul 2025 18:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MkkA6G_aQV0q; Wed, 16 Jul 2025 18:20:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 722CB6101B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 722CB6101B;
	Wed, 16 Jul 2025 18:20:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BADC1C62
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21F2283EA5
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ueIBUfuv79L2 for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 18:20:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71F8C83C9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71F8C83C9B
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71F8C83C9B
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:20:05 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:3cb9:e8a6:c6c7:308b] (unknown
 [IPv6:2a01:e0a:12:eba0:3cb9:e8a6:c6c7:308b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 9ED40C02B3;
 Wed, 16 Jul 2025 20:20:03 +0200 (CEST)
Message-ID: <cd0668be-ec08-4bd9-980c-5c1983132212@grenoble.cnrs.fr>
Date: Wed, 16 Jul 2025 20:20:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Buildroot development <buildroot@buildroot.org>
Cc: Petr Vorel <petr.vorel@gmail.com>, Julien Olivain <ju.o@free.fr>
References: <af8e78be-f4ad-4543-a166-b2527c0e9c3a@grenoble.cnrs.fr>
Content-Language: en-US, fr
In-Reply-To: <af8e78be-f4ad-4543-a166-b2527c0e9c3a@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1752690003;
 bh=RAGCgHakUZtP1pQCw3keeqOy4fU/sZqq3E145QC/vTY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pFpyf6b5n/nHE21k9RuKcbxY8e6wYY03lmJcTei4yXvH6D7Fjt8jnkJB7TmX+7m1Q
 vptjJSplxSYINWFLz2I76Hw81DK7MjFgvF0HDTfv/nflCgw+Hf0YBEkemfh3VhIsE3
 DQofKyYOtyWOg5Fyr8uS4DFuR+SRXqgDFY+npK46ZckqDGID1YT+o4ctNGY571z06s
 z/JsyUDrDHCu6bqxTQhGJlP9VP4LjATreNIWH8wjTenMogqCEg2ZiB4HH+het732Ry
 x3MdSq3RQRwXICZua3nP21gbF1+aA103GQepou27ROYde2awSyUTBoI8+ZFiiI1NP4
 73RR22YM41ing==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=pFpyf6b5
Subject: [Buildroot] [PATCH v2 4/4] support/kconfig: fix compiler warning in
 nconf.c
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

UnVubmluZyDigJxtYWtlIG5jb25maWfigJ0gd2l0aCBob3N0IEdDQyAxMyBnaXZlcyB0aGlzIHdh
cm5pbmc6CgpuY29uZi5jOiBJbiBmdW5jdGlvbiDigJhpdGVtX2FkZF9zdHLigJk6Cm5jb25mLmM6
NTc4OjQ3OiB3YXJuaW5nOiDigJglc+KAmSBkaXJlY3RpdmUgb3V0cHV0IG1heSBiZSB0cnVuY2F0
ZWQgd3JpdGluZyB1cCB0byAyNTUgYnl0ZXMgaW50byBhIHJlZ2lvbiBvZiBzaXplIGJldHdlZW4g
MSBhbmQgMjU2IFstV2Zvcm1hdC10cnVuY2F0aW9uPV0KICA1NzggfCAgICAgICAgIHNucHJpbnRm
KHRtcF9zdHIsIHNpemVvZih0bXBfc3RyKSwgIiVzJXMiLAogICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefgogIDU3OSB8ICAgICAgICAgICAgICAg
ICAgICAgICAgIGtfbWVudV9pdGVtc1tpbmRleF0uc3RyLCBuZXdfc3RyKTsKICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfn5+fn5+fgpuY29u
Zi5jOjU3ODo5OiBub3RlOiDigJhzbnByaW50ZuKAmSBvdXRwdXQgYmV0d2VlbiAxIGFuZCA1MTEg
Ynl0ZXMgaW50byBhIGRlc3RpbmF0aW9uIG9mIHNpemUgMjU2CiAgNTc4IHwgICAgICAgICBzbnBy
aW50Zih0bXBfc3RyLCBzaXplb2YodG1wX3N0ciksICIlcyVzIiwKICAgICAgfCAgICAgICAgIF5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogIDU3OSB8ICAgICAgICAg
ICAgICAgICAgICAgICAgIGtfbWVudV9pdGVtc1tpbmRleF0uc3RyLCBuZXdfc3RyKTsKICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4KCkZpeCBpdCBieSBlbmxhcmdpbmcgdGhlIGRlc3RpbmF0aW9uIGJ1ZmZlciBvZiBzbnByaW50
ZigpLiBBbHNvLCB1cGRhdGUKcGF0Y2hlcy8yNC1maXgtLVdmb3JtYXQtd2FybmluZ3MucGF0Y2gg
YWNjb3JkaW5nbHkuCgpTaWduZWQtb2ZmLWJ5OiBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUu
Y25ycy5mcj4KLS0tCiBzdXBwb3J0L2tjb25maWcvbmNvbmYuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0KIC4uLi9wYXRjaGVzLzI0LWZpeC0tV2Zvcm1hdC13YXJuaW5ncy5wYXRj
aCAgICAgICAgfCAxNSArKysrKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zdXBwb3J0L2tjb25maWcvbmNv
bmYuYyBiL3N1cHBvcnQva2NvbmZpZy9uY29uZi5jCmluZGV4IGU4ZTE5NDRmYTAuLmUxNWMxZmY0
MjUgMTAwNjQ0Ci0tLSBhL3N1cHBvcnQva2NvbmZpZy9uY29uZi5jCisrKyBiL3N1cHBvcnQva2Nv
bmZpZy9uY29uZi5jCkBAIC01NjcsNyArNTY3LDcgQEAgc3RhdGljIHZvaWQgaXRlbV9hZGRfc3Ry
KGNvbnN0IGNoYXIgKmZtdCwgLi4uKQogCXZhX2xpc3QgYXA7CiAJaW50IGluZGV4ID0gaXRlbXNf
bnVtLTE7CiAJY2hhciBuZXdfc3RyWzI1Nl07Ci0JY2hhciB0bXBfc3RyWzI1Nl07CisJY2hhciB0
bXBfc3RyWzUxMl07CiAKIAlpZiAoaW5kZXggPCAwKQogCQlyZXR1cm47CmRpZmYgLS1naXQgYS9z
dXBwb3J0L2tjb25maWcvcGF0Y2hlcy8yNC1maXgtLVdmb3JtYXQtd2FybmluZ3MucGF0Y2ggYi9z
dXBwb3J0L2tjb25maWcvcGF0Y2hlcy8yNC1maXgtLVdmb3JtYXQtd2FybmluZ3MucGF0Y2gKaW5k
ZXggMGU4YTg4M2VkZi4uNTRhNjZjNjk3MCAxMDA2NDQKLS0tIGEvc3VwcG9ydC9rY29uZmlnL3Bh
dGNoZXMvMjQtZml4LS1XZm9ybWF0LXdhcm5pbmdzLnBhdGNoCisrKyBiL3N1cHBvcnQva2NvbmZp
Zy9wYXRjaGVzLzI0LWZpeC0tV2Zvcm1hdC13YXJuaW5ncy5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZpeCAtV2Zvcm1hdC1vdmVyZmxvdyBjb21waWxlciB3YXJuaW5ncy4KK0ZpeCAtV2Zvcm1hdC1v
dmVyZmxvdyBhbmQgLVdmb3JtYXQtdHJ1bmNhdGlvbiBjb21waWxlciB3YXJuaW5ncy4KIAogSW5k
ZXg6IGtjb25maWcvY29uZmRhdGEuYwogPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQpAQCAtMzUsMyArMzUsMTYgQEAgSW5k
ZXg6IGtjb25maWcvdXRpbC5jCiAgCXN0cnVjdCBzeW1ib2wgKnN5bSwgKmVudl9zeW07CiAgCXN0
cnVjdCBleHByICplOwogIAlzdHJ1Y3QgZmlsZSAqZmlsZTsKK0luZGV4OiBrY29uZmlnL25jb25m
LmMKKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0KKy0tLSBrY29uZmlnLm9yaWcvbmNvbmYuYworKysrIGtjb25maWcvbmNv
bmYuYworQEAgLTU2Nyw3ICs1NjcsNyBAQCBzdGF0aWMgdm9pZCBpdGVtX2FkZF9zdHIoY29uc3Qg
Y2hhciAqZm10CisgCXZhX2xpc3QgYXA7CisgCWludCBpbmRleCA9IGl0ZW1zX251bS0xOworIAlj
aGFyIG5ld19zdHJbMjU2XTsKKy0JY2hhciB0bXBfc3RyWzI1Nl07CisrCWNoYXIgdG1wX3N0cls1
MTJdOworIAorIAlpZiAoaW5kZXggPCAwKQorIAkJcmV0dXJuOwotLSAKMi40My4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
