Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12B0C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 18:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B53260F28;
	Sat, 30 Dec 2023 18:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B53260F28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kz-PzZ2DeKNn; Sat, 30 Dec 2023 18:03:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE77B60F15;
	Sat, 30 Dec 2023 18:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE77B60F15
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE4291BF2F8
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B790E414C9
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B790E414C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sKOv6oi2gqpB for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 18:02:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B05C04149D
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 18:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B05C04149D
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF54D40004;
 Sat, 30 Dec 2023 18:02:01 +0000 (UTC)
Date: Sat, 30 Dec 2023 19:02:00 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231230190200.6fea8eaa@windsurf>
In-Reply-To: <20231230163844.497714-1-fontaine.fabrice@gmail.com>
References: <20231230163844.497714-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703959322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gG7GzFhjP27C8+wMMreFvUbcZqHwryyBjynOpF1pfo8=;
 b=F5B6Xow5lqTj1uIFPUH7w81bH/dtbK8o2/p8yVIV1hkjChYazn4icDuKwWPJoidHhaqOqn
 uVlBi87ml2OFlaa/uKZ8WhOnXWFgPURjt4SdFxV8mxyYuIyCEXMrg1Qv+m37THDk6q8ID/
 UY5Nuj40JjRdpLftl9c1xS2drQtzWhRipaXBU0HGdFzP1DIBY+bQ6RpObQgg556gcFcXlw
 +fCp9FR99EcCOnJmiwxKuIG7KUeco6oN0GpZeAmk5zP7CkJhpictvHOobTFOib/NUP0h2P
 fo+3/F9DxSSEDlYx5J37oANa4KQ3uRBGTMOVoqHWCTy6DcMWAs7i67FIRsuZBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F5B6Xow5
Subject: Re: [Buildroot] [PATCH 1/1] package/cracklib: bump to version 2.9.11
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
Cc: Stefan =?UTF-8?B?U8O4cmVuc2Vu?= <stefan.sorensen@spectralink.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Dec 2023 17:38:44 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/cracklib/cracklib/blob/v2.9.11/src/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cracklib/cracklib.hash | 4 ++--
>  package/cracklib/cracklib.mk   | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
