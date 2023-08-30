Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D11C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 06:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E33644156F;
	Wed, 30 Aug 2023 06:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E33644156F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Bhg6N9C47jC; Wed, 30 Aug 2023 06:13:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3305C409E7;
	Wed, 30 Aug 2023 06:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3305C409E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D1AF1BF41D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 06:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 338DA409E7
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 06:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 338DA409E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dq_GPdZYJG4p for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 06:13:34 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AA9040328
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 06:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AA9040328
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC4431BF204;
 Wed, 30 Aug 2023 06:13:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qbESH-008pNz-OO; Wed, 30 Aug 2023 08:13:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
References: <20230719125309.723762-1-vincent.stehle@arm.com>
 <20230721130959.899919-1-vincent.stehle@arm.com>
Date: Wed, 30 Aug 2023 08:13:29 +0200
In-Reply-To: <20230721130959.899919-1-vincent.stehle@arm.com> ("Vincent
 =?utf-8?Q?Stehl=C3=A9=22's?= message of "Fri, 21 Jul 2023 15:09:59 +0200")
Message-ID: <877cpd2h2u.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] boot/arm-trusted-firmware: add patch to
 fix fiptool link
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlZpbmNlbnQiID09IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNv
bT4gd3JpdGVzOgoKID4gV2hlbiBidWlsZGluZyBhIGZpcCBmaXJtd2FyZSAoQlIyX1RBUkdFVF9B
Uk1fVFJVU1RFRF9GSVJNV0FSRV9GSVA9eSksIHRoZQogPiBURi1BIGJ1aWxkIHJlY2lwZSBzdGFy
dHMgYnkgYnVpbGRpbmcgdGhlIGhvc3QgcHJvZ3JhbSBmaXB0b29sIHdpdGggdGhlCiA+IHByb3Bl
ciBidWlsZCBlbnZpcm9ubWVudCB2YXJpYWJsZXMuIFRoZW4gdGhlIG1haW4gVEYtQSB0YXJnZXQg
ZmlybXdhcmUKID4gYnVpbGQgc3RlcCB0YWtlcyBwbGFjZSwgd2l0aCB0aGUgZXhwZWN0YXRpb24g
dGhhdCB0aGUgZmlwdG9vbCBwcm9ncmFtIHdpbGwKID4gYmUgdXNlZCB1bmRlciB0aGUgaG9vZCBp
ZiBuZWNlc3NhcnkuCgogPiBJbiBURi1BLCB0aGUgYnVpbGQgcmVjaXBlIGZvciB0aGUgaG9zdCBw
cm9ncmFtIGZpcHRvb2wgaGFzIHN1YnRseSBjaGFuZ2VkCiA+IGFmdGVyIHYyLjcsIGluIGNvbW1p
dCBjZjJkZDE3ZGRkYTIgKCJyZWZhY3RvcihzZWN1cml0eSk6IGFkZCBPcGVuU1NMIDEueAogPiBj
b21wYXRpYmlsaXR5IikuIFRoaXMgY2hhbmdlIGhhcyB0aGUgZWZmZWN0IHRvIGZvcmNlIHJlLWxp
bmtpbmcgZmlwdG9vbAogPiBlYWNoIHRpbWUuCgogPiBJZiB3ZSB0cnkgdG8gYnVpbGQgd2l0aCBC
dWlsZHJvb3QgYSBmaXAgZmlybXdhcmUgd2l0aCBhIFRGLUEgdmVyc2lvbiBhZnRlcgogPiB2Mi43
IGNvbXByaXNpbmcgdGhlIGFmb3JlbWVudGlvbmVkIGNoYW5nZSwgdGhlIGZpcHRvb2wgcHJvZ3Jh
bSBpcyBmb3JjaWJseQogPiByZS1saW5rZWQgZHVyaW5nIHRoZSBtYWluIGZpcm13YXJlIGJ1aWxk
IHN0ZXAuIFRoaXMgaGFwcGVucyB3aXRob3V0IHRoZQogPiBwcm9wZXIgYnVpbGQgZW52aXJvbm1l
bnQgdmFyaWFibGVzIGFuZCBjb25zZXF1ZW50bHksIGlmIG9wZW5zc2wgaXMgbm90CiA+IGluc3Rh
bGxlZCBvbiB0aGUgaG9zdCwgdGhlIGxpYmNyeXB0byBzaGFyZWQgbGlicmFyeSB3aWxsIG5vdCBi
ZSBmb3VuZCBieQogPiB0aGUgbGlua2VyIGFuZCB0aGUgbGluayB3aWxsIGZhaWwgd2l0aCB0aGUg
Zm9sbG93aW5nIGVycm9yOgoKID4gICAvdXNyL2Jpbi9sZDogY2Fubm90IGZpbmQgLWxjcnlwdG86
IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKCiA+IEEgcGF0Y2ggaGFzIGJlZW4gaW50ZWdyYXRl
ZCBpbnRvIFRGLUEgdG8gYXZvaWQgcmUtbGlua2luZyBmaXB0b29sIHdoZW4gbm90CiA+IG5lY2Vz
c2FyeSwgd2hpY2ggc2hvdWxkIHNvbHZlIHRoZSBwcm9ibGVtIHN0YXJ0aW5nIHdpdGggdmVyc2lv
biB2Mi4xMC4gQWRkCiA+IHRoYXQgcGF0Y2ggaW4gQnVpbGRyb290IGZvciB2ZXJzaW9ucyB2Mi44
IGFuZCB2Mi45LCB0byByZXBhaXIgdGhlIGJ1aWxkIGluCiA+IHRoZSBjYXNlcyBkZXNjcmliZWQg
YWJvdmUuCgogPiBGaXhlczoKCiA+ICAgaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcv
YnVpbGRyb290Ly0vam9icy80NjY0ODQ1NzY3CgogPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0
ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CiA+IENjOiBEaWNrIE9sc3NvbiA8aGlAc2Vu
emlsbGEuaW8+CiA+IENjOiBTZXJnZXkgTWF0eXVrZXZpY2ggPGdlb21hdHNpQGdtYWlsLmNvbT4K
ID4gLS0tCiA+IENoYW5nZXMgdjEgLT4gdjI6CiA+ICAgLSBBZGQgRml4ZXM6IG1lbnRpb24gICAo
c3VnZ2VzdGVkIGJ5IFRob21hcykKCkNvbW1pdHRlZCB0byAyMDIzLjAyLnggYW5kIDIwMjMuMDUu
eCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
