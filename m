Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C6DCD13D2
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 13:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66E7460723;
	Sat, 31 Aug 2024 13:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pp-Hd5akwnWd; Sat, 31 Aug 2024 13:58:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FBBB6072F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FBBB6072F;
	Sat, 31 Aug 2024 13:58:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 604BE1BF2C2
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 13:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BA78816E3
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 13:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dO6hEo1cIee for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 13:58:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2BC7B813EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BC7B813EE
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BC7B813EE
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 13:57:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7068B1BF203;
 Sat, 31 Aug 2024 13:57:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1skOc1-00G9hw-2t;
 Sat, 31 Aug 2024 15:57:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Jos=C3=A9?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
References: <20240722182312.1500234b@windsurf>
 <20240722165715.3549-2-salvador.joseluis@gmail.com>
Date: Sat, 31 Aug 2024 15:57:57 +0200
In-Reply-To: <20240722165715.3549-2-salvador.joseluis@gmail.com>
 (=?utf-8?Q?=22Jos=C3=A9?= Luis
 Salvador Rufo"'s message of "Mon, 22 Jul 2024 18:57:16 +0200")
Message-ID: <87h6b0ztei.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/zfs: fix uClibc support
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkpvc8OpIiA9PSBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2Vs
dWlzQGdtYWlsLmNvbT4gd3JpdGVzOgoKID4gVGhpcyB1cGRhdGUgYWRkcmVzc2VzIHRoZSBpc3N1
ZSBvZiB1Q2xpYmMgc3VwcG9ydCBieSBza2lwcGluZyBaRlMgdGVzdHMKID4gdGhhdCByZXF1aXJl
IFNFRUtfREFUQSBzdXBwb3J0LgoKID4gVGhpcyBpcyBhIHdvcmstaW4tcHJvZ3Jlc3MgcGF0Y2gg
d2hpbGUgd2Ugd2FpdCBmb3IgYW4gdXBzdHJlYW0gZml4LgogPiBDdXJyZW50IHVwc3RyZWFtIGVm
Zm9ydHMgY2FuIGJlIGZvbGxvd2VkIGhlcmU6CiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZz
L3pmcy9wdWxsLzE2MTY5CgogPiBDb250ZXh0OgogPiAtIE9wZW5aRlMgaW5jbHVkZXMgYSB0ZXN0
IGZvciBhIGJ1ZyB0aGF0IG9jY3VycyB3aGVuIGNvcHlpbmcgYSBsYXJnZQogPiAgIG51bWJlciBv
ZiBQVU5DSEVEIGZpbGVzLgogPiAtIE9wZW5aRlMgaGFzIGJhY2twb3J0ZWQgdGhpcyB0ZXN0IHRv
IHYyLjIueC4KID4gLSB1Q2xpYmMgZG9lcyBub3Qgc3VwcG9ydCBTRUVLX0RBVEEgYW5kIFNFRUtf
SE9MRS4KID4gLSBUaGUgWkZTIHRlc3QgYGNwX3N0cmVzc2AgY2FuIG5vdCBiZSBjb21waWxlZCB1
c2luZyB1Q2xpYmMuCgogPiBUaGlzIGNvbW1pdCBmaXg6CiA+IC0gaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy83MzkxNzkzMjI2CgogPiBTaWduZWQtb2Zm
LWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNv
bT4KID4gLS0tCiA+IENoYW5nZXMgdjEgLT4gdjI6CiA+ICAgLSByZW1vdmVkIHBhdGNoIGhhc2gg
IChzdWdnZXN0ZWQgYnkgVGhvbWFzIFBldGF6em9uaSkKID4gICAtIGZpeCBjb21tZW50IGZvciBy
ZWFzb24gYWJvdXQgWkZTX0FVVE9SRUNPTkYgIChzdWdnZXN0ZWQgYnkgVGhvbWFzIFBldGF6em9u
aSkKCkNvbW1pdHRlZCB0byAyMDI0LjAyLnggYW5kIDIwMjQuMDUueCwgdGhhbmtzLgoKLS0gCkJ5
ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
