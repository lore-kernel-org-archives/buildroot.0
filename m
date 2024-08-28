Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062C3C636EE
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 18:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BDA8608CA;
	Wed, 28 Aug 2024 18:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLOJhK0_3fjW; Wed, 28 Aug 2024 18:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DE4A60D6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DE4A60D6B;
	Wed, 28 Aug 2024 18:40:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1579C1BF3DB
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 18:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1006A8110E
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 18:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQgId626p381 for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 18:40:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 63E8481065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63E8481065
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63E8481065
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 18:40:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AD6D20003;
 Wed, 28 Aug 2024 18:40:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sjNb2-005P08-0V;
 Wed, 28 Aug 2024 20:40:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Jos=C3=A9?= Mendes <jp.baltazar.mendes@gmail.com>
References: <CAFAK9+d_UCVZ1+V+Msd3jk5rJg_H7v33fteAORNuNvt1PdJu4g@mail.gmail.com>
Date: Wed, 28 Aug 2024 20:40:44 +0200
In-Reply-To: <CAFAK9+d_UCVZ1+V+Msd3jk5rJg_H7v33fteAORNuNvt1PdJu4g@mail.gmail.com>
 (=?utf-8?Q?=22Jos=C3=A9?= Mendes"'s message of "Wed, 28 Aug 2024 17:45:08
 +0200")
Message-ID: <87plps7aoj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] Building U-Boot FIT
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

Pj4+Pj4gIkpvc8OpIiA9PSBKb3PDqSBNZW5kZXMgPGpwLmJhbHRhemFyLm1lbmRlc0BnbWFpbC5j
b20+IHdyaXRlczoKCiA+IEhpIGFsbCwKID4gSSdtIHRyeWluZyB0byBidWlsZCBhIHJhc3BiZXJy
eSBwaSBDTTQgc3lzdGVtIHdpdGggVUJvb3QgdGhhdCBoYXMKID4gcmVkdW5kYW5jaWVzIG9uIHRo
ZSBrZXJuZWwgYW5kIHRoZSByb290ZnMuCgogPiBBcyBwZXIgc29tZSBvdGhlciBzdWdnZXN0aW9u
cyBJJ20gdHJ5aW5nIHRvIG1vdmUgdGhlIFJQSSBrZXJuZWwgYW5kIHRoZQogPiByb290ZnMgaW50
byBhIHNpbmdsZSBwYXJ0aXRpb24gYnkgYnVpbGRpbmcgaXQgYXMgYSBGSVQgaW1hZ2UuCgpUaGUg
J0ZJVCcgZm9ybWF0IGlzIHVzZWZ1bCB0byBidW5kbGUgbXVsdGlwbGUgYm9vdCBjb21wb25lbnRz
IGluIGEKc2luZ2xlIGZpbGUgKGtlcm5lbCBpbWFnZSwgZGV2aWNlIHRyZWUgYmxvYiwgaW5pdHJh
bWZzLCAuLikuIElzIHRoYXQKd2hhdCB5b3UgYXJlIGxvb2tpbmcgZm9yIG9yIHNpbXBseSB0byBz
dG9yZSB0aGUga2VybmVsIGltYWdlIGluc2lkZSB0aGUKcm9vdGZzPwoKRm9yIHRoZSBsYXR0ZXIg
eW91IGNhbiBzaW1wbHkgdXNlIHRoZSBCUjJfTElOVVhfS0VSTkVMX0lOU1RBTExfVEFSR0VUCm9w
dGlvbjoKCmNvbmZpZyBCUjJfTElOVVhfS0VSTkVMX0lOU1RBTExfVEFSR0VUCiAgICAgICAgYm9v
bCAiSW5zdGFsbCBrZXJuZWwgaW1hZ2UgdG8gL2Jvb3QgaW4gdGFyZ2V0IgogICAgICAgIGRlcGVu
ZHMgb24gIUJSMl9UQVJHRVRfUk9PVEZTX0lOSVRSQU1GUwogICAgICAgIGhlbHAKICAgICAgICAg
IFNlbGVjdCB0aGlzIG9wdGlvbiB0byBoYXZlIHRoZSBrZXJuZWwgaW1hZ2UgaW5zdGFsbGVkIHRv
CiAgICAgICAgICAvYm9vdCBpbiB0aGUgdGFyZ2V0IHJvb3QgZmlsZXN5c3RlbSwgYXMgaXMgdHlw
aWNhbGx5IGRvbmUgb24KICAgICAgICAgIHg4Ni94ODZfNjQgc3lzdGVtcy4KCiAgICAgICAgICBO
b3RlIHRoYXQgdGhpcyBvcHRpb24gYWxzbyBpbnN0YWxscyB0aGUgRGV2aWNlIFRyZWUgQmxvYnMg
dG8KICAgICAgICAgIC9ib290IGlmIERUQnMgaGF2ZSBiZWVuIGdlbmVyYXRlZCBieSB0aGUga2Vy
bmVsIGJ1aWxkCiAgICAgICAgICBwcm9jZXNzLgoKSWYgeW91IHdhbnQgdG8gY3JlYXRlIGEgRklU
IGltYWdlLCB0aGVuIHlvdSBuZWVkIHRvIGNyZWF0ZSBhIEZJVCBpbWFnZQpkZXNjcmlwdGlvbiAo
RS5HLiBhIHRlbXBsYXRlIEZJVCBkZXZpY2UgdHJlZSBzdGF0aW5nIHdoYXQgZmlsZXMgeW91IHdh
bnQKdG8gaW5jbHVkZSBhbmQgd2hhdCB0byBuYW1lIHRoZW0pIGFuZCB1c2UgbWtpbWFnZSB0byBn
ZW5lcmF0ZSB5b3VyIEZJVAppbWFnZSBmcm9tIGl0LiBTZWUgdGhlIFUtQm9vdCBkb2N1bWVudGF0
aW9uIGZvciBkZXRhaWxzOgoKaHR0cHM6Ly9kb2NzLnUtYm9vdC5vcmcvZW4vbGF0ZXN0L3VzYWdl
L2ZpdC9pbmRleC5odG1sCgpUaGlzIGNhbiBiZSBpbnRlZ3JhdGVkIGluIEJ1aWxkcm9vdCB1c2lu
ZyBhIHBvc3QtYnVpbGQgc2NyaXB0IHRoYXQgY2FsbHMKbWtpbWFnZSAtZiBvbiB5b3VyIHRlbXBs
YXRlIGZpbGUuCgpEb24ndCBmb3JnZXQgdG8gYXNrIEJ1aWxkcm9vdCB0byBidWlsZCBta2ltYWdl
IGZvciB0aGUgaG9zdAooQlIyX1BBQ0tBR0VfSE9TVF9VQk9PVF9UT09MUz15KSBhbmQgaW5jbHVk
ZSBGSVQgc3VwcG9ydAooQlIyX1BBQ0tBR0VfSE9TVF9VQk9PVF9UT09MU19GSVRfU1VQUE9SVD15
KSBzbyBpdCBpcyBhdmFpbGFibGUgZm9yIHlvdXIKcG9zdC1idWlsZCBzY3JpcHQuCgpGb3IgbW9y
ZSBkZXRhaWxzLCBzZWUgaHR0cHM6Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcvI3Jvb3Rmcy1jdXN0
b20KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
