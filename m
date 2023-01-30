Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC54C636D3
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 22:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 619C7822A9;
	Mon, 30 Jan 2023 22:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 619C7822A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id itZbRszFUIHm; Mon, 30 Jan 2023 22:05:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71F91822C5;
	Mon, 30 Jan 2023 22:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71F91822C5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A1A5A1BF41F
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 22:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73C6A822C2
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 22:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73C6A822C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id thkUCwCVO8Qs for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 22:04:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F397482291
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F397482291
 for <buildroot@uclibc.org>; Mon, 30 Jan 2023 22:04:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AB7D260003;
 Mon, 30 Jan 2023 22:04:50 +0000 (UTC)
Date: Mon, 30 Jan 2023 23:04:49 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230130230449.44c95251@windsurf>
In-Reply-To: <pan$2724f$ad18d855$3c1930f1$855c20a8@ID-313208.user.individual.net>
References: <20230130174339.36794-1-bernd.kuhls@t-online.de>
 <20230130174339.36794-4-bernd.kuhls@t-online.de>
 <20230130221514.2d58df14__31334.1615417571$1675113344$gmane$org@windsurf>
 <pan$86f7$3b01a6c4$a6498246$160afa18@ID-313208.user.individual.net>
 <20230130223941.11f007d8@windsurf>
 <pan$2724f$ad18d855$3c1930f1$855c20a8@ID-313208.user.individual.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675116291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=imwUi9Lux+IZh3rRQr/WpLuyDcs1w2jXOfwOrU7sYFE=;
 b=bKK26qk419kebCK9kTInak9iOsHIA7gB/5oh+wVIwlxwjF+C6qeOmP1FJarrFJns+2eMOL
 OGU14UIFMIbnAggUg7clxEBp39jesIMoBT40yWEI+4KhY5z5Loa3YIEpt356pMPyp6Dclg
 GmKFGEdEMpXVIZ+bz6I7qC3ii6fv44daLlwFFqXgl17wzgOzGRx2L3jFhq6H75iNHLo8Lu
 hksvZtlL33a9DihS9dyBxtyKyZRx2oZKmPB958vz5msGvVv3N+EtdngPxviMhKvQ/U0DvW
 ajH/E3RvAKrWGm5LIvaUzZuZyOHX2TBlsF9htOzcBSjf+QILTy/Tf/egwbD+TQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bKK26qk4
Subject: Re: [Buildroot] [PATCH 4/5] package/intel-mediadriver: bump version
 to 23.1.0
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
Cc: buildroot@busybox.net, buildroot@uclibc.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAzMCBKYW4gMjAyMyAyMjo0OTowNCArMDEwMApCZXJuZCBLdWhscyA8YmVybmQua3Vo
bHNAdC1vbmxpbmUuZGU+IHdyb3RlOgoKPiAtLS0gb2xkX2VkYWUvaW50ZWwtbWVkaWEtMjMuMS4w
LnRhci5nego+ICsrKyBuZXdfZjQ3Zi9pbnRlbC1tZWRpYS0yMy4xLjAudGFyLmd6Cj4g4pSC4pSE
IEZvcm1hdC1zcGVjaWZpYyBkaWZmZXJlbmNlcyBhcmUgc3VwcG9ydGVkIGZvciBHemlwcGVkIGZp
bGVzIGJ1dCBubyAKPiBmaWxlLXNwZWNpZmljIGRpZmZlcmVuY2VzIHdlcmUgZGV0ZWN0ZWQ7IGZh
bGxpbmcgYmFjayB0byBhIGJpbmFyeSBkaWZmLiAKPiBmaWxlKDEpIHJlcG9ydHM6IGd6aXAgY29t
cHJlc3NlZCBkYXRhLCBmcm9tIFVuaXgsIG9yaWdpbmFsIHNpemUgbW9kdWxvIAo+IDJeMzIgMjQ1
ODkzMTIwCgpJZiB5b3UgZ3VuemlwIGJvdGggZmlsZXMsIGFyZSB0aGUgcmVzdWx0aW5nIHRhcmJh
bGxzIGlkZW50aWNhbD8KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5k
IENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0
cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
