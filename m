Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C911C0015E
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 08:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C101181E9E;
	Mon, 24 Jul 2023 08:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C101181E9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JMOP-rrTMvHb; Mon, 24 Jul 2023 08:46:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6E4881EA5;
	Mon, 24 Jul 2023 08:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6E4881EA5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE85B1BF3A9
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 08:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9F4A40975
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 08:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9F4A40975
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_DWvMaecvav for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 08:46:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBE1840979
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 08:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBE1840979
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE9DE1C0014;
 Mon, 24 Jul 2023 08:45:59 +0000 (UTC)
Date: Mon, 24 Jul 2023 10:45:58 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230724104558.43d489a5@windsurf>
In-Reply-To: <CACXRmJiF+S5C4-4VFK68jBi4g5On1FBO3js9+cvxAwF_NxzZRw@mail.gmail.com>
References: <20230610133251.97022-1-thomas@devoogdt.com>
 <20230723092314.129079-1-thomas@devoogdt.com>
 <20230723092314.129079-4-thomas@devoogdt.com>
 <20230723120625.53310553@windsurf>
 <CACXRmJiF+S5C4-4VFK68jBi4g5On1FBO3js9+cvxAwF_NxzZRw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690188360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXEO1LbdcFLj67VKaxGTnbfJMctQO4v4n6BEQ0tDr8A=;
 b=oH7q0tBWzZfWA8wXK7OxfWfE4d36yH8mCzRg8iK2zW5DjZXRQ1znoMqCU2LDZTK0ymsABB
 DNW/WjY+WhClUHkhnsvCiiZZl33eQ/pMPPtGsI1h0+bgUdoz6f38jmSHZbrEQyrBTL1lpZ
 ryVMR86kkK/7UbV22nPI4rpqFmXvTdSApOFmZRbW+JQWnd4h6IyYamSRhl4BOaoahI3EbL
 158xM1cF1hYgHPKsO0YUd2A3tNcutRAzxBkMSDvd3cCUMOusvwXnA6reJyyK72CY5GYUA5
 oWeL1Z6bWXJkgJ4AWVWKQRrSeALxxfgwpS4O9LRrxfyxLtS00bGbCVtKNf81tg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oH7q0tBW
