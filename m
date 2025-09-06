Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B34CA1002
	for <buildroot@archiver.kernel.org>; Sat,  6 Sep 2025 10:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5948615BC;
	Sat,  6 Sep 2025 10:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EeUUTXPjdp5q; Sat,  6 Sep 2025 10:07:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0344C613F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0344C613F5;
	Sat,  6 Sep 2025 10:07:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12D40967
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 10:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECBD583FA1
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 10:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRA8N9wKWb14 for <buildroot@buildroot.org>;
 Sat,  6 Sep 2025 10:07:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0232283F89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0232283F89
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0232283F89
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 10:07:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1EC4E60137;
 Sat,  6 Sep 2025 12:07:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 06 Sep 2025 12:07:37 +0200
MIME-Version: 1.0
Date: Sat, 06 Sep 2025 12:07:37 +0200
To: =?UTF-8?Q?Mattias_Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250821120159.2156865-1-lazzer@gmail.com>
References: <20250821120159.2156865-1-lazzer@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ece80cae6bc0712fad2066b33f99e1ff@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757153259;
 bh=oHNCrgzq/zRq7tPutqJRB/6w0BFp3PlbIAc+3SsjWpE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YpywPXK+MSRFLga8N6xIm67N6EtUabFbZir8mkKioxM7xQAtwTWJV6j5HAIq+b9Y0
 2b4k8+miMFbuxR+OockqVfKTpnypMCAhq6OFuqX+dpsdEwD77b8Aq7mlqhpOXv4rj5
 yvjiTNcqpxTxlKIOt07A302sxLCl0bzkeNNx0iPzZnkWb1w/mp2gvQ950FGVMK6ToU
 Z8sdrkehTqEFg455AJcKanmTcAsWJBUOTUR7Rk8eIuT8rKfuhq46EN+ylqlpp8+L2h
 o4YRxmex2GbpT3Xv3FUsB/+M/hsW098R0FZsJJ11ZeHE1nHvfR5jeywfsqIXojKCTC
 bSeBQNFmjdh5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YpywPXK+
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: add option for
 mediatek MT7986 firmware (WiFi)
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

SGkgTWF0dGlhcywKCk9uIDIxLzA4LzIwMjUgMTQ6MDEsIE1hdHRpYXMgV2Fsc3Ryw7ZtIHdyb3Rl
Ogo+IEFkZCBhbiBvcHRpb24gdG8gaW5zdGFsbCB0aGUgZmlybXdhcmUgZmlsZXMgZm9yIFdpZmkg
aW4gTWVkaWF0ZWsKPiBNVDc5ODYgU09DLCB3aGljaCBhcmUgcHJlc2VudCBvbiBCYW5hbmFQaSBy
My4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aWFzIFdhbHN0csO2bSA8bGF6emVyQGdtYWlsLmNv
bT4KCkkgYXBwbGllZCB0aGlzIHBhdGNoIHRvIG5leHQsIHRoYW5rcy4KSSByZXdvcmtlZCBpdCBh
IGJpdCwgc2VlOgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9j
b21taXQvNTNlMGE0YmQzNTVkMGQ0OGRhZDc0NDA3ZGUzMmEwOTZhMzQyNjQ5ZgoKQmVzdCByZWdh
cmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
