Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38DDD49789
	for <buildroot@archiver.kernel.org>; Sun,  1 Dec 2024 20:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54FDD820F8;
	Sun,  1 Dec 2024 20:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3Z4ibY6x8SG; Sun,  1 Dec 2024 20:42:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8379C8418A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8379C8418A;
	Sun,  1 Dec 2024 20:42:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B2B206C
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 20:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9481E607FB
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 20:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3DvnkAD-724 for <buildroot@buildroot.org>;
 Sun,  1 Dec 2024 20:42:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3BACE60820
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BACE60820
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BACE60820
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 20:42:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCF411C0002;
 Sun,  1 Dec 2024 20:42:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tHqm3-002p63-3B;
 Sun, 01 Dec 2024 21:42:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: buildroot@buildroot.org
References: <20241129160226.134363-1-wsa+renesas@sang-engineering.com>
Date: Sun, 01 Dec 2024 21:42:35 +0100
In-Reply-To: <20241129160226.134363-1-wsa+renesas@sang-engineering.com>
 (Wolfram Sang's message of "Fri, 29 Nov 2024 17:02:25 +0100")
Message-ID: <87o71vkudg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/lrzsz: fix FTBFS by upgrading and
 applying Debian fix
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

Pj4+Pj4gIldvbGZyYW0iID09IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVl
cmluZy5jb20+IHdyaXRlczoKCiA+IFRoaXMgZmFpbHVyZSBhcHBlYXJlZCB3aGVuIHRyeWluZyB0
byBidWlsZCBscnpzejoKID4gbHN5c2xvZy5jOjczOjU6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJh
dGlvbiBvZiBmdW5jdGlvbiDigJh2YXNwcmludGbigJk7CiA+IGRpZCB5b3UgbWVhbiDigJh2c3By
aW50ZuKAmT8gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCgogPiBUbyBmaXggdGhl
IHByb2JsZW0sIGxldCdzIGZvbGxvdyBEZWJpYW4uIFN3aXRjaCB0byAwLjEyLjIxcmMgKHdoaWNo
IGlzCiA+IGFscmVhZHkgb3V0IHRoZXJlIDI1IHllYXJzISkgYW5kIGltcG9ydCB0aGVpciBwYXRj
aCBhZGRpbmcgaW5jbHVkZXMuCgogPiBTaWduZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYSty
ZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPgoKQ29tbWl0dGVkIGFmdGVyIGFkZGluZyBhbiBV
cHN0cmVhbTogdGFnIHRvIHRoZSBwYXRjaCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dh
YXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
