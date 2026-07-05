Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70960C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 12:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A8E96070A;
	Sun,  5 Jul 2026 12:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLkCRdsvW0Rx; Sun,  5 Jul 2026 12:48:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A2CC606E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783255702;
	bh=kvkLReQk+0d0+IQ9zKSvV2XH6aACu7rr7c//b+iNDiI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KW6svDwBtSQcC4QGFTq6sDvTuma9ICLehfLMr0hd07ajXU8yMqXD5O9frkELQoMli
	 u9erLh/6R5KEGfsVdxtzEsimpMkT/Phs3JIogj5aeqTzhr5xqcKB6uO5fdOHcGtM4d
	 etCdzf/fVK1s88+4HyS4009+SeZ1kGs4psXAhbibdztZJsbnSU8QvqbURFjOYBoKIn
	 N0NOv1Zunrcci/JkrrX/Nl2qnVHIe6s72y16N2b29qjI+IaLJtZ0cfqNkoAhOAnUWD
	 vM2WeN8JZ1NO5rVHCgnYdiVw75mDgSr8JafPYgwK8Kk/235tvLxpI9FDq+yB9kHSbX
	 JK+oOHqL3zxHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A2CC606E3;
	Sun,  5 Jul 2026 12:48:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 47AB0F2
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 12:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D7EE606FD
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 12:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id un917BlD-h5x for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 12:48:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 09C6E60617
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09C6E60617
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09C6E60617
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 12:48:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id AF83219F5C2;
 Sun,  5 Jul 2026 14:48:15 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jul 2026 14:48:15 +0200
MIME-Version: 1.0
Date: Sun, 05 Jul 2026 14:48:15 +0200
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>
In-Reply-To: <20260617-pmem-v1-1-bac54881145c@arm.com>
References: <20260617-pmem-v1-0-bac54881145c@arm.com>
 <20260617-pmem-v1-1-bac54881145c@arm.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <12dcd6647d67dbcaf533b8f38aecf2c6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783255698;
 bh=vYedfkCI9JFS1CufQzKYaMVAx7KdgaOtnQotvJp/Lgk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XCIEYRDUIXURHJkah3Dqt0oKz3tUyC/F1TuTiSvpWZ13Lqd1Dr/Gs4kc+8bYl35Lh
 IJFdYkMZfsueASN8ityMC7MC/hVuVs0lhVQaON61qsLDr4M6TL55hmVTzQPJCsu6Q5
 Ze/C4eMJmQU/jOS6Pv5Xl9rBBvwzSEjOHgX8YdGYSdgVhnhfiL/rziF8hZZv/w/onv
 2hxBH+ITbYWXOsA+q9DMrtmPCnr6uE2/Rbzyis0G0qLMnjFxFbudXviquYU8AP/Vn5
 sR3PIhIiqrZ4H4J5ywD9Vd4CHkoQiwqa92kdX24atyik+EITSRfFnDwh95p1o1r3pB
 J4BW3KsaIszNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XCIEYRDU
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/2=5D_DEVELOPERS=3A_add_Vincent_?=
 =?utf-8?q?Stehl=C3=A9_for_aarch64-efi_files?=
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTcvMDYvMjAyNiAxOToxMCwgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IFNpZ25lZC1vZmYt
Ynk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiBDYzogRGljayBP
bHNzb24gPGhpQHNlbnppbGxhLmlvPgoKU2VyaWVzIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3Mu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
