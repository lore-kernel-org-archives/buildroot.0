Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67674C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 21:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 080158186E;
	Wed, 13 Apr 2022 21:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tXkcVo5SeitG; Wed, 13 Apr 2022 21:08:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15ADF8175A;
	Wed, 13 Apr 2022 21:08:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C00921BF3B9
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 21:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBF26403AA
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 21:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pKT9G60_0IRY for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 21:08:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9C3E401A0
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 21:08:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EE1DBFF802;
 Wed, 13 Apr 2022 21:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649884130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DEABRPttPYiMIGxt9U+MxmorHb72XKpkAgO+S9LgidY=;
 b=fAGGJ8BRWyFXBq7OcrVud1VcgcFuGrrmG5B4nT92pkMPfEUJuMEUK75FdT7eAu/S3FEk+1
 EH+nX0pmtP3K2HVYErfzU/I+agB3/HwiI8EK2HEUUhJ6g/+isyeepS67X4VUZRYV92sB74
 amoXpsaJJOA2Ub+MtdyubttirBTQ6ahiIt219b/adOezNQH4kFM2gHLfNteO2ym3Qcdc/+
 qOVHW4Ywp/Fv4uJ7PlKwGyOegfynpRsTbKD6yyqGsUeWYsJzXVHz6cLA2u4Zc3Lw/ziMlf
 YQxPXdJt1Noa7Js15iEq781j8QS04Tso4rKyNTQ2PB+jbC14OYLoeIR6h/OF0w==
Date: Wed, 13 Apr 2022 23:08:48 +0200
To: "=?UTF-8?B?QW5kcmXDrw==?= V. FOMITCHEV-HERVIEU"
 <andrei.fomitchevhervieu@getinge.com>
Message-ID: <20220413230848.63adde79@windsurf>
In-Reply-To: <20220413073119.458265-1-andrei.fomitchevhervieu@getinge.com>
References: <20220413073119.458265-1-andrei.fomitchevhervieu@getinge.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/opkg: enable openssl signature
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

SGVsbG8gQW5kcmXDrywKCk9uIFdlZCwgMTMgQXByIDIwMjIgMDk6MzE6MTkgKzAyMDAKQW5kcmXD
ryBWLiBGT01JVENIRVYtSEVSVklFVSA8YW5kcmVpLmZvbWl0Y2hldmhlcnZpZXVAZ2V0aW5nZS5j
b20+IHdyb3RlOgoKPiBPUEtHIHN1cHBvcnRzIGVpdGhlciBHUEcgb3IgT3BlblNTTCBzaWduYXR1
cmUgY2hlY2suIEl0IGlzIGFscmVhZHkgcG9zc2libGUKPiB0byBlbmFibGUgaW4gYnVpbGRyb290
IHRoZSBjaGVjayBvZiBHUEcgc2lnbmF0dXJlcy4gVGhpcyBwYXRjaCBhZGRzIHNpbWlsYXIKPiBj
b25maWd1cmF0aW9uIHRvIGVuYWJsZSB0aGUgT3BlblNTTCBzaWduYXR1cmUgY2hlY2tzLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEFuZHJlw68gVi4gRk9NSVRDSEVWLUhFUlZJRVUgPGFuZHJlaS5mb21p
dGNoZXZoZXJ2aWV1QGdldGluZ2UuY29tPgo+IENoYW5nZS1JZDogSWQyYzc2YjNjYjM5YmE1ZWVk
NWJkMGJlZjc2NDhmNzk3MDAzM2I4N2IKCk5pY2UgdG8gc2VlIHlvdSBoZXJlLCB0aGFua3MgZm9y
IHRoZSBjb250cmlidXRpb24hCgpIb3dldmVyLCBhcmUgeW91IHN1cmUgaXQgbWFrZXMgc2Vuc2Ug
dG8gc3VwcG9ydCB0aGlzIGFuZCB1c2UgdGhpcz8KSW5kZWVkLCBvcGtnIGhhcyBkZXByZWNhdGVk
IHRoZSB1c2FnZSBvZiBvcGVuc3NsIGZvciBzaWduYXR1cmUuIEZyb20Kb3BrZydzIGNvbmZpZ3Vy
ZS5hYzoKCiAgQUNfTVNHX1dBUk4oT3BlblNTTCBzaWduYXR1cmUtY2hlY2tpbmcgc3VwcG9ydCBp
cyBkZXByYWN0ZWQgYW5kIHdpbGwgYmUgXApyZW1vdmVkIGluIGZ1dHVyZSByZWxlYXNlcy4gQ29u
c2lkZXIgdXNpbmcgR1BHTUUgKC0tZW5hYmxlLWdwZykgaW5zdGVhZC4pCgpTbywgaXQgaXMgcmVh
bGx5IHNlbnNpYmxlIHRvIHN1cHBvcnQgdGhpcz8KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9u
aSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
