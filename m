Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1A6E7717F
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 14:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14D5F41301;
	Tue, 17 Dec 2024 14:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6ArQJ-AyDXJ; Tue, 17 Dec 2024 14:14:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB0744130D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB0744130D;
	Tue, 17 Dec 2024 14:14:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 324E0C5
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 14:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13442412F8
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 14:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gK8_FT7N1Z9m for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 14:14:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C15FE41301
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C15FE41301
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id C15FE41301
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 14:14:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F06A6497;
 Tue, 17 Dec 2024 06:15:01 -0800 (PST)
Received: from localhost.localdomain (X72Y076X74.nice.Arm.com [10.34.111.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 637BB3F58B; Tue, 17 Dec 2024 06:14:33 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue, 17 Dec 2024 15:14:29 +0100
Message-ID: <20241217141429.3381228-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH] board/arm/fvp-ebbr: add TF-A hash
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

V2UgaGF2ZSBubyBtb3JlIGhhc2ggZmlsZSBmb3IgVEYtQSB2Mi4xMSBpbiB0aGUgcGFja2FnZSBk
aXJlY3Rvcnkgc2luY2UKY29tbWl0IDI0NjE1ZDE1MDJlMiAoImJvb3QvYXJtLXRydXN0ZWQtZmly
bXdhcmU6IGJ1bXAgdG8gdjIuMTIiKTsgYWRkCm9uZSBpbiBvdXIgZ2xvYmFsIHBhdGNoZXMgZGly
ZWN0b3J5LgoKVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmc6CgogIFdBUk5JTkc6IG5v
IGhhc2ggZmlsZSBmb3IgYXJtLXRydXN0ZWQtZmlybXdhcmUtdjIuMTEtZ2l0NC50YXIuZ3oKClNp
Z25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KLS0t
CgpIaSwKClRoaXMgaXMgdG8gZm9sbG93LXVwIHdpdGggb3VyIGRpc2N1c3Npb24gb24gVEYtQS4g
WzFdCkkgZGlkIGJ1aWxkIHRlc3QgaXQgb2suCgpCZXN0IHJlZ2FyZHMsClZpbmNlbnQuCgpbMV0g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyNC1EZWNl
bWJlci83NjkxMjUuaHRtbAoKIC4uLi9wYXRjaGVzL2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10
cnVzdGVkLWZpcm13YXJlLmhhc2ggICAgICB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9hcm0vZnZwLWViYnIvcGF0Y2hlcy9h
cm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoCgpkaWZmIC0tZ2l0
IGEvYm9hcmQvYXJtL2Z2cC1lYmJyL3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRy
dXN0ZWQtZmlybXdhcmUuaGFzaCBiL2JvYXJkL2FybS9mdnAtZWJici9wYXRjaGVzL2FybS10cnVz
dGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMC4uOGI3N2UxZjE2NQotLS0gL2Rldi9udWxsCisrKyBiL2JvYXJk
L2FybS9mdnAtZWJici9wYXRjaGVzL2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZp
cm13YXJlLmhhc2gKQEAgLTAsMCArMSwyIEBACisjIExvY2FsbHkgY2FsY3VsYXRlZAorc2hhMjU2
ICBjMGYyM2NjYzcxYzQ5OTg5ZTlhZDIzOGFjZjMzNDQ3M2MxN2I3Yzg4Zjc5YTIwYzgyOWMzZDQ0
M2UzNzk0YTIyICBhcm0tdHJ1c3RlZC1maXJtd2FyZS12Mi4xMS1naXQ0LnRhci5negotLSAKMi40
NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
