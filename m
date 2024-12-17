Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE59E7717F
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 14:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27245610BD;
	Tue, 17 Dec 2024 14:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1BfSX1WAQ9L4; Tue, 17 Dec 2024 14:14:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 445FB610C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 445FB610C5;
	Tue, 17 Dec 2024 14:14:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F53BC5
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 14:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2083C4131A
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 14:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FB-QlKtMpdfS for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 14:14:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02A1E4130D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02A1E4130D
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02A1E4130D
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 14:14:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39A31497;
 Tue, 17 Dec 2024 06:15:19 -0800 (PST)
Received: from localhost.localdomain (X72Y076X74.nice.Arm.com [10.34.111.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 1FE863F58B; Tue, 17 Dec 2024 06:14:49 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Julien Olivain <ju.o@free.fr>, Suniel Mahesh <sunil@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 17 Dec 2024 15:14:43 +0100
Message-ID: <20241217141443.3381247-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH] board/pine64/rockpro64: add TF-A hash
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
Z25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KQ2M6
IFN1bmllbCBNYWhlc2ggPHN1bmlsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgpDYzogSmFnYW4gVGVr
aSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+CkNjOiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlv
LmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KLS0tCgpIaSwKClRoaXMgaXMgdG8gZm9s
bG93LXVwIHdpdGggdGhlIGRpc2N1c3Npb24gd2l0aCBKdWxpZW4gb24gVEYtQS4gWzFdCkkgZGlk
IGJ1aWxkIHRlc3QgaXQgb2suCgpCZXN0IHJlZ2FyZHMsClZpbmNlbnQuCgpbMV0gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyNC1EZWNlbWJlci83Njkx
MjUuaHRtbAoKIC4uLi9wYXRjaGVzL2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZp
cm13YXJlLmhhc2ggICAgICB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9waW5lNjQvcm9ja3BybzY0L3BhdGNoZXMvYXJtLXRy
dXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUuaGFzaAoKZGlmZiAtLWdpdCBhL2Jv
YXJkL3BpbmU2NC9yb2NrcHJvNjQvcGF0Y2hlcy9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1
c3RlZC1maXJtd2FyZS5oYXNoIGIvYm9hcmQvcGluZTY0L3JvY2twcm82NC9wYXRjaGVzL2FybS10
cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLmhhc2gKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uOGI3N2UxZjE2NQotLS0gL2Rldi9udWxsCisrKyBiL2Jv
YXJkL3BpbmU2NC9yb2NrcHJvNjQvcGF0Y2hlcy9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1
c3RlZC1maXJtd2FyZS5oYXNoCkBAIC0wLDAgKzEsMiBAQAorIyBMb2NhbGx5IGNhbGN1bGF0ZWQK
K3NoYTI1NiAgYzBmMjNjY2M3MWM0OTk4OWU5YWQyMzhhY2YzMzQ0NzNjMTdiN2M4OGY3OWEyMGM4
MjljM2Q0NDNlMzc5NGEyMiAgYXJtLXRydXN0ZWQtZmlybXdhcmUtdjIuMTEtZ2l0NC50YXIuZ3oK
LS0gCjIuNDUuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
