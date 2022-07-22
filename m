Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8569C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 20:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D0AA84AD8;
	Fri, 22 Jul 2022 20:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D0AA84AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fKynz5EfwH9r; Fri, 22 Jul 2022 20:54:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BA22849D5;
	Fri, 22 Jul 2022 20:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BA22849D5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 01AA91BF3DE
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5D5F60A6A
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5D5F60A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cEe7mVBpnbih for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 20:54:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66410608B7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66410608B7
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 20:54:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CE25120005;
 Fri, 22 Jul 2022 20:54:27 +0000 (UTC)
Date: Fri, 22 Jul 2022 22:54:26 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= via buildroot
 <buildroot@buildroot.org>
Message-ID: <20220722225426.0eb1e223@windsurf>
In-Reply-To: <20220614190325.723977-1-raphael.melotte@mind.be>
References: <20220614190325.723977-1-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658523268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sDYld29gJ2F4RANQwkORIC3kkTDB1pe01TjEkFb9/rM=;
 b=csuNJZ2qpJc06TYppGNDAK5OQNHiAygeIV5U/lyXxl7CE5IeWbg3ogT7d/r8jK6DUknmcA
 ZZpGL0YAGmA6ETOvnCtl5L4CLMd4i/8HBA8tRnzAKZ6/JTZMfGi6NBhZmBb4r1aeOKZlch
 w7tQtwkjWrk8w+xJgFGIcL86uw3uZSTW/MOTWwVjFZ06JPfWsbjqUcPaMMYlZzUKR2SYu0
 s5+yif2EHsj5cZf9+7HQ0rCGPlaiWhnzfUaiwQQeUS6H63OgIpEczNLflb0b6a2Pul1S1f
 dn9VBKRenHsyGe2oS+jgPzA4Cj5dqP8JPhEQX14/iTseCRUzt++dfwpXoQvuvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=csuNJZ2q
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: add new test for
 python-s3transfer
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
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAxNCBKdW4gMjAyMiAyMTowMzoyMyArMDIwMApSYXBoYcOrbCBNw6lsb3R0ZSB2aWEg
YnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IE1hbnkgYWN0dWFs
IHRlc3RzIHJlcXVpcmUgbmV0d29yayB1c2FnZSwgc28ganVzdCBpbXBvcnQgdGhlIG1vZHVsZSB0
bwo+IGNoZWNrIHRoYXQgYXQgbGVhc3QgdGhhdCBwYXJ0IHdvcmtzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KPiAtLS0KPiAg
Li4uL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zM3RyYW5zZmVyLnB5ICAgICAgICB8ICAx
ICsKPiAgLi4uL3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9zM3RyYW5zZmVyLnB5
ICB8IDEyICsrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBs
ZV9weXRob25fczN0cmFuc2Zlci5weQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fczN0cmFuc2Zlci5weQoKU2VyaWVzIGFwcGxp
ZWQgdG8gbWFzdGVyLiBPbiB0aGUgZmlyc3QgcGF0Y2gsIHlvdSBzaG91bGQgaGF2ZSBhZGRlZAp5
b3Vyc2VsZiB0byB0aGUgREVWRUxPUEVSUyBmaWxlLCBidXQgSSBoYWQgZm9yZ290dGVuIHRoYXQg
bXlzZWxmIHdoZW4KcmV2aWV3aW5nL2FwcGx5aW5nLCBzbyBJIHB1c2hlZCBhbm90aGVyIHNlcGFy
YXRlIHBhdGNoIHRoYXQgYWRkcyB5b3UgaW4KdGhlIERFVkVMT1BFUlMgZmlsZSBhcyBleHBlY3Rl
ZC4KClRoYW5rcyBhIGxvdCEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290
bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGlu
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
