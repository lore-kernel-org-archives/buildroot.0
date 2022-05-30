Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4930C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AE1740AEF;
	Mon, 30 May 2022 20:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QUpJ5YgF3eUZ; Mon, 30 May 2022 20:40:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B76840AD3;
	Mon, 30 May 2022 20:40:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2066D1BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0799A61186
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lbgoxQKGdp73 for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:40:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF6CA60AE5
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:40:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9A845100003;
 Mon, 30 May 2022 20:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653943210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZRPZ7OdasFS65vOB7zKxM0D42L7S1/vloe/XDs+46c8=;
 b=P2Fg5XKi/6GbnBVENdud9+nhLitrjQfjhx8taCmIxJURmuxS0rKeZBKNuuj3d95CvuewCq
 q0q515EYMQunYyf+aZ6D7FNFNFCN0UibuVCuBcaMN4ybCsRWmYeWfggAPT27lRFnlLPmjN
 amOKprGjBgaPmN6ENFcu4nUEMdg0OeEZjvgVFr045EwCCsyXcGL4tkN5WPpZpQtA7SGUvv
 RKCZnO9ZVObo8fyRaYzAXseKWNv/ucSY3/0eyVEmVUnKKdKDRj2HP3mVq52kIf+gLhDH4m
 ibACAyBHFqJqd1aFvTPPlbhOsih3wXy8a/dof5KS184P0CBarIbO3U7hWj4ZCQ==
Date: Mon, 30 May 2022 22:40:08 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20220530224008.763953be@windsurf>
In-Reply-To: <YouAb62gXvqaHf2p@waldemar-brodkorb.de>
References: <20220522194732.2962580-1-peter@korsgaard.com>
 <YouAb62gXvqaHf2p@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/ruby: security bump to version 3.1.2
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

T24gTW9uLCAyMyBNYXkgMjAyMiAxNDozOToxMSArMDIwMApXYWxkZW1hciBCcm9ka29yYiA8d2J4
QG9wZW5hZGsub3JnPiB3cm90ZToKCj4gSGkgUGV0ZXIsCj4gCj4gVGVzdGVkLUJ5OiBXYWxkZW1h
ciBCcm9ka29yYiA8d2J4QG9wZW5hZGsub3JnPgo+IAo+IAo+IFRoZXJlIGlzIGFuIGlzc3VlIHdp
dGggbGlicmVzc2w6Cj4gb3NzbF9wa2V5LmM6IEluIGZ1bmN0aW9uIOKAmG9zc2xfcGtleV9leHBv
cnRfdHJhZGl0aW9uYWzigJk6Cj4gb3NzbF9wa2V5LmM6NjgxOjYyOiBlcnJvcjogaW52YWxpZCB1
c2Ugb2YgaW5jb21wbGV0ZSB0eXBlZGVmCj4g4oCYRVZQX1BLRVnigJkge2FrYSDigJhzdHJ1Y3Qg
ZXZwX3BrZXlfc3TigJl9Cj4gICA2ODEgfCAgRVZQX1BLRVlfYXNuMV9nZXQwX2luZm8oTlVMTCwg
TlVMTCwgTlVMTCwgTlVMTCwgJmFuYW1lLAo+ICAgcGtleS0+YW1ldGgpOwo+IAo+IEFueSBpZGVh
PwoKSW5kZWVkLCBidXQgdGhpcyBpc3N1ZSBpcyBhbHJlYWR5IHJlcHJvZHVjaWJsZSBiZWZvcmUg
dGhlIHJ1Ynkgc2VjdXJpdHkKYnVtcCwgc28gaXQgbmVlZHMgdG8gYmUgZml4ZWQgc2VwYXJhdGVs
eS4KCkJlc3QgcmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIg
YW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFu
ZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
