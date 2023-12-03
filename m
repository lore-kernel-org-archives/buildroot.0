Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE7FC4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 19:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8671140156;
	Sun,  3 Dec 2023 19:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8671140156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VcPWaE_oI_No; Sun,  3 Dec 2023 19:02:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84EB64015A;
	Sun,  3 Dec 2023 19:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84EB64015A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 709B21BF408
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 19:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4536A60776
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 19:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4536A60776
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XwVi_mdMxIIg for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 19:02:13 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F82760773
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 19:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F82760773
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0C0F20007;
 Sun,  3 Dec 2023 19:02:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r9rjG-009XHA-2z;
 Sun, 03 Dec 2023 20:02:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Anthony Harivel <aharivel@redhat.com>
References: <20231123153131.1253841-1-aharivel@redhat.com>
 <CACUOEi-aBgm8e8LoEKbqtKYxzDb3ghNw5SiFt-K=7udVugqB8w@mail.gmail.com>
Date: Sun, 03 Dec 2023 20:02:10 +0100
In-Reply-To: <CACUOEi-aBgm8e8LoEKbqtKYxzDb3ghNw5SiFt-K=7udVugqB8w@mail.gmail.com>
 (Anthony Harivel's message of "Sun, 3 Dec 2023 19:15:18 +0100")
Message-ID: <87y1ebw1n1.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: add an option to
 enable lscpu
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

Pj4+Pj4gIkFudGhvbnkiID09IEFudGhvbnkgSGFyaXZlbCA8YWhhcml2ZWxAcmVkaGF0LmNvbT4g
d3JpdGVzOgoKID4gYnVtcCBlbWFpbC4KID4gT24gVGh1LCBOb3YgMjMsIDIwMjMgYXQgNDozMeKA
r1BNIEFudGhvbnkgSGFyaXZlbCA8YWhhcml2ZWxAcmVkaGF0LmNvbT4gd3JvdGU6CiA+PiAKID4+
IGxzY3B1IGRpc3BsYXlzIGluZm9ybWF0aW9uIGFib3V0IENQVSBhcmNoaXRlY3R1cmUgYW5kIG5l
ZWRzIHRvIGJlCiA+PiBleHBsaWNpdGx5IGVuYWJsZSBmb3IgY29tcGlsYXRpb24uCgpXaGVyZSBk
byB5b3Ugc2VlIHRoYXQ/IGNvbmZpZ3VyZS5hYyBoYXM6CgpBQ19BUkdfRU5BQkxFKFtsc2NwdV0s
CiAgQVNfSEVMUF9TVFJJTkcoWy0tZGlzYWJsZS1sc2NwdV0sIFtkbyBub3QgYnVpbGQgbHNjcHVd
KSwKICBbXSwgW1VMX0RFRkFVTFRfRU5BQkxFKFtsc2NwdV0sIFtjaGVja10pXQopCgpBbmQgZG9p
bmcgYSBidWlsZCB3aXRoIEJSMl9QQUNLQUdFX1VUSUxfTElOVVhfQklOQVJJRVM9eSBJIHNlZToK
CmxpYnRvb2w6IGluc3RhbGw6IC91c3IvYmluL2luc3RhbGwgLWMgbHNjcHUgL2hvbWUvcGVrby9z
b3VyY2UvYnVpbGRyb290L291dHB1dC11dGlsL3RhcmdldC91c3IvYmluL2xzY3B1CgotLSAKQnll
LCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
