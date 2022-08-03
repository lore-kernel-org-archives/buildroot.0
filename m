Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F30C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 19:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72ACC606EC;
	Wed,  3 Aug 2022 19:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72ACC606EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4LheX2NIGuHG; Wed,  3 Aug 2022 19:58:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80879607B4;
	Wed,  3 Aug 2022 19:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80879607B4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88F501BF5DC
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 19:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6094040156
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 19:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6094040156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mhwd-h6opJGn for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 19:58:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA12F40151
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA12F40151
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 19:58:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 249BB240003;
 Wed,  3 Aug 2022 19:58:26 +0000 (UTC)
Date: Wed, 3 Aug 2022 21:58:25 +0200
To: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>
Message-ID: <20220803215825.30affd56@windsurf>
In-Reply-To: <A46AAF2E-D74E-4308-A9B3-3B18C3E1CD09@cutebit.org>
References: <A46AAF2E-D74E-4308-A9B3-3B18C3E1CD09@cutebit.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659556707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tFr/KCeYFrOX4X8K+RQarGudohzJUuCPHNYKMJabEMg=;
 b=lHFHL7qG68PzJZ535a9Mmwioz1480trMRm29b/oTI0cP7HZF2Ljr5SjFxfODAZSGp3NffW
 OPVNsOSU4MtrTSe4RrKVltP1tvlbn76ueRdBn6SysaOpyBmPr+dGZpr2KM+yNA+VizlBzm
 LOXiJPqzaJNsEY+FKFJcULnNlgriOrGzE/E3IzwAxlvCXj1WLftT3xwTNcj+E0uq2W9or6
 IU0sSrRApIPjeBXKYo/FrdGVhyE+R8arGTONKR5WGke+Y7mo/F4WUXqw49dgEpxFVIYQ0u
 8UBjyu0KfZqHXxzBiQ65yrTU5tfSm91EMI6r3MAFZ51EZ4HIHG5zghnKX4udCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lHFHL7qG
Subject: Re: [Buildroot] [PATCH 1/1 RESEND] package/python-construct: new
 package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWFydGluLAoKT24gV2VkLCAzIEF1ZyAyMDIyIDE3OjQyOjQ4ICswMjAwCk1hcnRpbiBQ
b3ZpxaFlciA8cG92aWsrbGluQGN1dGViaXQub3JnPiB3cm90ZToKCj4gY29uc3RydWN0IGlzIGEg
UHl0aG9uIGxpYnJhcnkgZm9yIGRlY2xhcmF0aXZlIHNlcmlhbGl6YXRpb24vCj4gZGVzZXJpYWxp
emF0aW9uIG9mIHN0cnVjdHVyZWQgYmluYXJ5IGRhdGEuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFy
dGluIFBvdmnFoWVyIDxwb3ZpaytsaW5AY3V0ZWJpdC5vcmc+Cj4gLS0tCj4gSSBkb24ndCBrbm93
IGlmIHlvdSBzZXQgYSBiYXIgZm9yIHRoZSBpbmNsdXNpb24gb2YgcGFja2FnZXMgaW4KPiBidWls
ZHJvb3QsIGJ1dCBJIHRoaW5rIGJ5IGl0cyBuYXR1cmUgY29uc3RydWN0IG1ha2VzIGZvciBhIHVz
ZWZ1bAo+IHBhY2thZ2Ugb24gZW1iZWRkZWQgc3lzdGVtcy4KClRoYW5rcyBmb3IgeW91ciBjb250
cmlidXRpb24hIEl0IGxvb2tlZCBnb29kLCBidXQgdGhlcmUgd2FzIG9uZSBpc3N1ZToKdGhlIHBh
dGNoIHdhcyBkYW1hZ2VkLCBwZXJoYXBzIGJlY2F1c2UgeW91IGRpZG4ndCBzZW5kIGl0IHVzaW5n
IGdpdApzZW5kLWVtYWlsPwoKU28gSSBmaXhlZCB1cCB0aGUgZGFtYWdlLCBidXQgYWxzbyBhZGRl
ZCBhIHRlc3QgaW4gb3VyIHJ1bnRpbWUgdGVzdAppbmZyYXN0cnVjdHVyZSBmb3IgdGhpcyBuZXcg
cGFja2FnZS4gVGhpcyBhbGxvd3MgdG8gdmVyaWZ5IHRoYXQgdGhlCnBhY2thZ2Ugd29ya3MgYXQg
cnVudGltZSwgd2hpY2ggaXMgcXVpdGUgaW1wb3J0YW50IGZvciBQeXRob24gbW9kdWxlcy4KClNl
ZToKCiAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fY29uc3RydWN0
LnB5Cgp3aGljaCBidWlsZHMgYSBzaW1wbGUgQnVpbGRyb290IGNvbmZpZ3VyYXRpb24gd2l0aCBw
eXRob24tY29uc3RydWN0CmVuYWJsZWQsIGJvb3RzIGl0IHVuZGVyIFFlbXUsIGFuZCBydW5zOgoK
ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2NvbnN0cnVjdC5w
eQoKaW5zaWRlIHRoaXMgZW52aXJvbm1lbnQuCgo+ICtQWVRIT05fQ09OU1RSVUNUX0RFUEVOREVO
Q0lFUyA9IGhvc3QtcHl0aG9uLXNldHVwdG9vbHMtc2NtCgpJIGFsc28gZHJvcHBlZCB0aGlzIGRl
cGVuZGVuY3ksIGJlY2F1c2UgSSBjb3VsZG4ndCBzZWUgaW4gc2V0dXAucHkgd2h5CnRoaXMgZGVw
ZW5kZW5jeSB3b3VsZCBiZSBuZWVkZWQsIGFuZCBhIHRlc3QgYnVpbGQgd2l0aG91dCB0aGlzCmRl
cGVuZGVuY3kgc2hvd2VkIGl0IHdhcyB3b3JraW5nLiBIb3BlZnVsbHkgSSB3YXMgbm90IHdyb25n
IG9uIHRoaXMgOi0pCgpTZWUgdGhlIGZpbmFsIGNvbW1pdCBhdDoKCiAgaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2MwNWNhYTc1NTcyMzczN2U5MWZm
ZDU3ZTczNjI5OGNiMTljOWM4N2YKCkFnYWluLCB0aGFua3MgZm9yIHlvdXIgY29udHJpYnV0aW9u
IQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGlu
CkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBz
Oi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
