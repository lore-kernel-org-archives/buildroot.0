Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B39C02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 17:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F190041419;
	Wed, 22 Jan 2025 17:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MEkCl4Lmx6oZ; Wed, 22 Jan 2025 17:05:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB0DC4141B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB0DC4141B;
	Wed, 22 Jan 2025 17:05:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A62E959
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 17:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28A5083EFA
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 17:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5R2d9TzEc0IE for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 17:05:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 30E4D83F00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30E4D83F00
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30E4D83F00
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 17:05:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E6C960003;
 Wed, 22 Jan 2025 17:05:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1taeAS-009BAK-1J;
 Wed, 22 Jan 2025 18:05:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent =?utf-8?Q?Stehl=C3=A9?= via buildroot <buildroot@buildroot.org>
Cc: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@laposte.net>,  Alistair
 Francis <alistair@alistair23.me>
References: <20250118143332.27240-1-vincent.stehle@laposte.net>
Date: Wed, 22 Jan 2025 18:05:28 +0100
In-Reply-To: <20250118143332.27240-1-vincent.stehle@laposte.net> ("Vincent
 =?utf-8?Q?Stehl=C3=A9?= via buildroot"'s message of "Sat, 18 Jan 2025
 15:33:32 +0100")
Message-ID: <87plkelqxz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/xen: fix build for gcc 14 and
 aarch64
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

Pj4+Pj4gIlZpbmNlbnQiID09IFZpbmNlbnQgU3RlaGzDqSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gQmFja3BvcnQgdHdvIGNvbW1pdHMgZnJvbSB1
cHN0cmVhbSBYZW4gdG8gZml4IHRoZSBidWlsZCBmb3IgQUFyY2g2NCB3aXRoCiA+IGdjYyAxNC4K
CiA+IFRoaXMgcmVwYWlycyB0ZXN0cy5wYWNrYWdlLnRlc3RfeGVuLlRlc3RYZW4sIHdoaWNoIHVz
ZXMgYW4gZXh0ZXJuYWwKID4gQUFyY2g2NCB0b29sY2hhaW4gdGhhdCBoYXMgYmVlbiByZWNlbnRs
eSB1cGdyYWRlZCB0byBnY2MgMTQuCgogPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kg
PHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0PgogPiBDYzogQWxpc3RhaXIgRnJhbmNpcyA8YWxp
c3RhaXJAYWxpc3RhaXIyMy5tZT4KCkNvbW1pdHRlZCB0byAyMDI0LjExLngsIHRoYW5rcy4KCi0t
IApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
