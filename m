Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A10FC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 12:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B574280DB6;
	Sun, 18 May 2025 12:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYCJ8Ou1flQF; Sun, 18 May 2025 12:11:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6D5080CD2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6D5080CD2;
	Sun, 18 May 2025 12:11:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CAC3C1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBF4940BDC
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VaBHFj-KuS9y for <buildroot@buildroot.org>;
 Sun, 18 May 2025 12:11:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E748F40142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E748F40142
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E748F40142
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:11:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B65281C0FAC; Sun, 18 May 2025 14:11:36 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Arnout Vandecappelle <arnout@rnout.be>
Date: Sun, 18 May 2025 14:11:28 +0200
Message-ID: <20250518121131.2821530-1-arnout@rnout.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747570297; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=lCyvm/kQ9mOhijVdFwnU8CPM1rDEnKJZZFH7Ig+TRXw=;
 b=DKZRKZvRlRgT4/oEIjkMbmEVC7eMElc1ImF84WsSs36AF5BjfEsfQGmWjWRhluRDa+eQ7q
 xBgfCkMVvrVSJvaq7G/t41xICFrozKSHpxVxoeQVT0nhvd1fEgxUGT1oEkb7tp4JiGz+rN
 rjuzQn+lI1YtHssTlVbiY6lDWYtjIZIdEQF+8n/UdRWJJkqETHepkfl8xbfb2VHQEKLG8w
 0syDoxThq5rtKw+G4pQAhT36IohQSoGgqjv6mvIpgSFbVidtseAmgF+lcWHocrGWfZiePO
 eaSwPLRnUxQpoN84LNa3tMHPZQu1G0A2kd8rZianURe8A1ZiSy2ePEayO2yg4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=DKZRKZvR
Subject: [Buildroot] [PATCH 0/3] Remaining fixes for qt5webengine
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBsaXR0bGUgc2VyaWVzIGhhcyByZW1haW5pbmcgZml4ZXMgZm9yIFF0NVdlYkVuZ2luZSwg
YWZ0ZXIgYXBwbHlpbmcgYWxsCnRoZSBmaXhlcyBmcm9tIEdhZcyIbC4KClRoZSBmaXJzdCBwYXRj
aCB3b3JrcyBhcm91bmQgYW4gaXNzdWUgd2l0aCB0aHVtYiBkZXRlY3Rpb24uIEl0IGlzIGtpbmQg
b2YgYQpoYWNrLCBidXQgdGhlIHRodW1iIGRldGVjdGlvbiBsb2dpYyBpcyBhbnl3YXkgYSBoYWNr
LiBCZWNhdXNlIGl0IGlzIHNvIGlmZnkKSSBoYXZlbid0IHN1Ym1pdHRlZCBpdCB1cHN0cmVhbS4K
ClRoZSBvdGhlciB0d28gcGF0Y2hlcyBmaXggaXNzdWVzIHdpdGggaG9zdCBHQ0MgMTUsIG9uZSBp
biBxdDVkZWNsYXJhdGl2ZSwgdGhlCm90aGVyIGluIHF0NXdlYmVuZ2luZS1jaHJvbWl1bS4KCkl0
IGhhcyBvbmx5IGJlZW4gYnVpbGQtdGVzdGVkLCBub3QgcnVudGltZSB0ZXN0ZWQuIEkndmUgdGVz
dGVkIHRoZSBmb2xsb3dpbmcKY29uZmlndXJhdGlvbnMsIGFsbCBvbiBhIEZlZG9yYSA0MiBidWls
ZCBzZXJ2ZXI6Ci0gcmFzcGJlcnJ5cGkzX3F0NXdlX2RlZmNvbmZpZwotIGFub3RoZXIgMzItYml0
IEFSTSBjb25maWcgd2l0aCBtZXNhL2V0bmF2aXYgYW5kIGEgQm9vdGxpbiB0b29sY2hhaW4KLSBh
IDY0LWJpdCBBUk0gY29uZmlnIHdpdGggbWVzYS9ldG5hdml2IGFuZCBhIEJvb3RsaW4gdG9vbGNo
YWluCgpBcm5vdXQgVmFuZGVjYXBwZWxsZSAoMyk6CiAgcGFja2FnZS9xdDUvcXQ1ZGVjbGFyYXRp
dmU6IGZpeCBidWlsZCB3aXRoIEdDQyAxNQogIHBhY2thZ2UvcXQ1L3F0NXdlYmVuZ2luZS1jaHJv
bWl1bTogZml4IGJ1aWxkIHdpdGggaG9zdCBHQ0MgMTUKICBwYWNrYWdlL3F0NS9xdDV3ZWJlbmdp
bmU6IGZpeCB0aHVtYiBkZXRlY3Rpb24gbG9naWMKCiAuLi4vMDAwMy1JbmNsdWRlLWNzdGRpbnQt
Zm9yLXVpbnRwdHJfdC5wYXRjaCAgfCAgNTAgKysrKysrKysrCiAuLi5kZS1jc3RkaW50LWZvci11
aW50cHRyX3QtdWludDhfdC1ldGMucGF0Y2ggfCAxMDEgKysrKysrKysrKysrKysrKysrCiAuLi5t
b3ZlLXNvbWUtb2YtdGhlLXRodW1iLWRldGVjdGlvbi1sb2cucGF0Y2ggfCAgNjkgKysrKysrKysr
KysrCiAzIGZpbGVzIGNoYW5nZWQsIDIyMCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9xdDUvcXQ1ZGVjbGFyYXRpdmUvMDAwMy1JbmNsdWRlLWNzdGRpbnQtZm9yLXVp
bnRwdHJfdC5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcXQ1L3F0NXdlYmVuZ2lu
ZS1jaHJvbWl1bS8wMDEyLUluY2x1ZGUtY3N0ZGludC1mb3ItdWludHB0cl90LXVpbnQ4X3QtZXRj
LnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9xdDUvcXQ1d2ViZW5naW5lLzAwMDMt
Y29uZmlndXJlLnByaS1yZW1vdmUtc29tZS1vZi10aGUtdGh1bWItZGV0ZWN0aW9uLWxvZy5wYXRj
aAoKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
