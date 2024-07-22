Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09B1C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 13:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7260D400AC;
	Mon, 22 Jul 2024 13:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SfYfm3KgM6j4; Mon, 22 Jul 2024 13:18:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FD0740241
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FD0740241;
	Mon, 22 Jul 2024 13:18:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EEE8D1BF2A3
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 13:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB99D40241
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 13:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQdOsdy2e2-u for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 13:18:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8CA85400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CA85400AC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CA85400AC
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 13:18:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B341260008;
 Mon, 22 Jul 2024 13:18:35 +0000 (UTC)
Date: Mon, 22 Jul 2024 15:18:34 +0200
To: =?UTF-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <20240722151834.53981478@windsurf>
In-Reply-To: <CAH+XeQZrmvt7Ui7D6M2515=+W_3wTsPGVVWLcRALx+4X93Chzg@mail.gmail.com>
References: <20240524181856.2712581-1-alexander.i.mukhin@gmail.com>
 <20240722144716.092e357b@windsurf>
 <CAH+XeQZrmvt7Ui7D6M2515=+W_3wTsPGVVWLcRALx+4X93Chzg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721654316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p1cX8pSp8msdduQ0aY5L8m6ENxNTUOtrxmoSTPpA93Y=;
 b=dX+B98HXGJpWFl9iCweTj+/9BcCF4THCcrVLmGuYA7Z1+JWXJkCVtLMDxyHnEOMVcxxJ+2
 Z9u7Z1qUCgcTaUmOpf1jDamtGSw6ROjCKKSu0k20xxVlbh/22s4LzG2fUbF2A2FNVJfSp9
 4qLwT5ZUOuOx1nS/oNOGx6XIqK9KLq2OTmOVO//RqmN2FJ8196tavXaYAVyFyp7X8H35tu
 UY+i/EBiL9aNT3HrKxVxQjfAh2hxb2h/f3lakCU8reNUT6b0B6lTNS+F9xayUaWGRsNI06
 hx+n4f8pBWz/kU5p+e0zxFxtmbppIQ6lDOhGIOQAngO1nWqfBxau54neViIZ9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dX+B98HX
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.2.4
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zw6ksCgpUaGFua3MgZm9yIHlvdXIgc3VwZXIgcXVpY2sgZmVlZGJhY2shCgpPbiBN
b24sIDIyIEp1bCAyMDI0IDE1OjAxOjQ1ICswMjAwCkpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8
c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPiB3cm90ZToKCj4gSW4gdGhlIG1lYW50aW1lLCBJ
IHJlY29tbWVuZCB0aGUgZm9sbG93aW5nIG9wdGlvbnM6Cj4gCj4gQSkgUmV2ZXJ0IHRvIHRoZSBw
cmV2aW91cyB2ZXJzaW9uIChPcGVuWkZTIHYyLjIuMykuIFRoaXMgaXMgbm90IGlkZWFsIGZvcgo+
IHBlb3BsZSB3aG8gaGF2ZSBhbHJlYWR5IHVwZ3JhZGVkLgo+IAo+IEIpIEluY2x1ZGUgYSB3b3Jr
LWluLXByb2dyZXNzIChpdCB3b3JrcyBmb3IgYnVpbGRyb290LCBJIHRlc3RlZCBpdCkgcGF0Y2g6
Cj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3B1bGwvMTYxNjkucGF0Y2guCgpQbGVh
c2UgZG8gdGhpcyBvcHRpb24gKEIpLCBhbmQgYWxzbyBjb250cmlidXRlIFNFRUtfREFUQSBzdXBw
b3J0IHRvCnVDbGliYy4gSSd2ZSBhZGRlZCBXYWxkZW1hciwgdGhlIHVDbGliYy1uZyBtYWludGFp
bmVyLCBpbiBDYy4KClRoYW5rcyBhIGxvdCEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwg
Y28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
