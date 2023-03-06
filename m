Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13523C678D4
	for <buildroot@archiver.kernel.org>; Mon,  6 Mar 2023 10:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6349A40936;
	Mon,  6 Mar 2023 10:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6349A40936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sj7QH8nF3EHX; Mon,  6 Mar 2023 10:01:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9C5640917;
	Mon,  6 Mar 2023 10:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9C5640917
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09E981BF3F3
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 10:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4BAC81493
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 10:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4BAC81493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id igTacThpInPa for <buildroot@lists.busybox.net>;
 Mon,  6 Mar 2023 10:01:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2ABC8148D
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2ABC8148D
 for <buildroot@buildroot.org>; Mon,  6 Mar 2023 10:01:38 +0000 (UTC)
Received: from smtpclient.apple ([146.241.82.238])
 by Aruba Outgoing Smtp  with ESMTPA
 id Z7evp7sXm8S3GZ7ewpGXpD; Mon, 06 Mar 2023 11:01:34 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 6 Mar 2023 11:01:33 +0100
Message-Id: <9AE9589A-01FF-484F-B8B6-69D6C7605966@benettiengineering.com>
References: <CA+h8R2rV-M13PB30fLxvWUSHM7SuQ=grhnBPBs0VATg4Kny32Q@mail.gmail.com>
In-Reply-To: <CA+h8R2rV-M13PB30fLxvWUSHM7SuQ=grhnBPBs0VATg4Kny32Q@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
X-Mailer: iPhone Mail (20D67)
X-CMAE-Envelope: MS4xfNRPU2Z6thJh6lJK6DGc9F4IXYfqrzX1RKn5p11eOJ2paGXZFpBy/MGb1HEcI2iChETMujFhKheTaQcm3RgsKG6DQRZbC6IFCYH5UvzJNkM3HIYozrrn
 1XlQLmHXhGUMD5QPkcXLWD9BfxLndxoZOTj/KJ0ywnWyk+12aXbrKzqNEmfLb0bM1dlZM4Ymrq4BLdt0L5KfKeK1o0Tpjmom1yRdiWWvtQ0Zj+8AafSnOB8X
 LPLBUmGQoq6V4AIKQUKTb78Oj/+bV2+kXym30Gjci+iEOAYB1j+Iyh+T45YSD+Su
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1678096894; bh=ax5i6de7J/Ezdkoq5xtycHhSSsciLn5Zvi+0qVvGBSY=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=TixELIIGOxh72ICzOFBE/fSfTZZzM4FTcjsS1ebZPwHmPzHRrveOI6liZFsXhajJc
 UQsFZZnsHicCmK1M/ARunbHquhc78e3oZUrooxB6Cy2Y30xCOIjZK+swREdq1JOUzq
 KhW3LggDCqF9eU5GKNJ8VXp6Wt7Ffg4machzaZuI3caoUYaSs19cQpyn88r/rKdOrv
 B1useZ80eHYwtfsRgVPiNZSslNFwe3sb5SVpJ8Eg/Cvhbraab4DCwaPUQSmBTPV4K2
 GgDClp36qTqFoAb8t4pQuWxbpiyU2UAsBSi0bORip+XvYkmrr93xah8+kJT5VmZz71
 6NnBHlbcgxW1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=TixELIIG
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: fix build failure on
 PowerPC64
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
Cc: Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQ2hyaXN0aWFuLAoKPiBJbCBnaW9ybm8gNiBtYXIgMjAyMywgYWxsZSBvcmUgMDg6MjgsIENo
cmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AcGFyYWwuaW4+IGhhIHNjcml0dG86Cj4gCj4g77u/
SGkgR2l1bGlvLCBQZXRlciwKPiAKPj4gT24gU3VuLCBNYXIgNSwgMjAyMyBhdCAxMjo0M+KAr1BN
IEdpdWxpbyBCZW5ldHRpCj4+IDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29t
PiB3cm90ZToKPj4gVGhpcyBwYXRjaCBpcyBzdGlsbCB2YWxpZCwgaXQgZml4ZXMgdGhlIGJ1ZyBm
b3IgdGhlIGN1cnJlbnQgcmVwb3NpdG9yeQo+PiB1c2VkIGJ5IHRoZSBwYWNrYWdlLgo+PiBCdXQg
c29vbiB0aGUgcmVwb3NpdG9yeSB3aWxsIGJlIG1vdmVkIHRvIGEgbmV3IG9uZToKPj4gaHR0cHM6
Ly9naXRodWIuY29tL21vcnJvd25yLzg4MjFjdS0yMDIxMDkxNgo+PiBiZWNhdXNlIHRoZSBhY3R1
YWwgb25lIHdpbGwgYmUgZGVsZXRlZChpdCdzIGEgc3RyYW5nZSBjaG9pY2UuLi4pLgo+IAo+IFRo
ZSBQUiB3aXRoIHRoaXMgcGF0Y2ggaGFzIGJlZW4gbWVyZ2VkIHRvIHRoZSAyMDIxMDkxNiByZXBv
Ogo+IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9tb3Jyb3duci84ODIxY3UtMjAyMTA5MTYvcHVsbC83
Mwo+IAo+IHN1Ym1pdHRlZCB0aGUgcGF0Y2ggdy8gdGhpcyBuZXcgdmVyc2lvbjoKPiAKPiBodHRw
czovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjMwMzA2
MDcyNTU4LjMxNTE1LTEtY2hyaXN0aWFuQHBhcmFsLmluLwo+IAo+IEkgc3VnZ2VzdCB3ZSBtZXJn
ZSB0aGUgbmV3IHZlcnNpb24gJiBza2lwIGFkZGluZyB0aGUgcGF0Y2ggdG8gdGhlCj4gYnVpbGRy
b290IHRyZWUuCgpJIGFncmVlLCB5b3UgaGVscGVkIG1vdmluZyB0aGluZ3MgdmVyeSBmYXN0IHVw
c3RyZWFtLCAKc28gSSB3b3VsZCBkaXJlY3RseSBnbyB3aXRoIGxhdGVzdCBDaHJpc3RpYW7igJlz
IHBhdGNoIGFuZCBza2lwIG1pbmUuCgpCZXN0IHJlZ2FyZHMKR2l1bGlvCgo+IAo+IEJlc3QgcmVn
YXJkcywKPiBDaHJpc3RpYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
