Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E06C7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 16:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE8E881A65;
	Sun, 19 Mar 2023 16:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE8E881A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FEFfbxNZbPNY; Sun, 19 Mar 2023 16:22:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05F7681A92;
	Sun, 19 Mar 2023 16:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05F7681A92
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECD261BF2F8
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0ADA81A92
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0ADA81A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MmoqQTup8euU for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 16:22:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AEA681A81
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AEA681A81
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 16:22:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0AED0FF804;
 Sun, 19 Mar 2023 16:22:45 +0000 (UTC)
Date: Sun, 19 Mar 2023 17:22:45 +0100
To: Martin =?UTF-8?B?SHVuZGViw7hsbA==?= <martin@geanix.com>
Message-ID: <20230319172245.28df0da7@windsurf>
In-Reply-To: <20230316123653.3648067-1-martin@geanix.com>
References: <20230316123653.3648067-1-martin@geanix.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679242966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lzKm082vo9KfglsZanSnKH/RLLmhp4h+t4bQKZPfY00=;
 b=GGYcOZnGznZUPYHuR/Fcz97Y5KJqX5lB/7A2nhjSh2fN8MgA6C6tCWDrkSf1HeDQNlVfgR
 FaSozkJ7Rg+XtnwkVkCaNW8apQR6FOiA7l+0LEipkcP7JRyay2poADsp13SXJVmE4ki/Td
 t4PSdIYHnVld81p3aiqslT0Sf8If/J1KNX9WcPjbnQt9ppxXhbbNWMv8TnKdU5ynkNuUOB
 SmCk5d5q7/nqbn7wtO4GMIqEVD4I0ZcELN6RurOKOsEOVE63WHlj7pijtQg71yqVeJEwL6
 jYIhrf06aVrYzl6QW+WQq7waPpXWkBng5tk69l0Gyvz1jZ+Y4BSmhkC2R2g+YA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GGYcOZnG
Subject: Re: [Buildroot] [PATCH 1/2] python-apispec: bump to 6.3.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxNiBNYXIgMjAyMyAxMzozNjo1MiArMDEwMApNYXJ0aW4gSHVuZGViw7hsbCA8bWFy
dGluQGdlYW5peC5jb20+IHdyb3RlOgoKPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gSHVuZGViw7hs
bCA8bWFydGluQGdlYW5peC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvcHl0aG9uLWFwaXNwZWMvcHl0
aG9uLWFwaXNwZWMuaGFzaCB8IDQgKystLQo+ICBwYWNrYWdlL3B5dGhvbi1hcGlzcGVjL3B5dGhv
bi1hcGlzcGVjLm1rICAgfCA0ICsrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKVGhvbWFzCi0t
IApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
