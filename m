Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210ECC0218D
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 21:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA7A180FC6;
	Sun, 26 Jan 2025 21:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XY84xGf4BfAZ; Sun, 26 Jan 2025 21:39:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C071781029
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C071781029;
	Sun, 26 Jan 2025 21:39:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5099894A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 21:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DE4A40453
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 21:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXFH56-va2tx for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 21:39:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C8F334013D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8F334013D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8F334013D
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 21:39:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2FD3E13F86E;
 Sun, 26 Jan 2025 22:39:31 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:57764])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Jan 2025 22:39:31 +0100
MIME-Version: 1.0
Date: Sun, 26 Jan 2025 22:39:31 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>
In-Reply-To: <20250126173402.24273-2-vincent.stehle@laposte.net>
References: <20250126173402.24273-1-vincent.stehle@laposte.net>
 <20250126173402.24273-2-vincent.stehle@laposte.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <5f77a29ddeb37e4818b42356002815b0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737927573;
 bh=nWZJh9NhEsWX8RJ2fSPOv98Dhpp04G2bjkY/FGA1Q/U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pzZZ3qaBrYVh/jH2YNAdl8g2yIs/uVudzrmrfYEun9MsX8SqujANNG22Mf4HydPiY
 TnJiArBmsejyRD7x0IF4caK5B9tGlJDji03katmq+EhlGpzgq7ZN9DPGhhazsX0eWS
 hKgqkqbSJKvBFUPUgEx6dDGZoa3vSyDKBx86LMmASn8ZLqh+yQcw0VBy864cmiXAjw
 5vRgMSE3OiZHOR71kEwoYn3bWxN5K86hrNLte6Yl7sEyz6M6M8k+j8TRwtTORqMtss
 qgjPUcDss0JJK394C6rQJB+WyianqD8uhItGmN06wgY1CM7RBKgDPLHOFcsAyx7yzE
 ClCRWABi2IyRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pzZZ3qaB
Subject: Re: [Buildroot] [PATCH v2 1/2] package/xen: xen tools needs bash at
 runtime
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjYvMDEvMjAyNSAxODozNCwgVmluY2VudCBTdGVobMOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gV2hlbiB0aGUgWGVuIHRvb2xzIGFyZSBidWlsdCwgYSBudW1iZXIgb2YgaW5pdCBzY3JpcHRz
IGFyZSBpbnN0YWxsZWQgdG8KPiB0aGUgdGFyZ2V0Lgo+IAo+IFNvbWUgb2YgdGhvc2UgWGVuIHNj
cmlwdHMgcmVxdWlyZSBiYXNoIHRvIHJ1bjoKPiAtIC9ldGMvaW5pdC5kL1M1MHhlbmNvbW1vbnMK
PiAtIC9ldGMvaW5pdC5kL1M1MHhlbi13YXRjaGRvZwo+IC0gL2V0Yy9pbml0LmQvUzYweGVuZG9t
YWlucwo+IC0gL2V0Yy94ZW4vc2NyaXB0cy9sYXVuY2gteGVuc3RvcmUKPiAtIC91c3IvbGliL3hl
bi9iaW4veGVuZG9tYWlucwo+IAo+IE1ha2Ugc3VyZSB0byBzZWxlY3QgYmFzaCB3aGVuIHRoZSBY
ZW4gdG9vbHMgYXJlIHNlbGVjdGVkICh3ZSBuZWVkIHRvCj4gc2VsZWN0ICJidXN5Ym94IHNob3cg
b3RoZXJzIiBmb3IgdGhhdCwgdG9vKS4KPiAKPiBTdWdnZXN0ZWQtYnk6IEp1bGllbiBPbGl2YWlu
IDxqdS5vQGZyZWUuZnI+Cj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50
LnN0ZWhsZUBsYXBvc3RlLm5ldD4KPiBDYzogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXJAYWxp
c3RhaXIyMy5tZT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
