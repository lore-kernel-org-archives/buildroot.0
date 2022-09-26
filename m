Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD38C07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 12:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9885160F75;
	Mon, 26 Sep 2022 12:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9885160F75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eU-EEcbymc-0; Mon, 26 Sep 2022 12:01:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC10C60F6F;
	Mon, 26 Sep 2022 12:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC10C60F6F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF8321BF3F7
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5BA140BE4
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5BA140BE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id juFql5AItPsu for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 12:01:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57E6340BC0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57E6340BC0
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 12:01:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 52895240014;
 Mon, 26 Sep 2022 12:01:46 +0000 (UTC)
Date: Mon, 26 Sep 2022 14:01:45 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Ignacy =?UTF-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Message-ID: <20220926140145.0d83bb2c@windsurf>
In-Reply-To: <20220926095203.r5u22akkpbj66rpg@zenon.in.qult.net>
References: <20220926095203.r5u22akkpbj66rpg@zenon.in.qult.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664193706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5XyarggR0Xiv/J1w6qFeCLm2JkmDTD/mgjZpwKjaxtc=;
 b=TrG7Wvc9DRqxPVzvU9FHsM9x3iBd4YU4QADhAwT7ng0lzTjh7Q0vACnz6z6NETdYOsw9Im
 Wr32UhjAoPe7mz4S2RpaZcSl40Q+Ywm2uBAuPy9OqpIH7STsoilNrfr1qcig3aPigs654E
 qmdRBbRRFmJfWiawgt7WVQsUQA4JeUqbvg1BGcGMT8dP3YnxtM4VoJrtR+F21G+1oBqp5L
 HtC4RpfsJbHr0qSGoRqFnRJCKOtMI1TGtboOAM/64ifCGo9LamPL7H09IX7sg/pNEjU1C5
 uoMmbVPIKA9X/sLOAfUwEORkfImND+xrclRZ7EhWGRszL9qpWJVg2klPKLpYvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TrG7Wvc9
Subject: Re: [Buildroot] [PATCH v2] package/chartjs: fix installation
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAyNiBTZXAgMjAyMiAxMTo1MjowMyArMDIwMApJZ25hY3kgR2F3xJlkemtpIDxpZ25h
Y3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+IHdyb3RlOgoKPiBWZXJzaW9uIDMu
OS4xIGRvZXMgbm90IGRpc3RyaWJ1dGUgYSBDU1MgZmlsZSBub3IgYSBidW5kbGUuICBJbnN0YWxs
Cj4gb25seSB0aGUgbWluaWZpZWQgSmF2YXNjcmlwdCBzb3VyY2UuCj4gCj4gaHR0cDovL2F1dG9i
dWlsZC5idWlsZHJvb3QubmV0Lz9yZWFzb249Y2hhcnRqcy0zLjkuMQoKV2Ugd2FudCB0byBoYXZl
IGEgbGluayB0byBvbmUgc3BlY2lmaWMgYnVpbGQgaXNzdWUuIEluZGVlZCwgaW1hZ2luZQpvdGhl
ciBjaGFydGpzLTMuOS4xIGJ1aWxkIGlzc3VlcyBwb3AgdXAgb25jZSB0aGlzIGlzc3VlIGhhcyBi
ZWVuIGZpeGVkLgpUaGVuIHRoaXMgbGluayB3b3VsZCBubyBsb25nZXIgbWFrZSBzZW5zZSwgYXMg
d2Ugd291bGRuJ3Qga25vdyB3aGljaApzcGVjaWZpYyBidWlsZCBpc3N1ZSBpdCB3YXMgZml4aW5n
LgoKU28gSSBoYXZlIHJlcGxhY2VkIHRoaXMgbGluayB3aXRoIGEgbGluayB0byBvbmUgc3BlY2lm
aWMgb2NjdXJyZW5jZSBvZgp0aGUgYnVpbGQgaXNzdWUsIGFuZCBhcHBsaWVkLiBUaGFua3MgYSBs
b3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3Rs
aW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0
cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
