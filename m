Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571DD606A329
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 17:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kfKPHpxZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F81080DC3;
	Tue, 24 Nov 2026 17:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_V6XW0m5DbA; Tue, 24 Nov 2026 17:45:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4498580C86
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795542326;
	b=bwAwFXbsGB9Tt/Yk1H4srM//Mc3nriBKTdb6v0KWEv3qsZc3YJ1IIPkZIa/+bccCqXGR
	 SAgZF8wDzkJ0Ea6PCO/0q0phZ2i5b7ecphMObWnongPl32apzo7XCUhWuu2zrnAh8cv4C
	 jZ2+0I5lbOweMZAf+VY8pMTRbKEdytYLcNkf6z98zhTwei4MXJZT75cKGN7JF4SETZ2pM
	 ZK/7EsmEIgIZ21Vrgt02DYu7XXJhuAm67JTcakPb8sJGk/8vNNgAuM9OCpb6X9H2ONuqN
	 zviO+mASmGFQDPFmDyBVtBSMk31o/yEOOiOq8AnUOv3UeoCyTgFCTBqC6isn33SjnaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795542326;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:In-Reply-To:References:
	 Organization:X-Mailer:MIME-Version:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=scYQY1UVSudVlA6fvT1qnrAlI8ncZfrFixGGyi5iqeI=;
	b=O8rjlyzBxnSA+iq1NbEvg8KonbRQ5lOkmXEWGxDYI+Zg6ttBLnUFXzO3Q3L3pwUH8uG/
	 ldv5yVaGbNtASVo8GEp5NRiUlFaUM4FzZy02478vik05endL5GW6sYI25gimvn8eIyURU
	 fUtaFEAYgvLCFu4yrr3I9+U0bwhtPur9aZT3X+57uCjaqKWE4Ng6XpUbzd7wVGFK/oUJV
	 UQcNVPNEtO2FTqwYcEIMVNxjxQZR/XoGcZ4qzFQsHIMkdIfA+7p/CB71mecRW5qL/gN1j
	 5be8wegLN/iDOnru4p5Em9vVYFW1CeVTzoN8J6h9i5u6Asi41wBfeW0ss0fLR2QivVw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795542326;
	bh=scYQY1UVSudVlA6fvT1qnrAlI8ncZfrFixGGyi5iqeI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kfKPHpxZ+qM0Hh7fs98pfbocpzvdmm85uj9VB/9rSSVpe4KagJfJS684pknFNxgb7
	 Lr/lt467KP22igcwZeCAwD+itbRTc3Ykf9iPf74yA+qsiWBuKEh7ikdbLGNbyyHgvo
	 2Hwm9+N721qydO4xfzKV7XjXIh2uJWeaJoaTMXN55mZSqUHBwaJ36AGlqXQtfE/S1k
	 qbnDZdirUDRFmZDkFZABDbH6EmjCdXY0LGXlT3gkVVdlBsxNMsoZjlkWHFv4/N3lJm
	 hTwNF1OwiUzFLHQ7tVhDmVOzHqAgyxhPVW2+rUl0S6lMfBlDX+ZJXzJIvfRXawNbQT
	 JNHoWii96N2FQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4498580C86;
	Tue, 24 Nov 2026 17:45:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B7191C9
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F66B80C86
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3wgfieKfb7N for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 17:45:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AB3BE80C7E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=herve.codina@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB3BE80C7E
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:45:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6F390C2C678
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:45:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CFA66601E1;
 Tue, 24 Nov 2026 17:45:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C85FC11E69AD3; Tue, 24 Nov 2026 18:45:16 +0100 (CET)
Date: Tue, 24 Nov 2026 18:45:15 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <20261124184515.55fe2395@bootlin.com>
In-Reply-To: <20261124172411.1613844-1-giulio.benetti@benettiengineering.com>
References: <20261124172411.1613844-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libfutils: fix build with gcc >= 16
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgR2l1bGlvLAoKT24gVHVlLCAyNCBOb3YgMjAyNiAxODoyNDoxMSArMDEwMApHaXVsaW8gQmVu
ZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cgo+IEFU
T01JQ19WQVJfSU5JVCgpIGhhcyBiZWVuIHJlbW92ZWQgaW4gQzIzLCBzbyB3aXRoIGdjYyA+PSAx
NiB0aGUgYnVpbGQKPiBmYWlscyB3aXRoOgo+IAo+IHNyYy9yYW5kb20uYzozMzg6MzE6IGVycm9y
OiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnQVRPTUlDX1ZBUl9JTklUJzsgZGlk
IHlvdSBtZWFuICdBVE9NSUNfRkxBR19JTklUJz8gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFy
YXRpb25dCj4gCj4gU28gbGV0J3MgYWRkIGEgbG9jYWwgcGF0Y2ggdGhhdCBpbml0aWFsaXplcyB0
aGUgYXRvbWljIHZhcmlhYmxlCj4gZGlyZWN0bHkuCj4gCj4gRml4ZXM6Cj4gaHR0cHM6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzgxOS84MTk1YzQwYzgyNmUxYjg1Y2VkMmFlYzVk
MWU4NzA1NTQyYTgyYzkzLwo+IAo+IENvLUF1dGhvcmVkLUJ5OiBDbGF1ZGUgT3B1cyA1LjUgPG5v
cmVwbHlAYW50aHJvcGljLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1
bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPiAtLS0KPiAgLi4uMDEtcmFuZG9t
LWRyb3AtQVRPTUlDX1ZBUl9JTklULXVzYWdlLnBhdGNoIHwgNDcgKysrKysrKysrKysrKysrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9saWJmdXRpbHMvMDAwMS1yYW5kb20tZHJvcC1BVE9NSUNfVkFSX0lOSVQtdXNh
Z2UucGF0Y2gKClJldmlld2VkLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGlu
LmNvbT4KCkJlc3QgcmVnYXJkcywKSGVydsOpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
