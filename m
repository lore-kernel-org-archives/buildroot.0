Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4746ECA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 18:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3D5E61713;
	Fri, 29 Aug 2025 18:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CK382psJXVlt; Fri, 29 Aug 2025 18:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 356E7616AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 356E7616AB;
	Fri, 29 Aug 2025 18:43:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C1FD61F4
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 18:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8904615E8
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 18:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-PypVpMRTSv for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 18:43:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0A0486134B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A0486134B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A0486134B
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 18:43:08 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -334554956; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 18:43:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1us441-00CzgX-1v;
 Fri, 29 Aug 2025 20:43:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Bernd Kuhls
 <bernd@kuhls.net>
References: <20250829161345.2218058-1-thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 20:43:05 +0200
In-Reply-To: <20250829161345.2218058-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Fri, 29 Aug 2025 18:13:44
 +0200")
Message-ID: <87a53ige9y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=jcG6iK+/P3rUSbXfRKtGpRS3toReLXIbSII8pmxCBVh0X7HvgBLSjKcRIVZ9iKqLlMcJVN/IDwzBxMtfChkCv5vgPtwgd8+zgref9IbDUlTXezj5lRe773oFGhErnA/zyg9o33kIldYOTLlmg5NkVygMT1SV7RGUqy+J1SOrzghJGIBm04YnptFqtCzL/GDm6BcoqLNXpSpM23pGycnTCJLGs+4O6MthgPD54AtKFRGNoXKusD23Te4Q/6Kos9b2bOtJH+8B3RQYtM9XPSdSmXq7mtACUgvN+v+01iDsJ2Fi4YD1FyPXidrBxRIckFjC6S1l7Whk3JzdJTn5hn9PNw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=CIAwZAEtELrMSDVojwh0raehN2rFaSYi+nMeHy5auoA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=jcG6iK+/
Subject: Re: [Buildroot] [PATCH] package/libfreeglut: fix build with GCC 15.x
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

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gRml4ZXM6CiA+IC9ob21lL3Rob21hcy9idWls
ZHJvb3QvYnVpbGRyb290L291dHB1dHMvYWxsL2J1aWxkL2xpYmZyZWVnbHV0LTMuNC4wL3NyYy94
MTEvZmdfaW5pdF94MTEuYzoyOTc6NjogZXJyb3I6IGNvbmZsaWN0aW5nIHR5cGVzIGZvciDigJhm
Z1BsYXRmb3JtRGVzdHJveUNvbnRleHTigJk7IGhhdmUg4oCYdm9pZChTRkdfUGxhdGZvcm1EaXNw
bGF5LCAgc3RydWN0IF9fR0xYY29udGV4dFJlYyAqKeKAmSB7YWthIOKAmHZvaWQoc3RydWN0IHRh
Z1NGR19QbGF0Zm9ybURpc3BsYXksICBzdHJ1Y3QgX19HTFhjb250ZXh0UmVjICop4oCZfQogPiAg
IDI5NyB8IHZvaWQgZmdQbGF0Zm9ybURlc3Ryb3lDb250ZXh0ICggU0ZHX1BsYXRmb3JtRGlzcGxh
eSBwRGlzcGxheSwgU0ZHX1dpbmRvd0NvbnRleHRUeXBlIE1Db250ZXh0ICkKCiA+IE5vIGF1dG9i
dWlsZGVyIGZhaWx1cmVzIGZvciB0aGlzIGlzc3VlLgoKID4gU2lnbmVkLW9mZi1ieTogVGhvbWFz
IFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KCkNvbW1pdHRlZCwgdGhh
bmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
