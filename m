Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9AEC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C31AF405D2;
	Wed, 27 Jul 2022 14:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C31AF405D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1hCfw7EojYSH; Wed, 27 Jul 2022 14:43:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD7634013E;
	Wed, 27 Jul 2022 14:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD7634013E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB66A1BF4E4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F7CE4013E
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F7CE4013E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QL6a8d8-fhCq for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:43:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E8F84013D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E8F84013D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:43:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 779C3FF810;
 Wed, 27 Jul 2022 14:43:22 +0000 (UTC)
Date: Wed, 27 Jul 2022 16:43:21 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220727164321.6b121f34@windsurf>
In-Reply-To: <20220205180817.2103343-2-bernd.kuhls@t-online.de>
References: <20220205180817.2103343-1-bernd.kuhls@t-online.de>
 <20220205180817.2103343-2-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658933002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZP7OoaI3glQV9t9sSHS/EPQMWfyiXXl+hWt39is6Tc=;
 b=aUbT4L3X77AxWn3fDqfT9oJUwNq/DuTcW1k/aQd/SBr1mL7NbluziKYIcCpXtkkXjSLNX5
 4ToghCVWRpcrMEBIOjDtIhF6cN2E58mUKpZ2ZnfbmdT7iIBmWKPzpMmBYMIw6M2bwT4bhD
 duTAlZwkIyqFEj/mGP9IJYU+CkThlVSdQxe6/StNSDYTwJLG20IzUINZIONna56EyB57Kc
 wahd7lUMcS5yq4bwoFKfXalYGv62e8OTWe7Urm6tud81M2hei+YwevaB6NpNFUlu5Xwh2x
 62JJ5nUcHp0E/GUq1v+V0hz/NzHVtd3Mrl2sTp28noQrMmccJKZfeuOQWS4W3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aUbT4L3X
Subject: Re: [Buildroot] [PATCH 2/3] package/dht: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  5 Feb 2022 19:08:16 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Needed for upcoming version bump of transmission.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> Build test using this defconfig

Could you please submit this one together with the transmission bump
(of course as separate patches, but in the same patch series) ? I'd
like to see how it gets used by transmission to see what solution to
use for the build of this library.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
