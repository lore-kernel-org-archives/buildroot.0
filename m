Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C9AC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 21:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5333560B70;
	Wed,  2 Nov 2022 21:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5333560B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cfMkpNZXvW1F; Wed,  2 Nov 2022 21:05:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E731607B0;
	Wed,  2 Nov 2022 21:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E731607B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B2B31BF2FA
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 21:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7DD1408F2
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 21:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7DD1408F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ewdYqfN1i4Y for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 21:05:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B906E400D0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B906E400D0
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 21:05:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B2F4A60009;
 Wed,  2 Nov 2022 21:05:45 +0000 (UTC)
Date: Wed, 2 Nov 2022 22:05:44 +0100
To: =?UTF-8?B?U8OpYmFzdGllbg==?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <20221102220544.37cde23a@windsurf>
In-Reply-To: <20221013085733.4973-1-sebastien.szymanski@armadeus.com>
References: <20221013085733.4973-1-sebastien.szymanski@armadeus.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667423146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRot4IOkuMCmexENmcK4xRJnlNOe826fro/f7m9pp5I=;
 b=FKVLr60+btqB2W0LlPsSh7dyxYkzPp6kcX6WIuCOumPJrtlPmnnXkzUm0zk/Z956qAHACQ
 Ke542k6g+NGdzD1XE7ZhW0JJegquA1Eg7P6I65PswYmjSOEAMkfpIw/L/cEcknPhDlrBrh
 /gWZZiBejsoRwfsTT7ZQ8yA8l7dQ0moJw5Tqdz3xEWxDdw4n3BX+y2e+3SwIGo3V7aEFKw
 m/lrnqWanuFauWg5X957hTljgiLHGgTiwrpeGvZlmZPmueXPQyG7ZjMA+XxOmV5Zl1KefG
 WIm13Ztn3dJjiT2YZ5050Wfb8pvBVphGHlbLcP+qhIDmcWYnFdqnfZAm2WJQ9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FKVLr60+
Subject: Re: [Buildroot] [PATCH v2 1/1] package/mmc-utils: bump to version
 dfc3b6ecda84d21418fb4408b39c5c71db4c6458
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxMyBPY3QgMjAyMiAxMDo1NzozMyArMDIwMApTw6liYXN0aWVuIFN6eW1hbnNraSA8
c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+IHdyb3RlOgoKPiBEcm9wIGZpcnN0IHBh
dGNoLCB1cHN0cmVhbWVkOgo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS91dGlscy9t
bWMvbW1jLXV0aWxzLmdpdC9jb21taXQvP2lkPTUyMGY1NGViOTQ4NDVlNTk3ODM3YWU5MDhhMDNi
OTFhZThjODc1OGYKPiAKPiBEZXBlbmRzIG9uIGtlcm5lbCBoZWFkZXJzID49IDQuNCBmb3Igc3Ry
dWN0IG1tY19pb2NfbXVsdGlfY21kCj4gCj4gRml4ZXM6IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRy
b290Lm5ldC9yZXN1bHRzLzAxZjc4MDgxYTUwNzQzZDFmYWE1MGEwOTBjMDBiN2U5MGExN2ZhMzkK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1h
bnNraUBhcm1hZGV1cy5jb20+Cj4gLS0tCgpJdCdzIGEgYml0IGFubm95aW5nIHRvIGhhdmUgdGhl
IGRlcGVuZGVuY3kgYnVtcGVkIHRvIExpbnV4IDQuNCwgYXMKbW1jLXV0aWxzIGNhbiBwb3RlbnRp
YWxseSBiZSB1c2VkIGJ5IHBlb3BsZSBydW5uaW5nIG9sZGVyIGtlcm5lbHMuIEJ1dAp3ZWxsLCBs
ZXQncyBzZWUgaWYgcGVvcGxlIGNvbXBsYWluIGFib3V0IHRoaXMsIHNvIEkndmUgYXBwbGllZCBh
cy1pcy4KVGhhbmtzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29t
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
