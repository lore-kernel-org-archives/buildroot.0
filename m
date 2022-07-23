Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF268C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D04C84A2D;
	Sat, 23 Jul 2022 12:57:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D04C84A2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AjoFfqAjgSvZ; Sat, 23 Jul 2022 12:57:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 586D184A18;
	Sat, 23 Jul 2022 12:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 586D184A18
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 423221BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AA3460FE2
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:57:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AA3460FE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8F1yDsIbBTqJ for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:57:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 731B660FE0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 731B660FE0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:57:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3BE1D60002;
 Sat, 23 Jul 2022 12:57:24 +0000 (UTC)
Date: Sat, 23 Jul 2022 14:57:23 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220723145723.3b13925a@windsurf>
In-Reply-To: <20220529131811.481017-5-romain.naour@gmail.com>
References: <20220529131811.481017-1-romain.naour@gmail.com>
 <20220529131811.481017-5-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658581044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+NlubLf1f731UEm+4AEUMGh8LshBnUt1zmQDD7b6R8=;
 b=GiNSYpp9YfWh0lv6AaamW3aT3bgjxXk0k1qW59pXji8GS383lIXm+KXDhcUef2voSl3bX7
 wXmawRyiWz0Plqru69h2wZuG0cvjfgQJGTMHNRai8NfeuB6n2Bwbew4twfr7WxBwGEC1yY
 aOw+Y4tTWyqSpGo+SI64Ajnc2l2CGT7ubsHDt71Dgw9oAz3fN3astu/5WYSAA4cFGe7wjN
 NvrbquHfrGPSgiUx2SwiKfgm1C1dhp68XzxQQs2aaXUeehGzvBwL/a13iwsOWFtVEyAlvX
 uYGOdIz5kfeSyRglK0B+nfli2rnP9JuXMZczEUqefO0/ZZEQHa4j8xdETbCxVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GiNSYpp9
Subject: Re: [Buildroot] [PATCH for-next 05/11] toolchain: enable
 libquadmath for PowerPC with VSX
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
Cc: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Cyril Bur <cyrilbur@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAyOSBNYXkgMjAyMiAxNToxODowNSArMDIwMApSb21haW4gTmFvdXIgPHJvbWFpbi5u
YW91ckBnbWFpbC5jb20+IHdyb3RlOgoKPiBmbG9hdDEyOCBpcyBhdmFpbGFibGUgb24gUG93ZXJQ
QyB3aXRoIFZTWCBbMV0gYnV0IGl0IHJlcXVpcmVzCj4gbGlicXVhZG1hdGggc3VwcG9ydC4KPiAK
PiBbMV0gaHR0cHM6Ly9nY2MuZ251Lm9yZy9vbmxpbmVkb2NzL2djYy05LjEuMC9nY2MvRmxvYXRp
bmctVHlwZXMuaHRtbAo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5h
b3VyQGdtYWlsLmNvbT4KPiBDYzogQ3lyaWwgQnVyIDxjeXJpbGJ1ckBnbWFpbC5jb20+Cj4gQ2M6
IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Cj4gLS0tCj4gIHRvb2xjaGFpbi9Db25m
aWcuaW4gfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCkFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9v
dGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxp
bi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
