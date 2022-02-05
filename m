Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BC5C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 12:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF029410E6;
	Sat,  5 Feb 2022 12:51:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQE68NN0vdtm; Sat,  5 Feb 2022 12:51:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 332E7410D4;
	Sat,  5 Feb 2022 12:51:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 448551BF2E3
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 12:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F3EF410D4
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 12:51:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sciTJ4SPOTeK for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 12:51:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49CFE410C1
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 12:51:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B2667240002;
 Sat,  5 Feb 2022 12:51:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nGKX7-0007Wl-TR; Sat, 05 Feb 2022 13:51:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20220204174712.1109-1-peter@korsgaard.com>
 <5de97254-e4b3-308e-c05f-26e394e2c668@gmail.com>
Date: Sat, 05 Feb 2022 13:51:17 +0100
In-Reply-To: <5de97254-e4b3-308e-c05f-26e394e2c668@gmail.com> (Romain Naour's
 message of "Sat, 5 Feb 2022 11:51:23 +0100")
Message-ID: <87zgn5v5mi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/{glibc,
 localedef}: security bump for additional post-2.34.x fixes
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPiB3
cml0ZXM6CgogPiBIaSBQZXRlciwKID4gTGUgMDQvMDIvMjAyMiDDoCAxODo0NywgUGV0ZXIgS29y
c2dhYXJkIGEgw6ljcml0wqA6CiA+PiBGaXhlcyB0aGUgZm9sbG93aW5nIHNlY3VyaXR5IGlzc3Vl
czoKID4+IAogPj4gQ1ZFLTIwMjItMjMyMTk6IFBhc3NpbmcgYW4gb3ZlcmxvbmcgZmlsZSBuYW1l
IHRvIHRoZSBjbG50X2NyZWF0ZQogPj4gbGVnYWN5IGZ1bmN0aW9uIGNvdWxkIHJlc3VsdCBpbiBh
IHN0YWNrLWJhc2VkIGJ1ZmZlciBvdmVyZmxvdyB3aGVuCiA+PiB1c2luZyB0aGUgInVuaXgiIHBy
b3RvY29sLiAgUmVwb3J0ZWQgYnkgTWFydGluIFNlYm9yLgogPj4gCiA+PiBDVkUtMjAyMi0yMzIx
ODogUGFzc2luZyBhbiBvdmVybG9uZyBmaWxlIG5hbWUgdG8gdGhlIHN2Y3VuaXhfY3JlYXRlCiA+
PiBsZWdhY3kgZnVuY3Rpb24gY291bGQgcmVzdWx0IGluIGEgc3RhY2stYmFzZWQgYnVmZmVyIG92
ZXJmbG93LgogPj4gCiA+PiBDVkUtMjAyMS0zOTk4OiBQYXNzaW5nIGEgcGF0aCBsb25nZXIgdGhh
biBQQVRIX01BWCB0byB0aGUgcmVhbHBhdGgKID4+IGZ1bmN0aW9uIGNvdWxkIHJlc3VsdCBpbiBh
IG1lbW9yeSBsZWFrIGFuZCBwb3RlbnRpYWwgYWNjZXNzIG9mCiA+PiB1bmluaXRpYWxpemVkIG1l
bW9yeS4gIFJlcG9ydGVkIGJ5IFF1YWx5cy4KID4+IAogPj4gQ1ZFLTIwMjEtMzk5OTogUGFzc2lu
ZyBhIGJ1ZmZlciBvZiBzaXplIGV4YWN0bHkgMSBieXRlIHRvIHRoZSBnZXRjd2QKID4+IGZ1bmN0
aW9uIG1heSByZXN1bHQgaW4gYW4gb2ZmLWJ5LW9uZSBidWZmZXIgdW5kZXJmbG93IGFuZCBvdmVy
ZmxvdwogPj4gd2hlbiB0aGUgY3VycmVudCB3b3JraW5nIGRpcmVjdG9yeSBpcyBsb25nZXIgdGhh
biBQQVRIX01BWCBhbmQgYWxzbwogPj4gY29ycmVzcG9uZHMgdG8gdGhlIC8gZGlyZWN0b3J5IHRo
cm91Z2ggYW4gdW5wcml2aWxlZ2VkIG1vdW50CiA+PiBuYW1lc3BhY2UuICBSZXBvcnRlZCBieSBR
dWFseXMuCiA+PiAKID4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4KCgogPiBSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJA
Z21haWwuY29tPgoKQ29tbWl0dGVkLCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
