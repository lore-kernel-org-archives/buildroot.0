Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74949E748E6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13E4960FE2;
	Sat, 30 Sep 2023 19:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13E4960FE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EeZzZmcJu5S7; Sat, 30 Sep 2023 19:59:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 617E460FDD;
	Sat, 30 Sep 2023 19:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 617E460FDD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94D441BF27A
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0908D80A68
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0908D80A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SO-3fRkETVGe for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:59:43 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2513983ACD
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2513983ACD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 183171C0002;
 Sat, 30 Sep 2023 19:59:40 +0000 (UTC)
Date: Sat, 30 Sep 2023 21:59:40 +0200
To: Sebastian Weyer <sebastian.weyer@smile.fr>
Message-ID: <20230930215940.7644e93c@windsurf>
In-Reply-To: <20230317151802.1242858-1-sebastian.weyer@smile.fr>
References: <20230317151802.1242858-1-sebastian.weyer@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696103981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAkV4tQrTXXYIm7Pf/zGe4FOhT/oKeBpsryTMZhd4QY=;
 b=OFI2aaN4o5be6BQNaGI5gJ/6CWKVpMrl6t3Lh7j5Nd0TtX4jZjcYvV+mfNoSENvZuudKfv
 +CLPhUbvq9+HZGuk8GU+mbjLWe2Oh5rKjm9AzT6K2RcwYW2DGK3+fOZXuO1rdulyZjwa0O
 ctOWU4Hn2P8ydtKp/giQbWGT/0VTLy9etvSs+HH7LOxO/IjTthA8rB7mptwvnJtbHh/fgP
 lfu4QIby8aVJUJx+IBlo/9YKVww1U+1aHZPiqmb+RGSnxd1skvK3HIyPp1o+wgAHhIRaCf
 pPA3TMBRtxpYTZjyncc6YShKDXUKZQZ4hfc3rMjGcjDAv1gb/iN0D2H6H0phew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OFI2aaN4
Subject: Re: [Buildroot] [PATCH v3 1/2] package/uutils-coreutils: new package
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
Cc: antoine.coutant@smile.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAxNyBNYXIgMjAyMyAxNjoxODowMCArMDEwMApTZWJhc3RpYW4gV2V5ZXIgPHNlYmFz
dGlhbi53ZXllckBzbWlsZS5mcj4gd3JvdGU6Cgo+IFRoaXMgcGFja2FnZSBpcyBhbiBpbXBsZW1l
bnRhdGlvbiBvZiBjb3JldXRpbHMgd3JpdHRlbiBjb21wbGV0ZWx5IGluIHJ1c3QuCgpUaGFua3Mg
Zm9yIHRoaXMgcGF0Y2guIFVuZm9ydHVuYXRlbHksIGl0IGRvZXNuJ3QgYnVpbGQuIFRlc3RlZCBv
biBBUk0sCml0IGZhaWxzIHdpdGg6CgpUaGUgZm9sbG93aW5nIHdhcm5pbmdzIHdlcmUgZW1pdHRl
ZCBkdXJpbmcgY29tcGlsYXRpb246Cgp3YXJuaW5nOiBhcm0tbGludXgtZysrLmJyX3JlYWw6IGVy
cm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5lIG9wdGlvbiDigJgtbTY04oCZCgplcnJvcjog
ZmFpbGVkIHRvIHJ1biBjdXN0b20gYnVpbGQgY29tbWFuZCBmb3IgYHV1X3N0ZGJ1Zl9saWJzdGRi
dWYgdjAuMC4yMSAoL2hvbWUvdGhvbWFzL3Byb2pldHMvYnVpbGRyb290L291dHB1dC9idWlsZC91
dXRpbHMtY29yZXV0aWxzLTAuMC4yMS9zcmMvdXUvc3RkYnVmL3NyYy9saWJzdGRidWYpYAoKQ2F1
c2VkIGJ5OgogIHByb2Nlc3MgZGlkbid0IGV4aXQgc3VjY2Vzc2Z1bGx5OiBgL2hvbWUvdGhvbWFz
L3Byb2pldHMvYnVpbGRyb290L291dHB1dC9idWlsZC91dXRpbHMtY29yZXV0aWxzLTAuMC4yMS90
YXJnZXQvcmVsZWFzZS9idWlsZC91dV9zdGRidWZfbGlic3RkYnVmLWE3NzY1NGQxNDY4OWVkYWIv
YnVpbGQtc2NyaXB0LWJ1aWxkYCAoZXhpdCBzdGF0dXM6IDEpCgpTbywgc29tZSBDKysgY29kZSBn
ZXRzIGJ1aWx0IHdpdGggQVJNIGNyb3NzLWNvbXBpbGVyLCBidXQgd2l0aCBhIC1tNjQKb3B0aW9u
IHRoYXQgZG9lc24ndCBtYWtlIHNlbnNlIG9uIEFSTS4KCk5vdGU6IGl0IGZhaWxlZCB3aXRoIDAu
MC4xNyB3aGljaCB3YXMgdXNlZCBpbiB5b3VyIHBhdGNoLCBzbyBJIHVwZGF0ZWQKdG8gMC4wLjIx
IChhcyB5b3UgY2FuIHNlZSBpbiB0aGUgbG9nIGFib3ZlKSwgYnV0IGl0IGZhaWxzIGluIGEgc2lt
aWxhcgp3YXkuCgpBbHNvLCB5b3VyIHBhdGNoIHdpbGwgaGF2ZSB0byBiZSB1cGRhdGVkIGZvciAw
LjAuMjEsIGFuZCBJIHRoaW5rIHlvdXIgMgpwYXRjaGVzIGNhbiBiZSBjb21iaW5lZCBpbnRvIG9u
ZSBieSBjaGFuZ2luZzoKCmluc3RhbGw6IGJ1aWxkIG1hbnBhZ2VzIGNvbXBsZXRpb25zCgp0byBq
dXN0OgoKaW5zdGFsbDoKCkNvdWxkIHlvdSBoYXZlIGEgbG9vaywgYW5kIHNlbmQgYW4gdXBkYXRl
ZCBwYXRjaD8KClRoYW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290
bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGlu
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
