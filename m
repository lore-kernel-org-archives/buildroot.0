Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D46CC2BD05
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 09:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D70298112E;
	Mon, 24 Jun 2024 09:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QlQbLPOI5n-l; Mon, 24 Jun 2024 09:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEB658113B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEB658113B;
	Mon, 24 Jun 2024 09:19:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E11D1BF48B
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 09:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AD218113B
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 09:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F709IliFz6qy for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 09:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2AF718112E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AF718112E
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AF718112E
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 09:19:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76A8CDA7;
 Mon, 24 Jun 2024 02:20:09 -0700 (PDT)
Received: from localhost.localdomain (X72Y076X74.nice.arm.com [10.34.129.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 DF47E3F6A8; Mon, 24 Jun 2024 02:19:43 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 11:19:39 +0200
Message-ID: <20240624091939.2536588-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH v2] configs/arm_foundationv8_defconfig: bump to
 Linux 6.8.10
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSBCdW1wIExpbnV4IGtlcm5lbCB0byB2Ni44LjEwLgotIEJ1bXAgdGhlIEZWUCBpbiB0aGUgcmVh
ZG1lIHRvIHZlcnNpb24gMTEuMjUgYnVpbGQgMTUuCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0
ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CkNjOiBNYXNhaGlybyBZYW1hZGEgPHlhbWFk
YS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgpDYzogQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91
dEBtaW5kLmJlPgotLS0KCgpDaGFuZ2VzIHYxIC0+IHYyOgogIC0gQWRkIGN1c3RvbSBrZXJuZWwg
aGFzaCAoc3VnZ2VzdGVkIGJ5IEFybm91dCkKICAtIEFkZCBnbG9iYWwgcGF0Y2ggZGlyIGZvciB0
aGUgY3VzdG9tIGhhc2gKCgogLi4uL2ZvdW5kYXRpb24tdjgvcGF0Y2hlcy9saW51eC1oZWFkZXJz
L2xpbnV4LWhlYWRlcnMuaGFzaCB8IDEgKwogYm9hcmQvYXJtL2ZvdW5kYXRpb24tdjgvcGF0Y2hl
cy9saW51eC9saW51eC5oYXNoICAgICAgICAgICB8IDIgKysKIGJvYXJkL2FybS9mb3VuZGF0aW9u
LXY4L3JlYWRtZS50eHQgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBjb25maWdzL2Fy
bV9mb3VuZGF0aW9udjhfZGVmY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgIHwgNyArKysr
LS0tCiA0IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIGNy
ZWF0ZSBtb2RlIDEyMDAwMCBib2FyZC9hcm0vZm91bmRhdGlvbi12OC9wYXRjaGVzL2xpbnV4LWhl
YWRlcnMvbGludXgtaGVhZGVycy5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvYXJtL2Zv
dW5kYXRpb24tdjgvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCgpkaWZmIC0tZ2l0IGEvYm9hcmQv
YXJtL2ZvdW5kYXRpb24tdjgvcGF0Y2hlcy9saW51eC1oZWFkZXJzL2xpbnV4LWhlYWRlcnMuaGFz
aCBiL2JvYXJkL2FybS9mb3VuZGF0aW9uLXY4L3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51eC1o
ZWFkZXJzLmhhc2gKbmV3IGZpbGUgbW9kZSAxMjAwMDAKaW5kZXggMDAwMDAwMDAwMC4uNTgwOGQ5
MmFmZQotLS0gL2Rldi9udWxsCisrKyBiL2JvYXJkL2FybS9mb3VuZGF0aW9uLXY4L3BhdGNoZXMv
bGludXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2gKQEAgLTAsMCArMSBAQAorLi4vbGludXgv
bGludXguaGFzaApcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKZGlmZiAtLWdpdCBhL2JvYXJk
L2FybS9mb3VuZGF0aW9uLXY4L3BhdGNoZXMvbGludXgvbGludXguaGFzaCBiL2JvYXJkL2FybS9m
b3VuZGF0aW9uLXY4L3BhdGNoZXMvbGludXgvbGludXguaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwLi41NTliNTNiZTJkCi0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQv
YXJtL2ZvdW5kYXRpb24tdjgvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCkBAIC0wLDAgKzEsMiBA
QAorIyBMb2NhbGx5IGNhbGN1bGF0ZWQKK3NoYTI1NiAgYjBiYjkyZDk4MmY4ODM4MGU1YjIwNTkz
NDljM2E4NjJlMGFmYTcxMmUwNjQ2ZWIwZTA4MmI5YzJjNWNiNTE3NiAgbGludXgtNi44LjEwLnRh
ci54egpkaWZmIC0tZ2l0IGEvYm9hcmQvYXJtL2ZvdW5kYXRpb24tdjgvcmVhZG1lLnR4dCBiL2Jv
YXJkL2FybS9mb3VuZGF0aW9uLXY4L3JlYWRtZS50eHQKaW5kZXggY2IwZmUwOGI4Ny4uNzAxY2Yz
Y2ViMCAxMDA2NDQKLS0tIGEvYm9hcmQvYXJtL2ZvdW5kYXRpb24tdjgvcmVhZG1lLnR4dAorKysg
Yi9ib2FyZC9hcm0vZm91bmRhdGlvbi12OC9yZWFkbWUudHh0CkBAIC0zLDcgKzMsNyBAQCBBUk0g
c29mdHdhcmUgc2ltdWxhdG9yIG9mIHRoZSBBQXJjaDY0IGFyY2hpdGVjdHVyZS4KIAogRmlyc3Qs
IG9uZSBoYXMgdG8gZG93bmxvYWQgdGhlIEFBcmNoNjQgc29mdHdhcmUgc2ltdWxhdG9yIGZyb206
CiAKLSAgaHR0cHM6Ly9hcm1rZWlsLmJsb2IuY29yZS53aW5kb3dzLm5ldC9kZXZlbG9wZXIvRmls
ZXMvZG93bmxvYWRzL2Vjb3N5c3RlbS1tb2RlbHMvRm91bmRhdGlvbl9QbGF0Zm9ybV8xMS4yMF8x
NV9MaW51eDY0LnRnegorICBodHRwczovL2RldmVsb3Blci5hcm0uY29tLy0vbWVkaWEvRmlsZXMv
ZG93bmxvYWRzL2Vjb3N5c3RlbS1tb2RlbHMvRk1fMTFfMjUvRm91bmRhdGlvbl9QbGF0Zm9ybV8x
MS4yNV8xNV9MaW51eDY0LnRnegogCiBUaGVuLCB1c2UgdGhlIGFybV9mb3VuZGF0aW9udjhfZGVm
Y29uZmlnIGNvbmZpZ3VyYXRpb24gdG8gYnVpbGQgeW91cgogQnVpbGRyb290IHN5c3RlbS4KZGlm
ZiAtLWdpdCBhL2NvbmZpZ3MvYXJtX2ZvdW5kYXRpb252OF9kZWZjb25maWcgYi9jb25maWdzL2Fy
bV9mb3VuZGF0aW9udjhfZGVmY29uZmlnCmluZGV4IDEwMmZlOGZkMDkuLjY5MjY2ODk0ZTEgMTAw
NjQ0Ci0tLSBhL2NvbmZpZ3MvYXJtX2ZvdW5kYXRpb252OF9kZWZjb25maWcKKysrIGIvY29uZmln
cy9hcm1fZm91bmRhdGlvbnY4X2RlZmNvbmZpZwpAQCAtMSwxMCArMSwxMSBAQAogQlIyX2FhcmNo
NjQ9eQotIyBMaW51eCBoZWFkZXJzIHNhbWUgYXMga2VybmVsLCBhIDYuMSBzZXJpZXMKLUJSMl9Q
QUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl8xPXkKKyMgTGludXggaGVhZGVycyBz
YW1lIGFzIGtlcm5lbCwgYSA2Ljggc2VyaWVzCitCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURF
UlNfQ1VTVE9NXzZfOD15CitCUjJfR0xPQkFMX1BBVENIX0RJUj0iYm9hcmQvYXJtL2ZvdW5kYXRp
b24tdjgvcGF0Y2hlcyIKIEJSMl9UQVJHRVRfR0VORVJJQ19HRVRUWV9QT1JUPSJ0dHlBTUEwIgog
QlIyX0xJTlVYX0tFUk5FTD15CiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKLUJS
Ml9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMS4xMyIKK0JSMl9MSU5VWF9L
RVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuOC4xMCIKIEJSMl9MSU5VWF9LRVJORUxfVVNF
X0FSQ0hfREVGQVVMVF9DT05GSUc9eQogQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15CiBC
UjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iYXJtL2ZvdW5kYXRpb24tdjgtZ2ljdjMt
cHNjaSIKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
