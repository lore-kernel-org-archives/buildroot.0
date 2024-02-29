Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1DFC48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 19:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ABD841B72;
	Thu, 29 Feb 2024 19:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U5NQkeuFkRuu; Thu, 29 Feb 2024 19:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 600DD41B7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 600DD41B7F;
	Thu, 29 Feb 2024 19:22:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FC3A1BF3C8
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 19:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A23A60A7C
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 19:22:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MHn9kUte9a_r for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 19:22:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D8603608CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8603608CD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8603608CD
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 19:22:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6E5CB13FA37;
 Thu, 29 Feb 2024 20:22:13 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 29 Feb 2024 20:22:13 +0100
Date: Thu, 29 Feb 2024 20:22:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZeDZZUks-dQSh5Gs@landeda>
References: <20240229131108.363533-1-romain.naour@smile.fr>
 <ZeCIDJkn+SbXgndh@tl-lnx-nyma7486-2>
 <a8fa2870-4d82-48df-b8ef-03c61a1ba81c@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8fa2870-4d82-48df-b8ef-03c61a1ba81c@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709234536;
 bh=UEQAcII/8RfEOYXqfyYEeH9SQ8ml4Y/Sk8hri6vf4IE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HQRBhSi20oqh2bMKySNNo6vybEJsK5m8xxmIgT0t7aU4Xw2XEVkpTBYWo+VR0XHNt
 JBFzUNRb11yjisTjMuC/qgOpndtyH8w4+hZz1e84mborCJ/1AWka5g7dgWh9zl0pFU
 /vxS7WAtgKs8PM+NawjLaeavGaZb0aLEaGyjwhXKerO0QCV17ursHbHKzjW/4pR/kw
 2icL2TL3hGyTVxhd7R9u088zcOTrZRp1fr3xyetIJpts+LSXhsslNLfaO0716YpEya
 2cK1xnN35H43MI/pI1dMkHaY95uT8dadqrfdKUQ3Sf7cZk8pb8SX+eV9LQTUG6oe9l
 q06872k49Cj2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HQRBhSi2
Subject: Re: [Buildroot] [PATCH 1/2] package/rust: use host libraries from
 HOST_DIR
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
Cc: yann.morin@orange.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBBbGwsCgpPbiAyMDI0LTAyLTI5IDE0OjQzICswMTAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IExlIDI5LzAyLzIwMjQgw6AgMTQ6MzUsIHlhbm4ubW9yaW5Ab3JhbmdlLmNv
bSBhIMOpY3JpdMKgOgo+ID4gT24gMjAyNC0wMi0yOSAxNDoxMSArMDEwMCwgUm9tYWluIE5hb3Vy
IHNwYWtlIHRodXNseToKPiA+PiBob3N0LXJ1c3QgcGFja2FnZSBkZXBlbmRzIG9uIHNldmVyYWwg
aG9zdCBwYWNrYWdlcyB0byBwcm92aWRlIHRvb2xzIGFuZAo+ID4+IGxpYnJhcmllcyBidXQgaXQg
ZG9lc24ndCB0YWtlIGludG8gYWNjb3VudCBIT1NUX0RJUiB3aGlsZSBidWlsZGluZyBydXN0Ywo+
ID4+IGNvbXBpbGVyLiBJbmRlZWQsIHJ1c3RjIG5lZWRzIHpsaWIgYW5kIGZhaWwgdG8gbGluayBp
ZiB6bGliIGlzIG5vdAo+ID4+IGluc3RhbGxlZCBvbiB0aGUgaG9zdC4KWy0tU05JUC0tXQo+ID4g
QnV0IHRoZW4sIHdlIHdvdWxkIGFsc28gbmVlZCB0byBhZGQgaG9zdC16bGliIHRvCj4gPiBIT1NU
X1JVU1RfREVQRU5ERU5DSUVTLCBubz8KPiBJbmRlZWQgYnV0IGluIHByYWN0aWNlIGhvc3Qtemxp
YiBpcyBhbHJlYWR5IGFuICJpbmRpcmVjdCIgZGVwZW5kZW5jeSBvZgo+IGhvc3QtcnVzdCBkdWUg
dG8gaG9zdC1vcGVuc3NsIChob3N0LWxpYm9wZW5zc2wpIGRlcGVuZGVuY3kuCgpXaGVuIGEgcGFj
a2FnZSBoYXMgYSBkZXBlbmRlbmN5IG9uIGEgbGlicmFyeSBmb3IgaXRzZWxmLCB3ZSBtdXN0IGFk
ZCBhbgpleHBsaWNpdCBkZXBlbmRlbmN5IGluIHRoYXQgcGFja2FnZSwgZXZlbiBpZiBpdCBpcyB0
cmFuc2l0aXZlbHkgYnJvdWdodApieSBhbm90aGVyLCBsaWtlIGlzIHRoZSBjYXNlIGhlcmUuIFNv
IHdlIGRvIHdhbnQgdGhhdCBob3N0LXJ1c3QgZGVwZW5kcwpvbiBob3N0LXpsaWIgZXhwbGljaXRs
eS4KCj4gICBIT1NUX0xJQk9QRU5TU0xfREVQRU5ERU5DSUVTID0gaG9zdC16bGliCj4gCj4gSSBu
b3RpY2VkIHRoZSBtaXNzaW5nIGRlcGVuZGVuY3kgYnV0IGZvcmdvdCB0byBhZGQgaXQgaW4gSE9T
VF9SVVNUX0RFUEVOREVOQ0lFUy4KCk1hcmsgdGhpcyBwYXRjaCBhcyBDaGFuZ2VzLXJlcXVlc3Rl
ZCwgdGhlbiEgOy0pCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFT
Q0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29m
dHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8
CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAg
ICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8
IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