Subject: Re: [Buildroot] [PATCH v3 4/4] package/fluent-bit: rework wasm
 handling
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gTW9uLCAyNCBKdWwgMjAyMyAxMDoyOTo0NSArMDIwMApUaG9tYXMg
RGV2b29nZHQgPHRob21hc0BkZXZvb2dkdC5jb20+IHdyb3RlOgoKPiA+IFNvbWV0aGluZyB0aGF0
IGlzbid0IGV4cGxhaW5lZCBpbiB5b3VyIGNvbW1pdCBsb2cgaXMgd2h5IHlvdSdyZSBtYWtpbmcK
PiA+IHRoZSB3YXNtIGZlYXR1cmUgYXV0b21hdGljYWxseSBlbmFibGVkLCByYXRoZXIgdGhhbiBv
cHRpb25hbCBhcyBpdCB3YXM/ICAKPiAKPiBJIGhhZCB0byByZS1hZGQgdGhlIGxvZ2ljIHRvIHRo
ZSBtYWtlIGZpbGUgaW4gb3JkZXIgdG8gc2VsZWN0IHRoZSByaWdodCB0YXJnZXQuCj4gSSBkcm9w
cGVkIHRoZSBDb25maWcuSW4gbG9naWMgdG8gYXZvaWQgZG91YmxlIG1haW50ZW5hbmNlIG9mIHRo
ZQo+IHN1cHBvcnRlZCBhcmNoaXRlY3R1cmVzLgoKV2VsbCwgaW4gZmFjdCB0aGUgbG9naWMgZm9y
IHRoZSBhcmNoaXRlY3R1cmUgd291bGQgYmUgY2xlYW5lciBpbiB0aGUKQ29uZmlnLmluIGZpbGUu
CgppZiBCUjJfUEFDS0FHRV9GTFVFTlRfQklUCgpjb25maWcgQlIyX1BBQ0tBR0VfRkxVRU5UX0JJ
VF9XQVNNX0FSQ0gKCXN0cmluZwoJZGVmYXVsdCAiQUFSQ0g2NCIgCWlmIEJSMl9hYXJjaDY0IHx8
IEJSMl9hYXJjaDY0YmUKCWRlZmF1bHQgIkFSQyIgCQlpZiBCUjJfYXJjIHx8IEJSMl9hcmNlYgoJ
ZGVmYXVsdCAiQVJNIiAJCWlmIEJSMl9hcm0gfHwgQlIyX2FybWViCgkuLi4KCmNvbmZpZyBCUjJf
UEFDS0FHRV9GTFVFTlRfQklUX1dBU01fQVJDSF9TVVBQT1JUUwoJYm9vbAoJZGVmYXVsdCB5IGlm
IEJSMl9QQUNLQUdFX0ZMVUVOVF9CSVRfV0FTTV9BUkNIICE9ICIiCgpjb25maWcgQlIyX1BBQ0tB
R0VfRkxVRU5UX0JJVF9XQVNNCglib29sICJ3YXNtIHJ1bnRpbWUgc3VwcG9ydCIKCWRlcGVuZHMg
b24gQlIyX0lOU1RBTExfTElCU1REQ1BQCglkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0ZMVUVOVF9C
SVRfV0FTTV9BUkNIX1NVUFBPUlRTCgloZWxwCgkgIFN1cHBvcnQgZm9yIFdBU00tYmFzZWQgcGx1
Z2lucy4KCi4uLgoKZW5kaWYKCkFuZCB0aGVuIGluIHRoZSBNYWtlZmlsZToKCkZMVUVOVF9CSVRf
V0FTTV9BUkNIID0gJChjYWxsIHFzdHJpcCwkKEJSMl9QQUNLQUdFX0ZMVUVOVF9CSVRfV0FTTV9B
UkNIKSkKCmFuZCB2b2lsw6AuCgo+ID4gV2hhdCBpcyB0aGUgc2l6ZSBpbXBhY3Q/IFdvdWxkIHNv
bWVvbmUgcG9zc2libHkgd2FudCBmbHVlbnQtYml0IHdpdGhvdXQKPiA+IHdhc20gc3VwcG9ydD8g
IAo+IAo+IEZMQl9XQVNNPU5vIDogLXJ3eHIteHIteCAxIHRob21hcyB0aG9tYXMgMzE3NjkxNTYg
SnVsIDI0IDA5OjEwCj4gb3V0cHV0L3RhcmdldC91c3IvbGliL2ZsdWVudC1iaXQvbGliZmx1ZW50
LWJpdC5zbwo+IEZMQl9XQVNNPVllczogLXJ3eHIteHIteCAxIHRob21hcyB0aG9tYXMgMzM4MDEw
NTYgSnVsIDI0IDA5OjA3Cj4gb3V0cHV0L3RhcmdldC91c3IvbGliL2ZsdWVudC1iaXQvbGliZmx1
ZW50LWJpdC5zbwo+IAo+IFNvIHRoZSBiaW5hcnkgZ29lcyBmcm9tIDMxLjhNQiB0byAzMy44TUIu
CgpBZG1pdHRlZGx5LCBpdCdzIGFscmVhZHkgYSBodWdlIHRoaW5nLCBzbyBhbm90aGVyIDIgTUIg
bW9yZS4uLgoKQnV0IGluIGdlbmVyYWwgaW4gQnVpbGRyb290IG91ciBwb2xpY3kgaXMgdG8gZW5z
dXJlIHRoaW5ncyB0aGF0IGFyZQpvcHRpb25hbCBpbiB1cHN0cmVhbSBhcmUgaW5kZWVkIG9wdGlv
bmFsIGluIEJ1aWxkcm9vdC4KCj4gcGFja2FnZS9mbHVlbnQtYml0OiByZXdvcmsgd2FzbSBoYW5k
bGluZwo+IAo+IEZsdWVudC1iaXQgaXNuJ3QgdmVyeSBncmVhdCBhdCBzdXBwb3J0aW5nIHRoZSB2
YXJpb3VzIGFyY2hpdGVjdHVyZXMsCj4gc28gaGVscCBhIGxpdHRsZSBiaXQgYnkgZGVmaW5pbmcg
dGhlIFdBTVJfQlVJTERfVEFSR0VUIG91cnNlbHZlcy4KPiAKPiBUaGUgQlIyX1BBQ0tBR0VfRkxV
RU5UX0JJVF9XQVNNIG9wdGlvbiBpcyByZW1vdmVkIHRvIGF2b2lkCj4gZG91YmxlIGFyY2hpdGVj
dHVyZSBtYWludGVuYW5jZSBpbiBib3RoIHRoZSBLQ29uZmlnIGFuZCBtYWtlIGZpbGUuIFRoaXMK
ClNlZSBhYm92ZTogbm8gZG91YmxlIG1haW50ZW5hbmNlIGlzIG5lZWRlZC4KCj4gbWVhbnMgdGhh
dCBXQU1SIHdpbGwgYWx3YXlzIGdldCBjb21waWxlZCByZXN1bHRpbmcgaW4gYSBzbGlnaHRseSBi
aW5hcnkKPiBzaXplIGluY3JlYXNlIGZyb20gMzEuOE1CIHRvIDMzLjhNQi4KPiAKPiBUd28gZmFp
bHVyZXMgd2hpbGUgZXhlY3V0aW5nIC4vdXRpbHMvdGVzdC1wa2c6Cj4gCj4gLSBzb3VyY2VyeS1t
aXBzNjQ6Cj4gY29yZS9pd2FzbS9jb21tb24vYXJjaC9pbnZva2VOYXRpdmVfbWlwcy5zOiBBc3Nl
bWJsZXIgbWVzc2FnZXM6Cj4gY29yZS9pd2FzbS9jb21tb24vYXJjaC9pbnZva2VOYXRpdmVfbWlw
cy5zOjU4OiBFcnJvcjogb3Bjb2RlIG5vdAo+IHN1cHBvcnRlZCBvbiB0aGlzIHByb2Nlc3Nvcjog
bWlwczY0cjIgKG1pcHM2NHIyKSBgbGRjMSAkZjEyLDAoJHNwKScKPiBjb3JlL2l3YXNtL2NvbW1v
bi9hcmNoL2ludm9rZU5hdGl2ZV9taXBzLnM6NTk6IEVycm9yOiBvcGNvZGUgbm90Cj4gc3VwcG9y
dGVkIG9uIHRoaXMgcHJvY2Vzc29yOiBtaXBzNjRyMiAobWlwczY0cjIpIGBsZGMxICRmMTQsOCgk
c3ApJwo+IG1ha2VbNF06ICoqKiBbc3JjL3dhc20vQ01ha2VGaWxlcy92bWxpYi1zdGF0aWMuZGly
L2J1aWxkLm1ha2U6NDk1Ogo+IHNyYy93YXNtL0NNYWtlRmlsZXMvdm1saWItc3RhdGljLmRpci9f
Xy9fXy9saWIvd2FzbS1taWNyby1ydW50aW1lLVdBTVItMS4xLjEvY29yZS9pd2FzbS9jb21tb24v
YXJjaC9pbnZva2VOYXRpdmVfbWlwcy5zLm9dCj4gRXJyb3IgMQo+IG1ha2VbNF06ICoqKiBXYWl0
aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCj4gCj4gLSBzb3VyY2VyeS1taXBzOgo+IGNvcmUv
aXdhc20vY29tbW9uL2FyY2gvaW52b2tlTmF0aXZlX21pcHMuczogQXNzZW1ibGVyIG1lc3NhZ2Vz
Ogo+IGNvcmUvaXdhc20vY29tbW9uL2FyY2gvaW52b2tlTmF0aXZlX21pcHMuczo1ODogRXJyb3I6
IG9wY29kZSBub3QKPiBzdXBwb3J0ZWQgb24gdGhpcyBwcm9jZXNzb3I6IG1pcHMzMnIyIChtaXBz
MzJyMikgYGxkYzEgJGYxMiwwKCRzcCknCj4gY29yZS9pd2FzbS9jb21tb24vYXJjaC9pbnZva2VO
YXRpdmVfbWlwcy5zOjU5OiBFcnJvcjogb3Bjb2RlIG5vdAo+IHN1cHBvcnRlZCBvbiB0aGlzIHBy
b2Nlc3NvcjogbWlwczMycjIgKG1pcHMzMnIyKSBgbGRjMSAkZjE0LDgoJHNwKScKPiBtYWtlWzRd
OiAqKiogW3NyYy93YXNtL0NNYWtlRmlsZXMvdm1saWItc3RhdGljLmRpci9idWlsZC5tYWtlOjQ5
NToKPiBzcmMvd2FzbS9DTWFrZUZpbGVzL3ZtbGliLXN0YXRpYy5kaXIvX18vX18vbGliL3dhc20t
bWljcm8tcnVudGltZS1XQU1SLTEuMS4xL2NvcmUvaXdhc20vY29tbW9uL2FyY2gvaW52b2tlTmF0
aXZlX21pcHMucy5vXQo+IEVycm9yIDEKPiBtYWtlWzRdOiAqKiogV2FpdGluZyBmb3IgdW5maW5p
c2hlZCBqb2JzLi4uLgo+IAo+IFdoaWNoIGFyZSBmaXhlZCBieSBzZXR0aW5nIHRoZSBvYnNjdXJl
IGZsYWcgIldBTVJfQlVJTERfSU5WT0tFX05BVElWRV9HRU5FUkFMIi4KPiAKPiBTZWUgaHR0cHM6
Ly9naXRodWIuY29tL2J5dGVjb2RlYWxsaWFuY2Uvd2FzbS1taWNyby1ydW50aW1lL2lzc3Vlcy82
MjUKPiBmb3IgbW9yZSBpbmZvOgo+IOKAnEhpLCBidWlsZGluZyB0aGUgaW52b2tlTmF0aXZlX2dl
bmVyYWwuYyBleHBsaWNpdGx5IGlzIHN1cHBvcnRlZCBub3csCj4gcGxlYXNlIHB1bGwgdGhlIGxh
dGVzdCBjb2RlIGFuZCB1c2UKPiAiY21ha2UgLURXQU1SX0JVSUxEX0lOVk9LRV9OQVRJVkVfR0VO
RVJBTD0xIC4uLiIgdG8gYnVpbGQgaXQu4oCdCgpUaGFua3MsIHRoaXMgZXhwbGFuYXRpb24gbG9v
a3MgZ29vZC4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywg
Qm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmlu
ZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
