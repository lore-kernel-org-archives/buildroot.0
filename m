Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE63FC5AE59
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 06:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA3D941588;
	Tue,  3 Jun 2025 06:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 03JRjM7uXbu0; Tue,  3 Jun 2025 06:22:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7D2641ECD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7D2641ECD;
	Tue,  3 Jun 2025 06:22:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F39DD15F
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9EE741149
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id REGmrWABDf7d for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 06:22:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D28D41132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D28D41132
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D28D41132
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6445E1C1413; Tue,  3 Jun 2025 08:22:07 +0200 (CEST)
Message-ID: <4f9936ee-8b3b-4ad0-a467-e4dc4415a36a@rnout.be>
Date: Sat, 31 May 2025 19:02:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250515060528.1355475-1-gael.portay+rtone@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250515060528.1355475-1-gael.portay+rtone@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748931727; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=KJnR0YTHug4PEEQgVwNIFQrwog/r/IjFrfi3ejS/lYI=;
 b=F/SGwRpoujbM8Zu/+SesAxEAgsc7jr6eZyI2i61ivtZ4Q5o/O23axRNjO+whJuIStBdQNU
 /ax2EoSdL+5OdB31rkhMDsjLB/PZqTWLHWrGk+IbRpnbK40smLThrCw4M1QlNitOaC1xW0
 J+lXfBEo5aSW2EO0Ef/rjPsey+nJuR7MMQNcsSfSdiq7TzWOIvPO9IkiXdwd1dF9ALo/t5
 j+u8fo7xBRNLPesH9HjPFHP5G9y1QfSMWG0U9MVO/6wZ/qRq5u8Z2Jh6AfQ8+rOE+mNO+I
 8rmqFcjFHBmhqwJrncVQ7Kt/YajbZqtZNoSRwDHhyss8hFax6/oQzf8eo4Uw+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=F/SGwRpo
Subject: Re: [Buildroot] [PATCH v2 0/2] package/mesa3d: allow building vc4
 without NEON
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNS8wNS8yMDI1IDA4OjA1LCBHYcOrbCBQT1JUQVkgd3JvdGU6Cj4gSGVsbG8sCj4gCj4g
VGhpcyBwYXRjaCBzZXJpZXMgYWxsb3dzIGJ1aWxkaW5nIHRoZSB2YzQgZHJpdmVyIGZvciB0b29s
Y2hhaW4vQ1BVCj4gd2l0aG91dCBzdXBwb3J0IGZvciBORU9OIChSYXNwYmVycnkgUGksIFJhc3Bi
ZXJyeSBQaSBaZXJvLCBSYXNwYmVycnkgUGkKPiBaZXJvIFcsIENvbXB1dGUgTW9kdWxlKS4KPiAK
PiBUaGUgZmlyc3QgcGF0Y2ggcmV2ZXJ0cyBhIGNvbW1pdCB0aGF0IGlzICJzdXBlcnNlZGVkIiBi
eSBhbiBpbnRlcm5hbAo+IHBhdGNoLgo+IAo+IFRoZSBzZWNvbmQgcGF0Y2ggdXBkYXRlcyB0aGUg
aGVscCBtZXNzYWdlcyBvZiBWQzQvVjNEIGRyaXZlciB0byByZWZsZWN0Cj4gdGhlIGN1cnJlbnQg
c3VwcG9ydCBvZiBoYXJkd2FyZXMgKFJhc3BiZXJyeSBQaSBtb2RlbHMsIGFuZCBWaWRlb0NvcmUK
PiB2ZXJzaW9ucykuCj4gCj4gSSBoYXZlIHRlc3RlZCBpdCBvbiBSYXNwYmVycnkgUGkgMSBvbmx5
IHRvIHJ1biBPcGVuR0xFUyB0aGluZ3MgKGttc2N1YmUsCj4gcXQgZ3VpIGV4YW1wbGVzKS4KPiAK
PiBDaGFuZ2VzIHNpbmNlIHYxOgo+ICAgLSBSZXdvcmQgY29tbWl0IG1lc3NhZ2UKPiAgIC0gVXBk
YXRlIGRyaXZlcnMgaGVscCBtZXNzYWdlcyAoaW4gYSBkZWRpY2F0ZWQgY29tbWl0KQo+IAo+IEdh
w6tsIFBPUlRBWSAoMik6Cj4gICAgUmV2ZXJ0ICJwYWNrYWdlL21lc2EzZDogR2FsbGl1bSBWQzQg
ZHJpdmVyIGRlcGVuZHMgb24gTkVPTiIKPiAgICBwYWNrYWdlL21lc2EzZDogdXBkYXRlIHZjNC92
M2QgZHJpdmVycyBoZWxwIG1lc3NhZ2VzCgogIEFwcGxpZWQgYm90aCB0byAyMDI1LjAyLngsIHRo
YW5rcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4gICBwYWNrYWdlL21lc2EzZC9Db25maWcu
aW4gfCA3ICsrKystLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
