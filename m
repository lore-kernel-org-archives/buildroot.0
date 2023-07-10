Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6235EEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D7B281393;
	Mon, 10 Jul 2023 17:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D7B281393
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G3FFmunuGG8T; Mon, 10 Jul 2023 17:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A455820B7;
	Mon, 10 Jul 2023 17:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A455820B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AC9F1BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D20F41554
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D20F41554
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qLo1qezBlYcY for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:32:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1259D409A3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1259D409A3
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:32:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F367E000B;
 Mon, 10 Jul 2023 17:32:12 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:32:11 +0200
To: Ignacy =?UTF-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Message-ID: <20230710193211.77b635f0@windsurf>
In-Reply-To: <20230703211559.qpoachdrbjt43btk@zenon.in.qult.net>
References: <20230703210915.1a409e96@windsurf>
 <20230703211559.qpoachdrbjt43btk@zenon.in.qult.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689010332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DiwoWTohfMXlM4c5eJCk7L55HOsQSPFmJqTTpCUJy/w=;
 b=SzLScIzDqSNHGYfzAuvgxmZ31UR2llabAjKo8A99VxvOxgzkdunZkGzfBhycTi7hIubBjO
 xqAh3v2DugQ/9x5Tl0hHNbS5TUAjtrZNheLtmENonHR7uHCOfjUQqIWIW4bbP5m7aO9H4y
 GNYJDs68jLt3GUSfHB0JwKF4pm4qkFrvOK7Hao595Q2jasLIm7tr2mVr5lw3YP9eH6UrBF
 i6fLc/6QAZry3D++m9q71TUrDFLlebXNov5mKciLyod2IB092TK84Pou2bjZimHvU1mtxB
 M+E5XJSPSGaWHKIsJowIhJDKO+Ywh+sgw17GdkOs++6qo7sKHcbo1bsvlWmgOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SzLScIzD
Subject: Re: [Buildroot] [PATCH v2] package/iproute2: add optional
 dependency on libbpf
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

T24gTW9uLCAzIEp1bCAyMDIzIDIzOjE1OjU5ICswMjAwCklnbmFjeSBHYXfEmWR6a2kgPGlnbmFj
eS5nYXdlZHpraUBncmVlbi1jb21tdW5pY2F0aW9ucy5mcj4gd3JvdGU6Cgo+IFRoZSBjb25maWd1
cmUgc2NyaXB0IHdpbGwgYXV0b21hdGljYWxseSBkZXRlY3QgdXNlZCBwa2ctY29uZmlnIGlmCj4g
bGliYnBmIGlzIGF2YWlsYWJsZS4KClRoaXMgc2VudGVuY2UgaW4gdGhlIGNvbW1pdCBsb2cgZGlk
IG5vdCByZWFsbHkgbWFrZSBzZW5zZSBhbnltb3JlIG5vdwp0aGF0IHlvdSBoYXZlIGFkZGVkIGV4
cGxpY2l0IHVzYWdlIG9mIHRoZSAtLWxpYmJwZl9mb3JjZSBvcHRpb24uCgo+ICtJUFJPVVRFMl9D
T05GSUdVUkVfT1BUUyA9CgpUaGlzIGlzIG5vdCBuZWVkZWQsIGFuZCB3ZSByYXJlbHkgZG8gdGhp
cyBpbiBCdWlsZHJvb3QuIE5vbi1leGlzdGluZwp2YXJpYWJsZXMgYXJlIGJ5IGRlZmF1bHQgZW1w
dHksIHNvIGRvaW5nIGEgKz0gdG8gYSBub24tZXhpc3RpbmcKdmFyaWFibGUgaXMgcGVyZmVjdGx5
IGNvcnJlY3QuCgpBcHBsaWVkIHdpdGggdGhvc2UgdHdvIHNtYWxsIG5pdHMgYWRkcmVzc2VkLiBU
aGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBD
RU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJh
aW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
